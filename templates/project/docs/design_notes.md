# Design Notes

## Design Goals

The [PROJECT_NAME] was designed with the following goals:

1. **Easy to print:** No supports required, flat base for good bed adhesion
2. **Easy to assemble:** Minimal hardware, simple construction
3. **Customizable:** Dimensions easily adjustable via configuration files
4. **Functional:** [Describe primary function]

## Design Decisions

### Part Orientation

**Part One (Base):**
- Prints flat on build plate
- Large surface area provides excellent bed adhesion
- No overhangs or supports needed

**Part Two (Holder):**
- Designed to print upright
- Opening faces up for easier support removal (if needed)
- Walls thick enough for strength without excessive print time

### Tolerances

Tolerance settings in `config.scad`:
```scad
TOLERANCE = 0.2;       // General fit
TIGHT_FIT = 0.1;       // Press-fit
LOOSE_FIT = 0.5;       // Easy sliding
```

These values work well for most FDM printers. Adjust based on your printer's accuracy.

### Material Thickness

**Wall thickness:** 2mm (default)
- Provides good strength-to-weight ratio
- Prints with 5 perimeters @ 0.4mm nozzle
- Can be adjusted in `config.scad`

**Floor thickness:** 3mm (default)
- Ensures solid base
- Prevents warping
- Strong enough for mounting screws

### Assembly Method

Using M5 screws and nuts rather than press-fit or glue because:
- Allows disassembly if needed
- More reliable than interference fits
- Easier to manufacture consistently
- Common hardware size

Alternative assembly methods considered:
- **Heat-set inserts:** More professional, but requires additional tools
- **Snap-fit:** Would reduce hardware, but less reliable
- **Glue:** Permanent, harder to repair

## Dimensions

### Base Constants

From `models/consts.scad`:
```scad
WIDGET_DIAMETER = 50;     // Size of object being held
WIDGET_HEIGHT = 20;       // Height of object
SLOT_WIDTH = WIDGET_DIAMETER + 2;   // +2mm clearance
```

### Configurable Parameters

From `config.scad`:
```scad
BASE_WIDTH = 100;         // Overall width
BASE_DEPTH = 60;          // Overall depth
WALL_THICKNESS = 2;       // Wall thickness
```

## Customization Guide

### To change size for different widget:

1. Measure your widget accurately
2. Edit `models/consts.scad`:
   ```scad
   WIDGET_DIAMETER = [your_measurement];
   WIDGET_HEIGHT = [your_measurement];
   ```
3. Run `make` to rebuild

### To adjust base size:

1. Edit `config.scad`:
   ```scad
   BASE_WIDTH = [desired_width];
   BASE_DEPTH = [desired_depth];
   ```
2. Run `make` to rebuild

### To change hole spacing:

1. Edit `config.scad`:
   ```scad
   MOUNTING_HOLE_SPACING = [new_spacing];
   ```
2. Verify holes don't interfere with parts
3. Run `make` to rebuild

## Known Issues

### Version 0.1.0

**Issue:** [Describe any known issues]
- **Workaround:** [Describe temporary fix]
- **Planned fix:** [Describe permanent solution]

## Future Improvements

### Planned Features

- [ ] Add cable management clips
- [ ] Create variant with adjustable spacing
- [ ] Design wall-mount version

### Potential Enhancements

- **Material efficiency:** Reduce infill requirements
- **Print time:** Optimize geometry for faster printing
- **Assembly:** Switch to snap-fit design
- **Aesthetics:** Add decorative elements or text

## Performance Characteristics

### Structural

- **Weight capacity:** [Estimated capacity]
- **Expected lifespan:** [Indoor/outdoor, load conditions]

### Manufacturing

- **Estimated failure rate:** Low (design tolerates printer variations)
- **Post-processing required:** Minimal (remove support/brim only)

## Testing

### Fit Testing

Before finalizing design:
1. Print single holder first
2. Verify widget fits with proper clearance
3. Check mounting hole alignment
4. Adjust tolerances if needed

### Stress Testing

[Describe any stress or durability testing performed]

## Design Iteration History

### Version 0.1.0 (Initial)
- Basic functional design
- Standard mounting hole pattern
- Single holder configuration

---

## References

- [Related designs or inspiration]
- [Technical references or standards]
- [Material property databases]

## Contact

For design questions or suggestions:
- GitHub Issues: [Your repo URL]
- Email: [Your email]
