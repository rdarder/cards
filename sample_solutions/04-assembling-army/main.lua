-- Load the deck of cards from the cards.lua file.
local deck = require("cards")

-- === Main Quest ===
-- Print the name of the second card in the deck.
print("The second card's name is: " .. deck[2].name)

-- Print the total number of cards in the deck.
print("Total cards in deck: " .. #deck)
print("---") -- separator for clarity

-- === Side Quest 2: The Speed Trial ===
-- Start by assuming the first card is the fastest one.
local fastest_card_so_far = deck[1]

-- Compare the current fastest card to the second card in the deck.
if deck[2].speed > fastest_card_so_far.speed then
  -- If the second card is faster, it becomes the new fastest.
  fastest_card_so_far = deck[2]
end

-- Compare the current fastest card to the third card in the deck.
if deck[3].speed > fastest_card_so_far.speed then
  -- If the third card is faster, it becomes the new fastest.
  fastest_card_so_far = deck[3]
end

-- After all checks, print the name of the winning card.
print("The fastest card is: " .. fastest_card_so_far.name)
