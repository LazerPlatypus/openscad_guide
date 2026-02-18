// ============================================================
// PREVIEW: Fit Test
// Description: Tests clearances and fit between parts
// ============================================================
// Use this to verify tolerances and part alignment

include <../config.scad>
include <../models/consts.scad>

use <../models/part_one.scad>
use <../models/part_two.scad>

// Override for faster preview
$fn = 16;

// ============================================================
// FIT TEST VIEW
// ============================================================

// Show cross-section for clearance checking
intersection() {
    union() {
        // Base plate
        color("lightblue")
            part_one();

        // Single holder for testing
        translate([0, 0, FLOOR_THICKNESS])
        color("gray")
            part_two();

        // Widget in holder
        translate([0, 0, FLOOR_THICKNESS + WALL_THICKNESS + SLOT_HEIGHT/2])
        color("yellow", alpha=0.5)
            cylinder(
                d = WIDGET_DIAMETER,
                h = WIDGET_HEIGHT,
                center = true,
                $fn = 16
            );
    }

    // Cut plane (comment out to see full view)
    translate([0, 0, 50])
        cube([200, 200, 100], center=true);
}

// ============================================================
// MEASUREMENT GUIDES
// ============================================================

// Show clearance dimensions
%color("red") {
    // Vertical clearance indicator
    translate([SLOT_WIDTH/2 + 10, 0, FLOOR_THICKNESS + WALL_THICKNESS])
        cylinder(d=0.5, h=SLOT_HEIGHT, $fn=8);

    // Horizontal clearance indicator
    translate([0, SLOT_WIDTH/2 + 5, BASE_HEIGHT/2])
        rotate([0, 90, 0])
            cylinder(d=0.5, h=SLOT_WIDTH, center=true, $fn=8);
}
