// ============================================================
// PROJECT CONFIGURATION
// Description: Global settings for [PROJECT_NAME]
// ============================================================

// ============================================================
// RENDERING SETTINGS
// ============================================================

// Preview quality (lower = faster preview)
PREVIEW_FN = 32;

// Export quality (higher = smoother STL)
EXPORT_FN = 128;

// Current mode (set to true when exporting STL)
// Override from command line: openscad -D 'EXPORT_MODE=true' ...
EXPORT_MODE = false;

// Convenience variable - automatically use correct quality
$fn = EXPORT_MODE ? EXPORT_FN : PREVIEW_FN;

// ============================================================
// PROJECT DIMENSIONS
// ============================================================

// Base dimensions (millimeters)
BASE_WIDTH = 100;
BASE_DEPTH = 60;
BASE_HEIGHT = 30;

// Material settings
WALL_THICKNESS = 2;
FLOOR_THICKNESS = 3;

// Hardware
MOUNTING_HOLE_DIAMETER = 5;
MOUNTING_HOLE_SPACING = 80;

// ============================================================
// TOLERANCES
// ============================================================

// General fit tolerance (for sliding parts)
TOLERANCE = 0.2;

// Tight fit (press-fit, requires force)
TIGHT_FIT = 0.1;

// Loose fit (easy sliding, clearance)
LOOSE_FIT = 0.5;

// 3D printer compensation (add to holes, subtract from pegs)
PRINTER_TOLERANCE = 0.15;

// ============================================================
// FEATURE FLAGS
// ============================================================

// Enable experimental features
ENABLE_ADVANCED_FEATURES = false;

// Include support structures in export
INCLUDE_SUPPORTS = false;

// Show reference geometry in previews
SHOW_REFERENCE = true;

// ============================================================
// RENDERING HELPERS
// ============================================================

// Helper function to determine if we're in preview mode
function is_preview() = !EXPORT_MODE;

// Helper function to determine if we're in export mode
function is_export() = EXPORT_MODE;
