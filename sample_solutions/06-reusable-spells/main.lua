-- ============================
-- Function Definitions (My Spellbook)
-- ============================

-- A function to display the information for a single card.
function display_card(a_card)
  print(
    a_card.name .. " (Life: " .. a_card.life ..
    ", Attack: " .. a_card.attack .. ", Speed: " .. a_card.speed .. ")"
  )
end

-- A function that takes a deck and returns the fastest card in it.
function find_fastest_card(a_deck)
  -- The function assumes the deck is not empty.
  local fastest_card_so_far = a_deck[1]

  for _, card in ipairs(a_deck) do
    if card.speed > fastest_card_so_far.speed then
      fastest_card_so_far = card
    end
  end

  -- Hand the winning card back to whatever code called this function.
  return fastest_card_so_far
end


-- ============================
-- Main Program Logic
-- ============================

-- Load the master list of all cards.
local all_cards = require("cards")

-- Create two smaller, different decks for the players.
local player_deck = { all_cards[1], all_cards[3] }
local computer_deck = { all_cards[2], all_cards[4] }

-- Display the contents of both decks using our new function.
print("--- Player's Deck ---")
for _, card in ipairs(player_deck) do
  display_card(card)
end

print("--- Computer's Deck ---")
for _, card in ipairs(computer_deck) do
  display_card(card)
end

-- Use our seeker spell to find the fastest card in each deck.
local fastest_in_player_deck = find_fastest_card(player_deck)
local fastest_in_computer_deck = find_fastest_card(computer_deck)

-- Display the results of our analysis.
print("--- Battle Analysis ---")
print("Player's fastest card is: " .. fastest_in_player_deck.name)
print("Computer's fastest card is: " .. fastest_in_computer_deck.name)
