# OpenSCAD Style Guide - Cheatsheet

One-page quick reference for daily use.

---

## Naming

| Type | Convention | Example |
|------|-----------|---------|
| Constants | `SCREAMING_SNAKE_CASE` | `HOCKEY_PUCK_DIAMETER` |
| Variables | `snake_case` | `segment_count` |
| Functions | `snake_case` (verb) | `calculate_radius()` |
| Modules | `snake_case` (noun/verb) | `hockey_puck()` |
| Booleans | `is_/has_/can_` prefix | `is_centered` |
| Private | `_snake_case` | `_internal_helper()` |
| Files | `snake_case.scad` | `hockey_puck.scad` |

---

## File Structure

```scad
// File: name.scad
// Description: Purpose
// Includes:
//   include <project/path/to/name.scad>

// IMPORTS
include <dep.scad>
use <util.scad>

// CONSTANTS
CONSTANT = value;

// PUBLIC FUNCTIONS
function public_func() = ...;

// PUBLIC MODULES
module public_mod() { ... }

// PRIVATE HELPERS
function _helper() = ...;
```

**Note:** Examples and tests go in `examples/` and `tests/` directories, not in source files.

---

## Documentation Format

```scad
// Function: calculate_radius()
// Usage:
//   r = calculate_radius(diameter);
// Description:
//   Calculates radius from diameter.
// Arguments:
//   diameter = The diameter. Must be positive.
//   ---
//   units = Unit system. Default: "mm"
// Example:
//   r = calculate_radius(10);  // Returns 5
function calculate_radius(diameter, units="mm") = diameter / 2;
```

**Key:** Use `---` to separate positional args from named args.

**Private items:** Use `Status: INTERNAL` in documentation.

---

## Formatting

- **Indentation:** 4 spaces
- **Line length:** < 100 characters
- **Operators:** Always spaces: `x = a + b`
- **Commas:** Space after: `[0, 0]`
- **Blank lines:** 1 between items, 2 between sections

---

## Common Patterns

### Constants with units
```scad
PUCK_DIAMETER_MM = 76.3;
PUCK_DIAMETER_INCHES = 3;
MM_PER_INCH = 25.4;
```

### Function with validation
```scad
function calculate_area(radius) =
    assert(radius > 0, "Radius must be positive")
    PI * radius * radius;
```

### Module with defaults
```scad
module bracket(
    width = 50,
    height = 30,
    thickness = 3
) {
    cube([width, height, thickness]);
}
```

### Boolean predicates
```scad
function is_valid_radius(r) = r > 0 && r < 1000;
function has_minimum_points(points) = len(points) >= 3;
```

### Private helpers
```scad
// Function: _validate_plane()
// Status: INTERNAL
// Description: Validates plane parameter.
function _validate_plane(plane) =
    assert(in_list(plane, VALID_PLANES))
    true;
```

---

## include vs use

```scad
include <consts.scad>           // Everything (constants + code)
use <deps/coord_kit/core.scad>  // Only functions/modules
```

## Dependencies

```
project/
├── models/          # Your parts
├── deps/            # Dependencies (not 'lib')
│   ├── coord_kit/
│   └── BOSL2/
└── build/           # Generated (gitignored)
```

---

## Decision Trees

### "What naming convention?"
- Never changes? → `CONSTANT`
- Function? → `calculate_something()`
- Module? → `thing_name()` or `action_something()`
- Boolean? → `is_something()` or `has_feature()`
- Private? → `_internal_thing()`

### "Where does this go?"
- Never changes? → CONSTANTS section
- Public API? → PUBLIC FUNCTIONS/MODULES
- Internal only? → PRIVATE HELPERS
- External code? → IMPORTS

---

## Quick Checks

**Before committing:**
- [ ] File header with `Includes:` block
- [ ] All items documented (public + private)
- [ ] Private items have `Status: INTERNAL`
- [ ] Public items before private in file
- [ ] Functions and modules in separate sections
- [ ] 4-space indentation
- [ ] Proper naming conventions
- [ ] No magic numbers (use constants)
- [ ] Examples/tests in separate directories

---

**Full documentation:** [OpenSCAD Guide](../README.md)
