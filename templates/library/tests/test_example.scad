// Test: example_module.scad
//
// Tests for example_module functions and modules.
// Run `make test` to execute these tests.

include <../core.scad>

// Test example_function with default multiplier
test_value_1 = example_function(5);
assert(test_value_1 == 10, "example_function(5) should return 10");

// Test example_function with custom multiplier
test_value_2 = example_function(5, multiplier=3);
assert(test_value_2 == 15, "example_function(5, multiplier=3) should return 15");

// Test example_function with zero
test_value_3 = example_function(0);
assert(test_value_3 == 0, "example_function(0) should return 0");

// Test example_function with negative value
test_value_4 = example_function(-5);
assert(test_value_4 == -10, "example_function(-5) should return -10");

// Visual test - create some geometry to ensure modules render without errors
// The test script will check for OpenSCAD errors during rendering

example_box([10, 10, 10]);

translate([15, 0, 0])
    example_box(8, center=true);

translate([0, 15, 0])
    example_rounded_box([10, 10, 5], radius=1);

translate([15, 15, 0])
    example_rounded_box([8, 8, 5], radius=1.5, center=true, fn=32);

// If we reach here without assertions failing, all tests passed
echo("✓ All tests passed for example_module.scad");
