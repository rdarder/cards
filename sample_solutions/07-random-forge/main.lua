-- ============================
-- Helper Functions (from previous unit)
-- ============================

-- A function to display the information for a single card.
function display_card(a_card)
  print(
    a_card.name .. " (Life: " .. a_card.life ..
    ", Attack: " .. a_card.attack .. ", Speed: " .. a_card.speed .. ")"
  )
end

-- ============================
-- The Card Forge
-- ============================

-- This function generates and returns a single, complete, random card table.
function generate_random_card()
  -- Step 1: Create a blank slate for our new card.
  local new_card = {}

  -- Step 2: Give the card a random name.
  local adjectives = { "Swift", "Stone", "Vengeful", "Cunning", "Ancient", "Shadow" }
  local nouns = { "Golem", "Elf", "Knight", "Stalker", "Drake", "Guardian" }

  local random_adjective = adjectives[math.random(#adjectives)]
  local random_noun = nouns[math.random(#nouns)]
  new_card.name = random_adjective .. " " .. random_noun

  -- Step 3: Generate balanced stats using a repeat...until loop.
  local life, attack, speed
  local max_stats = 20

  repeat
    life = math.random(1, 10)
    attack = math.random(1, 10)
    speed = math.random(1, 8)
  until (life + attack + speed) <= max_stats

  new_card.life = life
  new_card.attack = attack
  new_card.speed = speed

  -- Step 4: Return the finished card.
  return new_card
end


-- ============================
-- Main Program Logic
-- ============================

print("--- Forging a New Deck ---")

-- Create an empty table to hold our new deck.
local random_deck = {}
local deck_size = 12

-- Use a for loop to forge 12 new cards.
for i = 1, deck_size do
  -- Add a newly generated card to our deck at the correct index.
  random_deck[i] = generate_random_card()
end

-- Use a loop and our helper function to display the new deck.
for index, card in ipairs(random_deck) do
  display_card(card)
end
