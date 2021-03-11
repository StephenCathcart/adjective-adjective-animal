# Ergonomic Seed

A tiny human-readable seed generator for Lua.

## Installation
The ergonomic_seed.lua file should be dropped into an existing project and required by it.

```lua
local ergonomic_seed = require("ergonomic_seed")
```

## Usage

```lua
local result = ergonomic_seed:generate()
print(result) -- abdominal-beneficial-aardvark
```

## Options

```lua
local result = ergonomic_seed:generate({
    seed=902,
    format='upper', -- lower, upper, capitalize
    delimiter='.',
    length=2,
    adjectives={'ablaze', 'binding'},
    nouns={'aardwolf', 'bandicoot'}
  })
  print(result) -- BINDING.AARDWOLF
```
