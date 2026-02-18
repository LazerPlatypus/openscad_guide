// ============================================================
// SHARED CONSTANTS
// Description: Constants used by multiple parts in [PROJECT_NAME]
// ============================================================

// ============================================================
// WIDGET DIMENSIONS
// ============================================================
// Example: If your project holds/fits a specific object,
// define its dimensions here

// Widget dimensions (example - replace with your actual object)
WIDGET_DIAMETER = 50;
WIDGET_HEIGHT = 20;

// ============================================================
// CALCULATED DIMENSIONS
// ============================================================
// Dimensions derived from base constants and tolerances

// Slot/holder sizing with clearance
SLOT_WIDTH = WIDGET_DIAMETER + 2;      // 2mm total clearance
SLOT_HEIGHT = WIDGET_HEIGHT + 1;       // 1mm clearance

// Spacing between elements
ELEMENT_SPACING = WIDGET_DIAMETER + 10;  // 10mm gap between widgets

// ============================================================
// EXAMPLE USAGE
// ============================================================
// In your part files:
//   include <consts.scad>
//   cylinder(d = WIDGET_DIAMETER + TOLERANCE, h = WIDGET_HEIGHT);
