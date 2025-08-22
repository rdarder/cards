-- This is our "Toolbox" Module.
-- It contains all our game logic functions, ready to be used by other scripts.

local GameLogic = {}

-- A function to display a card's info.
-- As per the new rule, it's okay for a function in a module to print.
function GameLogic.display_card(card)
  local status = ""
  if card.life <= 0 then
    status = " (DEFEATED)"
  end
  print(
    "- " .. card.name .. " (Life: " .. card.life ..
    ", Attack: " .. card.attack .. ", Speed: " .. card.speed .. ")" .. status
  )
end

-- Generates a single card blueprint.
function GameLogic.generate_archetype()
  local archetype = {}
  local adjectives = { "Swift", "Stone", "Vengeful", "Cunning" }
  local nouns = { "Golem", "Elf", "Knight", "Stalker" }
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

-- Creates a damageable copy from an Archetype.
function GameLogic.summon(archetype_card)
  local summoned_creature = {}
  for key, value in pairs(archetype_card) do
    summoned_creature[key] = value
  end
  summoned_creature.archetype = archetype_card
  return summoned_creature
end

-- The core attack logic.
function GameLogic.attack(attacker, target)
  target.life = target.life - attacker.attack
end

-- The entire Grand Melee logic.
function GameLogic.run_round(player_hand, computer_hand)
  local battlefield = {}
  for _, card in ipairs(player_hand) do table.insert(battlefield, { card = card, owner = "player", has_attacked = false }) end
  for _, card in ipairs(computer_hand) do table.insert(battlefield, { card = card, owner = "computer", has_attacked = false }) end

  for turn_number = 1, #battlefield do
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
      local opponent_hand = (next_attacker_info.owner == "player") and computer_hand or player_hand
      
      local valid_targets = {}
      for _, card in ipairs(opponent_hand) do if card.life > 0 then table.insert(valid_targets, card) end end

      if #valid_targets > 0 then
        local target_card
        if next_attacker_info.owner == "player" then
          target_card = valid_targets[1] -- Simulated player attacks first valid target
        else
          target_card = valid_targets[math.random(#valid_targets)] -- Computer attacks a random valid target
        end
        GameLogic.attack(attacker_card, target_card)
      end
      next_attacker_info.has_attacked = true
    end
  end
  
  -- ** FIX: Return a single table containing the final results **
  return { player = player_hand, computer = computer_hand }
end

-- At the very end, return the finished toolbox.
return GameLogic
