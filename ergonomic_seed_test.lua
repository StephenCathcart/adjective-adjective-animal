local t = require("modules.testing.luaunit")
local ergonomic_seed = require("ergonomic_seed")

TestErgonomicSeed = {}

function TestErgonomicSeed:test_valid_version()
  t.assertIsString(ergonomic_seed._version)
end

function TestErgonomicSeed:test_valid_seed_offset()
  t.assertIsNumber(ergonomic_seed._seed_offset)
end

function TestErgonomicSeed:test_default_generate()
  local actual1 = ergonomic_seed:generate()
  local actual2 = ergonomic_seed:generate()
  t.assertIsString(actual1)
  t.assertIsString(actual2)
  t.assertNotEquals(actual1, actual2)
end

function TestErgonomicSeed:test_same_seed_generate()
  local expected = 'beneficial-illicit-ladybug'
  t.assertEquals(ergonomic_seed:generate({seed=0}), expected)
  t.assertEquals(ergonomic_seed:generate({seed=0}), expected)
end

function TestErgonomicSeed:test_different_seed_generate()
  t.assertEquals(ergonomic_seed:generate({seed=0}), 'beneficial-illicit-ladybug')
  t.assertEquals(ergonomic_seed:generate({seed=1}), 'handsome-beneficial-xenopus')
end

function TestErgonomicSeed:test_format_generate()
  t.assertEquals(ergonomic_seed:generate({seed=0, format='lower'}), 'beneficial-illicit-ladybug')
  t.assertEquals(ergonomic_seed:generate({seed=0, format='upper'}), 'BENEFICIAL-ILLICIT-LADYBUG')
  t.assertEquals(ergonomic_seed:generate({seed=0, format='capitalize'}), 'Beneficial-Illicit-Ladybug')
end

function TestErgonomicSeed:test_delimiter_generate()
  t.assertEquals(ergonomic_seed:generate({seed=0, delimiter=''}), 'beneficialillicitladybug')
  t.assertEquals(ergonomic_seed:generate({seed=0, delimiter='.'}), 'beneficial.illicit.ladybug')
  t.assertEquals(ergonomic_seed:generate({seed=0, delimiter='++'}), 'beneficial++illicit++ladybug')
end

function TestErgonomicSeed:test_length_generate()
  t.assertEquals(ergonomic_seed:generate({seed=0, length=1}), 'boubou')
  t.assertEquals(ergonomic_seed:generate({seed=0, length=2}), 'beneficial-isopod')
  t.assertEquals(ergonomic_seed:generate({seed=0, length=3}), 'beneficial-illicit-ladybug')
  t.assertEquals(ergonomic_seed:generate({seed=0, length=4}), 'beneficial-illicit-legless-vulture')
end

function TestErgonomicSeed:test_adjectives_generate()
  t.assertEquals(ergonomic_seed:generate({seed=0, adjectives={'ablaze', 'binding'}}), 'binding-ablaze-ladybug')
end

function TestErgonomicSeed:test_nouns_generate()
  t.assertEquals(ergonomic_seed:generate({seed=0, nouns={'aardwolf', 'bandicoot'}}), 'beneficial-illicit-bandicoot')
end

function TestErgonomicSeed:test_all_generate()
  t.assertEquals(ergonomic_seed:generate({
    seed=902,
    format='capitalize',
    delimiter='',
    length=2,
    adjectives={'ablaze', 'binding'},
    nouns={'aardwolf', 'bandicoot'}
  }), 'BindingAardwolf')
end

os.exit(t.LuaUnit.run())