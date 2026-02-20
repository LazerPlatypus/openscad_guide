# [PROJECT_NAME]

[PROJECT_DESCRIPTION]

## Overview
brief overview

**Features:**
- features

## Requirements

- **OpenSCAD** 2026.02.10 or newer
- **Python 3** (for documentation generation, optional)
- **openscad-docsgen** (installed via `make setup`)

## Quick Start

### 1. Preview
Open any file in `parts/` or `assemblies/` in OpenSCAD and press F5 to preview.

### 2. Build
```bash
make          # Build all STL files & images of assemblies
```

### 3. Customize
Edit parameters in `config.scad` to adjust dimensions and settings.

## Building

```bash
# Build all parts
make

# Build specific part
make parts/butt_connector.scad build/stl/butt_connector.stl
make parts/saw_horse_connector.scad build/stl/saw_horse_connector.stl
make parts/toe_clamp_body.scad build/stl/toe_clamp_body.stl
make parts/toe_clamp_insert.scad build/stl/toe_clamp_insert.stl

# Generate documentation
make docs

# Render images
make images

# Clean build artifacts
make clean

# clean docs
make clean-docs
```

## File Organization

- **[parts/](parts/)** - Printable 3D part source files
- **[assemblies/](assemblies/)** - Pre-configured assembly files for preview and export
- **[tools/](tools/)** - Reusable mount and attachment modules
- **[hardware/](hardware/)** - Hardware reference models (bolt, screw)
- **[scripts/](scripts/)** - Build automation scripts
- **[build/](build/)** - Generated STL files and images (run `make` to create)
- **[docs/](docs/)** - Documentation (hand-written + generated)
- **[config.scad](config.scad)** - Project-wide configuration

## Customization

All project settings can be adjusted in `config.scad`:
- Hardware dimensions (bolt/screw)
- Rendering quality ($fn settings)

## Parts List

| Part | File | Description |
|------|------|-------------|
| placeholder_part | `parts/placeholder_part.scad` | Part One + Usage |

See [docs/bom.md](docs/bom.md) for complete bill of materials including hardware.

## Assembly

See [docs/assembly_instructions.md](docs/assembly_instructions.md) for step-by-step assembly instructions.

## Documentation

- **[API Reference](docs/api/)** - Generated API documentation
- **[Assembly Instructions](docs/assembly_instructions.md)** - How to assemble the parts
- **[Bill of Materials](docs/bom.md)** - Complete parts and hardware list

## Development

### Setup Development Environment
```bash
make setup
```

This creates a Python virtual environment and installs `openscad-docsgen` for documentation generation.

### Project Structure
```
best_fence/
├── README.md                        # Project overview
├── Makefile                         # Build automation
├── config.scad                      # Project configuration
├── .openscad_docsgen_rc             # Documentation config
├── parts/                           # Printable part source files
│   ├── placeholder_part.scad
│   └── ... more parts
├── assemblies/                      # Pre-configured assembly files
│   ├── all.scad
│   └── all_but_placeholder_part.scad
├── tools/                           # Reusable mount/attachment modules
│   ├── tool_1.scad
│   └── ... more tools
├── hardware/                        # Hardware reference models
│   ├── bolt.scad
│   └── screw.scad
├── scripts/                         # Build scripts
├── build/                           # Generated files (gitignored)
│   ├── stl/                        # STL exports
│   └── images/                     # Documentation renders
└── docs/                            # Documentation
    └── api/                        # Generated API docs
```

## Exporting with Variable Overrides

You can override variables from the command line:

```bash
# Export with custom bolt radius
./scripts/export_part.sh parts/placeholder_part.scad build/stl/placeholder_part.stl \
    "BOLT_HEAD_RADIUS=8"

# Export with lower resolution (faster)
./scripts/export_part.sh parts/placeholder_part.scad build/stl/placeholder_part_lowres.stl \
    "EXPORT_FN=16"
```


## Contributing

Contributions welcome! Please:
1. Follow the [OpenSCAD Style Guide](https://github.com/LazerPlatypus/openscad_guide/)
2. Document everything using [openscad_docsgen](https://github.com/BelfrySCAD/openscad_docsgen) format
3. Test your changes before submitting
4. Update documentation as needed

## Support

- **Issues:** [GitHub Issues](https://github.com/[PROJECT_AUTHOR]/[PROJECT_NAME]/issues)
- **Documentation:** [docs/](docs/)

## License

This project is licensed under the **CERN Open Hardware License Version 2 – Strongly Reciprocal (CERN-OHL-S v2)**.

**Summary:**
- ✓ Use, modify, and manufacture (including commercially)
- ✓ Distribute original or modified versions
- ⚠️ Modified versions must use the same license
- ⚠️ Must provide complete source for any distributed modifications

See [LICENSE](LICENSE) for full license text.

---

**Status:** Active development
**Version:** 0.1.0 (pre-release)
