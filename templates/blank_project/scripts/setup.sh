#!/usr/bin/env bash
# Setup script for [PROJECT_NAME] development environment
# Creates Python venv and installs openscad-docsgen

set -e

VENV_DIR=".venv"

echo "Setting up [PROJECT_NAME] development environment..."
echo ""

# init submodules
if [ -f ".gitmodules" ]; then
    echo "Initializing git submodules..."
    git submodule update --init --recursive
    echo "✓ Git submodules initialized"
    echo ""
else
    echo "No .gitmodules file found, skipping submodule initialization"
    echo ""
fi

# Check if OpenSCAD is installed
if ! command -v openscad &> /dev/null; then
    echo "❌ OpenSCAD not found in PATH"
    echo "   Install snapshot from: https://openscad.org/"
    exit 1
fi
echo "✓ OpenSCAD found: $(openscad --version 2>&1 | head -1)"

# Check Python
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 not found in PATH"
    exit 1
fi
echo "✓ Python found: $(python3 --version)"
echo ""

# Create or verify venv
if [ -d "$VENV_DIR" ]; then
    echo "✓ Virtual environment already exists at $VENV_DIR/"
else
    echo "Creating virtual environment at $VENV_DIR/..."
    python3 -m venv "$VENV_DIR"
    echo "✓ Virtual environment created"
fi
echo ""

# Install/upgrade openscad-docsgen
echo "Installing openscad-docsgen..."
"$VENV_DIR/bin/pip" install --quiet --upgrade pip
"$VENV_DIR/bin/pip" install --quiet openscad-docsgen
echo "✓ openscad-docsgen installed"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✓ Setup complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Next steps:"
echo "  1. Run 'make' to build all STL files"
echo "  2. Run 'make docs' to generate documentation"
echo "  3. Run 'make images' to render documentation images"
echo ""
echo "The Makefile will automatically use the venv installation."
echo ""
echo "To manually activate the venv:"
echo "  source $VENV_DIR/bin/activate"
echo ""
echo "To deactivate:"
echo "  deactivate"
echo ""
