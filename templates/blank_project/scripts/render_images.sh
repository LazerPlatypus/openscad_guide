#!/usr/bin/env bash
# Render documentation images from model files using OpenSCAD
# Creates PNG images of all files in assemblies/ directory

set -e

ASSEMBLIES_DIR="assemblies"
OUTPUT_DIR="build/images"

# Camera and image settings
IMGSIZE="800,600"
COLORSCHEME="Tomorrow"

# Check OpenSCAD
if ! command -v openscad &> /dev/null; then
    echo "❌ OpenSCAD not found in PATH"
    exit 1
fi

# Check if assemblies directory exists
if [ ! -d "$ASSEMBLIES_DIR" ]; then
    echo "❌ Assemblies directory not found: $ASSEMBLIES_DIR"
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Rendering documentation images..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

IMAGE_COUNT=0

while IFS= read -r scad_file; do
    rel="${scad_file#"$ASSEMBLIES_DIR"/}"
    basename="${rel%.scad}"

    IMAGE_COUNT=$((IMAGE_COUNT + 1))
    output="$OUTPUT_DIR/$basename.png"
    mkdir -p "$(dirname "$output")"

    echo "[$IMAGE_COUNT] Rendering $basename.png..."

    openscad --hardwarnings \
        -D 'EXPORT_MODE=true' \
        --viewall \
        --autocenter \
        --imgsize="$IMGSIZE" \
        --colorscheme="$COLORSCHEME" \
        -o "$output" "$scad_file" 2>&1 | grep -v "^$" || true

    echo "  ✓ Done"
    echo ""
done < <(find "$ASSEMBLIES_DIR" -name "*.scad")

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✓ Rendered $IMAGE_COUNT images to $OUTPUT_DIR/"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
