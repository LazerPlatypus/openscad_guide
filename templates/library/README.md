# [PROJECT_NAME]

[DESCRIPTION]

## Overview

[PROJECT_NAME] provides [detailed description of what the library does].

**Key Features:**
- [Feature 1]
- [Feature 2]
- [Feature 3]
- Clean, documented API

## Installation

### Method 1: Git Submodule (Recommended)

Add to your project as a git submodule:

```bash
cd your-project
git submodule add https://github.com/[YOUR_USERNAME]/[PROJECT_NAME].git deps/[PROJECT_NAME]
git submodule update --init --recursive
```

### Method 2: Direct Download

Download and place in your OpenSCAD library directory:
- **Linux:** `~/.local/share/OpenSCAD/libraries/`
- **macOS:** `~/Documents/OpenSCAD/libraries/`
- **Windows:** `My Documents\OpenSCAD\libraries\`

## Quick Start

### If installed as submodule (recommended):

```scad
include <deps/[PROJECT_NAME]/core.scad>

// Use [PROJECT_NAME] functions
// [Add example usage here]
```

### If installed in OpenSCAD libraries directory:

```scad
include <[PROJECT_NAME]/core.scad>

// Use [PROJECT_NAME] functions
// [Add example usage here]
```

## Documentation

- **[API Reference](docs/)** - Complete function and module documentation
- **[Examples](examples/)** - Usage examples with rendered images

## Development

### Setup

First-time setup of development environment:

```bash
make setup
```

This creates a Python virtual environment and installs `openscad-docsgen` for documentation generation.

### Building

```bash
# Build everything (docs + images)
make

# Build documentation only
make docs

# Render example images
make images

# Run tests
make test
```

### Project Structure

```
[PROJECT_NAME]/
├── core.scad              # Main entry point
├── src/                   # Source modules
│   └── example_module.scad
├── examples/              # Usage examples
├── tests/                 # Test files
├── docs/                  # Generated documentation
├── deps/                  # Dependencies (submodules)
├── scripts/               # Build scripts
└── Makefile              # Build automation
```

## Usage Examples

[Add usage examples here - see examples/ directory for more]

```scad
include <deps/[PROJECT_NAME]/core.scad>

// Example usage
```

See [examples/](examples/) for more complete examples.

## Dependencies

- **OpenSCAD** 2021.01 or newer
- **Python 3** (for documentation generation only)
- **openscad-docsgen** (installed automatically with `make setup`)

Optional dependencies in `deps/` are included as git submodules.

## Contributing

Contributions welcome! Please:

1. Follow the [OpenSCAD Style Guide](https://github.com/[YOUR_USERNAME]/openscad_guide/)
2. Document all public functions using openscad_docsgen format
3. Add examples for new features
4. Run tests before submitting: `make test`

## License

This project is licensed under the **CERN Open Hardware License Version 2 – Strongly Reciprocal (CERN-OHL-S v2)**.

**Summary:**
- ✓ Use, modify, and manufacture (including commercially)
- ✓ Distribute original or modified versions
- ⚠️ Modified versions must use the same license
- ⚠️ Must provide complete source for any distributed modifications

Full license text available in the [LICENSE](LICENSE) file.

## Support

- **Issues:** [GitHub Issues](https://github.com/[YOUR_USERNAME]/[PROJECT_NAME]/issues)
- **Discussions:** [GitHub Discussions](https://github.com/[YOUR_USERNAME]/[PROJECT_NAME]/discussions)
- **Documentation:** [docs/](docs/)

---

**Status:** Active development
**Version:** 0.1.0 (pre-release)
