-- This file defines all the individual creature cards for the game.

local stone_golem = {
  name = "Stone Golem",
  life = 20,
  attack = 4,
  speed = 1,
}

local swift_elf = {
  name = "Swift Elf",
  life = 8,
  attack = 3,
  speed = 5,
}

local shadow_stalker = {
  name = "Shadow Stalker",
  life = 12,
  attack = 6,
  speed = 4,
}

-- Put all the cards into a single list to be used by the main game.
local all_cards = { stone_golem, swift_elf, shadow_stalker }

-- Return the list of cards so other files can use it.
return all_cards
