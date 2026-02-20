# Hardware

OpenSCAD models of off-the-shelf hardware components — bolts, screws, nuts, inserts, etc. These are not 3D printed; they are modeled so they can be placed in assemblies for previewing fit and clearance.

Hardware modules should be "used" by assemblies and parts that need them:

```scad
use <../hardware/bolt.scad>;
```

Each file should model a single hardware type, driven by dimensions defined in `config.scad`:

```scad
// File: bolt.scad
//   A simple hex-head bolt, sized from config.scad.
// Includes:
//   use <hardware/bolt.scad>;

include <../config.scad>;

// Module: bolt
// Description: Hex-head bolt with shank.
// Example(3D,Render):
//   bolt();
module bolt() {
    // head
    rotate([0, 0, 90])
        cylinder(h=BOLT_HEAD_HEIGHT, r=BOLT_HEAD_RADIUS, $fn=6);
    // shank
    translate([0, 0, -BOLT_SHANK_HEIGHT])
        cylinder(h=BOLT_SHANK_HEIGHT, r=BOLT_SHANK_RADIUS);
}

bolt();
```

Documentation should be written in the `.scad` files using [openscad_docsgen](https://github.com/BelfrySCAD/openscad_docsgen) format.

---

Delete this file when this directory is populated.
