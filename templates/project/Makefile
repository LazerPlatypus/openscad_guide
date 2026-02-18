# ============================================================
# Makefile for [PROJECT] OpenSCAD Project
# ============================================================
# Build automation for OpenSCAD design projects
#
# Usage:
#   make          - Build all STL files
#   make stls     - Build all STL files
#   make images   - Render documentation images
#   make docs     - Generate API documentation
#   make setup    - Setup development environment
#   make clean    - Remove build artifacts
#   make help     - Show this help

# ============================================================
# CONFIGURATION
# ============================================================

# OpenSCAD command
OPENSCAD := openscad
SCAD_FLAGS := --hardwarnings
EXPORT_FLAGS := -D 'EXPORT_MODE=true'

# Directories
MODELS_DIR := models
PREVIEWS_DIR := previews
BUILD_DIR := build
DOCS_DIR := docs/api
SCRIPTS_DIR := scripts

# Camera settings for documentation renders
CAMERA := 0,0,0,60,0,45,200
IMGSIZE := 800,600

# ============================================================
# DEFAULT TARGET
# ============================================================

.PHONY: all
all: stls
	@echo "✓ Build complete!"

# ============================================================
# BUILD TARGETS
# ============================================================

.PHONY: stls
stls: 
	@$(SCRIPTS_DIR)/export_all.sh

# ============================================================
# DOCUMENTATION TARGETS
# ============================================================

.PHONY: images
images: 
	@$(SCRIPTS_DIR)/render_images.sh

.PHONY: docs
docs:
	@$(SCRIPTS_DIR)/generate_docs.sh

# ============================================================
# SETUP TARGETS
# ============================================================

.PHONY: setup
setup:
	@$(SCRIPTS_DIR)/setup.sh

# ============================================================
# CLEANING
# ============================================================

.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(BUILD_DIR)
	@echo "✓ Build artifacts removed"

.PHONY: clean-docs
clean-docs:
	@echo "Cleaning generated documentation..."
	@rm -rf $(DOCS_DIR)
	@echo "✓ Documentation removed"

.PHONY: clean-all
clean-all: clean clean-docs
	@echo "✓ All generated files removed"

# ============================================================
# UTILITY TARGETS
# ============================================================

.PHONY: help
help:
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo "[PROJECT] - Makefile Help"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo ""
	@echo "Setup:"
	@echo "  make setup        Setup development environment (venv, tools)"
	@echo ""
	@echo "Build:"
	@echo "  make              Build all STL files"
	@echo "  make stls         Build all STL files"
	@echo "  make images       Render documentation images"
	@echo "  make docs         Generate API documentation"
	@echo ""
	@echo "Specific targets:"
	@echo "  make build/stl/[part_name].stl    Build specific part"
	@echo "  make build/images/[part_name].png Render specific image"
	@echo ""
	@echo "Clean:"
	@echo "  make clean        Remove build artifacts (STLs, images)"
	@echo "  make clean-all    Remove build artifacts and docs"
	@echo "  make clean-docs   Remove only generated docs"
	@echo ""
	@echo "Info:"
	@echo "  make help         Show this help message"
	@echo ""
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo "First time setup:"
	@echo "  1. make setup"
	@echo "  2. make"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo ""
	@echo "Customize dimensions in config.scad"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

