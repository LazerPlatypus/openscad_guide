# Parts

Individual 3D-printable components. Each file defines one part as a self-contained module, sized by variables in `config.scad`.

Parts are imported by assemblies with `use` so their modules are available without side effects:

```scad
use <../parts/my_part.scad>;
```

Each part file should include a call to the main module for export and viewing:

```scad
// File: my_part.scad
//   A simple rectangular block.
// Includes:
//   use <parts/my_part.scad>;

include <../config.scad>;

// Module: my_part
// Description: A simple rectangular block sized from config.scad.
// Example(3D,Render):
//   my_part();
module my_part() {
    cube([PART_WIDTH, PART_LENGTH, PART_HEIGHT]);
}

my_part();
```

Documentation should be written in the `.scad` files using [openscad_docsgen](https://github.com/BelfrySCAD/openscad_docsgen) format.

---

Delete this file when this directory is populated.
