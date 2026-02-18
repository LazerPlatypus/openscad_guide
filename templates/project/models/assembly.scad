// ============================================================
// ASSEMBLY VIEW
// Description: Combined view of all parts (not for export)
// ============================================================
// This file shows how all parts fit together
// DO NOT export this file directly - export individual parts

include <../config.scad>
include <consts.scad>

use <part_one.scad>
use <part_two.scad>

// ============================================================
// ASSEMBLY
// ============================================================

// Base plate at origin
color("lightblue")
    part_one();

// Holders positioned on base
for (i = [0 : 2]) {
    translate([
        (i - 1) * ELEMENT_SPACING,
        0,
        FLOOR_THICKNESS
    ])
    color("gray")
        part_two();
}

// ============================================================
// REFERENCE GEOMETRY
// ============================================================

// Show widget for reference (semi-transparent)
if (SHOW_REFERENCE) {
    for (i = [0 : 2]) {
        translate([
            (i - 1) * ELEMENT_SPACING,
            0,
            FLOOR_THICKNESS + WALL_THICKNESS + SLOT_HEIGHT/2
        ])
        %color("black", alpha=0.3)
            cylinder(
                d = WIDGET_DIAMETER,
                h = WIDGET_HEIGHT,
                center = true
            );
    }
}
