## The Random Card Forge 🏭

-----

### The Story So Far...

You've mastered creating reusable spells with functions\! Your code is clean, organized, and powerful. But you still have to write out every single card by hand. This is slow, and it makes your game predictable.

What if your game could create new, surprising cards *on its own*, every time you play? Today, we're building the heart of the game factory: a function that forges brand-new, random cards from scratch.

### The Mission: What We'll Accomplish Today

Our mission is to build a single, powerful function: `generate_random_card()`. When we call this function, it will create and return a complete, unique, and balanced card table.

The generated card will have:

1.  A random name, created by combining adjectives and nouns (e.g., "Vengeful Knight").
2.  Random stats for life, attack, and speed.
3.  **Balanced Stats:** The card will obey a special rule: the sum of its life, attack, and speed must not be greater than a set number (e.g., 20).

### The Spellbook: New Tools We'll Learn

**1. `math.random()` (The Dice Roll) 🎲**

Lua has a built-in library of math tools called `math`. One of its most fun tools is `random()`, which works like rolling dice.

  * `math.random(max)`: Gives you a random whole number between 1 and `max`.
  * `math.random(min, max)`: Gives you a random whole number between `min` and `max`.

**2. Adding to a List: `table.insert()`**

For our final quest, we'll need to start with an empty deck and add new cards to it. Lua gives us a special, clean spell for this: `table.insert`. This function takes two arguments: first the table you want to add to, and second the item you want to add. It automatically puts the new item at the very end of the list.

```lua
local my_deck = {} -- an empty deck
local goblin_card = { name = "Goblin" }
local elf_card = { name = "Elf" }

-- Add the goblin card to the deck.
table.insert(my_deck, goblin_card) -- The deck is now { goblin_card }

-- Add the elf card. It goes to the end.
table.insert(my_deck, elf_card)    -- The deck is now { goblin_card, elf_card }
```

Lua has many of these helpful built-in functions for tables, strings, and more. As you get more curious, you can search online for "Lua table library" to see what other tools are in your spellbook\!

**3. The `repeat...until` Loop (The Persistent Spell)**

You've mastered the `for` loop, which runs a *known* number of times. A **`repeat...until` loop** is for when you need to do something *at least once*, and then keep doing it until a specific condition is met.

**Analogy:** A blacksmith forging a balanced sword.

1.  "**Repeat** the following steps..."
2.  "Forge the sword. Hammer it out. Cool it in water."
3.  "...**until** the sword is perfectly balanced."

The code inside the loop always runs once, then the condition is checked at the end.

-----

### Your Quest: The Grand Forging

We will build our `generate_random_card()` function step-by-step.

**Step 1: The Blueprint & A New Technique**

First, create the basic shell for our function.

```lua
function generate_random_card()
  -- We'll add more here!
end
```

Inside this function, we'll use a new technique: **building a table piece by piece.**

1.  **Create an empty table:** `local new_card = {}`
2.  **Add fields later:** `new_card.name = "Temporary Name"`

We'll start with an empty `new_card` table and add the random `name`, `life`, `attack`, and `speed` to it one by one.

-----

**Step 2: The Naming Ceremony**

Let's start building our card.

1.  Inside your function, create the empty `new_card` table.
2.  Create two lists: one with adjectives, one with nouns.
3.  Use the `math.random` pattern to pick one word from each list and combine them.
4.  Add the new name to your table using `new_card.name = ...`.

> **A Quick Detour: Nested vs. Step-by-Step**
> **The Step-by-Step Way (easier to read):**
>
> ```lua
> local total_adjectives = #adjectives
> local random_index = math.random(total_adjectives)
> local random_adjective = adjectives[random_index]
> ```
>
> **The Nested Way (a compact shortcut):**
>
> ```lua
> local random_adjective = adjectives[math.random(#adjectives)]
> ```
>
> Both ways work the same\! You can choose whichever makes more sense to you.

-----

**Step 3: The Balancing Act**

Now for the stats. We'll use our new `repeat...until` loop to make sure they are balanced.

1.  Inside your function, declare local variables for `life`, `attack`, and `speed`.
2.  Create a `repeat...until` loop.
3.  Inside the loop, generate a random number for `life`, `attack`, and `speed`. Let's say between 1 and 10 for each.
4.  The `until` condition should check if the sum of the stats is less than or equal to your maximum (e.g., 20).
5.  After the loop finishes, you are guaranteed to have balanced stats. Add them to the `new_card` table.

<!-- end list -->

```lua
-- This part goes inside your generate_random_card function
local life, attack, speed
local max_stats = 20

-- A quick word: The Value of Nothing (nil)
-- Notice we wrote `local life, attack, speed` without giving them a value. 
-- Before the loop starts, these variables hold a special value called `nil`. 
-- Think of `nil` as meaning "empty" or "nothing yet". 
-- It's not the number `0` and it's not an empty string `""`—it's just pure nothingness.

repeat
  life = math.random(1, 10)
  attack = math.random(1, 10)
  speed = math.random(1, 8) -- Maybe speed is rarer
until life + attack + speed <= max_stats

new_card.life = life
new_card.attack = attack
new_card.speed = speed
```

-----

**Step 4: The Final Product**

At the very end of your function, after you've added the name and all the stats, make sure you return the finished product.

```lua
function generate_random_card()
  local new_card = {}
  -- ... all the name and stat generation code goes here ...
  return new_card -- Send the finished card out!
end
```

Now, use your completed function to forge a whole deck\!

1.  Create an empty table for your new deck: `local random_deck = {}`.
2.  Write a numeric `for` loop that runs, say, 12 times.
3.  Inside the loop, call `generate_random_card()` and use **`table.insert()`** to add the returned card to your `random_deck`.
4.  Use your `display_card()` function from the last unit to print out your brand-new, completely unique deck\!

### The Troubleshooting Scroll

  * **My program freezes and never finishes\!**
      * **Meaning:** You probably have an **infinite loop**. Your `repeat...until` loop's condition is never becoming true.
      * **Check:** Is your rule possible to achieve? If you generate stats from 10-20, their sum can *never* be less than 20. Make sure your `max_stats` value is high enough for the random numbers you are generating\!
  * **Error: `bad argument #2 to 'random' (interval is empty)`**
      * **Meaning:** You tried to do `math.random(min, max)` where `min` is larger than `max`.
      * **Check:** Make sure the first number in `math.random(min, max)` is always smaller than or equal to the second.
  * **Error: `bad argument #1 to 'insert' (table expected, got nil)`**
      * **Meaning:** The first thing you gave to `table.insert` was not a table.
      * **Check:** Did you spell your deck's variable name correctly? The correct format is `table.insert(your_deck_variable, your_card_variable)`.
