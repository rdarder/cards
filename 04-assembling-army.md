## Assembling Your Army

-----

### The Story So Far...

You've successfully crafted the "soul" of a single creature, storing all its stats neatly in one table. Your code is clean and organized. But a master summoner never relies on a single creature; they command an army\! It's time to go from one card to a full deck.

### The Mission: What We'll Accomplish Today

Our main goal is to create a deck of cards. By the end, we'll have a program that defines several different cards and bundles them into a single "deck" variable. We'll also take on some challenging side quests to make our code even more powerful.

### The Spellbook: New Tools We'll Learn

**1. Tables as Lists (The Card Box)**

We're going to use our trusty `table` tool in a new way. Instead of using named keys like `name = "..."`, we're just going to put our finished card-tables into a list, separated by commas. Think of it like putting your individual cards into a deck box.

First, we define our individual cards, just like in the previous unit:

```lua
local goblin = { name = "Goblin Grunt", life = 5, speed = 3, attack = 2 }
local golem = { name = "Stone Golem", life = 10, speed = 1, attack = 1 }
local elf = { name = "Swift Elf", life = 3, speed = 5, attack = 3 }

-- Now, we put them all into one "deck" table!
local deck = { goblin, golem, elf }
```

**2. A Crucial Concept: Variables are Pointers**

When we write `local deck = { goblin, golem, elf }`, something very important is happening. We are **not** making copies of our cards. To understand this, you need to know one of the most important ideas in programming.

Think of variables as **names that point to things**.

**Analogy:** Imagine you create a table for your goblin. This is like a real, physical goblin creature that now exists in your computer's memory 👹. The variable `goblin` isn't the creature itself; it's just a **name tag** you've stuck on it.

  * When you create your deck with `local deck = { goblin }`, you're not putting a *clone* of the goblin in the deck. You're simply adding a *new name tag*, `deck[1]`, that also points to that **one original goblin**.
  * Now, both the name `goblin` and the name `deck[1]` point to the **exact same creature table**.
  * If you were to change the goblin using one name (e.g., `goblin.life = 4`), the change would be visible through the other name (`deck[1].life` would now also be `4`). This is because you changed the *actual thing*, not just one of its name tags.

This is a super powerful idea that we will use a lot later\!

**3. Accessing by Index (Picking a Card)**

How do you get the second card from the deck? You can't use a dot because there's no name. Instead, we use a number in **square brackets `[ ]`**. This number is called the **index**.

**Important:** In Lua, the first item is at index **1**.

```lua
-- Get the second card from the deck (the golem)
local second_card = deck[2]

-- Now we can use dot notation on the card we picked!
print("The second card's name is: " .. second_card.name) -- Prints "Stone Golem"
```

**4. The Length Operator (Counting Your Cards)**

Need to know how many cards are in your deck? Just put a hashtag `#` in front of the table's name.

```lua
print("There are " .. #deck .. " cards in the deck.") -- Prints "3"
```

**5. Conditionals: `if/then` (Making a Choice)**

To make our program interesting, it needs to make decisions. The **`if` statement** is our tool for this. It checks if a condition is `true`, and if it is, it runs a block of code.

**Analogy:** You look outside and ask a question: "Is it raining?" **If** the answer is yes, **then** you grab an umbrella.

```lua
local player_score = 250
local high_score = 200

if player_score > high_score then
  print("You got a new high score!")
end
-- The code inside only runs because player_score > high_score is true.
```

The `condition` is a question that can be answered with `true` or `false`, like `speed > 5` or `life <= 0`. We'll need this for our next quest.

-----

### Your Quest: Assemble the Deck\!

First, let's get the main part done.

**Instructions:**

1.  In your `main.lua` file, create at least three different creature cards as table variables (like `goblin`, `golem`, `elf`, etc.). Give them unique names and stats.
2.  Create one final table called `deck` and place your card variables inside it, just like the example.
3.  Use `print()` and the index `[ ]` syntax to display the name of the *second* card in your deck.
4.  Use `print()` and the `#` operator to display the total number of cards in the deck.

-----

### Side Quest 1: A Separate Spellbook 📜

Your main file is going to get crowded if you define every single card there. Let's move them to their own file\!

**Instructions:**

1.  Create a **new file** in the same folder and name it `cards.lua`.
2.  **Cut** your card definitions from `main.lua` and **paste** them into `cards.lua`.
3.  In `cards.lua`, create a master list of all your cards. At the very end of the file, **return** that list. Your `cards.lua` should look like this:

    ```lua
    -- cards.lua
    local goblin = { name = "Goblin Grunt", life = 5, speed = 3, attack = 2 }
    local golem = { name = "Stone Golem", life = 10, speed = 1, attack = 1 }
    local elf = { name = "Swift Elf", life = 3, speed = 5, attack = 3 }
    local all_cards = { goblin, golem, elf }
    return all_cards
    ```

4.  Now, go back to your **`main.lua`** file. Use a new spell called **`require`** to load the file and get the table it `return`ed.

    ```lua
    -- main.lua
    local deck = require("cards")
    print("Successfully loaded " .. #deck .. " cards!")
    print("The first card is: " .. deck[1].name)
    ```

-----

### Side Quest 2: The Speed Trial 💨

Now for a real challenge. Your program needs to figure out which card in the deck is the fastest. To solve this, we need a variable that can change its mind. We'll need a variable to keep track of the "fastest card found so far," and we'll have to *update* it every time we find an even faster one. This brings us to a new rule.

**New Tool: Reassigning a Variable**

You use `local` only the **first time** you create a variable. To update it with a new value later, you just use its name **without** `local`. 

```lua
-- First, we declare a leader
local leader = "Alex"
print("The current leader is: " .. leader)

-- After a competition, a new leader is chosen!
-- No 'local' needed, because the 'leader' variable already exists.
leader = "Zoya"
print("The new leader is: " .. leader)
```

Now we can use this technique for our speed trial.

**The Logic:**
You need a variable to keep track of the fastest card you've found *so far*. You start by assuming the first card is the fastest. Then you use an **`if` statement** to compare it to the second card. If the second is faster, you **reassign** your "fastest so far" variable to be the second card. Then you compare the current fastest to the third, and so on.

**Instructions (in `main.lua`):**

1.  Make sure your deck is loaded.
2.  Create a variable to hold the winner. To start, assume the first card is the fastest: `local fastest_card_so_far = deck[1]`.
3.  Write an **`if` statement** that compares `deck[2].speed` to `fastest_card_so_far.speed`. If `deck[2]` is faster, reassign `fastest_card_so_far` to be `deck[2]`.
4.  Write *another* `if` statement that compares `deck[3].speed` to `fastest_card_so_far.speed`. If `deck[3]` is faster, reassign `fastest_card_so_far`.
5.  Repeat this for every card in your deck.
6.  Finally, after all the checks, print out the result: `print("The fastest card is: " .. fastest_card_so_far.name)`.

### The Troubleshooting Scroll

  * **Error:** `... module 'cards' not found:`
      * **Meaning:** Your `require("cards")` command couldn't find the file.
      * **Check:** Is `cards.lua` in the exact same folder as `main.lua`? Is the filename spelled correctly?
  * **Error:** `... attempt to index a nil value (local 'deck')` when using `deck[1]`
      * **Meaning:** Your `deck` variable is empty.
      * **Check:** Did you remember to add `return all_cards` at the very end of your `cards.lua` file? If you forget, `require` gets nothing back.
  * **Error:** `'then' expected near ...`
      * **Meaning:** This is a syntax error in your `if` statement.
      * **Check:** Did you remember to write `then` after your condition? The correct structure is `if condition then ... end`.

