local ErgonomicSeed = {
  -- default pool of adjectives
  adjectives = { 'abdominal', 'beneficial', 'carping', 'Dejected', 'Elusive', 'Feisty', 'Gnomonic', 'Handsome', 'Illicit', 'Jokeless', 'Knightly', 'Legless', 'Macho', 'Nebulous', 'oozy', 'peachy', 'quaint', 'radical', 'seedy', 'thievish', 'uneasy', 'vague', 'wacky', 'xerophagous', 'yummy', 'zippy' },
  -- default pool of nouns
  nouns = { 'aardvark', 'boubou', 'caterpillar', 'dowitcher', 'elephant', 'finwhale', 'gazelle', 'hippopotamus', 'isopod', 'jellyfish', 'kestrel', 'ladybug', 'mantid', 'narwhale', 'orca', 'pheasant', 'quetzal', 'raptor', 'scorpion', 'tortoise', 'unicorn', 'vulture', 'wasp', 'xenopus', 'yeti', 'zebu' },
  -- default format of adjectives and nouns
  format = 'lower',
  -- default delimiter between adjectives and nouns
  delimiter = '-',
  -- default length of seed
  length = 3,
  -- ensure unique seed as os time has second granularity
  _seed_offset = 0,
  -- current version of library
  _version = '1.0.0'
}

local formats = {
  lower = function(str) return string.lower(str) end,
  upper = function(str) return string.upper(str) end,
  capitalize = function(str) return (str:gsub("^%l", string.upper)) end,
}

local function randomseed(seed, seed_offset)
  math.randomseed( seed or (os.time() + seed_offset) )
  return seed_offset + 1
end

local function generator(length, adjectives, nouns)
  local values = {}
  for i=1,length-1 do table.insert(values, adjectives[ math.random( #adjectives ) ]) end
  table.insert(values, nouns[ math.random( #nouns ) ])
  return values;
end

local function formatter(values, format)
  for key, value in pairs(values) do values[key] = (formats[format] or formats.lower)(value) end
  return values
end

-- Returns a random and reasonably unique human readable id.
-- @param options Override internal variables
function ErgonomicSeed:generate(options)
  options = options or {}
  self._seed_offset = randomseed(options.seed, self._seed_offset)
  return table.concat(
    formatter(
      generator(
        options.length or self.length,
        options.adjectives or self.adjectives,
        options.nouns or self.nouns
      ),
      options.format or self.format
    ),
    options.delimiter or self.delimiter)
end

return ErgonomicSeed