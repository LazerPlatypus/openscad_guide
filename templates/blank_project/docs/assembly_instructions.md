# Assembly Instructions

This document covers how to print and assemble each component in the best_fence system.

See [bom.md](bom.md) for the full parts and hardware list.

---

## Printing Guidelines

### Material Recommendations

| Part | Material | Notes |
|------|----------|-------|
| `toe_clamp_body` | **TPU** | Flexible/grippy material gives a secure hold on the fence |
| `toe_clamp_insert` | **PLA** | Rigid insert provides structural support inside the clamp body |
| `butt_connector` | **PLA** | Structural part — rigidity preferred (see Print Settings below) |
| `saw_horse_connector` | **PLA** | Structural part — rigidity preferred (see Print Settings below) |

### Print Settings

#### Connectors and Inserts (PLA recommended)

**PLA Basic (e.g. Bambu Labs PLA Basic)** works surprisingly well and is the recommended choice:
- **6 top/bottom layers, 4 walls, 25% infill**
- PLA's combination of rigidity and impact resistance at this wall thickness is ideal
- Heat warping is a theoretical concern for outdoor summer use (110°F+ days), but has not been a practical problem in testing

**Alternative: PC CF GF** (e.g. [Priline Superhard CF PC](https://a.co/d/026GdiBA)) is the only other material that has worked well in practice. Standard PC, PA, PA-CF, and PETG have all been tested and found to be unsuitable.

#### Toe Clamp Body (TPU)

> **Note:** Specific TPU print settings not yet documented.

---

## Toe Clamp Assembly

The toe clamp is a two-part clamping system that grips the outside of the Best Fence rail. Each mount channel requires one complete toe clamp assembly (body + insert + bolt).

### Parts needed (per channel)
- 1x `toe_clamp_body` (TPU)
- 1x `toe_clamp_insert` (PLA)
- 1x 1/4"-20 × 2" hex bolt (McMaster-Carr [#92865A549](https://www.mcmaster.com/catalog/132/3578/92865A549))
- 1x 1/4"-20 hex nut, zinc (McMaster-Carr [#95462A029](https://www.mcmaster.com/products/95462a029/))
- 1x spring, 3/4" long × 3/8" OD (McMaster-Carr [#9657K289](https://www.mcmaster.com/products/9657k289/))
- 1x 1/4" washer, zinc (optional) (McMaster-Carr [#92141A029](https://www.mcmaster.com/products/92141a029/))
- 1x 1/4"-20 plastic knob with brass threaded insert (McMaster-Carr [#6185K21](https://www.mcmaster.com/6185K21/) or hardware store)

### Hardware Stack

From top to bottom:

```
[ bolt head ]
[ toe clamp insert ]
[ toe clamp body ]
[ nut ]
[ spring ]       ← stiffer is better, helps the toe clamp to "spring" up after loosening
[ connector body (butt or saw horse) ]
[ washer ]       ← optional, add if you can't tighten enough
[ knob ]
```

### Steps

1. **Print** `toe_clamp_body` in TPU and `toe_clamp_insert` in PLA.
2. **Insert** the `toe_clamp_insert` into the pocket of the `toe_clamp_body`. The insert is sized slightly smaller than the body cavity (`TOE_CLAMP_INSERT_WIDTH` and `TOE_CLAMP_INSERT_LENGTH` are each 2mm smaller than the body) so it should fit snugly.
3. **Thread the bolt** down through the center hole, passing through the insert and body.
4. **Thread a nut** onto the bolt below the clamp body.
5. **Add the spring** below the nut.
6. **Drop the assembly** through the channel slot in the connector body (butt or saw horse connector) so the spring sits against the underside of the connector.
7. **Add the optional washer** below the connector body, then **thread on the knob** to complete the assembly.
8. **Tighten the knob** to compress the spring and drive the toe clamp body against the fence rail.

---

## Butt Connector Assembly

The butt connector joins two sections of Best Fence end-to-end. It uses 2 channel slots (one toe clamp per slot) and mounts from the **bottom** of the fence using a "Helping Hand" arm.

### Parts needed
- 1x `butt_connector` (PLA)
- 2x toe clamp assemblies (see above)
- 1x [FastCap 3rd Hand](https://www.fastcap.com/products/3rd-hand-series) arm

### Steps

1. **Print** `butt_connector` in PLA.
2. **Assemble two toe clamps** per the Toe Clamp Assembly instructions above.
3. **Clip the FastCap 3rd Hand** onto the bottom of the Best Fence rail, then **slide the connector** onto the arm so it seats in the cylindrical pocket on the underside.
4. **Position the connector** across the joint between two fence sections — roughly centered, with one channel on each section. Exact centering isn't critical; just make sure each channel is on a different fence section.
5. **Insert a toe clamp assembly** into each channel slot and **tighten the knobs** to lock both sections in place.

---

## Saw Horse Connector Assembly

The saw horse connector mounts a single section of Best Fence onto a saw horse. It uses 1 channel slot (one toe clamp) and mounts from the **top** of the connector down into the saw horse surface using 4 screws.

### Parts needed
- 1x `saw_horse_connector` (PLA)
- 1x toe clamp assembly (see above)
- 4x #10 wood screws
- 1x wood mounting block (user-provided)

### Steps

1. **Print** `saw_horse_connector` in PLA.
2. **Assemble one toe clamp** per the Toe Clamp Assembly instructions above.
3. **Mount a wood block** to the saw horse at the desired fence position. The block lets you tune the exact height of the fence rail — size and attach it however works for your saw horse.
4. **Screw the connector** to the wood block using 4x #10 wood screws through the 2×2 hole pattern (32mm spacing).
5. **Slide the fence rail** into the connector channel.
6. **Insert the toe clamp assembly** and **tighten the knob** to lock the fence in place.

---

## Adjusting Dimensions

All geometry is driven by variables in `config.scad`. If your printed parts are too tight or too loose:

- `TOE_CLAMP_TOLERANCE_LENGTH` — adjusts fit along the length of the channel (default: +1mm)
- `TOE_CLAMP_TOLERANCE_WIDTH` — adjusts fit across the width of the channel (default: -3mm)
- `MOUNT_VERTICAL_CLEARANCE` — controls how far the mount sits above/below the top of the fence rail (default: -2mm, meaning 2mm below the top edge)
