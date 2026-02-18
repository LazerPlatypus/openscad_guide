# Quick Start Guide

> **Note:** There's an automated setup script that handles all these steps for you!
>
> Run `../new_project.sh` from the templates directory for an interactive setup.
>
> The instructions below are for manual setup.

## Setup Checklist

### 1. Copy Template
```bash
cp -r /path/to/templates/project/ /path/to/your-project/
cd /path/to/your-project/
```

### 2. Find & Replace Placeholders

Run these replacements across all files:

| Placeholder | Replace With | Example |
|------------|--------------|---------|
| `[PROJECT_NAME]` | Your project name | `hockey_puck_display` |
| `[DESCRIPTION]` | Brief description | `A display stand for hockey pucks` |
| `[YOUR_USERNAME]` | GitHub username | `johndoe` |
| `[YEAR]` | Current year | `2026` |

**Files to update:**
- README.md
- Makefile
- .openscad_docsgen_rc
- config.scad
- All files in models/
- All files in previews/
- All files in docs/

### 3. Customize Configuration

Edit `config.scad` to set your project's dimensions, tolerances, and settings:

```scad
// Update these to match your project
BASE_WIDTH = 100;          // Your dimensions
BASE_DEPTH = 60;
BASE_HEIGHT = 30;
WALL_THICKNESS = 2;
TOLERANCE = 0.2;
```

### 4. Replace Example Parts

**Replace placeholder parts with your actual design:**

1. Rename or replace `models/part_one.scad` and `models/part_two.scad`
2. Update `models/consts.scad` with your project-specific constants
3. Update `previews/preview_assembly.scad` to show your parts
4. Update `lib/helpers.scad` with your project-specific utilities (or delete if not needed)

### 5. Initialize Git

```bash
git init
git add .
git commit -m "Initial commit from template"
```

### 6. Setup & Build

```bash
make setup    # Install documentation tools
make          # Build all STL files
make images   # Render documentation images (optional)
make docs     # Generate API documentation (optional)
```

### 7. Clean Up Template Files

```bash
rm QUICK_START.md
```

## Makefile Commands

| Command | Description |
|---------|-------------|
| `make` | Build all STL files |
| `make stls` | Build all STL files (same as make) |
| `make setup` | Setup development environment |
| `make images` | Render documentation images |
| `make docs` | Generate API documentation |
| `make clean` | Remove build artifacts |
| `make clean-docs` | Remove generated docs |
| `make clean-all` | Remove all generated files |
| `make help` | Show help message |
| `make list-parts` | List all parts in project |

## Project Structure

```
your-project/
├── config.scad              # Project-wide configuration
├── models/                  # Source .scad files (one per part)
│   ├── consts.scad         # Shared constants
│   ├── part_one.scad
│   └── part_two.scad
├── previews/                # Preview files for development
│   └── preview_assembly.scad
├── scripts/                 # Build automation scripts
├── build/                   # Generated files (gitignored)
│   ├── stl/                # STL exports
│   └── images/             # Documentation renders
├── docs/                    # Documentation
│   ├── api/                # Generated API docs
│   ├── assembly_instructions.md
│   └── bom.md
└── lib/                     # Project-specific helpers (optional)
    └── helpers.scad
```

## Common Tasks

### Add a new part

1. Create `models/new_part.scad`
2. Use this template:

```scad
// ============================================================
// PART: New Part
// Description: What this part does
// ============================================================

include <../config.scad>
include <consts.scad>

// ============================================================
// PART MODULE
// ============================================================

module new_part(
    width = BASE_WIDTH,
    height = BASE_HEIGHT
) {
    cube([width, height, WALL_THICKNESS], center = true);
}

// ============================================================
// RENDER
// ============================================================

// Render this part when file is opened directly
new_part();
```

3. Create preview: `previews/preview_new_part.scad`
4. Run `make` to export STL

### Add a preview for testing

Create `previews/preview_fit_test.scad`:

```scad
include <../config.scad>

use <../models/part_one.scad>
use <../models/part_two.scad>

// Override for faster preview
$fn = 16;

// Show parts together to test fit
part_one();
translate([50, 0, 0])
    part_two();
```

### Export with custom dimensions

```bash
# Export with variable overrides
./scripts/export_part.sh models/bracket.scad build/stl/bracket_large.stl \
    "WIDTH=100" "HEIGHT=60" "EXPORT_MODE=true"
```

### Add documentation to your functions

Use openscad_docsgen format:

```scad
// Function: calculate_size()
// Usage:
//   size = calculate_size(base, multiplier);
// Description:
//   Calculates the size based on base and multiplier
// Arguments:
//   base = Base dimension in mm
//   ---
//   multiplier = Size multiplier. Default: 1.0
function calculate_size(base, multiplier=1.0) = base * multiplier;
```

## Development Workflow

### 1. Design Phase
- Create part in `models/`
- Create preview in `previews/`
- Open preview file and press F5 repeatedly to iterate

### 2. Test Fit
- Create assembly preview showing multiple parts
- Check clearances and fit
- Adjust dimensions in `config.scad`

### 3. Export
```bash
# Build all parts
make

# Or build specific part
make build/stl/part_name.stl
```

### 4. Document
- Add function/module documentation in source files
- Update `docs/assembly_instructions.md`
- Update `docs/bom.md`
- Run `make docs` to generate API documentation
- Run `make images` to render documentation images

## Tips

### Keep previews fast
```scad
// In preview files
$fn = EXPORT_MODE ? 128 : 16;  // Low detail in preview

// Use bounding boxes for complex parts
if (EXPORT_MODE) {
    detailed_part();
} else {
    # cube([10, 10, 10]);  // Simple placeholder
}
```

### Organize constants
```scad
// models/consts.scad - dimensions used by multiple parts
WIDGET_DIAMETER = 50;
WIDGET_HEIGHT = 20;
SLOT_WIDTH = WIDGET_DIAMETER + 2;  // Calculated from base
```

### Use feature flags
```scad
// config.scad
INCLUDE_MOUNTING_HOLES = true;

// models/base.scad
if (INCLUDE_MOUNTING_HOLES) {
    mounting_holes();
}
```

## Troubleshooting

**STL not exporting:**
- Check for OpenSCAD errors (press F6 in OpenSCAD GUI)
- Ensure `config.scad` is included correctly
- Check that all dimensions are valid (no negatives, no zero divisions)

**Preview is slow:**
- Lower PREVIEW_FN in config.scad (try 16 or 8)
- Use simpler geometry in preview files
- Use `# cube([...])` placeholders for complex parts

**Make command not found:**
- Install make: `brew install make` (macOS) or use your package manager
- On Windows, use Git Bash or WSL

**openscad-docsgen not found:**
```bash
make setup  # Installs documentation tools
```

## Next Steps

1. Replace example parts with your design
2. Update config.scad with your dimensions
3. Create preview files for development
4. Build and test your parts
5. Document your design
6. Share your project!

For detailed standards, see the [OpenSCAD Standards Documentation](https://github.com/[YOUR_USERNAME]/openscad_guide/).
