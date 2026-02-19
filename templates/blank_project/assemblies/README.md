# Assemblies

Assemblies combine parts and hardware into complete, multi-component models. They show how everything fits together and are the primary output for previewing the finished design.

Each assembly file should:
- `use` (not `include`) its constituent parts and hardware so modules are available without side effects
- Position, orient, and optionally color each component
- Call the top-level module at the bottom so the file can be opened directly in OpenSCAD for preview and export

```scad
// File: my_assembly.scad
//   Combines my_part and a bolt into a complete assembly.
// Includes:
//   use <assemblies/my_assembly.scad>;

use <../parts/my_part.scad>;
use <../hardware/bolt.scad>;
include <../config.scad>;

// Module: my_assembly
// Description: Full assembly of my_part with bolt installed.
// Example(3D,Render):
//   my_assembly();
module my_assembly() {
    my_part();
    translate([0, 0, 5]) bolt();
}

my_assembly();
```

### Example blocks and dependencies

Because deps are imported with `use` (not `include`), they are not re-exported to the docsgen example context. An Example block that calls modules directly — rather than through the assembly module — must `use` those files explicitly:

```scad
// Example(3D,Render):
//   use <../parts/my_part.scad>;
//   use <../hardware/bolt.scad>;
//   my_part();
//   translate([0, 0, 5]) bolt();
```

You only need to `use` the files whose modules the Example block calls directly. You do **not** need to mirror every import in the source file.

Documentation should be written in the `.scad` files using [openscad_docsgen](https://github.com/BelfrySCAD/openscad_docsgen) format.

---

Delete this file when this directory is populated.
