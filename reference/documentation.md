# Documentation Format - Quick Reference

**Last Updated:** 2026-02-19
**Status:** Draft
**Tool:** [openscad_docsgen](https://github.com/BelfrySCAD/openscad_docsgen)
**Full Reference:** [WRITING_DOCS.md](https://github.com/BelfrySCAD/openscad_docsgen/blob/main/WRITING_DOCS.md)

---

## Core Rules

- Keep documentation in source files, next to implementation.
- Prefer practical completeness over rigid boilerplate.
- Include examples in doc blocks whenever possible.
- Use `Status: INTERNAL` for private items.

---

## File Header

Every `.scad` file starts with:

```scad
// File: filename.scad
// Description:
//   Brief description of file purpose.
// Includes:
//   use <path/to/filename.scad>
```

For libraries, `LibFile:` is also valid.

### `Includes:` usage

- First line should show how users import this file from project root.
- Prefer `use <...>` for modules/functions.
- Add extra `include`/`use` lines in individual examples only when needed by that example.

Example:

```scad
// File: parts/bracket.scad
// Description:
//   Bracket geometry.
// Includes:
//   use <parts/bracket.scad>
```

---

## Public Item Requirements

### Required blocks (all public functions/modules)
- Header (`Function:` or `Module:`)
- `Description:`
- `Usage:`

### Conditional requirement
- `Arguments:` is required when the item takes arguments.
- `Arguments:` must be omitted when the item takes no arguments.

### Strong recommendation
- `Example:` is strongly recommended for all public items.
- For geometry-producing modules, examples should be treated as standard practice.

---

## Function Template

With arguments:

```scad
// Function: calculate_radius
// Usage:
//   radius = calculate_radius(diameter);
// Description:
//   Calculates radius from diameter.
// Arguments:
//   diameter = Diameter value. Must be positive.
// Example:
//   calculate_radius(10);  // 5
function calculate_radius(diameter) = diameter / 2;
```

Without arguments:

```scad
// Function: default_segments
// Usage:
//   default_segments();
// Description:
//   Returns the default segment count.
// Example:
//   default_segments();
function default_segments() = 32;
```

---

## Module Template

With arguments:

```scad
// Module: puck
// Usage:
//   puck(diameter=76.3, height=25.4);
// Description:
//   Creates a puck body.
// Arguments:
//   diameter = Diameter in mm. Default: 76.3
//   height = Height in mm. Default: 25.4
// Example(3D,Render):
//   puck();
module puck(diameter=76.3, height=25.4) {
    cylinder(d=diameter, h=height);
}
```

Without arguments:

```scad
// Module: bolt_preview
// Usage:
//   bolt_preview();
// Description:
//   Renders a fixed bolt preview.
// Example(3D,Render):
//   bolt_preview();
module bolt_preview() {
    // ...
}
```

---

## Examples in Source Files

Examples in doc comment blocks are preferred.

- They improve generated documentation quality.
- They support docs image generation.
- They remain versioned with implementation changes.

Supported patterns include:
- `Example:`
- `Example(2D):`
- `Example(3D,Render):`

---

## Private Items

Private functions/modules should still be documented for maintainability.

```scad
// Function: _validate_plane
// Status: INTERNAL
// Usage:
//   _validate_plane(plane);
// Description:
//   Validates plane parameter and raises on invalid values.
// Arguments:
//   plane = Plane identifier.
function _validate_plane(plane) =
    assert(in_list(plane, ["XY", "XZ", "YZ"]))
    true;
```

---

## Configuration

Baseline `.openscad_docsgen_rc`:

```plaintext
DocsDirectory: docs/api
TargetProfile: wiki
ProjectName: Your Project
GenerateDocs: Files, ToC, Index, Topics, CheatSheet
```

Why `wiki`?
- Better compatibility with VS Code markdown visualization.

---

## Quick Checklist

- [ ] File header includes `File`/`LibFile`, `Description`, and `Includes`
- [ ] Public items include header + `Description` + `Usage`
- [ ] `Arguments` present only when arguments exist
- [ ] `Example` blocks included wherever practical (strongly recommended)
- [ ] Private items include `Status: INTERNAL`
- [ ] `.openscad_docsgen_rc` uses `TargetProfile: wiki`
- [ ] `.openscad_docsgen_rc` uses `GenerateDocs` (not `GeneratedDocs`)

---

## Next Steps

- See [File Organization](file_organization.md) for placement and ordering
- See [Project Structure](project_structure.md) for folder/workflow conventions
- See [Why These Conventions](../explanation/why_these_conventions.md#documentation) for rationale
