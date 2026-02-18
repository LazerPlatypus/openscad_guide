// Example: Basic usage of [PROJECT_NAME]
//
// This example demonstrates the basic functionality of the library.
// Run `make examples` to render this as an image.

include <../core.scad>

// Create a simple box
translate([0, 0, 0])
    example_box([20, 15, 10]);

// Create a centered cube
translate([30, 0, 0])
    example_box(15, center=true);

// Create a rounded box
translate([0, 25, 0])
    example_rounded_box([20, 15, 10], radius=2);

// Create a rounded box with higher resolution
translate([30, 25, 0])
    example_rounded_box([15, 15, 10], radius=3, center=true, fn=64);
