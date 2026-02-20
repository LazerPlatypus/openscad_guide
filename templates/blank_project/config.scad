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
// PROJECT DIMENSIONS (mm and degrees)
// ============================================================

// hardware dimensions
BOLT_HEAD_RADIUS = 6.5; // standard 1/4" bolt head radius

// ============================================================
// TOLERANCES (mm and degrees)
// ============================================================

EPSILON = 1e-3;

// ============================================================
// RENDERING HELPERS
// ============================================================

// Helper function to determine if we're in preview mode
function is_preview() = !EXPORT_MODE;

// Helper function to determine if we're in export mode
function is_export() = EXPORT_MODE;
