#!/usr/bin/env bash
# Export a single OpenSCAD file with variable overrides
# Usage: ./scripts/export_part.sh <input.scad> <output.stl> [VAR=value ...]

set -e

INPUT="$1"
OUTPUT="$2"
shift 2
OVERRIDES=("$@")

if [ -z "$INPUT" ] || [ -z "$OUTPUT" ]; then
    echo "Usage: $0 <input.scad> <output.stl> [VAR=value ...]"
    echo ""
    echo "Examples:"
    echo "  $0 models/bracket.scad build/stl/bracket.stl"
    echo "  $0 models/bracket.scad build/stl/bracket_large.stl \"WIDTH=100\" \"HEIGHT=60\""
    echo "  $0 models/part.scad build/stl/part.stl \"EXPORT_MODE=true\" \"EXPORT_FN=256\""
    exit 1
fi

# Check if input file exists
if [ ! -f "$INPUT" ]; then
    echo "❌ Input file not found: $INPUT"
    exit 1
fi

# Create output directory if needed
mkdir -p "$(dirname "$OUTPUT")"

# Build OpenSCAD command with variable overrides
CMD=(openscad --hardwarnings)

# Add variable overrides
for override in "${OVERRIDES[@]}"; do
    CMD+=(-D "$override")
done

# Add output and input
CMD+=(-o "$OUTPUT" "$INPUT")

# Show what we're doing
echo "Exporting: $INPUT → $OUTPUT"
if [ ${#OVERRIDES[@]} -gt 0 ]; then
    echo "Overrides:"
    for override in "${OVERRIDES[@]}"; do
        echo "  - $override"
    done
fi

# Execute command
"${CMD[@]}"

echo "✓ Done: $OUTPUT"
