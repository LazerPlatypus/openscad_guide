# File Organization - Quick Reference

**Last Updated:** 2026-02-19
**Status:** Draft
**Why this structure?** See [Explanation](../explanation/why_these_conventions.md#file-organization)

---

## Standard File Template

```scad
// File: parts/example_part.scad
// Description:
//   One-line purpose statement.
// Includes:
//   use <parts/example_part.scad>

use <../deps/coord_kit/core.scad>;
include <../config.scad>;

EXAMPLE_CONST = 10;

// Function: calculate_value
// Usage:
//   calculate_value(input);
// Description:
//   Computes a derived value.
// Arguments:
//   input = Numeric input.
// Example:
//   calculate_value(10);
function calculate_value(input) = input + EXAMPLE_CONST;

// Module: example_part
// Usage:
//   example_part();
// Description:
//   Creates example part geometry.
// Example(3D,Render):
//   example_part();
module example_part() {
    cube([10, 10, 10]);
}

// Function: _internal_helper
// Status: INTERNAL
// Usage:
//   _internal_helper(v);
// Description:
//   Internal helper.
// Arguments:
//   v = Value to normalize.
function _internal_helper(v) = max(v, 0);

example_part();
```

---

## Ordering Guidelines

Preferred top-to-bottom order:

1. File header (`File`/`LibFile`, `Description`, `Includes`)
2. Imports (`use`/`include`)
3. Constants
4. Public functions
5. Public modules
6. Private helpers (`_`-prefixed)
7. Default render call

Public API stays above internal implementation details.

---

## `Includes:` Guidance

### Required behavior
- First `Includes:` entry should show project-root import path for this file.
- Use `use <...>` for module/function consumers by default.

### Example-level additions
- If an individual `Example` block needs more context, add additional `use`/`include` lines in that example block.
- Do not overload top-level `Includes:` with every possible transitive dependency.

---

## Examples in Source

Examples in source doc blocks are preferred.

- Keep examples short and realistic.
- Use `Example(2D)` / `Example(3D,Render)` where it improves clarity.
- Put extended tutorials in separate example files; keep API usage examples in source docs.

---

## Render Behavior

Project files should render unconditionally when opened directly in OpenSCAD.

- Add a default render call at file end for direct visual feedback.
- Use `config.scad` for quality/export flags (`EXPORT_MODE`, `PREVIEW_FN`, `EXPORT_FN`, `$fn`).
- Avoid patterns that open to a blank viewport by default.

---

## Formatting Rules

- **Indentation:** 4 spaces
- **Line length:** prefer under 100 chars
- **Operators:** spaces around operators (`x = a + b`)
- **Commas:** space after comma (`[0, 0]`)
- **Blank lines:** 1 between related items, 2 between major sections

---

## Common File Types (Project)

### `parts/*.scad`
- Printable geometry modules.
- Export targets for STL generation.

### `assemblies/*.scad`
- Combined setups for fit checks and docs renders.
- Usually image targets, not STL targets.

### `tools/*.scad`
- Reusable helper modules used by `parts`.
- Often not directly printable final models.

### `hardware/*.scad`
- Hardware references and supporting helpers.

---

## Quick Checklist

- [ ] Header includes `File`/`LibFile`, `Description`, `Includes`
- [ ] `Includes` starts with project-root `use <...>` path for the file itself
- [ ] Public items are above private helpers
- [ ] Private helpers use `_` prefix and `Status: INTERNAL`
- [ ] `Arguments` block appears only when arguments exist
- [ ] Source doc examples are present (strongly recommended)
- [ ] File renders unconditionally when opened directly
- [ ] Formatting remains consistent (4-space indent, spacing, line length)

---

## Next Steps

- See [Documentation Reference](documentation.md) for block-level docs requirements
- See [Project Structure](project_structure.md) for directory and workflow conventions
- See [Naming Reference](naming.md) for naming patterns
