# Why These Conventions?

**Last Updated:** 2026-02-15
**Status:** Draft

Understanding the reasoning behind our style guide choices.

---

## Core Philosophy

### Clarity Over Cleverness
- Code is read more than written
- Future maintainers (including future you) need to understand quickly
- Explicit is better than implicit

### Consistency Over Personal Preference
- Team consistency > individual style
- Reduces cognitive load
- Makes code predictable

### Simplicity Over Abstraction
- Simple patterns are easier to maintain
- Don't over-engineer for hypothetical future needs
- A little duplication is better than complex abstraction

---

## Naming Conventions {#naming}

### Why snake_case for Everything?

**Consistency with OpenSCAD:**
- Built-in functions use snake_case: `linear_extrude`, `rotate_extrude`
- Special variables use snake_case: `$fn`, `$vpr`
- Following the language's established patterns

**Readability:**
- More readable than camelCase for longer names
- Clear word boundaries: `calculate_maximum_radius` vs `calculateMaximumRadius`
- Works well with underscores in OpenSCAD syntax

**Avoids Case Confusion:**
- Case-insensitive filesystems (macOS, Windows) can have issues with mixed case
- No debate about PascalCase vs camelCase
- One consistent rule

**Alternatives considered:**
- ❌ camelCase - doesn't match OpenSCAD built-ins
- ❌ PascalCase - typically reserved for types/classes (OpenSCAD has neither)
- ❌ kebab-case - not valid in OpenSCAD identifiers

### Why SCREAMING_SNAKE_CASE for Constants?

**Visual distinction:**
- Immediately recognize constants when scanning code
- Signals "this value doesn't change"
- Common convention across many languages (C, Python, Ruby, Go)

**Prevents accidental reassignment:**
- While OpenSCAD doesn't enforce const, the convention signals intent
- Code reviewers can spot violations

**Example:**
```scad
// Clear at a glance which are constants
HOCKEY_PUCK_DIAMETER = 76.3;
radius = HOCKEY_PUCK_DIAMETER / 2;
```

**Alternatives considered:**
- ❌ Regular snake_case - no visual distinction from variables
- ❌ Prefix notation (`k_diameter`) - less common, harder to scan

### Why Prefix Private Items with `_`?

**Clear API boundaries:**
- Users immediately know what's public vs internal
- Signals "use at your own risk"
- Common convention (Python, JavaScript, Go)

**Documentation separation:**
- Private items don't need full documentation
- Generators can skip `_` items
- Cleaner public API docs

**Example:**
```scad
// Public - documented, stable
function calculate_area(radius) = ...;

// Private - undocumented, can change
function _validate_radius(r) = ...;
```

**Note:** OpenSCAD doesn't enforce privacy - this is purely conventional

### Why No Function Aliases?

**Single obvious name:**
- One function, one name
- No confusion about which name to use
- Easier to search and find

**Simpler documentation:**
- Don't have to document multiple names
- No decision about "canonical" name
- Clearer API surface

**Less maintenance:**
- Name changes affect one place
- No keeping aliases in sync
- Simpler refactoring

**If you need different names:**
- Create wrapper functions with clear purpose
- Document why the variant exists
- Don't just alias for the sake of it

### Why Verb-Based Function Names?

**Intent clarity:**
- `calculate_radius()` - clearly performs a calculation
- `is_valid()` - clearly returns boolean
- `make_points()` - clearly generates data

**Searchability:**
- Easy to find all validation functions: search `is_`
- Easy to find all generators: search `make_`
- Consistent patterns aid navigation

**Alternatives considered:**
- ❌ Noun-based (`radius()`) - ambiguous (getter? creator? calculator?)
- ❌ Mixed styles - inconsistent, harder to predict

---

## Documentation Standards {#documentation}

### Why openscad_docsgen?

**Established standard:**
- Used by major libraries (BOSL2)
- Active development and support
- Good integration with GitHub/markdown

**Automatic generation:**
- Docs stay in code (single source of truth)
- Can't get out of sync
- Generates navigable references

