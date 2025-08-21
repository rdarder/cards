## Summoning Your First Creature\!

-----

### Let's Get Started\!

Hey\! Welcome to your first step in becoming a game creator. Every huge, amazing game you've ever played started exactly where you are now: with a single line of code.

Our big quest is to build your card game. But before we can have epic battles, we need a creature to fight. So, today's mission is to reach into the digital world and summon our very first creature. We'll decide what it is, what its powers are, and teach the computer how to show it to us.

### The Mission: What We'll Accomplish Today

By the end of this session, we will have a simple program that:

1.  Defines a single creature card with a name, life points, attack power, and speed.
2.  Prints out all of that card's information, neatly formatted, to the console.

It will look something like this in the output:

```
--- My First Card ---
Name: Goblin Grunt
Life: 5
Attack: 2
Speed: 3
```

### The Spellbook: New Tools We'll Learn

To summon our creature, we need to learn a few basic "spells" in Lua.

**1. Variables: The Magic Boxes**

Imagine you have a bunch of magic, labeled boxes. You can put something inside a box and, later, you can ask for whatever is in the box just by using its label. In programming, these boxes are called **variables**. They hold information for us.

To create a variable in Lua, we write `local`, give it a name, use `=`, and then put the information we want to store.

```lua
-- This creates a variable named 'playerName' and stores the text "Alex" in it.
local playerName = "Alex"
```

**2. Data Types: Kinds of Magic**

You can't store a potion in a box meant for a sword\! Different types of information need different kinds of variables. For today, we only need to know two types:

  * **Strings:** This is just text. Anything you wrap in double quotes (`"..."`) is a `string`. We'll use this for our creature's name.

    ```lua
    local creatureName = "Dragon Hatchling"
    ```
  * **Numbers:** These are... well, numbers\! No quotes needed. We'll use these for our card's stats like life, attack, and speed.

    ```lua
    local creatureLife = 10
    ```

**3. `print()`: The Announcer Spell**

What good is creating a creature if we can't see it? The `print()` command tells the computer to display something on the screen. You just put what you want to show inside the parentheses.

```lua
local score = 1500
print(score) -- This will show the number 1500 on the screen
print("Game Over!") -- This will show the text Game Over!
```

**4. String Concatenation: Gluing Text Together**

What if we want to print a nice label *and* our variable's value in the same line? We need to "glue" them together. In Lua, the glue is two dots `..`. This is called **concatenation**.

```lua
local creatureName = "Goblin Grunt"
print("The creature's name is: " .. creatureName)
```

This will print `The creature's name is: Goblin Grunt` all on one line. It takes the string on the left, glues on the value from the `creatureName` variable, and prints the new, combined string.

**5. Comments: Notes to Yourself**

Sometimes, you want to write notes in your code to remember what something does. If you start a line with two dashes `--`, the computer will completely ignore it. These are **comments**, and they are for humans only\!

```lua
-- This variable stores the player's health.
local playerHealth = 100 -- Start with full health
```

### The Training Grounds: Practice Your Spells

Before we summon the real creature, let's warm up with these small exercises. Try writing them in a separate test file.

**Practice \#1: The Scoreboard**

  * Create a variable to store a player's name (a `string`).
  * Create another variable to store their score (a `number`).
  * Use `print()` and string concatenation (`..`) to display a message like `Player Zeke has a score of 500`.

**Practice \#2: A Mighty Spell**

  * Create a variable for a spell's name, like `"Fireball"`.
  * Create a variable for its damage, like `8`.
  * Use `print()` to announce the spell and its power, for example: `Casting Fireball! It does 8 damage!`.

### Your Quest: Summon the Creature\!

Alright, you're ready. Your mission is to write a Lua program from scratch that accomplishes our goal.

**Instructions:**

1.  Create a new file, maybe call it `my_first_card.lua`.
2.  Inside, create **four variables** for your first creature. You'll need one for its name (`string`), and three for its life, attack, and speed (`number`s). Choose any name and stats you want\! Be creative.
3.  Use comments to label what each part of your code does.
4.  Use the `print()` command and `..` to display the card's stats neatly. Try to match the format we showed at the beginning of the mission.

Go for it\! I'll be here to help if you get stuck.

### The Troubleshooting Scroll: When Spells Go Wrong

Even the best wizards mess up a spell sometimes. If your code doesn't run, you'll see an error message. Here are a few common ones and what they mean:

  * **Error:** `... attempt to concatenate a nil value (local 'creatureName')`

      * **Meaning:** You're trying to use a variable that doesn't exist or is empty ("nil" means nothing).
      * **Check:** Did you misspell your variable name? Remember, `creatureName` and `creaturename` are two different things to the computer (it's case-sensitive\!).

  * **Error:** `... 'then' expected near 'Grunt'`

      * **Meaning:** This confusing error often happens when you forget the quotes `"` around a string. If you write `local name = Goblin Grunt`, the computer gets confused and thinks `Goblin` is a command.
      * **Check:** Make sure all your text values are wrapped in double quotes\!

  * **Error:** `... attempt to perform arithmetic on a string value`

      * **Meaning:** You tried to use a math operator like `+` to connect strings. Lua is picky and uses `..` for that.
      * **Check:** Make sure you're using the double dots `..` to glue strings together, not `+`.



