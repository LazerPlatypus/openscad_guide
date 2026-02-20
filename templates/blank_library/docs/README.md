# Documentation

This directory contains auto-generated API docs.

## Regenerating API docs

```bash
make docs
```

This scans all documented modules and functions in:
- `src/*.scad`

## Documenting code

Use [openscad_docsgen](https://github.com/BelfrySCAD/openscad_docsgen) comment format in your `.scad` files:

```scad
// Module: my_module
// Usage:
//   my_module(size);
// Description:
//   Creates a component with the specified size.
// Arguments:
//   size = Size in millimeters
// Example(3D,Render):
//   my_module(10);
module my_module(size) {
    cube([size, size, size]);
}
```

---

Delete this file when this directory is populated.
