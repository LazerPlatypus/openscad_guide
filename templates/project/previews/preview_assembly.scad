// ============================================================
// PREVIEW: Full Assembly
// Description: Complete assembly showing all parts
// ============================================================
// This file is optimized for fast preview (F5)
// Use this for design iteration and fit checking

include <../config.scad>
include <../models/consts.scad>

use <../models/part_one.scad>
use <../models/part_two.scad>

// Override for faster preview
$fn = 16;

// ============================================================
// ASSEMBLY PREVIEW
// ============================================================

// Base plate
color("lightblue")
    part_one();

// Holders on base
color("gray") {
    for (i = [0 : 2]) {
        translate([
            (i - 1) * ELEMENT_SPACING,
            0,
            FLOOR_THICKNESS
        ])
            part_two();
    }
}

// ============================================================
// REFERENCE GEOMETRY
// ============================================================

// Show widget for size reference (semi-transparent)
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
                center = true,
                $fn = 16
            );
    }
}

// Optional: Show build volume for reference
// %color("red", alpha=0.1)
//     translate([0, 0, 100])
//         cube([200, 200, 200], center=true);
