# Source

The library's reusable modules and functions. These files form the public API and are meant to be `use`d or `include`d by consumers — they must not produce any geometry at the file root.

Each source file should:
- Define one or more related modules or functions
- `use` any sibling files or dependencies it requires
- **Never** call a module or produce geometry at the file root — library files must be side-effect free

```scad
// File: my_module.scad
//   A reusable widget module.
// Includes:
//   use <src/my_module.scad>;

use <./helpers.scad>;

// Module: my_module
// Description: Creates a widget with the given size.
// Arguments:
//   size = Width of the widget in mm.
// Example(3D,Render):
//   my_module(size=10);
module my_module(size=10) {
    cube([size, size, size / 2]);
}

// Function: my_volume
// Description: Returns the volume of a widget.
// Arguments:
//   size = Width of the widget in mm.
// Example:
//   vol = my_volume(size=10);  // Returns 500
function my_volume(size=10) = size * size * (size / 2);
```

There is no module call at the end. Unlike project parts, library source files are always imported — a top-level call would execute geometry every time the file is `include`d.

Documentation should be written in the `.scad` files using [openscad_docsgen](https://github.com/BelfrySCAD/openscad_docsgen) format.

---

Delete this file when this directory is populated.
