// ============================================================
// PART: Part One
// Description: Base plate for [PROJECT_NAME]
// ============================================================

include <../config.scad>
include <consts.scad>

// ============================================================
// PART MODULE
// ============================================================

// Module: part_one()
// Usage:
//   part_one();
//   part_one(width, depth, thickness);
// Description:
//   Creates the base plate with mounting holes
// Arguments:
//   width = Width of the base plate. Default: BASE_WIDTH
//   depth = Depth of the base plate. Default: BASE_DEPTH
//   thickness = Thickness of the plate. Default: FLOOR_THICKNESS
// Example(3D): Standard base plate
//   part_one();
// Example(3D): Custom sized base plate
//   part_one(width=150, depth=80, thickness=5);
module part_one(
    width = BASE_WIDTH,
    depth = BASE_DEPTH,
    thickness = FLOOR_THICKNESS
) {
    difference() {
        // Main plate body
        translate([0, 0, thickness/2])
            cube([width, depth, thickness], center = true);

        // Mounting holes at corners
        for (x = [-1, 1], y = [-1, 1]) {
            translate([
                x * MOUNTING_HOLE_SPACING/2,
                y * MOUNTING_HOLE_SPACING/2,
                -0.1
            ])
                cylinder(
                    d = MOUNTING_HOLE_DIAMETER,
                    h = thickness + 0.2,
                    $fn = EXPORT_MODE ? 64 : 16
                );
        }
    }
}

// ============================================================
// RENDER
// ============================================================

// Render this part when file is opened directly
part_one();
