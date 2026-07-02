<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Tromba Marina — Drawing Brief

No dimensioned drawings can be produced yet: this packet supplies NO reference
dimensions (design.md records only named unknowns). This brief defines what the
FIRST drawings should capture once a historical reference and/or bench-rig
constraints are accepted as controlling inputs.

## First drawings (deferred until authority exists)

- Buzzing-bridge bench-rig layout: single tensioned string over an
  interchangeable trumpet bridge and a soundboard coupon (the recommended first
  prototype — design.md "L2 Prototype Path", bom.csv BOM-009).
- Trumpet bridge module detail: asymmetric two-foot bridge with one loose foot;
  capture gap, mass, foot contact patch, and replaceable-shim interface
  (pending_bridge_* unknowns — leave dimensioned only after bench tests).
- Harmonic reference map: derived from the selected scale length + tuning
  (deferred until pending_string_scale_length and pending_main_string_tuning are
  chosen).
- Full resonator body outline: deferred until a historical envelope is selected
  and cited (cut-list.csv CUT-005 — do not cut).

## Authority Notes

- `cad/tromba-marina.scad` is a GENERIC OpenSCAD envelope scaffold (authority
  `pending_measurement`), not fabrication authority. Every numeric value in it
  is an explicit PLACEHOLDER chosen only so the silhouette renders; none is
  derived from a reference or measurement. Replace all placeholders from a
  reviewed reference before any CAD or shop work.
- Keep all drawings, tables, and prose at `concept_only` or
  `pending_measurement` until a later review supplies authority (design.md "L2
  Review Checklist").
