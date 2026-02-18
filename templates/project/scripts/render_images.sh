#!/usr/bin/env bash
# Render documentation images from model files using OpenSCAD
# Creates PNG images of all parts in models/ directory

set -e

PREVIEWS_DIR="previews"
OUTPUT_DIR="build/images"

# Camera and image settings
IMGSIZE="800,600"
COLORSCHEME="Tomorrow"

# Check OpenSCAD
if ! command -v openscad &> /dev/null; then
    echo "❌ OpenSCAD not found in PATH"
    exit 1
fi

# Check if models directory exists
if [ ! -d "$PREVIEWS_DIR" ]; then
    echo "❌ Models directory not found: $PREVIEWS_DIR"
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Rendering documentation images..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

IMAGE_COUNT=0

for scad_file in "$PREVIEWS_DIR"/*.scad; do
    # Skip if no files found
    [ -f "$scad_file" ] || continue

    basename=$(basename "$scad_file" .scad)

    IMAGE_COUNT=$((IMAGE_COUNT + 1))
    output="$OUTPUT_DIR/$basename.png"

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
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✓ Rendered $IMAGE_COUNT images to $OUTPUT_DIR/"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
