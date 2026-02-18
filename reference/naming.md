# Naming Conventions - Quick Reference

**Last Updated:** 2026-02-15
**Status:** Draft
**Why these conventions?** See [Explanation](../explanation/why_these_conventions.md#naming)

---

## Decision Tree

**What am I naming?**
- A value that never changes → [Constants](#constants)
- A function that returns a value → [Functions](#functions)
- A module that creates geometry → [Modules](#modules)
- Something users shouldn't call directly → [Private Items](#private-items)
- A collection (list/array) → [Plurals](#plurals)
- A boolean value → [Booleans](#booleans)
- A `.scad` file → [Files](#files)

---

## Constants

**Format:** `SCREAMING_SNAKE_CASE`

**Examples:**
- Physical dimensions: `HOCKEY_PUCK_DIAMETER`, `PUCK_HEIGHT`
- Configuration: `DEFAULT_SEGMENTS`, `HIGH_QUALITY_FN`
- Mathematical: `PHI`, `TAU`
- Tolerances: `EPSILON`, `DEFAULT_TOLERANCE`

**Quick rules:**
- All uppercase
- Underscores between words
- No abbreviations unless universally understood

---

## Functions

**Format:** `snake_case`

**Patterns:**
- Calculations: Use verbs (`calculate_`, `compute_`)
- Boolean checks: Use predicates (`is_`, `has_`, `can_`)
- Generators: Use action verbs (`make_`, `create_`, `generate_`)
- Transforms: Use verbs (`rotate_`, `scale_`, `translate_`)

**Examples:**
- `calculate_radius(diameter)`
- `is_valid_radius(r)`
- `make_circle_points(radius, segments)`
- `rotate_points(points, angle)`

**Quick rules:**
- Lowercase with underscores
- Use full words, not abbreviations
- Verb-based naming for actions
- Descriptive, not cryptic

---

## Modules

**Format:** `snake_case`

**Patterns:**
- Geometry creators: Use nouns (`hockey_puck`, `mounting_bracket`)
- Geometry modifiers: Use verbs (`extrude_rounded`, `mirror_duplicate`)
- Patterns/arrays: Use descriptive names (`pattern_circular`, `array_linear`)

**Examples:**
- `hockey_puck(diameter, height)`
- `extrude_along_path(path, profile)`
- `mirror_duplicate(axis)`

**Quick rules:**
- Lowercase with underscores
- Nouns for things, verbs for actions
- Consistent with OpenSCAD built-ins (`linear_extrude`, `rotate_extrude`)

---

## Private Items

**Format:** `_snake_case` (prefix with underscore)

**Use for:**
- Internal helper functions
- Implementation details
- Functions/modules not meant for public use

**Examples:**
- `_validate_plane(plane)`
- `_calculate_intermediate_point(p1, p2)`
- `_internal_render_helper()`

**Quick rules:**
- Same naming as public items, but prefixed with `_`
- Not documented in public API
- Can change without warning

---

## Plurals

**Use singular for single values, plural for collections:**
- Single: `point`, `radius`, `segment_count`
- Multiple: `points`, `radii`, `segment_counts`

**Examples:**
- `point = [0, 0]` (single 2D coordinate)
- `points = [[0,0], [10,0], [10,10]]` (list of coordinates)
- `function make_circle_points(...)` (returns multiple points)

---

## Booleans

**Use clear prefixes:**
- `is_` for state checks: `is_centered`, `is_clockwise`
- `has_` for feature checks: `has_mounting_holes`, `has_lid`
- `can_` for capability: `can_extrude`, `can_render`
- `should_` for decisions: `should_render_preview`

**Examples:**
- `is_valid = check_dimensions(w, h)`
- `has_holes = hole_count > 0`
- `module bracket(include_lid = false)`

---

## Files

**Format:** `snake_case.scad`

**Examples:**
- Good: `hockey_puck.scad`, `mounting_bracket.scad`, `geometry_utils.scad`
- Bad: `HockeyPuck.scad`, `mountingBracket.scad`, `geometry-utils.scad`

**Quick rules:**
- Lowercase with underscores
- Descriptive of contents
- No spaces or special characters
- Consistent with module/function naming

---

## Common Patterns

### Multi-word Names
- ✅ `calculate_maximum_radius`
- ❌ `calc_max_rad`

### When to Abbreviate
**DO abbreviate:**
- Standard math: `r` (radius), `d` (diameter), `theta`, `phi`
- OpenSCAD convention: `fn` (fragment number)
- Very long words: `coord` (coordinate), `param` (parameter)

**DON'T abbreviate:**
- Domain terms
- When it reduces clarity
- Inconsistently

### Units in Names
- Include units when ambiguous: `diameter_mm`, `angle_degrees`
- Omit when project uses single unit system (document in constants)

---

## Summary Table

| Type | Convention | Example |
|------|-----------|---------|
| Constants | `SCREAMING_SNAKE_CASE` | `HOCKEY_PUCK_DIAMETER` |
| Variables | `snake_case` | `segment_count` |
| Functions | `snake_case` (verb) | `calculate_radius()` |
| Modules | `snake_case` (noun/verb) | `hockey_puck()` |
| Booleans | `is_/has_/can_` | `is_centered` |
| Private | `_snake_case` | `_internal_helper()` |
| Plurals | Add `s` | `points`, `radii` |
| Files | `snake_case.scad` | `hockey_puck.scad` |

---

## Next Steps

- See [Documentation Reference](documentation.md) for how to document your well-named code
- See [File Organization](file_organization.md) for where to put your code
- See [Why These Conventions](../explanation/why_these_conventions.md#naming) for rationale
