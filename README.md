# OpenSCAD Style Guide

Opinionated conventions for writing maintainable OpenSCAD code.

---

## Quick Start

**New to this guide?**
- Start with [Naming Reference](reference/naming.md)
- Then read [Project Structure](reference/project_structure.md)
- Then read [File Organization](reference/file_organization.md)
- Keep [Cheatsheet](reference/cheatsheet.md) open while coding

**Want the reasoning?**
- Read [Why These Conventions](explanation/why_these_conventions.md)

---

## What This Guide Standardizes

- Naming conventions (`snake_case`, `SCREAMING_SNAKE_CASE`, `_private_items`)
- Canonical physical-project layout:
  - `parts/`
  - `assemblies/`
  - `tools/`
  - `hardware/`
- Script-first build workflow (`make` orchestrates, scripts implement)
- In-source docs with openscad_docsgen
- Practical docs requirements (required minimum + recommended examples)
- Runtime config pattern (`EXPORT_MODE`, preview/export `$fn`)

---

## Guide Structure

- **[Reference](reference/)** - Quick lookup
  - [Naming](reference/naming.md)
  - [Documentation Format](reference/documentation.md)
  - [File Organization](reference/file_organization.md)
  - [Project Structure](reference/project_structure.md)
  - [Cheatsheet](reference/cheatsheet.md)

- **[Explanation](explanation/)** - Rationale and trade-offs
  - [Why These Conventions](explanation/why_these_conventions.md)

- **[Templates](templates/)** - Starter structures
  - [Templates README](templates/README.md)
  - `blank_project/`
  - `blank_library/`

---

## At a Glance

```scad
// Global render controls
PREVIEW_FN = 32;
EXPORT_FN = 128;
EXPORT_MODE = false;
$fn = EXPORT_MODE ? EXPORT_FN : PREVIEW_FN;

// Public API docs minimum
// Module: toe_clamp_body
// Usage:
//   toe_clamp_body();
// Description:
//   Creates the toe clamp body.
// Example(3D,Render):
//   toe_clamp_body();
module toe_clamp_body() { ... }

// Internal helper
// Function: _validate_dims
// Status: INTERNAL
function _validate_dims() = ...;
```

---

## Current Status

**Status:** Active draft (aligned to current project conventions)  
**Last Updated:** 2026-02-19

---

## Contributing

This guide is a living document.

**Found something confusing?** Open an issue or submit a clarification.

**Have a better example?** Submit a PR.

**Disagree with a convention?** Start a discussion with rationale.

---

## License

[Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](LICENSE)

You are free to use, share, and adapt this guide, provided you give attribution and distribute any derivative works under the same license.
