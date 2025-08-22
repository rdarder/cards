-- This is a SCRIPT file for testing our toolbox.

local GameLogic = require("game_logic")

-- Quest A: The Single-Strike Test
print("Running single-strike test...")
local knight = { name = "Test Knight", attack = 7, life = 20 }
local goblin = { name = "Test Goblin", attack = 3, life = 10 }
GameLogic.attack(knight, goblin)
assert(goblin.life == 3, "Single-strike test failed: Goblin's final health was not 3!")
print("Single-strike test passed!")

-- Quest B: The Full Melee Simulation
print("\nRunning full melee simulation test...")
local p_hand = {
  { name="Player Hero", life=20, attack=5, speed=10 }
}
local c_hand = {
  { name="Computer Minion", life=12, attack=3, speed=5 },
  { name="Computer Brute", life=18, attack=4, speed=2 }
}

-- Execute the simulation.
local final_state = GameLogic.run_round(p_hand, c_hand)

-- ** FIX: Assert the final state by accessing the returned table **
assert(final_state.player[1].life == 13, "Player Hero failed health check. Expected 13.")
assert(final_state.computer[1].life == 7, "Computer Minion failed health check. Expected 7.")
assert(final_state.computer[2].life == 18, "Computer Brute should not have been attacked.")
print("Full melee simulation passed!")
