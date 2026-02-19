# OpenSCAD Style Guide - Cheatsheet

One-page quick reference for daily use.

---

## Naming

| Type | Convention | Example |
|------|-----------|---------|
| Constants | `SCREAMING_SNAKE_CASE` | `BEST_FENCE_INTERIOR_WIDTH` |
| Variables | `snake_case` | `channel_spacing` |
| Functions | `snake_case` (verb) | `calculate_radius()` |
| Modules | `snake_case` | `toe_clamp_body()` |
| Booleans | `is_/has_/can_` | `is_export_mode` |
| Private | `_snake_case` | `_validate_args_mount()` |
| Files | `snake_case.scad` | `toe_clamp_body.scad` |

--- 

## Canonical Project Layout

```
project/
├── config.scad
├── parts/          # Printable geometry (STL targets)
├── assemblies/     # Composed views (image/docs targets)
├── tools/          # Reusable geometry-building modules
├── hardware/       # Hardware models/helpers
├── deps/           # External dependencies
├── scripts/        # Build/docs scripts
├── build/          # Generated output (gitignored)
└── docs/           # Hand-written + generated docs
```

---

## File Header + Includes

```scad
// File: parts/example.scad
// Description:
//   Example part.
// Includes:
//   use <parts/example.scad>
```

- First `Includes:` line shows project-root import path for this file.
- Prefer `use` for file self-reference in docs.
- Add additional `use`/`include` lines inside specific examples as needed.

---

## Documentation Minimum

### Public items require
- `Function:` or `Module:`
- `Description:`
- `Usage:`

### `Arguments:` rule
- Include `Arguments:` only when the item takes arguments.
- Omit `Arguments:` when there are no arguments.

### Examples
- `Example:` is strongly recommended.
- In-source examples are preferred.

### Private items
- Add `Status: INTERNAL`.

---

## Runtime Config Pattern

```scad
PREVIEW_FN = 32;
EXPORT_FN = 128;
EXPORT_MODE = false;
$fn = EXPORT_MODE ? EXPORT_FN : PREVIEW_FN;
```

- Files should render unconditionally when opened directly in OpenSCAD.

---

## docsgen Config Baseline

```plaintext
DocsDirectory: docs/api
TargetProfile: wiki
ProjectName: your_project
GenerateDocs: Files, ToC, Index, Topics, CheatSheet
```

Use `wiki` for better VS Code markdown visualization compatibility.

---

## Make + Scripts Pattern

```bash
make            # build default targets
make docs       # generate API docs
make images     # render docs images
make clean      # remove generated output
```

Common scripts:
- `scripts/export_all.sh`
- `scripts/export_part.sh`
- `scripts/render_images.sh`
- `scripts/generate_docs.sh`
- `scripts/setup.sh`

---

## Formatting

- 4-space indentation
- Prefer line length under 100 chars
- Spaces around operators (`x = a + b`)
- Space after commas (`[0, 0]`)

---

## Quick Checks

- [ ] Domain layout (`parts/assemblies/tools/hardware`) used
- [ ] File header + project-root `Includes` path present
- [ ] Public docs have header + description + usage
- [ ] `Arguments` block only when args exist
- [ ] `Example` blocks present in source docs
- [ ] Private docs include `Status: INTERNAL`
- [ ] Files render unconditionally when opened
- [ ] `.openscad_docsgen_rc` uses `TargetProfile: wiki` + `GenerateDocs`
- [ ] Minimum OpenSCAD version documented in `README.md`

---

**Full documentation:** [OpenSCAD Guide](../README.md)