**Format benefits:**
- Structured but not overly complex
- Human-readable in source
- Generates clean markdown

**Alternatives considered:**
- ❌ Plain comments - no structure, can't generate docs
- ❌ Custom format - reinventing the wheel
- ❌ JSDoc-style - not OpenSCAD-native, tooling doesn't exist

### Why Require Examples in Documentation?

**Examples teach better than descriptions:**
- Shows actual usage, not just syntax
- Reveals parameter relationships
- Tests that code works

**Self-validating:**
- Examples can be extracted and run as tests
- Documentation becomes executable
- openscad_docsgen can generate images from examples

**Example:**
```scad
// Without example - unclear usage
// Function: make_circle_points()
// Description: Generates circle points.

// With example - immediately clear
// Function: make_circle_points()
// Description: Generates circle points.
// Example:
//   points = make_circle_points(10, segments=32);
//   polygon(points);
```

### Why Require Includes Block?

**Documentation image generation:**
- openscad_docsgen needs the file path to generate example images
- Without it, examples won't render properly
- Relative path from project root is required

**Clarity:**
- Shows how to include the file
- Documents the file's location in project
- Helps users understand project structure

**Example:**
```scad
// File: geometry/circles.scad
// Includes:
//   include <mylib/src/geometry/circles.scad>
```

### Why Document Private Items Fully?

**Maintainability:**
- Future maintainers need to understand internal code
- Debugging is easier with documented internals
- Refactoring requires understanding dependencies

**Status: INTERNAL signals intent:**
- Clearly marks as non-public API
- Can be filtered from public documentation
- Warns users not to depend on it

**Consistency:**
- Same documentation format for all code
- No decision fatigue about "how much to document"
- Easier to review

**Example:**
```scad
// Function: _validate_plane()
// Status: INTERNAL
// Description:
//   Validates plane parameter against allowed values.
//   Raises assertion if invalid.
```

---

## File Organization {#file-organization}

### Why This Section Order?

**Top-to-bottom priority flow:**
1. Imports (needed by everything below)
2. Constants (needed by functions/modules)
3. Public functions (primary API)
4. Public modules (primary API)
5. Private helpers (implementation details at end)

**Rationale:**
- Public API visible first (most important for users)
- Private implementation details at end (for maintainers)
- No searching through private code to find public API
- Consistent across all files

### Why Public Before Private?

**API-first visibility:**
- Users see the public interface immediately
- Don't have to scroll past implementation details
- Clear separation between "what you use" and "how it works"

**Maintainability:**
- Public API is the contract
- Private can change freely
- Separation enforces this distinction

### Why Separate Functions from Modules?

**Clarity of purpose:**
- Functions return values (pure computation)
- Modules create geometry (side effects)
- Separation makes the distinction obvious

**Easier navigation:**
- "Where's that function?" → PUBLIC FUNCTIONS section
- "Where's that module?" → PUBLIC MODULES section
- No mixing of different types

**Better organization:**
- Functions can be ordered by dependency
- Modules can be ordered by usage
- Different types have different ordering logic

### Why No Examples in Source Files?

**Separation of concerns:**
- Source files define functionality
- Example files demonstrate usage
- Tests validate correctness

**File cleanliness:**
- Examples add noise to source
- Hard to find actual implementation
- Commented-out code is a maintenance burden

**Better organization:**
- `examples/` directory for demonstrations
- `tests/` directory for validation
- Source files stay focused

### Why 4-Space Indentation?

**Readability:**
- 2 spaces - too subtle, hard to see nesting
- 8 spaces / tabs - wastes horizontal space
- 4 spaces - clear nesting, reasonable width

**Consistency:**
- Common in many languages (Python default, Go-formatted code)
- Many editors default to 4
- Works well with OpenSCAD's nesting depth

**Note:** Tabs are ambiguous (everyone renders them differently)

### Why Line Length Limit?

**Readability:**
- Long lines require horizontal scrolling
- Hard to see on small screens
- Difficult to review in diff views

