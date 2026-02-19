# Tools

Reusable OpenSCAD utility modules that are specific to this project but shared across multiple parts and assemblies. Think of these as the project's internal library.

Tools are imported with `use` so their modules are available without side effects:

```scad
use <../tools/my_tool.scad>;
```

Good candidates for tools:
- Geometry helpers (e.g. a standard mounting interface, a connector profile)
- Positioning aids (e.g. a "helping hand" placeholder used during assembly layout)
- Repeated subshapes that aren't standalone printable parts

Tools should have a call to the main module for easy viewing in OpenSCAD

```scad
// File: my_tool.scad
//   Shared geometry helper used by parts in this project.
// Includes:
//   use <tools/my_tool.scad>;

include <../config.scad>;

// Module: my_tool
// Description: Creates a standard mounting slot.
// Arguments:
//   width = Slot width in mm
// Example(3D,Render):
//   my_tool(width=10);
module my_tool(width=10) {
    cube([width, TOOL_LENGTH, TOOL_HEIGHT]);
}

my_tool();
```

Documentation should be written in the `.scad` files using [openscad_docsgen](https://github.com/BelfrySCAD/openscad_docsgen) format.

---

Delete this file when this directory is populated.
