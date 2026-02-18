# Documentation Format - Quick Reference

**Last Updated:** 2026-02-15
**Status:** Draft
**Tool:** [openscad_docsgen](https://github.com/BelfrySCAD/openscad_docsgen)
**Full Reference:** [WRITING_DOCS.md](https://github.com/BelfrySCAD/openscad_docsgen/blob/main/WRITING_DOCS.md)

---

## Basic Format

All documentation uses openscad_docsgen comment block format:

```scad
// BlockName: identifier
//   Body line 1
//   Body line 2
```

**Key rules:**
- Block names start with capital letter + colon
- Body lines indented with `//` + 3 spaces
- Use `.` on its own line for paragraph breaks

---

## File Header

**Every file must start with:**

```scad
// File: filename.scad
// Description:
//   Brief description of file purpose.
//   What it provides.
// Includes:
//   include <path/to/filename.scad>
```

**Important:** The `Includes:` block must show the relative path from the project root. This is required for openscad_docsgen to properly generate images from examples.

**For libraries:**

```scad
// LibFile: geometry/circles.scad
// Description:
//   Circle and arc generation functions.
// Includes:
//   include <library_name/src/geometry/circles.scad>
```

**Example with dependencies:**

```scad
// File: models/bracket.scad
// Description:
//   Mounting bracket creation.
// Includes:
//   include <project_name/models/bracket.scad>
//   include <BOSL2/std.scad>
//   include <../lib/helpers.scad>
```

**Note:** Always include the path to the file itself first, then external dependencies

---

## Function Documentation

**Required blocks:**
- `Function:` - Name with parentheses
- `Usage:` - Common calling patterns
- `Description:` - What it does
- `Arguments:` - All parameters
- `Example:` - At least one example

**Template:**

```scad
// Function: function_name()
// Usage:
//   result = function_name(param1);
//   result = function_name(param1, param2);
// Description:
//   What this function does.
//   Additional details.
// Arguments:
//   param1 = Description. Units. Constraints.
//   param2 = Description. Default: value
//   ---
//   optional_param = Description. Default: value
// Example:
//   result = function_name(10);  // Returns ...
```

**Key points:**
- Use `---` to separate positional arguments from named arguments
- Positional arguments appear before `---` and must be provided in order
- Named arguments appear after `---` and can be provided in any order with `name=value`
- Always specify defaults for named arguments
- Include units and constraints
- Provide concrete examples

---

## Module Documentation

**Required blocks:**
- `Module:` - Name with parentheses
- `Usage:` - Common calling patterns
- `Description:` - What it creates
- `Arguments:` - All parameters
- `Example:` - At least one example

**Template:**

```scad
// Module: module_name()
// Usage:
//   module_name();
//   module_name(param1, param2);
//   module_name(param1) { children }
// Description:
//   Creates geometry description.
//   Positioning and orientation details.
// Arguments:
//   param1 = Description. Units. Default: value
//   ---
//   param2 = Description. Default: value
// Example:
//   module_name();
// Example: Custom size
//   module_name(width=100, height=60);
```

---

## Constants Documentation

**Simple constants:**

```scad
// Constant: CONSTANT_NAME
// Description:
//   What this constant represents.
//   Why this specific value.
CONSTANT_NAME = value;
```

**Grouped constants:**

```scad
// ============================================================
// CONSTANTS - Group Description
// ============================================================
// Overall group explanation if needed

CONSTANT_ONE = value;   // Inline comment
CONSTANT_TWO = value;   // Inline comment
```

---

## Examples

**Simple example:**

```scad
// Example:
//   hockey_puck();
```

**Named example:**

```scad
// Example: Large puck
//   hockey_puck(diameter=80);
```

**2D example:**

```scad
// Example(2D):
//   polygon(make_circle_points(10));
```

**Example with setup:**

```scad
// Example:
//   $fn = 64;
//   difference() {
//       hockey_puck();
//       cylinder(d=20, h=30, center=true);
//   }
```

---

## Special Sections

**Status:**

```scad
// Function: old_function()
// Status: DEPRECATED, use `new_function()` instead
```

```scad
// Function: experimental_feature()
// Status: EXPERIMENTAL - API may change
```

**Topics:**

```scad
// Function: make_bracket()
// Topics: Geometry, Hardware, Mounting
```

**See Also:**

```scad
// Function: make_circle_points()
// See Also: make_arc_points(), make_ellipse_points()
```

---

## Private vs Public

**Public items:** Full documentation (all blocks required)

**Private items:** Full documentation with `Status: INTERNAL`

```scad
// Function: _validate_plane()
// Status: INTERNAL
// Usage:
//   valid = _validate_plane(plane);
// Description:
//   Internal helper to validate plane parameter.
//   Returns true if valid, raises assertion if invalid.
// Arguments:
//   plane = Plane identifier to validate
function _validate_plane(plane) =
    assert(in_list(plane, VALID_PLANES), str("Invalid plane: ", plane))
    true;
```

**Why full documentation for private items:**
- Helps maintainers understand internal code
- Facilitates debugging and refactoring
- `Status: INTERNAL` signals it's not public API
- Can be filtered out of public documentation generation

---

## Inline Comments

**When to use:**
- Complex mathematical operations
- Non-obvious algorithms
- Workarounds
- Performance optimizations

**Example:**

```scad
let (
    // Calculate centroid by averaging all points
    centroid = [
        sum([for (p = points) p.x]) / len(points),
        sum([for (p = points) p.y]) / len(points)
    ],

    // Translate relative to centroid for center rotation
    centered = [for (p = points) p - centroid]
)
```

**When NOT to use:**
- Obvious operations
- Repeating what code shows
- Compensating for bad naming

---

## Quick Checklist

Before committing:

- [ ] File has `// File:` or `// LibFile:` header with `Includes:` block
- [ ] `Includes:` shows relative path from project root
- [ ] All public functions have `// Function:` blocks
- [ ] All public modules have `// Module:` blocks
- [ ] All private items have full docs with `Status: INTERNAL`
- [ ] Each has `Usage:`, `Description:`, `Arguments:`, `Example:`
- [ ] Examples show actual usage, not just syntax
- [ ] `---` used correctly to separate positional from named arguments
- [ ] Constants have explanatory comments
- [ ] Complex logic has inline comments
- [ ] No `Aliases:` blocks (one name per function)

---

## Configuration

**Setup in `.openscad_docsgen_rc`:**

```plaintext
DocsDirectory: docs/api
TargetProfile: githubwiki
ProjectName: Your Project
GeneratedDocs: Files, ToC, Index, Topics, CheatSheet
```

See [How to Set Up openscad_docsgen](../how_to/setup_openscad_docsgen.md) *(coming soon)*

---

## Next Steps

- See [Naming Reference](naming.md) for naming your documented items
- See [File Organization](file_organization.md) for structuring documented files
- See [Why These Conventions](../explanation/why_these_conventions.md#documentation) for rationale
