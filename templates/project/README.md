# [PROJECT_NAME]

[DESCRIPTION]

## Overview

[PROJECT_NAME] is a design project for [detailed description of what this project creates].

**Features:**
- [Feature 1]
- [Feature 2]
- [Feature 3]

## Requirements

- **OpenSCAD** 2021.01 or newer
- **Python 3** (for documentation generation, optional)
- **openscad-docsgen** (installed via `make setup`)

## Quick Start

### 1. Preview
Open `previews/preview_assembly.scad` in OpenSCAD and press F5 to preview the full assembly.

### 2. Build
```bash
make          # Build all STL files
```

### 3. Customize
Edit parameters in `config.scad` to adjust dimensions and settings.

## Building

```bash
# Build all parts
make

# Build specific part
make build/stl/[part_name].stl

# Generate documentation
make docs

# Render images
make images

# Clean build artifacts
make clean
```

## File Organization

- **[models/](models/)** - Source .scad files for each part
- **[previews/](previews/)** - Quick preview files for development
- **[scripts/](scripts/)** - Build automation scripts
- **[build/](build/)** - Generated STL files (run `make` to create)
- **[docs/](docs/)** - Documentation (hand-written + generated)
- **[lib/](lib/)** - Project-specific helper functions (if needed)
- **[config.scad](config.scad)** - Project-wide configuration

## Customization

All project settings can be adjusted in `config.scad`:
- Dimensions and sizing
- Material thicknesses
- Tolerances and fits
- Rendering quality ($fn settings)
- Feature flags

## Parts List

| Part | Quantity | Description |
|------|----------|-------------|
| [part_one] | 1 | [Description] |
| [part_two] | 1 | [Description] |

See [docs/bom.md](docs/bom.md) for complete bill of materials including hardware.

## Assembly

See [docs/assembly_instructions.md](docs/assembly_instructions.md) for step-by-step assembly instructions.

## Documentation

- **[API Reference](docs/api/)** - Generated API documentation
- **[Assembly Instructions](docs/assembly_instructions.md)** - How to assemble the parts
- **[Bill of Materials](docs/bom.md)** - Complete parts and hardware list
- **[Design Notes](docs/design_notes.md)** - Design decisions and considerations

## Development

### Setup Development Environment
```bash
make setup
```

This creates a Python virtual environment and installs `openscad-docsgen` for documentation generation.

### Project Structure
```
[PROJECT_NAME]/
├── README.md                    # Project overview
├── Makefile                     # Build automation
├── config.scad                  # Project configuration
├── .openscad_docsgen_rc         # Documentation config
├── models/                      # Source .scad files
│   ├── consts.scad             # Shared constants
│   ├── part_one.scad
│   └── part_two.scad
├── previews/                    # Preview files
│   └── preview_assembly.scad
├── scripts/                     # Build scripts
├── build/                       # Generated files (gitignored)
│   ├── stl/                    # STL exports
│   └── images/                 # Documentation renders
├── docs/                        # Documentation
│   └── api/                    # Generated API docs
└── lib/                         # Project-specific helpers
```

## Exporting with Variable Overrides

You can override variables from the command line:

```bash
# Export with custom dimensions
./scripts/export_part.sh models/part_one.scad build/stl/part_one_large.stl \
    "WIDTH=100" "HEIGHT=60" "EXPORT_MODE=true"

# Export with different quality
./scripts/export_part.sh models/part_one.scad build/stl/part_one_lowres.stl \
    "EXPORT_FN=64" "EXPORT_MODE=true"
```

## License

This project is licensed under the **CERN Open Hardware License Version 2 – Strongly Reciprocal (CERN-OHL-S v2)**.

**Summary:**
- ✓ Use, modify, and manufacture (including commercially)
- ✓ Distribute original or modified versions
- ⚠️ Modified versions must use the same license
- ⚠️ Must provide complete source for any distributed modifications

See [LICENSE](LICENSE) for full license text.

## Contributing

Contributions welcome! Please:
1. Follow the [OpenSCAD Style Guide](https://github.com/[YOUR_USERNAME]/openscad_guide/)
2. Document all public functions using openscad_docsgen format
3. Test your changes before submitting
4. Update documentation as needed

## Support

- **Issues:** [GitHub Issues](https://github.com/[YOUR_USERNAME]/[PROJECT_NAME]/issues)
- **Documentation:** [docs/](docs/)

---

**Status:** Active development
**Version:** 0.1.0 (pre-release)
