# Dependencies

External OpenSCAD libraries used by this project, managed as git submodules.

Each subdirectory here is a submodule pointing to a versioned external library. They are included in `.scad` files using a path relative to the project root:

```scad
use <../deps/some_library/core.scad>;
```

## Managing submodules

**Add a new dependency:**
```bash
git submodule add <repo-url> deps/<library-name>
```

**Clone this repo with all dependencies:**
```bash
git clone --recurse-submodules <repo-url>
```

**Update an existing dependency:**
```bash
git submodule update --remote deps/<library-name>
```

**Initialize after cloning without `--recurse-submodules`:**
```bash
git submodule update --init --recursive
```

---

Delete this file when this directory is populated.
