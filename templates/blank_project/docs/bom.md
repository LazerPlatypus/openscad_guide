# Bill of Materials

This document lists all parts needed to build one complete best_fence setup. Quantities depend on your configuration — see the notes per section.

---

## 3D Printed Parts

Print these from the STL files in `build/stl/` (run `make` to generate).

| Part | File | Material | Qty (per use) | Notes |
|------|------|----------|---------------|-------|
| Toe Clamp Body | `toe_clamp_body.stl` | TPU | 1 per channel | Flexible/grippy — one per toe clamp station |
| Toe Clamp Insert | `toe_clamp_insert.stl` | PLA | 1 per channel | Rigid insert — one per toe clamp station |
| Butt Connector | `butt_connector.stl` | PLA | 1 per fence joint | Has 2 channels; needs 2 toe clamp sets |
| Saw Horse Connector | `saw_horse_connector.stl` | PLA | 1 per saw horse | Has 1 channel; needs 1 toe clamp set |

**Example:** A setup with 2 saw horses and 1 butt-joined fence section would need:
- 2x Saw Horse Connector (2 channels total → 2 toe clamp sets)
- 1x Butt Connector (2 channels → 2 toe clamp sets)
- **4x** Toe Clamp Body, **4x** Toe Clamp Insert

---

## Hardware

### Toe Clamp Hardware

The following hardware is required per toe clamp channel. The stack from top to bottom is:
**bolt head → toe clamp insert → toe clamp body → nut → spring → connector body → washer → knob**

| Item | Spec | Notes |
|------|------|-------|
| Hex bolt | **1/4"-20 × 2"** | McMaster-Carr [#92865A549](https://www.mcmaster.com/catalog/132/3578/92865A549) — avoid cheap hardware store bolts, they can strip in the brass knob |
| Hex nut | 1/4"-20, zinc | McMaster-Carr [#95462A029](https://www.mcmaster.com/products/95462a029/) |
| Spring | **3/4" long, 3/8" OD**, spring rate ~8.9 lb/in | McMaster-Carr [#9657K289](https://www.mcmaster.com/products/9657k289/) — the spring is critical; exact spring rate matters less than the dimensions |
| Washer | 1/4", zinc (optional) | McMaster-Carr [#92141A029](https://www.mcmaster.com/products/92141a029/) — between connector body and knob |
| Knob | 1/4"-20 plastic knob with brass threaded insert | Hardware store knob works; McMaster-Carr [#6185K21](https://www.mcmaster.com/6185K21/) if ordering online |

### Saw Horse Mounting Screws

Four screws are required per saw horse connector. The connector mounts to a **wood block** (not directly to the saw horse), which lets you dial in the exact height.

| Item | Spec | Notes |
|------|------|-------|
| Wood screw | **#10** | Length depends on your wood block thickness |
| Wood block | User-provided | Sized and mounted to the saw horse to set the fence height |
| Pattern | 2×2 grid, 32mm spacing | Matches `SCREW_MOUNT_WIDTH/LENGTH = 32mm` in `config.scad` |
| Qty per connector | 4 | |

### FastCap 3rd Hand

One [FastCap 3rd Hand](https://www.fastcap.com/products/3rd-hand-series) arm is required per butt connector. It clips onto the bottom of the Best Fence rail and the arm slides into the cylindrical pocket on the underside of the connector to support it from below.

| Attribute | Value |
|-----------|-------|
| Product | FastCap 3rd Hand |
| Source | [fastcap.com](https://www.fastcap.com/products/3rd-hand-series) |
| Qty per butt connector | 1 |

---

## Summary Table (per typical 2-saw-horse setup)

| Item | Qty |
|------|-----|
| Toe Clamp Body (TPU) | 4 |
| Toe Clamp Insert (PLA) | 4 |
| Butt Connector (PLA) | 1 |
| Saw Horse Connector (PLA) | 2 |
| 1/4"-20 × 2" hex bolt (McMaster [#92865A549](https://www.mcmaster.com/catalog/132/3578/92865A549)) | 4 |
| 1/4"-20 hex nut, zinc (McMaster [#95462A029](https://www.mcmaster.com/products/95462a029/)) | 4 |
| Spring 3/4" × 3/8" OD (McMaster [#9657K289](https://www.mcmaster.com/products/9657k289/)) | 4 |
| 1/4" washer, zinc, optional (McMaster [#92141A029](https://www.mcmaster.com/products/92141a029/)) | 4 |
| 1/4"-20 plastic knob w/ brass insert (McMaster [#6185K21](https://www.mcmaster.com/6185K21/)) | 4 |
| #10 wood screws | 8 |
| Wood mounting blocks | 2 |
| FastCap 3rd Hand | 1 |
