<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# CAD MCP Session Log

Status: V5 provenance stub for `tromba-marina`.

No MCP, CAD, DXF, image generation, Wolfram, acoustic modeling, or measurement
tool produced or modified artifacts in this repository. This is a text-only L2
V5 build-packet candidate, not a fabrication packet.

## Step 0 QMD

| timestamp | command | result |
| --- | --- | --- |
| 2026-05-30 | `qmd query "tromba-marina Tromba marina (trumpet marine) -- a very long single bowed string with a buzzing 'trumpet' bridge (one foot loose so it rattles against the soundboard), played in natural harmonics; sympathetic strings inside the body"` | Tooling timeout: qmd entered node-llama-cpp CPU fallback and returned no usable context before `timeout 30` exited with code 124. |
| 2026-05-30 | `qmd search "tromba marina" -c instrument-builds` | Tooling error: sqlite-vec extension unavailable; no usable context returned. |

## Tool Sessions

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-30-codex-r7-tromba-marina | none | Round 7 lane prompt only | `README.md`; `design.md`; `bom.csv`; `decision-record.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | concept_packet_scaffold | concept_only | self_checked | No CAD geometry, DXF coordinates, tuning values, harmonic-position tables, acoustic predictions, pressure values, bridge dimensions, or force values were generated. |
| 2026-05-30-codex-r7-tromba-marina-l2 | local text edit | Existing L1 packet files only | `README.md`; `design.md`; `bom.csv`; `cut-list.csv`; `decision-record.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | l2_packet_uplift | pending_measurement | self_checked | L2 review structure added without CAD geometry, DXF coordinates, tuning values, harmonic-position tables, bridge dimensions, or force values. |
| 2026-05-30-wolfram-hand-authoring | Codex local edit | Round 8 Wolfram author contract plus existing repo design notes | `tromba-marina-starter.wl`; `wolfram/tromba-marina-wolfram-model.wl` | wolfram_source_authoring | reference_only | self_checked | No MCP, Desktop, or Cloud Wolfram session was run; source was authored by hand. All physical numeric inputs are estimate placeholders pending measurement, not fabrication authority. |

## Next Provenance Requirement

Any future CAD, drawing, render, tuning, harmonic, string-force, bridge-buzz, or
sympathetic-string artifact must add a new row here with the real tool, source
inputs, outputs, review status, and authority result.
