#!/usr/bin/env bash
# Export all parts in models/ directory to STL files
# Excludes assembly.scad and consts.scad files

set -e

MODELS_DIR="models"
PREVIEWS_DIR="previews"
OUTPUT_DIR="build/stl"

# Check if models directory exists
if [ ! -d "$MODELS_DIR" ]; then
    echo "❌ Models directory not found: $MODELS_DIR"
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Count parts
PART_COUNT=0
SUCCESS_COUNT=0
FAILED_COUNT=0

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Exporting all parts from $MODELS_DIR/"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Export each part (excluding lib & consts files)

# models dir
for model in "$MODELS_DIR"/*.scad; do
    # Skip if no files found
    [ -f "$model" ] || continue

    basename=$(basename "$model" .scad)

    # Skip non-part files
    if [[ "$basename" == "assembly" ]] || [[ "$basename" == "consts" ]]; then
        continue
    fi

    PART_COUNT=$((PART_COUNT + 1))
    output="$OUTPUT_DIR/$basename.stl"

    echo "[$PART_COUNT] Exporting $basename..."

    # Export with EXPORT_MODE=true
    if ./scripts/export_part.sh "$model" "$output" "EXPORT_MODE=true" 2>&1 | grep -v "^$"; then
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo "  ❌ Failed to export $basename"
        FAILED_COUNT=$((FAILED_COUNT + 1))
    fi

    echo ""
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Exporting all parts from $PREVIEWS_DIR/"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

for model in "$PREVIEWS_DIR"/*.scad; do
    # Skip if no files found
    [ -f "$model" ] || continue

    basename=$(basename "$model" .scad)

    # Skip non-part files
    if [[ "$basename" == "assembly" ]] || [[ "$basename" == "consts" ]]; then
        continue
    fi

    PART_COUNT=$((PART_COUNT + 1))
    output="$OUTPUT_DIR/$basename.stl"

    echo "[$PART_COUNT] Exporting $basename..."

    # Export with EXPORT_MODE=true
    if ./scripts/export_part.sh "$model" "$output" "EXPORT_MODE=true" 2>&1 | grep -v "^$"; then
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo "  ❌ Failed to export $basename"
        FAILED_COUNT=$((FAILED_COUNT + 1))
    fi

    echo ""
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Export Summary"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Total parts:     $PART_COUNT"
echo "Successful:      $SUCCESS_COUNT"
echo "Failed:          $FAILED_COUNT"
echo "Output location: $OUTPUT_DIR/"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ $FAILED_COUNT -gt 0 ]; then
    exit 1
fi
