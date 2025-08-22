-- ============================
-- Helper Functions (from previous units)
-- ============================

-- A function to display the information for a single card.
function display_card(a_card)
  print(
    a_card.name .. " (Life: " .. a_card.life ..
    ", Attack: " .. a_card.attack .. ", Speed: " .. a_card.speed .. ")"
  )
end

-- A function that generates and returns a single, complete, random card table.
function generate_random_card()
  local new_card = {}
  local adjectives = { "Swift", "Stone", "Vengeful", "Cunning", "Ancient", "Shadow" }
  local nouns = { "Golem", "Elf", "Knight", "Stalker", "Drake", "Guardian" }
  new_card.name = adjectives[math.random(#adjectives)] .. " " .. nouns[math.random(#nouns)]
  
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
  
  return new_card
end

-- A function that takes a deck and returns the fastest card in it.
function find_fastest_card(a_deck)
  local fastest_card_so_far = a_deck[1]
  for _, card in ipairs(a_deck) do
    if card.speed > fastest_card_so_far.speed then
      fastest_card_so_far = card
    end
  end
  return fastest_card_so_far
end

-- ============================
-- Main Program: The First Clash!
-- ============================

-- Step 1: Setting the Stage
print("--- The Battle Begins! ---")
local player_hand = {}
local computer_hand = {}

for i = 1, 3 do
  table.insert(player_hand, generate_random_card())
  table.insert(computer_hand, generate_random_card())
end

print("Your hand:")
for _, card in ipairs(player_hand) do
  display_card(card)
end

print("\nComputer's hand:")
for _, card in ipairs(computer_hand) do
  display_card(card)
end

-- Step 2: The Initiative
local battlefield = {}
for _, card in ipairs(player_hand) do table.insert(battlefield, card) end
for _, card in ipairs(computer_hand) do table.insert(battlefield, card) end

local attacker = find_fastest_card(battlefield)
print("\n" .. attacker.name .. " has the highest speed and attacks first!")

-- Step 3: Whose Turn Is It?
local is_player_turn = false
for _, card in ipairs(player_hand) do
  if card == attacker then
    is_player_turn = true
  end
end

-- Step 4: The Attack!
local target -- Declare here so it can be used after the if/else block.

if is_player_turn == true then
  -- Player's Turn
  print("\nIt's your turn! Choose a target:")
  for index, card in ipairs(computer_hand) do
    print(index .. ": " .. card.name)
  end
  
  io.write("Enter target number (1-" .. #computer_hand .. "): ")
  local choice_text = io.read()
  local choice_num = tonumber(choice_text)
  target = computer_hand[choice_num]

else
  -- Computer's Turn
  print("\nIt's the computer's turn!")
  local choice_num = math.random(#player_hand)
  target = player_hand[choice_num]
  print("The computer targets " .. target.name .. "!")
end

-- Step 5: The Aftermath
target.life = target.life - attacker.attack
print(attacker.name .. " attacks " .. target.name .. ", dealing " .. attacker.attack .. " damage!")

if target.life <= 0 then
  print(target.name .. " has been defeated!")
else
  print(target.name .. " has " .. target.life .. " life remaining.")
end
