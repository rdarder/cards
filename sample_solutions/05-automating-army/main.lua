-- Load the deck of cards from the cards.lua file.
local deck = require("cards")

print("--- The Full Deck ---")
-- === Quest Part A: Display the Whole Deck ===
-- Use an ipairs loop to go through every card in the deck.
for index, card in ipairs(deck) do
  -- For each card, print its details on one line.
  print(
    "Card #" .. index .. ": " .. card.name ..
    " (Life: " .. card.life .. ", Attack: " .. card.attack .. ", Speed: " .. card.speed .. ")"
  )
end
print("---------------------") -- separator

-- === Quest Part B: The Ultimate Speed Trial ===
-- Start by assuming the first card is the fastest one.
local fastest_card_so_far = deck[1]

-- Loop through every card in the deck to find the true fastest.
for index, card in ipairs(deck) do
  -- Compare the current card's speed to our fastest-known speed.
  if card.speed > fastest_card_so_far.speed then
    -- If this card is faster, it becomes the new fastest.
    fastest_card_so_far = card
  end
end

-- After checking all the cards, print the name of the winning card.
print("The fastest card is: " .. fastest_card_so_far.name)
print("---------------------") -- separator

-- === Side Quest: The Barbarian's Rage ===
print("The Barbarian rages!")
-- Use a numeric for loop to repeat an action 5 times.
for i = 1, 5 do
  print("Smash!")
end
