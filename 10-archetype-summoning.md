## The Archetype & The Summoning Spell

-----

### The Story So Far...

You've built an incredible "Grand Melee"\! It's a full, chaotic battle where every card gets a turn, and the logic is smart enough to handle defeated cards correctly. The game feels more real than ever.

But what happens when the dust settles? A real game doesn't just end after one round. The survivors should get ready for the next fight. This brings up some fascinating new problems that will require some truly powerful magic to solve.

### The Mission: What We'll Accomplish Today

Our mission is to build the "post-battle" phase of our game. By the end of this unit, our program will not only run a full melee, but also:

1.  Provide a detailed "Damage Report" showing how much health each surviving card lost.
2.  Gather the surviving cards and prepare a new, fully-healed hand, ready for the next round.

-----

### Quest A: The Damage Report 🧾

Let's start by making our end-of-round report more interesting. Instead of just showing a survivor's remaining health, let's also show how much damage they took.

**The Problem:**
Wait, we have a problem. When a card is attacked, our code does this: `target.life = target.life - attacker.attack`. We are changing the `life` value directly. By the end of the round, the original health value is gone forever\! How can we possibly calculate the damage taken if we don't remember what the health was at the start?

**A New Tactic: Archetypes and Summoned Creatures**
To solve this, we need to think about our cards in a new way. Let's decide that from now on, there are two forms of every card:

  * **The Archetype:** This is the card's perfect, original essence. Its `life` value is its **maximum** health. Archetypes are like the master blueprints in a grand library—they are never changed or damaged.
  * **The Summoned Creature:** When a card is brought into a battle, it's a temporary, physical version of its archetype. This is the version that takes damage.

If we do this, we can always look at a damaged, summoned creature and compare it to its original archetype to see how much health it has lost. But that leads to the next question... how do we create a "Summoned Creature" from an "Archetype"?

**The Tool for Summoning: The `pairs()` Loop**
We need to make a copy. But writing `new_card.name = old_card.name`, `new_card.life = old_card.life`, etc., for every single stat is clumsy.

There's a better way. We can use a special loop called **`for ... in pairs()`** that automatically visits every key-value pair in a table, no matter what they're named. It's the perfect spell for inspecting every single item in a magic bag of holding. For each item, you get its label (`key`, e.g., "speed") and the item itself (`value`, e.g., 5).

**New Tool: The Master Key to Tables `[ ]`**
To use the `pairs` loop, we need to learn a secret about tables. You've been using dot notation like `card.name` to get values. It turns out, that's just a handy shortcut\!

The real, universal way to access a table is with **square brackets `[ ]`**. You can get any value by putting its key inside the brackets. The only difference is, if the key is text, it must be in quotes.
`card.name` is the exact same as `card["name"]`.

So why is this important? Because the value inside the `[]` can be a **variable**\! This is the magic we need for our summoning spell. The `key` variable from our `pairs` loop will hold a string like `"name"` one time and `"life"` the next. By writing `summoned_creature[key] = value`, we can copy every part of the card without having to know its name ahead of time.

**Let's build the `summon()` function\!**

1.  **Create the function:** `function summon(archetype_card) ... end`.
2.  **The Body:** Inside, create an empty table for the `summoned_creature`. Use a `for key, value in pairs(archetype_card) do ... end` loop. Inside the loop, copy each property using your new master key: `summoned_creature[key] = value`.
3.  **The Link:** After the loop, create the link back to the original: `summoned_creature.archetype = archetype_card`.
4.  **Return:** `return summoned_creature`.

**Now, update your game\!**

1.  Change your `cards.lua` or card generation list to be the "Codex of Archetypes."
2.  When you deal the `player_hand` and `computer_hand`, use your new `summon()` function to create summoned creatures for the battle.
3.  Run the Grand Melee logic.
4.  In the Aftermath step, for each `survivor`, calculate damage: `local damage_taken = survivor.archetype.life - survivor.life`.
5.  Print the new report: `print(survivor.name .. " survived with " .. survivor.life .. " HP (" .. damage_taken .. " damage taken).")`.

-----

### Quest B: Preparing for the Next Round ♻️

The battle is over, and the damage report is done. What's next? A new round\! But we can't send these damaged survivors back into the fight. We need fresh ones.

**The Problem:**
We have a list of survivors, but they are all battle-worn and damaged. How do we prepare a new hand of fully-healed creatures for the next round?

**The Solution:**
This is easy now\! Since each survivor has a "shortcut" back to its perfect archetype (`survivor.archetype`), we can simply use that archetype to summon a brand-new, fully-healed copy.

**The Task:**

1.  After the "Damage Report" is printed, create a new empty table, `player_hand_for_next_round`.
2.  Loop through the (damaged) `player_hand` from the battle.
3.  Inside the loop, for each `card` that survived (`card.life > 0`), summon a fresh copy from its archetype:
    ```lua
    -- Inside your loop over the survivors...
    local fresh_copy = summon(card.archetype)
    table.insert(player_hand_for_next_round, fresh_copy)
    ```
4.  After the loop, print the contents of `player_hand_for_next_round` using your `display_card` function.

**The Payoff:** You will see a list of only the surviving creatures, all restored to their maximum health, proving they are ready for another fight. This demonstrates the full, powerful lifecycle: **Archetype -\> Summon -\> Damage -\> Use Archetype to Re-Summon**.
