// File: helpers.scad
// Description: Reusable utilities for [PROJECT_NAME]
// This file contains helper functions and modules specific to
// this project. For general-purpose utilities, consider using
// a library like BOSL2 instead.

// ============================================================
// MOUNTING HARDWARE
// ============================================================

// Module: mounting_holes()
// Usage:
//   mounting_holes(spacing, diameter);
//   mounting_holes(spacing, diameter, depth);
// Description:
//   Creates a 2x2 pattern of mounting holes centered at origin
// Arguments:
//   spacing = Distance between hole centers
//   diameter = Diameter of each hole
//   ---
//   depth = Depth of holes. Default: 10
// Example(3D): Standard mounting holes
//   mounting_holes(spacing=80, diameter=5, depth=10);
// Example(3D): Custom pattern
//   mounting_holes(spacing=60, diameter=3, depth=5);
module mounting_holes(
    spacing,
    diameter,
    depth = 10
) {
    positions = [
        [-spacing/2, -spacing/2],
        [ spacing/2, -spacing/2],
        [ spacing/2,  spacing/2],
        [-spacing/2,  spacing/2]
    ];

    for (pos = positions) {
        translate([pos[0], pos[1], 0])
            cylinder(d = diameter, h = depth, center = true);
    }
}

// Module: countersink_holes()
// Usage:
//   countersink_holes(spacing, diameter, head_diameter);
// Description:
//   Creates mounting holes with countersink for flat-head screws
// Arguments:
//   spacing = Distance between hole centers
//   diameter = Diameter of screw shaft
//   head_diameter = Diameter of screw head
//   ---
//   depth = Total depth of hole. Default: 10
//   countersink_depth = Depth of countersink. Default: 3
// Example(3D): Countersunk mounting holes
//   countersink_holes(spacing=80, diameter=5, head_diameter=10);
module countersink_holes(
    spacing,
    diameter,
    head_diameter,
    depth = 10,
    countersink_depth = 3
) {
    positions = [
        [-spacing/2, -spacing/2],
        [ spacing/2, -spacing/2],
        [ spacing/2,  spacing/2],
        [-spacing/2,  spacing/2]
    ];

    for (pos = positions) {
        translate([pos[0], pos[1], 0]) {
            // Shaft hole
            cylinder(d = diameter, h = depth, center = true);

            // Countersink
            translate([0, 0, depth/2 - countersink_depth/2])
                cylinder(
                    d1 = diameter,
                    d2 = head_diameter,
                    h = countersink_depth,
                    center = true
                );
        }
    }
}

// ============================================================
// GEOMETRY UTILITIES
// ============================================================

// Module: rounded_cube()
// Usage:
//   rounded_cube(size, radius);
// Description:
//   Creates a cube with rounded edges
// Arguments:
//   size = Size as [x, y, z] or single value for cube
//   radius = Rounding radius for edges
//   ---
//   center = Whether to center the cube. Default: false
// Example(3D): Rounded cube
//   rounded_cube([50, 30, 10], radius=3);
// Example(3D): Centered rounded cube
//   rounded_cube([40, 40, 20], radius=5, center=true);
module rounded_cube(size, radius, center=false) {
    s = is_list(size) ? size : [size, size, size];

    translate(center ? [0, 0, 0] : [s[0]/2, s[1]/2, s[2]/2])
        minkowski() {
            cube(
                [s[0] - radius*2, s[1] - radius*2, s[2] - radius*2],
                center = true
            );
            sphere(r = radius);
        }
}

