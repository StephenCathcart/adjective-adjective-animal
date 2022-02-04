# Ergonomic Seed

A tiny human-readable seed generator for Lua.

## Installation
The ergonomic_seed.lua file should be dropped into an existing project and required by it.

```lua
local ergonomic_seed = require("ergonomic_seed")
```

## Usage

```lua
local result, hash = ergonomic_seed:generate()
print(result, hash) -- zippy-seedy-scorpion  5473059125845893634
```

## Options

```lua
local result, hash = ergonomic_seed:generate({
    seed = 902,
    format = 'capitalize',
    delimiter = '',
    length = 2,
    adjectives = {'ablaze', 'binding'},
    nouns = {'aardwolf', 'bandicoot'}
})
print(result, hash) -- BindingAardwolf	-1709859011706699856
```

## Unit Tests

```bash
$ cd {workspace}
$ lua ergonomic_seed_test.lua 
.............
Ran 13 tests in 0.001 seconds, 13 successes, 0 failures
OK
```
