-- ============================
-- Helper Functions
-- ============================

-- A function to display the information for a single card.
function display_card(a_card)
  local status = ""
  if a_card.life <= 0 then
    status = " (DEFEATED)"
  -- Check if it's a summoned creature with an archetype to show max health
  elseif a_card.archetype then
    status = " / " .. a_card.archetype.life .. " HP"
  end
  print(
    a_card.name .. " (Life: " .. a_card.life ..
    ", Attack: " .. a_card.attack .. ", Speed: " .. a_card.speed .. ")" .. status
  )
end

-- Generates a single, unchangeable card blueprint (an Archetype).
function generate_archetype()
  local archetype = {}
  local adjectives = { "Swift", "Stone", "Vengeful", "Cunning", "Ancient", "Shadow" }
  local nouns = { "Golem", "Elf", "Knight", "Stalker", "Drake", "Guardian" }
  archetype.name = adjectives[math.random(#adjectives)] .. " " .. nouns[math.random(#nouns)]
  
  local life, attack, speed
  local max_stats = 25
  repeat
    life = math.random(5, 12)
    attack = math.random(2, 8)
    speed = math.random(1, 10)
  until (life + attack + speed) <= max_stats
  
  archetype.life = life
  archetype.attack = attack
  archetype.speed = speed
  
  return archetype
end

-- Creates a temporary, damageable copy (a Summoned Creature) from an Archetype.
function summon(archetype_card)
  local summoned_creature = {}
  -- Use pairs() to copy every key and value from the archetype.
  for key, value in pairs(archetype_card) do
    summoned_creature[key] = value
  end
  -- Create the link back to the original blueprint.
  summoned_creature.archetype = archetype_card
  return summoned_creature
end

-- ============================
-- Main Program Logic
-- ============================

-- 1. SETUP: Create archetypes and summon creatures for the hands.
local codex_of_archetypes = {}
for i = 1, 6 do
  table.insert(codex_of_archetypes, generate_archetype())
end

local player_hand = {}
local computer_hand = {}
-- Summon the first 3 for the player, the next 3 for the computer.
for i = 1, 3 do
  table.insert(player_hand, summon(codex_of_archetypes[i]))
  table.insert(computer_hand, summon(codex_of_archetypes[i+3]))
end

print("--- The Battle Begins! ---")
print("Your hand:")
for _, card in ipairs(player_hand) do display_card(card) end
print("\nComputer's hand:")
for _, card in ipairs(computer_hand) do display_card(card) end

-- 2. GRAND MELEE: The battle logic from the previous unit.
local battlefield = {}
for _, card in ipairs(player_hand) do
  table.insert(battlefield, { card = card, owner = "player", has_attacked = false })
end
for _, card in ipairs(computer_hand) do
  table.insert(battlefield, { card = card, owner = "computer", has_attacked = false })
end

for turn_number = 1, 6 do
  local next_attacker_info = nil
  local highest_speed = -1
  for _, info in ipairs(battlefield) do
    if info.card.life > 0 and info.has_attacked == false and info.card.speed > highest_speed then
      highest_speed = info.card.speed
      next_attacker_info = info
    end
  end

  if next_attacker_info then
    local attacker_card = next_attacker_info.card
    local opponent_hand
    if next_attacker_info.owner == "player" then
      opponent_hand = computer_hand
    else
      opponent_hand = player_hand
    end
    
    local valid_targets = {}
    for _, card in ipairs(opponent_hand) do if card.life > 0 then table.insert(valid_targets, card) end end

    if #valid_targets > 0 then
      local target_card
      if next_attacker_info.owner == "player" then
        -- Player turn is simplified for this example
        target_card = valid_targets[1]
      else
        target_card = valid_targets[math.random(#valid_targets)]
      end
      target_card.life = target_card.life - attacker_card.attack
      print(attacker_card.name .. " attacks " .. target_card.name .. ", dealing " .. attacker_card.attack .. " damage!")
    end
    next_attacker_info.has_attacked = true
  end
end

-- 3. AFTERMATH (QUEST A & B)
print("\n--- Round Over! ---")

-- Quest A: The Damage Report
print("\n--- Damage Report ---")
for _, card in ipairs(player_hand) do
  if card.life > 0 then
    local damage_taken = card.archetype.life - card.life
    print(card.name .. " survived with " .. card.life .. " HP (" .. damage_taken .. " damage taken).")
  end
end
for _, card in ipairs(computer_hand) do
  if card.life > 0 then
    local damage_taken = card.archetype.life - card.life
    print(card.name .. " survived with " .. card.life .. " HP (" .. damage_taken .. " damage taken).")
  end
end

-- Quest B: Preparing for the Next Round
print("\n--- Preparing Next Round's Hand ---")
local player_hand_for_next_round = {}
for _, card in ipairs(player_hand) do
  if card.life > 0 then
    -- For each survivor, summon a fresh, fully-healed copy from its archetype.
    local fresh_copy = summon(card.archetype)
    table.insert(player_hand_for_next_round, fresh_copy)
  end
end

print("Your surviving cards are healed and ready for the next battle:")
for _, card in ipairs(player_hand_for_next_round) do
  display_card(card)
end
