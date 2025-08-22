-- This file defines and displays my very first creature card using a table.

-- 1. Define the creature's attributes in a single table
local stone_golem = {
  name = "Stone Golem",
  life = 20,
  attack = 4,
  speed = 1,
}

-- 2. Display the card information using dot notation
print("--- My First Card ---")
print("Name: " .. stone_golem.name)
print("Life: " .. stone_golem.life)
print("Attack: " .. stone_golem.attack)
print("Speed: " .. stone_golem.speed)
