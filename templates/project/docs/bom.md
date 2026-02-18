# Bill of Materials

## 3D Printed Parts

| Part | Quantity | Material | Print Time* | Filament* | Settings |
|------|----------|----------|-------------|-----------|----------|
| Part One (Base) | 1 | PLA | ~2h 30m | ~45g | 0.2mm layers, 20% infill |
| Part Two (Holder) | 1 | PLA | ~1h 15m | ~25g | 0.2mm layers, 20% infill |

**Total Print Time:** ~3h 45m
**Total Filament:** ~70g

*Approximate times and weights - varies by printer, settings, and size

### Recommended Print Settings

```
Layer Height:     0.2mm (or 0.15mm for higher quality)
Shell Thickness:  1.2mm (3 perimeters @ 0.4mm nozzle)
Infill:           20% (gyroid or grid pattern)
Infill Speed:     80mm/s
Support:          None required (parts designed for FDM)
Bed Adhesion:     Brim recommended for Part One
Material:         PLA, PETG, or ABS
```

### Material Notes

- **PLA:** Easiest to print, good for display items
- **PETG:** More durable, better for functional parts
- **ABS:** Highest strength, requires heated enclosure

### Color Recommendations

- Part One (Base): Any color
- Part Two (Holder): Contrasting color recommended

## Hardware & Fasteners

| Item | Quantity | Specification | Source | Est. Cost |
|------|----------|---------------|--------|-----------|
| M5 × 20mm screw | 4 | Socket head cap screw | McMaster #92000A120 | $0.50 each |
| M5 nut | 4 | Hex nut | McMaster #90592A095 | $0.10 each |

**Total Hardware Cost:** ~$2.40

### Hardware Notes

- Socket head cap screws recommended for clean look
- Button head screws work as alternative
- Stainless steel recommended for corrosion resistance

## Optional Components

| Item | Quantity | Purpose | Source |
|------|----------|---------|--------|
| Rubber feet | 4 | Prevent sliding | Amazon, hardware store |
| Felt pads | 4 | Protect surfaces | Craft store |

## Tools Required

**For Assembly:**
- 4mm Allen key (for M5 socket head screws)
- OR Phillips screwdriver (for button head alternative)

**For Modifications:**
- Soldering iron (for heat-set inserts - optional)
- Sandpaper (120 and 220 grit - for cleanup)
- Calipers (for verification)

## Cost Summary

| Category | Cost |
|----------|------|
| 3D Printed Parts (filament) | ~$2.00 |
| Hardware | ~$2.40 |
| Optional components | $1.00-$5.00 |
| **Total Project Cost** | **~$4.40-$9.40** |

*Costs are approximate and vary by supplier and location*

## Sourcing Notes

### 3D Printing Services

If you don't have a 3D printer, these services can print the parts:

- **Shapeways** - https://www.shapeways.com/
- **Craftcloud** - https://craftcloud3d.com/
- **Local makerspaces** - Often offer printing services

Upload the STL files from `build/stl/` directory.

### Hardware Suppliers

**USA:**
- McMaster-Carr - Fast shipping, excellent quality
- Fastenal - Local pickup available
- Amazon - Variety packs available

**International:**
- Check local hardware stores
- Online suppliers in your region
- Bulk hardware from AliExpress (longer shipping)

## Customization Options

### Size Variants

To create different sizes:
1. Edit dimensions in `config.scad`
2. Run `make` to rebuild STL files
3. Update this BOM with new print times/filament

### Material Substitutions

**For outdoor use:**
- Use PETG or ASA filament
- Use stainless steel hardware
- Apply UV-resistant coating

**For high-temperature:**
- Use ABS or ASA filament
- Verify screw ratings for temperature

## Revision History

| Version | Date | Changes |
|---------|------|---------|
| 0.1.0 | [YYYY-MM-DD] | Initial BOM |

---

**Note:** Print times and filament usage are estimates based on:
- Prusa MK3S+ printer
- 0.4mm nozzle
- PrusaSlicer defaults
- Your results may vary
