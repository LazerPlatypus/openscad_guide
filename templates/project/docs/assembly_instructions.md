# Assembly Instructions

## Required Parts

### 3D Printed Parts
- 1× Part One (base plate)
- 1× Part Two (holder)

See [bom.md](bom.md) for complete parts list with quantities.

## Required Hardware

| Item | Quantity | Notes |
|------|----------|-------|
| M5 × 20mm screw | 4 | Mounting hardware |
| M5 nut | 4 | For mounting holes |

## Required Tools

- Allen key or screwdriver (for M5 screws)
- [Add other tools as needed]

## Pre-Assembly Notes

1. **Print Settings:**
   - All parts should be printed with the settings in [bom.md](bom.md)
   - Check fit before assembly - parts may need light sanding

2. **Preparation:**
   - Remove support material if present
   - Clean up any rough edges
   - Test fit all parts before gluing/screwing

## Assembly Steps

### Step 1: Prepare Base Plate

1. Insert M5 nuts into the mounting holes on the underside of the base plate
2. Nuts should fit snugly - use a soldering iron tip to heat-set if needed
3. Verify nuts are flush with the surface

![Base plate with nuts installed](../build/images/part_one.png)

### Step 2: Position Holders

1. Place holders on base plate at marked positions
2. Align mounting holes
3. Do not tighten screws yet - just start them

### Step 3: Final Assembly

1. Check alignment of all parts
2. Tighten all screws evenly
3. Verify parts are secure and aligned

![Completed assembly](../build/images/assembly.png)

### Step 4: Verification

- [ ] All screws tight
- [ ] Parts properly aligned
- [ ] No gaps or misalignment
- [ ] Holder slots accept widgets smoothly

## Troubleshooting

**Parts don't fit:**
- Check printer tolerance settings
- Light sanding may be needed
- Adjust `TOLERANCE` in `config.scad` and re-print if needed

**Holders won't stay in place:**
- Ensure mounting holes align correctly
- Check that nuts are properly seated
- Verify screws are correct length

**Widget doesn't fit in slot:**
- Check `SLOT_WIDTH` in `models/consts.scad`
- Measure your actual widget diameter
- Adjust dimensions and re-print if needed

## Maintenance

- Periodically check screw tightness
- Clean with mild soap and water
- Avoid harsh chemicals that may damage plastic

## Modifications

To customize dimensions:
1. Edit `config.scad` for global settings
2. Edit `models/consts.scad` for part-specific dimensions
3. Run `make` to rebuild STL files
4. Print and test fit

See [design_notes.md](design_notes.md) for design considerations.
