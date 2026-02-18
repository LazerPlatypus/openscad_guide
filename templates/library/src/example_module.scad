// LibFile: example_module.scad
//   Example module demonstrating documentation and coding conventions
// Includes:
//   include <[PROJECT_NAME]/core.scad>


// Section: Basic Shapes
//   Functions and modules for creating basic shapes


// Function: example_function()
// Usage:
//   result = example_function(value, multiplier);
// Description:
//   Example function that demonstrates proper documentation style.
//   This function takes a value and multiplies it by a multiplier.
// Arguments:
//   value = The input value to process
//   ---
//   multiplier = Multiplication factor. Default: 2
// Example(2D): Basic usage
//   result = example_function(5);
//   // result = 10
// Example(2D): With custom multiplier
//   result = example_function(5, multiplier=3);
//   // result = 15
function example_function(
    value,
    multiplier = 2
) = value * multiplier;


// Module: example_box()
// Usage:
//   example_box(size, center);
// Description:
//   Creates a box with optional centering.
//   This is an example module showing proper documentation conventions.
// Arguments:
//   size = Size of the box as [x, y, z]. Can also be a single number for a cube.
//   ---
//   center = If true, box is centered at origin. Default: false
// Example(3D): Basic box
//   example_box([10, 20, 5]);
// Example(3D): Centered cube
//   example_box(15, center=true);
module example_box(
    size,
    center = false
) {
    // Convert single number to vector
    actual_size = is_list(size) ? size : [size, size, size];

    if (center) {
        translate(-actual_size / 2)
            cube(actual_size);
    } else {
        cube(actual_size);
    }
}


// Module: example_rounded_box()
// Usage:
//   example_rounded_box(size, radius, center);
// Description:
//   Creates a box with rounded edges.
//   Demonstrates a more complex module with multiple parameters.
// Arguments:
//   size = Size of the box as [x, y, z]
//   ---
//   radius = Radius of edge rounding. Default: 1
//   center = If true, box is centered at origin. Default: false
//   fn = Number of fragments for rounding. Default: $fn or 32
// Example(3D): Basic rounded box
//   example_rounded_box([20, 15, 10], radius=2);
// Example(3D): Centered with custom rounding
//   example_rounded_box([30, 30, 10], radius=3, center=true, fn=64);
module example_rounded_box(
    size,
    radius = 1,
    center = false,
    fn = undef
) {
    actual_fn = fn != undef ? fn : ($fn > 0 ? $fn : 32);

    module rounded_cube() {
        hull() {
            for (x = [radius, size.x - radius]) {
                for (y = [radius, size.y - radius]) {
                    for (z = [radius, size.z - radius]) {
                        translate([x, y, z])
                            sphere(r=radius, $fn=actual_fn);
                    }
                }
            }
        }
    }

    if (center) {
        translate(-size / 2)
            rounded_cube();
    } else {
        rounded_cube();
    }
}