**Forces clarity:**
- Breaking long lines often reveals complexity
- Encourages extracting to variables
- Results in more readable code

**100 characters chosen:**
- Fits on most screens
- Allows side-by-side diffs
- Reasonable for descriptive names

---

## Project Structure {#project-structure}

### Why Makefile?

**Single command interface:**
- `make` builds entire project
- No remembering complex OpenSCAD commands
- Consistent across all projects
- Standard tool, works everywhere

**Automatic dependency tracking:**
- Only rebuilds changed files
- Saves time on large projects
- Detects when config.scad changes

**Integration with scripts:**
- Makefile orchestrates, scripts do the work
- Easier to maintain than complex Make syntax
- Can be tested independently
- Simpler path to Windows support (port scripts to Python/PowerShell)

**Standard targets:**
- `make` - build everything
- `make docs` - generate documentation
- `make test` - run tests
- `make clean` - remove generated files
- Everyone knows these conventions

### Why .openscad_docsgen_rc?

**Consistent documentation generation:**
- Same configuration across all contributors
- No command-line arguments to remember
- Documentation builds identically everywhere

**Version controlled:**
- Configuration checked into git
- Changes are tracked and reviewed
- Easy to replicate builds

**Project-specific settings:**
- Controls which files to document
- Sets processing order (PriorityPrefix)
- Configures output directory
- Automatically used by `make docs`

### Why deps/ Instead of lib/?

**Dependencies aren't always libraries:**
- May include tools (build helpers)
- May include utilities (scripts)
- May include data files (lookup tables)
- "deps" is more accurate and general

**Clarity of purpose:**
- Clearer that these are external, not your code
- Signals "managed separately"
- Matches common conventions (npm's node_modules, Go's vendor)

**Avoid confusion:**
- `lib/` might suggest part of your project
- `deps/` clearly means external dependencies
- Better mental model

### Why Separate scripts/ Directory?

**Easier to maintain:**
- Shell syntax is simpler than Make syntax
- Can use standard scripting patterns
- Easier to debug with `bash -x`

**Independent testing:**
- Can run scripts directly for testing
- Don't need make to test individual steps
- Easier to iterate during development

**Portability:**
- Simpler to port to other languages (Python, PowerShell)
- Can add platform detection in scripts
- Make just calls scripts, stays simple

**Focused concerns:**
- Makefile: dependency tracking and targets
- Scripts: actual build logic
- Each does one thing well

### Why build/ Directory (gitignored)?

**Reproducible from source:**
- Build artifacts can always be regenerated
- No need to version generated files
- Keeps git history clean

**Reduces conflicts:**
- Generated files change on every build
- Different machines generate slightly different files
- Leads to merge conflicts

**Clear separation:**
- `src/` and `models/` are source of truth
- `build/` is derived output
- Can delete build/ and recreate anytime

**Exception for releases:**
- May include STL files in release archives
- Users don't need to rebuild
- But not in git history

### Why docs/ for Both Generated and Hand-Written?

**Single documentation location:**
- Users look in one place for all docs
- No searching multiple directories
- Clear documentation home

