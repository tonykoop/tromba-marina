// Tromba Marina — GENERIC parametric envelope scaffold.
//
// Authority: pending_measurement. NOT fabrication authority. This packet is a
// concept study: design.md records only NAMED UNKNOWNS (pending_body_length,
// pending_string_scale_length, pending_bridge_*, etc.) and supplies NO
// reference dimensions. Every numeric value below is therefore an explicit
// PLACEHOLDER chosen only so the envelope renders — it is NOT derived from any
// reference, measurement, or design-table cell, and MUST be replaced from a
// selected historical reference / bench-rig constraint before any CAD or shop
// work. See design.md "Parametric Intent" and visual-output-register.csv.
//
// Nothing here claims historical dimensions, tuning, harmonic node locations,
// bridge geometry, string tension, body material, or soundboard thickness.
//
// Units: millimeters (all PLACEHOLDER).

/* [PLACEHOLDER body envelope — NO reference dimension exists] */
// Generic long-tapered tromba-marina silhouette. Replace from a reviewed
// reference drawing (design.md: pending_body_length).
body_length_mm      = 1600;   // PLACEHOLDER (pending_body_length)
base_width_mm       = 220;    // PLACEHOLDER (three-sided body, wide foot)
top_width_mm        = 60;     // PLACEHOLDER (narrow bowing end)
base_depth_mm       = 200;    // PLACEHOLDER (triangular section depth)
soundboard_thick_mm = 6;      // PLACEHOLDER (pending_soundboard_material)

/* [PLACEHOLDER single bowed string — pending_string_scale_length] */
string_scale_mm     = 1500;   // PLACEHOLDER (pending_string_scale_length)
string_count        = 1;      // single bowed string is the retained identity

/* [PLACEHOLDER trumpet bridge — pending_bridge_* / loose foot] */
bridge_height_mm    = 45;     // PLACEHOLDER (pending_bridge_height)
bridge_from_foot_mm = 220;    // PLACEHOLDER bridge station up from the base
loose_foot_gap_mm   = 1.2;    // PLACEHOLDER (pending_bridge_loose_foot_gap)

/* [PLACEHOLDER optional sympathetic strings — pending_sympathetic_*] */
symp_count          = 4;      // PLACEHOLDER (optional branch; may be zero)
symp_spacing_mm     = 14;     // PLACEHOLDER

$fn = 48;

// ---------------------------------------------------------------------------
// Modules — generic silhouette only.
// ---------------------------------------------------------------------------

module body_shell() {
  // Tapered triangular-section body (three-sided tromba-marina family form).
  hull() {
    // foot (wide) cross-section
    translate([0, 0, 0]) linear_extrude(0.01) triangle(base_width_mm, base_depth_mm);
    // top (narrow) cross-section
    translate([0, 0, body_length_mm]) linear_extrude(0.01)
      triangle(top_width_mm, base_depth_mm * 0.4);
  }
}

module triangle(w, d) {
  polygon(points = [[-w/2, 0], [w/2, 0], [0, d]]);
}

module soundboard_face() {
  // Front face plate the string + bridge bear on (y = 0 face).
  hull() {
    translate([-base_width_mm/2, 0, 0]) cube([base_width_mm, soundboard_thick_mm, 0.01]);
    translate([-top_width_mm/2, 0, body_length_mm]) cube([top_width_mm, soundboard_thick_mm, 0.01]);
  }
}

module trumpet_bridge() {
  // Asymmetric bridge near the foot: one solid foot, one loose foot lifted by
  // loose_foot_gap_mm so it can rattle (buzz) against the soundboard.
  translate([0, soundboard_thick_mm, bridge_from_foot_mm]) {
    // solid foot
    translate([-30, 0, 0]) cube([12, 8, bridge_height_mm]);
    // loose foot (raised by the gap — the buzzing foot)
    translate([18, 0, loose_foot_gap_mm]) cube([12, 8, bridge_height_mm - loose_foot_gap_mm]);
    // saddle top bar carrying the string
    translate([-30, 0, bridge_height_mm]) cube([60, 8, 6]);
  }
}

module main_string() {
  // Single bowed string down the front face from the top to the bridge saddle.
  x = 0;
  hull() {
    translate([x, soundboard_thick_mm + 4, body_length_mm - (body_length_mm - string_scale_mm)])
      sphere(1);
    translate([x, soundboard_thick_mm + 8 + bridge_height_mm,
               bridge_from_foot_mm + bridge_height_mm]) sphere(1);
  }
}

module sympathetic_strings() {
  // Optional internal sympathetic strings (may be omitted entirely).
  for (i = [0 : max(symp_count, 1) - 1]) {
    x = -symp_spacing_mm * (symp_count - 1) / 2 + i * symp_spacing_mm;
    if (symp_count > 0)
      hull() {
        translate([x, base_depth_mm * 0.25, bridge_from_foot_mm]) sphere(0.6);
        translate([x, base_depth_mm * 0.20, body_length_mm * 0.85]) sphere(0.6);
      }
  }
}

module tromba_assembly() {
  body_shell();
  soundboard_face();
  trumpet_bridge();
  main_string();
  sympathetic_strings();
}

tromba_assembly();

echo("ALL DIMENSIONS ARE PLACEHOLDERS — no reference measurement exists yet.");
echo(str("PLACEHOLDER body_length_mm=", body_length_mm,
         " string_scale_mm=", string_scale_mm,
         " loose_foot_gap_mm=", loose_foot_gap_mm));
