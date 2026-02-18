# OpenSCAD Style Guide

Opinionated conventions for writing maintainable OpenSCAD code.

---

## Quick Start

**New to this guide?**
- Start with [Naming Reference](reference/naming.md)
- Then see [File Organization](reference/file_organization.md)
- Print the [Cheatsheet](reference/cheatsheet.md) for your desk

**Setting up a new project?**
- See [How to Create a Project](how_to/create_project.md) *(coming soon)*

**Setting up a new library?**
- See [How to Create a Library](how_to/create_library.md) *(coming soon)*

**Want to understand why?**
- Read [Why These Conventions](explanation/why_these_conventions.md)

---

## Guide Structure

This guide follows the [Diataxis](https://diataxis.fr) framework:

- **[Reference](reference/)** - Quick lookup when you need an answer
  - Naming conventions
  - Documentation format
  - File organization patterns
  - Project structure
  - One-page cheatsheet

- **[Explanation](explanation/)** - Understanding the reasoning
  - Why these conventions?
  - Design philosophy
  - Trade-offs and alternatives

- **[How-To Guides](how_to/)** *(coming soon)* - Step-by-step task completion
  - Setting up openscad_docsgen
  - Creating a new library
  - Creating a new project
  - Organizing large projects

- **[Tutorials](tutorials/)** *(coming soon)* - Learning by doing
  - Your first library
  - Your first project

- **[Templates](templates/)** *(coming soon)* - Starter code
  - Library template
  - Project template
  - File templates

---

## At a Glance

```scad
// Constants - SCREAMING_SNAKE_CASE
HOCKEY_PUCK_DIAMETER = 76.3;
DEFAULT_SEGMENTS = 32;

// Variables, functions, modules - snake_case
radius = 10;
function calculate_area(r) = PI * r * r;
module hockey_puck() { ... }

// Private items - prefix with _
function _internal_helper() = ...;
module _debug_render() { ... }
```

See the [Cheatsheet](reference/cheatsheet.md) for more.

---

## Using This Guide

### As a Quick Reference
Jump directly to [Reference](reference/) when you need to look something up.

### As a Learning Tool
Start with [Explanation](explanation/) to understand the philosophy, then work through examples.

### For a New Project
Use the [Templates](templates/) and follow the [How-To Guides](how_to/) *(coming soon)*.

---

## Contributing

This is a living document.

**Found something confusing?** Open an issue or submit a clarification.

**Have a better example?** Submit a PR.

**Disagree with a convention?** Start a discussion with rationale.

---

**Status:** Early draft - Reference and Explanation sections in progress
**Last Updated:** 2026-02-15
