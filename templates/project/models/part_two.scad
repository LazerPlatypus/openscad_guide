// ============================================================
// PART: Part Two
// Description: Holder/mount component for [PROJECT_NAME]
// ============================================================

include <../config.scad>
include <consts.scad>

// ============================================================
// PART MODULE
// ============================================================

// Module: part_two()
// Usage:
//   part_two();
//   part_two(height, wall);
// Description:
//   Creates a holder/mount component with a slot
// Arguments:
//   height = Overall height of the holder. Default: BASE_HEIGHT
//   wall = Wall thickness. Default: WALL_THICKNESS
// Example(3D): Standard holder
//   part_two();
// Example(3D): Taller holder with thicker walls
//   part_two(height=50, wall=3);
module part_two(
    height = BASE_HEIGHT,
    wall = WALL_THICKNESS
) {
    difference() {
        // Main body - cylinder or rounded rectangle
        translate([0, 0, height/2])
            cylinder(
                d = SLOT_WIDTH + wall * 2,
                h = height,
                center = true
            );

        // Slot for widget
        translate([0, 0, wall])
            cylinder(
                d = SLOT_WIDTH,
                h = height,
                center = false
            );

        // Side opening for insertion
        translate([SLOT_WIDTH/4, 0, height/2 + wall])
            cube([
                SLOT_WIDTH/2 + 1,
                SLOT_WIDTH + 1,
                height
            ], center = true);
    }
}

// ============================================================
// RENDER
// ============================================================

// Render this part when file is opened directly
part_two();
