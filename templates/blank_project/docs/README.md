# Documentation

This directory contains project documentation: hand-written guides and auto-generated API docs.

## Structure

### Hand-written docs
- **`assembly_instructions.md`** - Step-by-step guide to physically assembling the project
- **`bom.md`** - Bill of materials listing all parts and hardware needed

### Generated docs
- **`api/`** - Auto-generated API reference extracted from `.scad` source comments
  - Built by running `make docs`
  - Do not edit manually — it is recreated on each build

## Regenerating API docs

```bash
make docs
```

This scans all documented modules and functions in:
- `assemblies/*.scad`
- `hardware/*.scad`
- `parts/*.scad`
- `tools/*.scad`

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
