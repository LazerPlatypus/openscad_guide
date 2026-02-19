#!/usr/bin/env bash
# Generate API documentation using openscad-docsgen
# Automatically detects venv installation or uses system installation

set -e

VENV_DIR=".venv"
DOCS_DIR="docs"
DIRS="src"

# Find openscad-docsgen (venv first, then system)
if [ -x "$VENV_DIR/bin/openscad-docsgen" ]; then
    DOCSGEN="$VENV_DIR/bin/openscad-docsgen"
    echo "Using openscad-docsgen from venv"
elif command -v openscad-docsgen &> /dev/null; then
    DOCSGEN="openscad-docsgen"
    echo "Using system openscad-docsgen"
else
    echo "❌ openscad-docsgen not found"
    echo ""
    echo "Install with:"
    echo "  make setup    # or ./scripts/setup.sh"
    echo ""
    echo "Or install globally:"
    echo "  https://github.com/BelfrySCAD/openscad_docsgen"
    exit 1
fi

echo "Generating documentation..."
mkdir -p "$DOCS_DIR"

IFS=',' read -ra DIR_LIST <<< "$DIRS"
for dir in "${DIR_LIST[@]}"; do
    if [ -d "$dir" ]; then
        scad_files=()
        while IFS= read -r -d '' f; do scad_files+=("$f"); done < <(find "$dir" -name "*.scad" -print0)
        if [ ${#scad_files[@]} -gt 0 ]; then
            $DOCSGEN -m "${scad_files[@]}" --force
        fi
    fi
done

echo "✓ Documentation generated in $DOCS_DIR/"