// Function: rounded_rect_points()
// Usage:
//   points = rounded_rect_points(width, height, radius);
// Description:
//   Generates points for a 2D rounded rectangle suitable for linear_extrude
// Arguments:
//   width = Width of rectangle
//   height = Height of rectangle
//   radius = Corner radius
//   ---
//   fn = Number of segments per corner. Default: $fn or 16
// Returns: List of 2D points
// Example(2D): Rounded rectangle profile
//   polygon(rounded_rect_points(50, 30, 5));
function rounded_rect_points(width, height, radius, fn=undef) =
    let(
        _fn = fn != undef ? fn : ($fn > 0 ? $fn : 16),
        w = width / 2 - radius,
        h = height / 2 - radius,
        step = 90 / _fn
    )
    concat(
        // Bottom-right corner
        [for (a = [0 : step : 90])
            [w + radius * cos(a), -h + radius * sin(a)]],
        // Top-right corner
        [for (a = [90 : step : 180])
            [w + radius * cos(a), h + radius * sin(a)]],
        // Top-left corner
        [for (a = [180 : step : 270])
            [-w + radius * cos(a), h + radius * sin(a)]],
        // Bottom-left corner
        [for (a = [270 : step : 360])
            [-w + radius * cos(a), -h + radius * sin(a)]]
    );

// ============================================================
// ARRAY PATTERNS
// ============================================================

// Module: linear_array()
// Usage:
//   linear_array(count, spacing, axis) children();
// Description:
//   Creates a linear array of child objects
// Arguments:
//   count = Number of copies
//   spacing = Distance between copies
//   ---
//   axis = Direction vector for array. Default: [1, 0, 0]
// Example(3D): Linear array along X axis
//   linear_array(count=5, spacing=20) cube([10, 10, 10]);
// Example(3D): Linear array along Y axis
//   linear_array(count=3, spacing=30, axis=[0, 1, 0]) sphere(d=10);
module linear_array(count, spacing, axis=[1, 0, 0]) {
    for (i = [0 : count - 1]) {
        translate(axis * spacing * i)
            children();
    }
}

// Module: circular_array()
// Usage:
//   circular_array(count, radius) children();
// Description:
//   Creates a circular array of child objects around origin
// Arguments:
//   count = Number of copies
//   radius = Distance from center
//   ---
//   start_angle = Starting angle in degrees. Default: 0
//   end_angle = Ending angle in degrees. Default: 360
// Example(3D): Full circular array
//   circular_array(count=6, radius=30) cube([5, 5, 10]);
// Example(3D): Partial circular array
//   circular_array(count=4, radius=25, start_angle=0, end_angle=180)
//       cylinder(d=8, h=15);
module circular_array(count, radius, start_angle=0, end_angle=360) {
    angle_step = (end_angle - start_angle) / count;

    for (i = [0 : count - 1]) {
        angle = start_angle + i * angle_step;
        rotate([0, 0, angle])
            translate([radius, 0, 0])
                children();
    }
}

// ============================================================
// TEXT & LABELS
// ============================================================

// Module: embossed_text()
// Usage:
//   embossed_text(text, size, depth);
// Description:
//   Creates raised text for embossing on parts
// Arguments:
//   text = Text string to emboss
//   size = Font size
//   depth = Height of embossed text
//   ---
//   font = Font name. Default: "Liberation Sans:style=Bold"
//   halign = Horizontal alignment. Default: "center"
//   valign = Vertical alignment. Default: "center"
// Example(3D): Embossed label
//   embossed_text("LABEL", size=8, depth=1);
module embossed_text(
    text,
    size,
    depth,
    font = "Liberation Sans:style=Bold",
    halign = "center",
    valign = "center"
) {
    linear_extrude(height = depth)
        text(
            text,
            size = size,
            font = font,
            halign = halign,
            valign = valign
        );
}

// Module: engraved_text()
// Usage:
//   engraved_text(text, size, depth);
// Description:
//   Creates recessed text for engraving into parts (use with difference())
// Arguments:
//   text = Text string to engrave
//   size = Font size
//   depth = Depth of engraved text
//   ---
//   font = Font name. Default: "Liberation Sans:style=Bold"
//   halign = Horizontal alignment. Default: "center"
//   valign = Vertical alignment. Default: "center"
// Example(3D): Engraved label
//   difference() {
//       cube([50, 20, 5]);
//       translate([25, 10, 5])
//           engraved_text("LABEL", size=6, depth=1);
//   }
module engraved_text(
    text,
    size,
    depth,
    font = "Liberation Sans:style=Bold",
    halign = "center",
    valign = "center"
) {
    linear_extrude(height = depth)
        text(
            text,
            size = size,
            font = font,
            halign = halign,
            valign = valign
        );
}
