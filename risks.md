<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Tromba Marina — Risks

Concept-study risk register. This packet supplies NO reference dimensions
(design.md records only named unknowns); every risk below is qualitative and
stays open until reference measurements and bench-rig evidence exist. Nothing
here is fabrication authority.

## Mechanism Risks

- **Buzz vs. choke tradeoff [H]** — The loose bridge foot must rattle audibly
  without choking string sustain. Gap, mass, preload, and contact material are
  all unspecified (pending_bridge_loose_foot_gap / pending_bridge_contact_material).
  Verify on a buzzing-bridge bench rig (validation.csv VAL-001..003) before any
  full-body work.
- **Buzz repeatability [M]** — A loose foot may drift or wear so the buzz is not
  resettable between sessions. Treat the bridge as a replaceable experimental
  module; log reset repeatability (VAL-002, VAL-005).
- **Harmonic playability [M]** — The instrument is played in natural harmonics;
  reliable harmonic locations depend on a chosen scale length + tuning that do
  not yet exist (pending_string_scale_length, pending_main_string_tuning).

## Structural / Safety Risks

- **Tensioned-string bench rig [H]** — Any single-string tensioning frame is a
  stored-energy hazard; load rating and anchor geometry are unengineered
  (bom.csv BOM-012). Complete a guarding + setup checklist (BOM-014) before
  tensioned tests.
- **Body load path [M]** — Long resonant body proportions and soundboard
  support are unreviewed; do not cut a full body (cut-list.csv CUT-005) until a
  historical envelope and bridge load path are accepted.

## Evidence Risks

- **No reference dimensions [H]** — Historical dimensions, tuning, harmonic
  nodes, bridge geometry, string tension, body material, and soundboard
  thickness are all absent (design.md Non-Claims). Do not promote any value to
  fabrication authority without a cited reference or bench-rig measurement.
- **Optional sympathetic-string scope creep [L]** — Adding sympathetic strings
  before the buzzing-bridge question is answered risks complicating setup;
  hold as a deferred branch (VAL-007).

## Mitigations

- Keep the packet at L2 V5 build-packet candidate; keep all values
  `concept_only` / `pending_measurement`.
- Build the buzzing-bridge bench rig first, not a full instrument.
- Select and cite a historical reference before any CAD body outline.
