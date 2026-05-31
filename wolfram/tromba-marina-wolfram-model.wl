(* Tromba Marina parametric acoustic/bridge-buzz model.
   All physical numeric inputs are estimates pending measurement and are not fabrication authority. *)

ClearAll["Global`*"];

packetMetadata = <|
   "Instrument" -> "Tromba Marina",
   "Packet" -> "Round 8 Wolfram build-packet model",
   "ModelName" -> "Bowed monochord harmonic and loose-foot bridge explorer",
   "Authority" -> "reference_only; estimate placeholders only"
   |>;

stringScaleLengthEstimate = 1.6; (* estimate - pending measurement, not fabrication authority *)
mainStringTensionEstimate = 65.; (* estimate - pending measurement, not fabrication authority *)
linearDensityEstimate = 0.0022; (* estimate - pending measurement, not fabrication authority *)
bridgeLooseFootGapEstimate = 0.0008; (* estimate - pending measurement, not fabrication authority *)
bridgeFootEffectiveMassEstimate = 0.012; (* estimate - pending measurement, not fabrication authority *)
bridgeContactStiffnessEstimate = 1500.; (* estimate - pending measurement, not fabrication authority *)
bridgeDampingCoefficientEstimate = 0.18; (* estimate - pending measurement, not fabrication authority *)
sympatheticStringCountEstimate = 6; (* estimate - pending measurement, not fabrication authority *)

stringFrequency[length_, tension_, linearDensity_] :=
  (1/(2 length)) Sqrt[tension/linearDensity];

harmonicFrequency[fundamental_, harmonicNumber_] :=
  harmonicNumber fundamental;

harmonicNodeMap[length_, highestHarmonic_] :=
  Table[
   {harmonicNumber, length/harmonicNumber},
   {harmonicNumber, 2, highestHarmonic}
   ];

bridgeNaturalFrequency[stiffness_, mass_] :=
  (1/(2 Pi)) Sqrt[stiffness/mass];

bridgeDampingRatio[dampingCoefficient_, stiffness_, mass_] :=
  dampingCoefficient/(2 Sqrt[stiffness mass]);

bridgeBuzzClearanceRatio[stringDisplacement_, looseFootGap_] :=
  stringDisplacement/looseFootGap;

trombaMarinaModel[length_, tension_, linearDensity_, looseFootGap_,
   bridgeMass_, bridgeStiffness_, bridgeDamping_, sympatheticCount_] :=
  Module[
   {fundamentalFrequency, harmonicTable, nodeTable, bridgeFrequency,
    dampingRatio, displacementProbeEstimate, clearanceRatio},
   displacementProbeEstimate =
    looseFootGap/2; (* estimate - pending measurement, not fabrication authority *)
   fundamentalFrequency = stringFrequency[length, tension, linearDensity];
   harmonicTable =
    Table[
     {harmonicNumber, harmonicFrequency[fundamentalFrequency, harmonicNumber]},
     {harmonicNumber, 1, 8}
     ];
   nodeTable = harmonicNodeMap[length, 8];
   bridgeFrequency = bridgeNaturalFrequency[bridgeStiffness, bridgeMass];
   dampingRatio =
    bridgeDampingRatio[bridgeDamping, bridgeStiffness, bridgeMass];
   clearanceRatio =
    bridgeBuzzClearanceRatio[displacementProbeEstimate, looseFootGap];
   <|
    "FundamentalHz" -> fundamentalFrequency,
    "NaturalHarmonicsHz" -> harmonicTable,
    "NodeDistanceFromEndM" -> nodeTable,
    "BridgeLooseFootHz" -> bridgeFrequency,
    "BridgeDampingRatio" -> dampingRatio,
    "LooseFootClearanceRatio" -> clearanceRatio,
    "SympatheticStringCount" -> sympatheticCount
    |>
   ];

trombaMarinaExplorer =
  Manipulate[
   Module[
    {model, harmonics, nodes},
    model =
     trombaMarinaModel[
      stringScaleLengthEstimate scaleLengthFactor,
      mainStringTensionEstimate tensionFactor,
      linearDensityEstimate densityFactor,
      bridgeLooseFootGapEstimate gapFactor,
      bridgeFootEffectiveMassEstimate bridgeMassFactor,
      bridgeContactStiffnessEstimate bridgeStiffnessFactor,
      bridgeDampingCoefficientEstimate bridgeDampingFactor,
      Round[sympatheticStringCountEstimate sympatheticCountFactor]
      ];
    harmonics =
     Prepend[
      ({#[[1]], NumberForm[#[[2]], {8, 2}]} & /@
        model["NaturalHarmonicsHz"]),
      {"harmonic", "frequency Hz"}
      ];
    nodes =
     Prepend[
      ({#[[1]], NumberForm[#[[2]], {8, 3}]} & /@
        model["NodeDistanceFromEndM"]),
      {"harmonic", "node spacing m"}
      ];
    Column[
     {
      packetMetadata,
      Grid[
       {
        {"fundamental Hz", NumberForm[model["FundamentalHz"], {8, 2}]},
        {"loose-foot bridge natural Hz",
         NumberForm[model["BridgeLooseFootHz"], {8, 2}]},
        {"bridge damping ratio",
         NumberForm[model["BridgeDampingRatio"], {8, 3}]},
        {"buzz clearance ratio",
         NumberForm[model["LooseFootClearanceRatio"], {8, 3}]},
        {"sympathetic string count placeholder",
         model["SympatheticStringCount"]}
        },
       Frame -> All
       ],
      Grid[harmonics, Frame -> All],
      Grid[nodes, Frame -> All]
      }
     ]
    ],
   {{scaleLengthFactor, 1, "scale length factor"}, 0.5, 1.5,
    Appearance -> "Labeled"},
   {{tensionFactor, 1, "main string tension factor"}, 0.5, 2.0,
    Appearance -> "Labeled"},
   {{densityFactor, 1, "linear density factor"}, 0.5, 2.0,
    Appearance -> "Labeled"},
   {{gapFactor, 1, "loose-foot gap factor"}, 0.25, 2.0,
    Appearance -> "Labeled"},
   {{bridgeMassFactor, 1, "bridge foot mass factor"}, 0.25, 2.0,
    Appearance -> "Labeled"},
   {{bridgeStiffnessFactor, 1, "bridge contact stiffness factor"}, 0.25,
    3.0, Appearance -> "Labeled"},
   {{bridgeDampingFactor, 1, "bridge damping factor"}, 0.25, 3.0,
    Appearance -> "Labeled"},
   {{sympatheticCountFactor, 1, "sympathetic string count factor"}, 0.0,
    2.0, Appearance -> "Labeled"},
   ControlPlacement -> Left
   ];

trombaMarinaExplorer
