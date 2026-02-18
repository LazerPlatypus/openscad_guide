# Quick Start Guide

> **Note:** There's an automated setup script that handles all these steps for you!
>
> Run `../new_library.sh` from the templates directory for an interactive setup.
>
> The instructions below are for manual setup.

## Setup Checklist

### 1. Copy Template
```bash
cp -r /path/to/templates/library/ /path/to/your-library/
cd /path/to/your-library/
```

### 2. Find & Replace Placeholders

Run these replacements across all files:

| Placeholder | Replace With | Example |
|------------|--------------|---------|
| `[PROJECT_NAME]` | Your library name | `my_awesome_lib` |
| `[DESCRIPTION]` | Brief description | `A library for awesome things` |
| `[YOUR_USERNAME]` | GitHub username | `johndoe` |
| `[COPYRIGHT_HOLDER]` | Your name/org | `John Doe` |
| `[YEAR]` | Current year | `2026` |
| `[YYYY-MM-DD]` | Today's date | `2026-02-15` |

**Files to update:**
- README.md
- LICENSE
- CHANGELOG.md
- Makefile
- .openscad_docsgen_rc
- core.scad
- src/example_module.scad
- examples/basic_example.scad

### 3. Customize Source Files

**Replace example code with your actual implementation:**

1. Rename or replace `src/example_module.scad`
2. Update `core.scad` includes
3. Create real examples in `examples/`
4. Create real tests in `tests/`

### 4. Initialize Git

```bash
git init
git add .
git commit -m "Initial commit from template"
```

### 5. Setup & Build

```bash
make setup    # Install tools
make          # Build docs & images
make test     # Run tests
```

### 6. Clean Up Template Files

```bash
rm TEMPLATE_README.md
rm QUICK_START.md
rm .placeholder-deps
```

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make` | Build docs and render all images |
| `make setup` | Setup development environment |
| `make docs` | Generate API documentation only |
| `make images` | Render all example and test images |
| `make examples` | Render only example images |
| `make test-images` | Render only test images |
| `make test` | Run test suite |
| `make clean` | Remove build artifacts |
| `make clean-docs` | Remove generated docs |
| `make clean-all` | Remove all generated files |
| `make help` | Show help message |

## Documentation Format

Use openscad_docsgen format for all public functions/modules:

```scad
// Function: my_function()
// Usage:
//   result = my_function(param);
// Description:
//   What the function does
// Arguments:
//   param = Description of required parameter
//   ---
//   optional = Description of optional parameter. Default: value
// Example(2D): Example name
//   my_function(10);
function my_function(param, optional=default) = ...;
```

## Directory Layout

```
your-library/
├── core.scad              # Entry point - includes all modules
├── src/                   # Your library modules
├── examples/              # Usage examples
├── tests/                 # Test files
├── scripts/               # Build scripts (don't modify)
├── docs/                  # Generated (git-ignored)
├── build/                 # Generated (git-ignored)
└── deps/                  # Git submodules
```

## Common Tasks

### Add a new module
1. Create `src/new_module.scad`
2. Add `include <src/new_module.scad>;` to `core.scad`
3. Create `examples/new_module_example.scad`
4. Create `tests/test_new_module.scad`
5. Run `make` to rebuild

### Add a dependency
```bash
mkdir -p deps
git submodule add <repo-url> deps/<name>
git submodule update --init --recursive
```

### Make a release
1. Update version in README.md
2. Update CHANGELOG.md
3. Commit: `git commit -am "Release v1.0.0"`
4. Tag: `git tag -a v1.0.0 -m "Version 1.0.0"`
5. Push: `git push && git push --tags`

## Troubleshooting

**openscad-docsgen not found:**
```bash
make setup
```

**Tests failing:**
```bash
# Run tests with verbose output
./scripts/run_tests.sh
```

**Images not rendering:**
```bash
# Check OpenSCAD installation
which openscad
openscad --version
```

## Next Steps

1. Read TEMPLATE_README.md for detailed information
2. Review the style guide conventions
3. Start implementing your library
4. Delete template documentation files when done
