#!/usr/bin/env bash
# Export all parts in parts/ directory to STL files

set -e

PARTS_DIR="parts"
OUTPUT_DIR="build/stl"

# Check if parts directory exists
if [ ! -d "$PARTS_DIR" ]; then
    echo "❌ Parts directory not found: $PARTS_DIR"
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Count parts
PART_COUNT=0
SUCCESS_COUNT=0
FAILED_COUNT=0

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Exporting all parts from $PARTS_DIR/"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Export each part file
for part in "$PARTS_DIR"/*.scad; do
    # Skip if no files found
    [ -f "$part" ] || continue

    basename=$(basename "$part" .scad)

    PART_COUNT=$((PART_COUNT + 1))
    output="$OUTPUT_DIR/$basename.stl"

    echo "[$PART_COUNT] Exporting $basename..."

    # Export with EXPORT_MODE=true
    if ./scripts/export_part.sh "$part" "$output" "EXPORT_MODE=true" 2>&1 | grep -v "^$"; then
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
