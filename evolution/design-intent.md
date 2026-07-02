<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Design Intent — tromba-marina rev A

- Master CAD: `cad/tromba-marina.scad` (sha256: 5dced763eb8e61484fbd009448ac3b8359ae6d85d27a1006a1edf216c80f5eb6) — a GENERIC placeholder envelope, NOT a dimensional master. Design source is `design.md` (sha256: e01379e21f984fefd8dec9f6564308bd364f2232492cade068b10ef13441e620), which records only named unknowns.
- Function: Tromba marina (trumpet marine) — a long bowed monochord-family instrument played in natural harmonics. Its signature is a buzzing "trumpet" bridge: one bridge foot is intentionally loose enough to rattle against the soundboard when the string is bowed. Optional internal sympathetic strings may add resonance. This packet is a concept study defining the next evidence-gathering path, not a build.
- Environment: bowed acoustic instrument; a tensioned single string over a resonant body. The loose-foot bridge is an experimental, replaceable module. A tensioned-string bench rig is a stored-energy hazard (risks.md).
- Target qty: 1 (bench-rig prototype first, not a full instrument). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Body length | TBD (pending_body_length) | — | overall envelope / harmonic feel | design.md Parametric Intent |
| Main string scale length | TBD (pending_string_scale_length) | — | pitch + harmonic node locations | design.md Parametric Intent |
| Bridge height | TBD (pending_bridge_height) | — | string break + buzz geometry | design.md Parametric Intent |
| Loose-foot gap | TBD (pending_bridge_loose_foot_gap) | bench-rig gate | buzz vs. choke (VAL-001) | design.md / validation.csv |
| Bridge contact material | TBD (pending_bridge_contact_material) | bench-rig gate | buzz character + wear (VAL-005) | design.md / validation.csv |
| Soundboard material/thickness | TBD (pending_soundboard_material) | — | resonance + buzz coupling | design.md Parametric Intent |
| Sympathetic string count/tuning | TBD (optional) | — | optional resonance branch | design.md / validation.csv VAL-007 |

All rows are intentionally TBD — this packet supplies no reference dimensions (design.md Non-Claims).

## Incidental (free for DFM)

- Nothing yet — the whole form is open until a historical envelope is selected.

## Must-nots (DFM may never violate)

- Do not treat the OpenSCAD placeholder envelope as a dimensional or fabrication authority — every value in it is an explicit placeholder (design.md records only unknowns).
- Do not cut a full resonator body before a historical envelope + bridge load path are reviewed (cut-list.csv CUT-005, risks.md).
- Do not run tensioned-string tests without a guarding + setup checklist (bom.csv BOM-014, risks.md).
- Do not claim historical dimensions, tuning, harmonic node locations, or bridge geometry without a cited reference or bench measurement (design.md Non-Claims).
- Do not let the loose-foot buzz choke string sustain — validate on the bench rig first (VAL-001..003).

## Material intent

- All materials TBD (bom.csv / sourcing.csv are spec-first, all pending): body/soundboard tonewood, single bowed string, hardwood buzzing bridge, replaceable foot shims, optional sympathetic strings.
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run. The first useful prototype is a buzzing-bridge bench rig; a full-body packet waits until mechanism questions are answered and reference measurements are selected.
