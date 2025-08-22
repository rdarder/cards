-- This is a SCRIPT file. It requires the toolbox and uses its tools to run the game.

local GameLogic = require("game_logic")

-- Helper function for this script to display a full hand.
function display_hand(title, hand)
    print(title)
    for _, card in ipairs(hand) do
        GameLogic.display_card(card) -- Uses the tool from our toolbox
    end
end

-- 1. Setup
local player_hand = {}
for i = 1, 3 do table.insert(player_hand, GameLogic.summon(GameLogic.generate_archetype())) end

local computer_hand = {}
for i = 1, 3 do table.insert(computer_hand, GameLogic.summon(GameLogic.generate_archetype())) end

print("--- The Battle Begins! ---")
display_hand("Your hand:", player_hand)
display_hand("Computer's hand:", computer_hand)

-- 2. Run the simulation
print("\n--- Running Grand Melee ---")
local final_state = GameLogic.run_round(player_hand, computer_hand)

-- 3. Show the results
print("\n--- Round Over ---")
-- ** FIX: Access results from the returned table **
display_hand("Your final hand:", final_state.player)
display_hand("Computer's final hand:", final_state.computer)
