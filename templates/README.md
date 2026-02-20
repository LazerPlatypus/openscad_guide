# Templates - Quick Start

**Last Updated:** 2026-02-19
**Status:** Enhanced with automated setup scripts

Ready-to-use project templates following the style guide conventions.

---

## Available Templates

### [Blank Library Template](blank_library/)
For creating reusable OpenSCAD libraries with functions and modules.

**Use when:**
- Creating reusable functions/modules
- Code will be used in multiple projects
- Building shared utilities

**Includes:**
- Complete directory structure (src/, scripts/)
- Makefile with standard targets (setup, docs, images, test, clean)
- Build scripts (setup.sh, generate_docs.sh, render_images.sh, run_tests.sh)
- Documentation configuration (.openscad_docsgen_rc)
- README.md, LICENSE (CERN-OHL-S v2)
- Comprehensive setup guides (src/README.md, deps/README.md, etc.)

### [Blank Project Template](blank_project/)
For design projects that create specific parts or assemblies.

**Use when:**
- Creating specific physical objects
- Design is the goal, not reusability
- Will export to STL for printing
- Parameters tuned to specific use case

**Includes:**
- Complete directory structure
- Makefile for building and exporting
- Build scripts
- Configuration file template
- README template

---

## Quick Start

### Automated Setup (Recommended)

#### Creating a New Project

```bash
cp blank_project /path/to/project
cd /path/to/project
make init
```

The interactive script will:
- Prompt for project name, description, GitHub username, etc.
- Replace all placeholders with project info
- Initialize git repository

#### Creating a New Library

```bash
cp blank_library /path/to/library
cd /path/to/library
make init
```

The interactive script will:
- Prompt for library name, description, GitHub username, etc.
- Replace all placeholders with library info
- Initialize git repository

## Next Steps

- **[Blank Library Template Documentation](blank_library/README.md)** - Detailed library setup
- **[Blank Project Template Documentation](blank_project/README.md)** - Detailed project setup
- **[Style Guide](../README.md)** - Complete reference and explanations
