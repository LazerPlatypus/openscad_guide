#!/usr/bin/env bash
# OpenSCAD Library Template Setup Script
# Creates a new OpenSCAD library from the template

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Helper functions
print_header() {
    echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

print_step() {
    echo -e "${GREEN}▸${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1" >&2
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/library"

# Validate template exists
if [[ ! -d "$TEMPLATE_DIR" ]]; then
    print_error "Template directory not found: $TEMPLATE_DIR"
    exit 1
fi

# Banner
print_header "OpenSCAD Library Template Setup"
echo "This script will help you create a new OpenSCAD library."
echo ""

# Gather information
read -p "Library name (e.g., my_awesome_lib): " PROJECT_NAME
if [[ -z "$PROJECT_NAME" ]]; then
    print_error "Library name is required"
    exit 1
fi

read -p "Brief description: " DESCRIPTION
if [[ -z "$DESCRIPTION" ]]; then
    print_error "Description is required"
    exit 1
fi

read -p "GitHub username (default: $(git config user.name 2>/dev/null || echo 'yourusername')): " YOUR_USERNAME
if [[ -z "$YOUR_USERNAME" ]]; then
    YOUR_USERNAME=$(git config user.name 2>/dev/null || echo "yourusername")
fi

read -p "Copyright holder (default: $YOUR_USERNAME): " COPYRIGHT_HOLDER
if [[ -z "$COPYRIGHT_HOLDER" ]]; then
    COPYRIGHT_HOLDER=$YOUR_USERNAME
fi

YEAR=$(date +%Y)
read -p "Copyright year (default: $YEAR): " INPUT_YEAR
if [[ -n "$INPUT_YEAR" ]]; then
    YEAR=$INPUT_YEAR
fi

DATE=$(date +%Y-%m-%d)

# Destination directory
read -p "Destination directory (default: ./$PROJECT_NAME): " DEST_DIR
if [[ -z "$DEST_DIR" ]]; then
    DEST_DIR="./$PROJECT_NAME"
fi

# Expand path
DEST_DIR=$(eval echo "$DEST_DIR")

# Check if destination exists
if [[ -d "$DEST_DIR" ]]; then
    print_error "Destination directory already exists: $DEST_DIR"
    read -p "Overwrite? (y/N): " OVERWRITE
    if [[ ! "$OVERWRITE" =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
    rm -rf "$DEST_DIR"
fi

# Summary
echo ""
print_header "Configuration Summary"
echo "Library Name:      $PROJECT_NAME"
echo "Description:       $DESCRIPTION"
echo "GitHub User:       $YOUR_USERNAME"
echo "Copyright Holder:  $COPYRIGHT_HOLDER"
echo "Copyright Year:    $YEAR"
echo "Date:              $DATE"
echo "Destination:       $DEST_DIR"
echo ""

read -p "Proceed? (Y/n): " PROCEED
if [[ "$PROCEED" =~ ^[Nn]$ ]]; then
    echo "Aborted."
    exit 0
fi

# Create library
print_header "Creating Library"

print_step "Copying template files..."
mkdir -p "$DEST_DIR"
cp -r "$TEMPLATE_DIR/"* "$DEST_DIR/"
cp "$TEMPLATE_DIR/.openscad_docsgen_rc" "$DEST_DIR/" 2>/dev/null || true
cp "$TEMPLATE_DIR/.gitignore" "$DEST_DIR/" 2>/dev/null || true
print_success "Files copied"

# Replace placeholders
print_step "Replacing placeholders..."

# Function to replace in file (macOS and Linux compatible)
replace_in_file() {
    local file=$1
    local search=$2
    local replace=$3

    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        sed -i '' "s|${search}|${replace}|g" "$file"
    else
        # Linux
        sed -i "s|${search}|${replace}|g" "$file"
    fi
}

# Find all files and replace placeholders
find "$DEST_DIR" -type f \( -name "*.scad" -o -name "*.md" -o -name "Makefile" -o -name "LICENSE" -o -name "CHANGELOG.md" -o -name ".*" \) -not -path "*/build/*" -not -path "*/docs/*" -not -path "*/.git/*" | while read -r file; do
    replace_in_file "$file" '\[PROJECT_NAME\]' "$PROJECT_NAME"
    replace_in_file "$file" '\[DESCRIPTION\]' "$DESCRIPTION"
    replace_in_file "$file" '\[YOUR_USERNAME\]' "$YOUR_USERNAME"
    replace_in_file "$file" '\[COPYRIGHT_HOLDER\]' "$COPYRIGHT_HOLDER"
    replace_in_file "$file" '\[YEAR\]' "$YEAR"
    replace_in_file "$file" '\[YYYY-MM-DD\]' "$DATE"
done

print_success "Placeholders replaced"

# Clean up template files
print_step "Cleaning up template files..."
rm -f "$DEST_DIR/QUICK_START.md"
rm -f "$DEST_DIR/TEMPLATE_README.md" 2>/dev/null || true
rm -f "$DEST_DIR/.placeholder-deps"
rm -f "$DEST_DIR/deps/.placeholder-deps"
rm -f "$DEST_DIR/scripts/setup.sh" 2>/dev/null || true
print_success "Template files removed"

# Initialize git
print_step "Initializing git repository..."
cd "$DEST_DIR"
git init -q
git add .
git commit -q -m "Initial commit from OpenSCAD library template"
print_success "Git repository initialized"

# Optional setup
echo ""
print_header "Optional Setup Steps"

read -p "Run 'make setup' to install documentation tools? (y/N): " RUN_SETUP
if [[ "$RUN_SETUP" =~ ^[Yy]$ ]]; then
    print_step "Running make setup..."
    make setup
    print_success "Setup complete"
fi

read -p "Build documentation and examples now? (y/N): " RUN_BUILD
if [[ "$RUN_BUILD" =~ ^[Yy]$ ]]; then
    print_step "Building documentation and examples..."
    make
    print_success "Build complete"
fi

read -p "Run tests? (y/N): " RUN_TESTS
if [[ "$RUN_TESTS" =~ ^[Yy]$ ]]; then
    print_step "Running tests..."
    make test
    print_success "Tests complete"
fi

# Success message
echo ""
print_header "🎉 Library Created Successfully!"
echo ""
echo "Your new library is ready at: ${GREEN}$DEST_DIR${NC}"
echo ""
echo "Next steps:"
echo "  1. cd $DEST_DIR"
echo "  2. Replace example code in src/ with your implementation"
echo "  3. Update core.scad with your module includes"
echo "  4. Create examples in examples/"
echo "  5. Create tests in tests/"
echo "  6. Run 'make' to build docs and render examples"
echo "  7. Run 'make help' to see all available commands"
echo ""
echo "Happy coding!"
echo ""
