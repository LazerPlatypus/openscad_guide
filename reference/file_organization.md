# File Organization - Quick Reference

**Last Updated:** 2026-02-15
**Status:** Draft
**Why this structure?** See [Explanation](../explanation/why_these_conventions.md#file-organization)

---

## Standard File Template

Every `.scad` file follows this structure:

```scad
// File: filename.scad
// Description:
//   Brief file description.

// ============================================================
// IMPORTS
// ============================================================

include <dependency1.scad>
use <dependency2.scad>

// ============================================================
// CONSTANTS
// ============================================================

CONSTANT_NAME = value;

// ============================================================
// PUBLIC FUNCTIONS
// ============================================================

// Function: public_function()
// Usage:
//   result = public_function(arg);
// Description:
//   What this function does.
// Arguments:
//   arg = Description. Default: value
// Example:
//   result = public_function(10);
function public_function() = ...;

// ============================================================
// PUBLIC MODULES
// ============================================================

// Module: public_module()
// Usage:
//   public_module();
// Description:
//   What this module creates.
// Arguments:
//   ---
//   param = Description. Default: value
// Example:
//   public_module();
module public_module() { ... }

// ============================================================
// PRIVATE HELPERS
// ============================================================

// Function: _private_function()
// Status: INTERNAL
// Usage:
//   result = _private_function(arg);
// Description:
//   Internal helper for validation.
// Arguments:
//   arg = Description
function _private_function() = ...;
```

**Notes:**
- Public functions and modules come before private helpers
- Examples and tests belong in separate `examples/` and `tests/` directories, not in source files
- Keep functions and modules in separate sections for clarity

---

## Section Details

### 1. File Header
- `// File:` or `// LibFile:` block
- Description of file purpose
- Dependencies list (if any)

### 2. Imports
- `include` for full file inclusion
- `use` for modules/functions only
- Group: external libraries, local files, utilities

### 3. Constants
- All `SCREAMING_SNAKE_CASE` constants
- Grouped by purpose
- Commented with units/rationale

### 4. Public Functions
- All exported functions
- Full documentation blocks
- Kept separate from modules for clarity
- Ordered logically (most-used first or by dependency)

### 5. Public Modules
- All exported modules
- Full documentation blocks
- Kept separate from functions for clarity
- Ordered logically

### 6. Private Helpers
- All `_prefixed` internal functions/modules
- Full documentation with `Status: INTERNAL`
- Placed at end so public API is visible first
- Ordered by dependency

---

## Formatting Rules

### Indentation
- **4 spaces** (not tabs)
- Consistent throughout file

### Blank Lines
- 1 blank line between items in same section
- 2 blank lines between major sections

### Line Length
- Prefer under 100 characters
- Break long lines at logical points

### Operator Spacing
- Always spaces around operators: `x = a + b`
- Space after commas: `[0, 0]`
- No space after `(` or before `)`: `function(arg1, arg2)`

---

## File Size Guidelines

**When to split a file:**
- File has multiple distinct responsibilities (most important criterion)
- Reusable components can be extracted
- Testing would benefit from isolation
- File organization becomes unclear

**About file length:**
- Long files (500+ lines) are acceptable if they have a single, clear responsibility
- Some complex modules/functions naturally require many lines
- Focus on responsibility, not arbitrary line counts
- If a file is long, ensure it's well-organized with clear sections

**How to split:**
```
Before:
  shapes.scad (800 lines)

After:
  shapes/
    circles.scad
    rectangles.scad
    polygons.scad
    public.scad  (includes all)
```

---

## include vs use

**`include <file.scad>`:**
- Brings in everything (like copy-paste)
- Includes constants and expressions
- Use when you need constants or want code to run

**`use <file.scad>`:**
- Imports only modules and functions
- Doesn't include constants or run code
- Use when you only need functions/modules

**Example:**
```scad
include <consts.scad>           // Need the constants
use <geometry_helpers.scad>     // Only need the functions
```

---

## Project vs Library Files

### Library Files (for reuse)
- More documentation
- More validation/assertions
- Broader parameter ranges
- Public API focus
- Examples section

### Project Files (for specific design)
- Focused on specific use case
- Optimized for project needs
- May have tighter constraints
- Can be less general

---

## Common File Types

### Core library file
```scad
// LibFile: core.scad
// Description:
//   Main entry point, includes all library modules.

include <constants.scad>
include <geometry/circles.scad>
include <geometry/polygons.scad>
```

### Constants file
```scad
// File: consts.scad
// Description:
//   Shared constants for project.

HOCKEY_PUCK_DIAMETER = 76.3;
HOCKEY_PUCK_HEIGHT = 25.4;
```

### Part file
```scad
// File: base_plate.scad
// Description:
//   Base plate for display assembly.

include <../config.scad>
include <consts.scad>

module base_plate() { ... }

// Render when opened directly
base_plate();
```

### Preview file
```scad
// File: preview_assembly.scad
// Description:
//   Full assembly preview for development.

use <../models/part_one.scad>
use <../models/part_two.scad>

$fn = 16;  // Fast preview

part_one();
translate([50, 0, 0])
    part_two();
```

---

## Quick Checklist

Before committing a file:

- [ ] File header present
- [ ] Imports grouped logically
- [ ] Constants in `SCREAMING_SNAKE_CASE`
- [ ] Private items prefixed with `_`
- [ ] Sections in standard order (public before private)
- [ ] Functions and modules in separate sections
- [ ] Public items fully documented
- [ ] Private items documented with `Status: INTERNAL`
- [ ] 4-space indentation
- [ ] Lines under 100 characters
- [ ] Spaces around operators
- [ ] No examples in source files (use `examples/` directory)
- [ ] No commented-out old code

---

## Next Steps

- See [Naming Reference](naming.md) for naming conventions
- See [Documentation Reference](documentation.md) for documenting your code
- See [Project Structure](../how_to/create_project.md) *(coming soon)* for full project organization
- See [Library Structure](../how_to/create_library.md) *(coming soon)* for library organization
