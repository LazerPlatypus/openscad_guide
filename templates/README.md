# Templates - Quick Start

**Last Updated:** 2026-02-15
**Status:** Enhanced with automated setup scripts

Ready-to-use project templates following the style guide conventions.

---

## Available Templates

### [Library Template](library/) ✅ COMPLETE
For creating reusable OpenSCAD libraries with functions and modules.

**Use when:**
- Creating reusable functions/modules
- Code will be used in multiple projects
- Building shared utilities

**Includes:**
- Complete directory structure (src/, examples/, tests/, scripts/)
- Makefile with standard targets (setup, docs, images, test, clean)
- Build scripts (setup.sh, generate_docs.sh, render_images.sh, run_tests.sh)
- Documentation configuration (.openscad_docsgen_rc)
- Example source module with proper documentation
- Example usage and test files
- README.md, LICENSE (CERN-OHL-S v2), CHANGELOG.md templates
- Comprehensive setup guides (TEMPLATE_README.md, QUICK_START.md)

### [Project Template](project/)
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
- Example part files
- README template

---

## Quick Start

### Automated Setup (Recommended)

#### Creating a New Project

```bash
cd 08_OpenSCAD/openscad_guide/templates
./new_project.sh
```

The interactive script will:
- Prompt for project name, description, GitHub username, etc.
- Copy the template and replace all placeholders
- Initialize git repository
- Optionally run setup and build

#### Creating a New Library

```bash
cd 08_OpenSCAD/openscad_guide/templates
./new_library.sh
```

The interactive script will:
- Prompt for library name, description, copyright info, etc.
- Copy the template and replace all placeholders
- Initialize git repository
- Optionally run setup, build, and tests

### Manual Setup (Legacy)

If you prefer to set up templates manually:

#### Creating a New Library

```bash
# Copy template
cp -r templates/library/ my_new_library/
cd my_new_library/

# Customize
# 1. Edit README.md (replace placeholders)
# 2. Edit .openscad_docsgen_rc (set project name)
# 3. Edit LICENSE (set your name/year)
# 4. Create your first module in src/

# Setup environment
make setup

# Start developing
# - Add .scad files to src/
# - Add examples to examples/
# - Add tests to tests/

# Build
make              # Generate docs and images
make test         # Run tests
```

#### Creating a New Project

```bash
# Copy template
cp -r templates/project/ my_new_project/
cd my_new_project/

# Customize
# 1. Edit README.md (replace placeholders)
# 2. Edit config.scad (set dimensions)
# 3. Create your parts in models/

# Start developing
# - Add part files to models/
# - Edit config.scad for shared settings
# - Test with previews/

# Build
make              # Export all STL files
make images       # Render documentation images
```

See [project/QUICK_START.md](project/QUICK_START.md) and [library/QUICK_START.md](library/QUICK_START.md) for detailed manual setup instructions.

---

## What Gets Automated

The setup scripts (`new_project.sh` and `new_library.sh`) automatically replace these placeholders across all template files:

| Placeholder | Description | Example |
|------------|-------------|---------|
| `[PROJECT_NAME]` | Your project/library name | `hockey_puck_display` |
| `[DESCRIPTION]` | Brief description | `A display stand for hockey pucks` |
| `[YOUR_USERNAME]` | GitHub username | `johndoe` |
| `[COPYRIGHT_HOLDER]` | Name or organization (libraries only) | `John Doe` |
| `[YEAR]` | Copyright year | `2026` |
| `[YYYY-MM-DD]` | Current date (libraries only) | `2026-02-15` |

**Files that are automatically cleaned up:**
- `QUICK_START.md` (deleted after setup)
- `TEMPLATE_README.md` (deleted for libraries)
- `.placeholder-deps` (deleted for libraries)

---

## Template Customization

### Required Changes

After copying a template, you **must** customize:

1. **README.md** - Replace `[PROJECT_NAME]`, `[DESCRIPTION]`, etc.
2. **.openscad_docsgen_rc** - Set `ProjectName`
3. **LICENSE** - Set copyright holder and year
4. **CHANGELOG.md** *(libraries)* - Set initial version

### Optional Changes

You may want to customize:

- Makefile targets (add project-specific builds)
- .gitignore (add project-specific ignores)
- Scripts (modify for your workflow)

---

## Next Steps

- **[Library Template Documentation](library/README.md)** - Detailed library setup
- **[Project Template Documentation](project/README.md)** - Detailed project setup
- **[Style Guide](../README.md)** - Complete reference and explanations
