-- ============================
-- Helper Functions (from previous units)
-- ============================

-- A function to display the information for a single card.
function display_card(a_card)
  -- A small update to show if a card is defeated
  local status = ""
  if a_card.life <= 0 then
    status = " (DEFEATED)"
  end
  print(
    a_card.name .. " (Life: " .. a_card.life ..
    ", Attack: " .. a_card.attack .. ", Speed: " .. a_card.speed .. ")" .. status
  )
end

-- A function that generates and returns a single, complete, random card table.
function generate_random_card()
  local new_card = {}
  local adjectives = { "Swift", "Stone", "Vengeful", "Cunning", "Ancient", "Shadow" }
  local nouns = { "Golem", "Elf", "Knight", "Stalker", "Drake", "Guardian" }
  new_card.name = adjectives[math.random(#adjectives)] .. " " .. nouns[math.random(#nouns)]
  
  local life, attack, speed
  local max_stats = 25 -- Slightly higher for more variety
  repeat
    life = math.random(5, 12)
    attack = math.random(2, 8)
    speed = math.random(1, 10)
  until (life + attack + speed) <= max_stats
  
  new_card.life = life
  new_card.attack = attack
  new_card.speed = speed
  
  return new_card
end

-- ============================
-- Main Program: The Grand Melee!
-- ============================

-- Step 1: Setup
print("--- The Grand Melee Begins! ---")
local player_hand = {}
local computer_hand = {}
for i = 1, 3 do
  table.insert(player_hand, generate_random_card())
  table.insert(computer_hand, generate_random_card())
end

print("Your hand:")
for _, card in ipairs(player_hand) do display_card(card) end
print("\nComputer's hand:")
for _, card in ipairs(computer_hand) do display_card(card) end

-- Step 2: Create the Battlefield List
local battlefield = {}
for _, card in ipairs(player_hand) do
  table.insert(battlefield, { card = card, owner = "player", has_attacked = false })
end
for _, card in ipairs(computer_hand) do
  table.insert(battlefield, { card = card, owner = "computer", has_attacked = false })
end

-- Step 3: The Main Loop (6 turns in the round)
for turn_number = 1, 6 do
  print("\n--- Turn " .. turn_number .. " ---")

  -- A. Find the Next Attacker
  local next_attacker_info = nil
  local highest_speed = -1
  
  for _, info in ipairs(battlefield) do
    if info.card.life > 0 and info.has_attacked == false and info.card.speed > highest_speed then
      highest_speed = info.card.speed
      next_attacker_info = info
    end
  end

  -- B. The Attack Sequence
  if next_attacker_info then
    local attacker_card = next_attacker_info.card
    print(attacker_card.name .. " prepares to attack!")

    -- Determine and Filter Targets
    local opponent_hand
    if next_attacker_info.owner == "player" then
      opponent_hand = computer_hand
    else
      opponent_hand = player_hand
    end
    
    local valid_targets = {}
    for _, card in ipairs(opponent_hand) do
      if card.life > 0 then
        table.insert(valid_targets, card)
      end
    end

    -- Perform the Attack if there are valid targets
    if #valid_targets > 0 then
      local target_card
      if next_attacker_info.owner == "player" then
        print("Choose a target:")
        for i, card in ipairs(valid_targets) do print(i .. ": " .. card.name) end
        io.write("Enter target number: ")
        local choice = tonumber(io.read())
        target_card = valid_targets[choice]
      else
        local choice = math.random(#valid_targets)
        target_card = valid_targets[choice]
        print("The computer targets " .. target_card.name .. "!")
      end

      -- Calculate damage
      target_card.life = target_card.life - attacker_card.attack
      print(attacker_card.name .. " attacks " .. target_card.name .. ", dealing " .. attacker_card.attack .. " damage!")

    else
      print(attacker_card.name .. " has no valid targets!")
    end
    
    -- Update State: Mark this card as having attacked
    next_attacker_info.has_attacked = true

  else
    print("No more cards can act this round.")
    -- break -- This would exit the loop early, but we haven't learned it yet.
  end
end

-- Step 4: The Aftermath
print("\n--- Round Over ---")
print("Final board status:")
print("\nYour hand:")
for _, card in ipairs(player_hand) do display_card(card) end
print("\nComputer's hand:")
for _, card in ipairs(computer_hand) do display_card(card) end
