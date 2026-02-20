#!/usr/bin/env bash
# init.sh — First-time project initialization
# Replaces template placeholders in-place and initializes the git repository.
#
# Run via: make init

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_header() {
    echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

print_step()    { echo -e "${GREEN}▸${NC} $1"; }
print_error()   { echo -e "${RED}✗${NC} $1" >&2; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# ============================================================
# Guard: detect if already initialized
# ============================================================

if ! grep -q '\[PROJECT_NAME\]' "$PROJECT_ROOT/README.md" 2>/dev/null; then
    print_warning "Placeholders have already been replaced — init appears to have been run. (did you mean to run 'make setup' instead?)"
    read -p "Re-run initialization? (y/N): " REINIT
    if [[ ! "$REINIT" =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
fi

print_header "Project Initialization"
echo "Configures this template for your project and initializes the git repository."
echo ""

# ============================================================
# Collect project info
# ============================================================

read -p "Project name (snake_case, e.g. hockey_puck_display): " PROJECT_NAME
if [[ -z "$PROJECT_NAME" ]]; then
    print_error "Project name is required"
    exit 1
fi

read -p "Brief description: " PROJECT_DESCRIPTION
if [[ -z "$PROJECT_DESCRIPTION" ]]; then
    print_error "Description is required"
    exit 1
fi

DEFAULT_AUTHOR=$(git config user.name 2>/dev/null || echo "")
read -p "GitHub username (default: ${DEFAULT_AUTHOR:-yourusername}): " PROJECT_AUTHOR
if [[ -z "$PROJECT_AUTHOR" ]]; then
    PROJECT_AUTHOR="${DEFAULT_AUTHOR:-yourusername}"
fi

# ============================================================
# Summary + confirm
# ============================================================

echo ""
print_header "Configuration Summary"
echo "  Project Name:  $PROJECT_NAME"
echo "  Description:   $PROJECT_DESCRIPTION"
echo "  GitHub User:   $PROJECT_AUTHOR"
echo "  Directory:     $PROJECT_ROOT"
echo ""

read -p "Proceed? (Y/n): " PROCEED
if [[ "$PROCEED" =~ ^[Nn]$ ]]; then
    echo "Aborted."
    exit 0
fi

# ============================================================
# Replace placeholders
# ============================================================

print_header "Replacing Placeholders"

replace_in_file() {
    local file="$1" search="$2" replace="$3"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s|${search}|${replace}|g" "$file"
    else
        sed -i "s|${search}|${replace}|g" "$file"
    fi
}

# Top-level files
TOP_LEVEL=(
    "$PROJECT_ROOT/.openscad_docsgen_rc"
    "$PROJECT_ROOT/.gitignore"
    "$PROJECT_ROOT/config.scad"
    "$PROJECT_ROOT/Makefile"
    "$PROJECT_ROOT/README.md"
)

# Collect all files: top-level + scanned directories
FILES=()
for f in "${TOP_LEVEL[@]}"; do
    [[ -f "$f" ]] && FILES+=("$f")
done

while IFS= read -r -d '' f; do
    FILES+=("$f")
done < <(find \
    "$PROJECT_ROOT/assemblies" \
    "$PROJECT_ROOT/docs" \
    "$PROJECT_ROOT/hardware" \
    "$PROJECT_ROOT/parts" \
    "$PROJECT_ROOT/scripts" \
    "$PROJECT_ROOT/tools" \
    -type f \
    \( -name "*.scad" -o -name "*.md" -o -name "*.sh" \) \
    -not -path "*/.git/*" \
    -not -path "*/.venv/*" \
    -not -path "*/build/*" \
    -print0 2>/dev/null)

for file in "${FILES[@]}"; do
    replace_in_file "$file" '\[PROJECT_NAME\]'        "$PROJECT_NAME"
    replace_in_file "$file" '\[PROJECT_DESCRIPTION\]' "$PROJECT_DESCRIPTION"
    replace_in_file "$file" '\[PROJECT_AUTHOR\]'      "$PROJECT_AUTHOR"
done

print_success "Placeholders replaced in ${#FILES[@]} files"

# ============================================================
# Initialize git repository
# ============================================================

print_header "Initializing Git Repository"

cd "$PROJECT_ROOT"

if [[ ! -d ".git" ]]; then
    git init
    print_success "Git repository initialized"
else
    print_step "Git repository already exists, skipping init"
fi

git add .
git commit -m "Initial commit: $PROJECT_NAME"
print_success "Initial commit created"

# ============================================================
# Done
# ============================================================

print_header "Done!"
echo "Next steps:"
echo "  make setup   — install Python venv and openscad-docsgen"
echo "  make         — build all STL files"
echo ""
echo "Happy designing!"
echo ""