**Separation within docs/:**
- `docs/api/` - generated (don't edit manually)
- `docs/*.md` - hand-written guides
- Clear which is which

**Regeneration is safe:**
- `make docs` regenerates docs/api/
- Hand-written docs stay untouched
- No risk of losing work

---

## Project vs Library Structure {#project-vs-library}

### Why Different Structures?

**Different goals:**
- Projects: Create specific things (hockey puck display)
- Libraries: Provide reusable tools (geometry functions)

**Different users:**
- Projects: You and collaborators
- Libraries: Other developers

**Different evolution:**
- Projects: Optimize for specific use case
- Libraries: Generalize for many uses

**Different documentation needs:**
- Projects: Assembly instructions, BOM
- Libraries: API reference, tutorials

### When to Use Which?

**Use project structure when:**
- Creating a specific physical object
- Design is the goal, not reusability
- Parameters are tuned to your needs
- You'll export STL files

**Use library structure when:**
- Creating reusable functions/modules
- Other projects will depend on it
- Abstraction is the goal
- You'll include it in other files

**Gray area:**
- Start as project
- Extract reusable parts to library later
- Don't over-engineer for reuse too early

---

## Design Principles

### Inspired by Go

**Why Go as reference?**
- Strong opinions on style (like we need)
- Values simplicity and clarity
- Excellent documentation culture
- Modern, well-established conventions

**Key borrowed principles:**
- Clear is better than clever
- Explicit is better than implicit
- Single obvious way to do things
- Documentation as code

**Not everything from Go:**
- We're not trying to make OpenSCAD into Go
- Use principles, not exact patterns
- Adapt to OpenSCAD's strengths

### Single Source of Truth

**Why avoid duplication?**
- Changes happen in one place
- Reduces maintenance burden
- Prevents inconsistencies
- Makes refactoring safer

**How we apply it:**
- Constants defined once, used everywhere
- Documentation in code, not separate files
- Templates instead of duplicated boilerplate

### Principle of Least Surprise

**Make common things easy:**
- Default parameters should be sensible
- Naming should be predictable
- File organization should be consistent

**Example:**
```scad
// Good - sensible defaults
module cylinder_default(r=10, h=20) { ... }

// Bad - forces override
module cylinder_default(r=0, h=0) { ... }
```

---

## Trade-offs and Alternatives

### What We Sacrificed

**Brevity for clarity:**
- Longer names: `calculate_radius` vs `calc_r`
- More structure: required documentation blocks
- More files: separated concerns

**Flexibility for consistency:**
- One naming convention (could allow multiple)
- Prescribed file structure (could be more flexible)
- Opinionated choices (could be more permissive)

**Why worth it:**
- Code is read 10x more than written
- Consistency reduces cognitive load
- Structure helps teams collaborate

### Alternative Approaches Considered

**More permissive guide:**
- Pro: Easier to adopt incrementally
- Con: Less consistency, more bike-shedding
- Decision: Be opinionated, allow exceptions when justified

**Tool-enforced style:**
- Pro: Automatic formatting, no debates
- Con: No good OpenSCAD formatter exists
- Decision: Document conventions, rely on code review

**Minimal guide:**
- Pro: Easier to remember, faster to read
- Con: Doesn't answer common questions
- Decision: Comprehensive reference, concise cheatsheet

---

## Evolution and Exceptions

### When to Break the Rules

**Good reasons:**
- External library requires different convention
- OpenSCAD limitation forces workaround
- Specific domain has established conventions (e.g., mathematical notation)
- Team agrees on specific exception

**Bad reasons:**
- "I don't like it"
- "My old code did it differently"
- "It's faster to type"
- "Nobody will notice"

### How This Guide Evolves

**Living document:**
- Conventions update based on experience
- New patterns emerge and get documented
- Outdated advice gets removed

**Change process:**
- Identify issue with current convention
- Propose alternative with rationale
- Discuss trade-offs
- Update if consensus reached
- Migrate existing code

**Stability:**
- Core conventions (naming, file structure) should be stable
- Specific patterns can evolve
- Breaking changes need strong justification

---

## Summary

Our conventions prioritize:
1. **Readability** - Code is communication
2. **Consistency** - Reduce cognitive load
3. **Maintainability** - Future-proof your code
4. **Practicality** - Use, don't debate

We choose established patterns over innovation because **consistency is more valuable than perfection**.

---

## Questions?

**"Why is X rule so strict?"**
- Strict rules prevent bike-shedding
- Consistency across files/projects
- Can always propose changes with rationale

**"Can I ignore rule X in my project?"**
- Personal projects: Your choice
- Team projects: Get team agreement
- Public libraries: Follow guide for ecosystem consistency

**"What if I disagree with rule X?"**
- Try it for a while (give it a fair chance)
- Document your concerns with examples
- Propose alternative with clear rationale
- Start discussion with maintainers

---

**Next:** See [Reference](../reference/) for quick lookup of conventions
