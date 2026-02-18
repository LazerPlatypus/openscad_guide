// ============================================================
// PREVIEW: Exploded View
// Description: Exploded assembly showing part relationships
// ============================================================
// Useful for documentation and understanding assembly order

include <../config.scad>
include <../models/consts.scad>

use <../models/part_one.scad>
use <../models/part_two.scad>

// Override for faster preview
$fn = 16;

// Explosion distance
EXPLODE_DISTANCE = 50;

// ============================================================
// EXPLODED ASSEMBLY
// ============================================================

// Base plate (at origin)
color("lightblue")
    part_one();

// Holders - exploded upward and outward
color("gray") {
    for (i = [0 : 2]) {
        translate([
            (i - 1) * (ELEMENT_SPACING + EXPLODE_DISTANCE/2),
            0,
            FLOOR_THICKNESS + EXPLODE_DISTANCE
        ])
            part_two();
    }
}

// Widgets - exploded further up
if (SHOW_REFERENCE) {
    for (i = [0 : 2]) {
        translate([
            (i - 1) * (ELEMENT_SPACING + EXPLODE_DISTANCE/2),
            0,
            FLOOR_THICKNESS + EXPLODE_DISTANCE * 2
        ])
        color("black", alpha=0.3)
            cylinder(
                d = WIDGET_DIAMETER,
                h = WIDGET_HEIGHT,
                center = true,
                $fn = 16
            );
    }
}

// ============================================================
// ASSEMBLY ARROWS (OPTIONAL)
// ============================================================

// Show assembly direction with arrows
%color("green") {
    for (i = [0 : 2]) {
        translate([
            (i - 1) * (ELEMENT_SPACING + EXPLODE_DISTANCE/2),
            0,
            FLOOR_THICKNESS + EXPLODE_DISTANCE/2
        ])
            cylinder(d=1, h=EXPLODE_DISTANCE/2, $fn=8);
    }
}
