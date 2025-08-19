# Code & Sorcery: A Lua Card Game Quest

## **Summoning Your First Creature\!**

-----

### **Let's Get Started\!**

Hey\! Welcome to your first step in becoming a game creator. Every huge, amazing game you've ever played started exactly where you are now: with a single line of code.

Our big quest is to build your card game. But before we can have epic battles, we need a creature to fight. So, today's mission is to reach into the digital world and summon our very first creature. We'll decide what it is, what its powers are, and teach the computer how to show it to us.

### **The Mission: What We'll Accomplish Today**

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

### **The Spellbook: New Tools We'll Learn**

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

### **The Training Grounds: Practice Your Spells**

Before we summon the real creature, let's warm up with these small exercises. Try writing them in a separate test file.

**Practice \#1: The Scoreboard**

  * Create a variable to store a player's name (a `string`).
  * Create another variable to store their score (a `number`).
  * Use `print()` and string concatenation (`..`) to display a message like `Player Zeke has a score of 500`.

**Practice \#2: A Mighty Spell**

  * Create a variable for a spell's name, like `"Fireball"`.
  * Create a variable for its damage, like `8`.
  * Use `print()` to announce the spell and its power, for example: `Casting Fireball! It does 8 damage!`.

### **Your Quest: Summon the Creature\!**

Alright, you're ready. Your mission is to write a Lua program from scratch that accomplishes our goal.

**Instructions:**

1.  Create a new file, maybe call it `my_first_card.lua`.
2.  Inside, create **four variables** for your first creature. You'll need one for its name (`string`), and three for its life, attack, and speed (`number`s). Choose any name and stats you want\! Be creative.
3.  Use comments to label what each part of your code does.
4.  Use the `print()` command and `..` to display the card's stats neatly. Try to match the format we showed at the beginning of the mission.

Go for it\! I'll be here to help if you get stuck.

### **The Troubleshooting Scroll: When Spells Go Wrong**

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



## **Crafting the Card's Soul**

-----

### **The Story So Far...**

Awesome work on summoning your first creature\! You taught the computer to remember four different things about it: its name, life, attack, and speed, using four separate variables.

But there's a small problem. In our code, the variable `card_name` has no idea it belongs with `card_life`. They're like four separate ghosts floating around, and we just happen to know they describe the same creature. If we wanted to make a second card, we'd need four *more* variables (`card2_name`, `card2_life`...). That would get confusing fast\!

Today, we're going to fix that. We're going to give our card a "soul"—a single container that holds all its information together.

### **The Mission: What We'll Accomplish Today**

By the end of this session, our program will produce the **exact same output as before**, but our code will be much cleaner and smarter. We will:

1.  Learn how to store all of a card's data inside a single variable.
2.  Rewrite our code from Unit 1 to use this new, organized structure.

The big change isn't what the program *does*, but *how* our code is written. This is a huge step in programming: learning to write clean, organized code.

### **The Spellbook: New Tools We'll Learn**

We only need one new, super-powerful tool for this mission.

**1. Tables: The Ultimate Organizer**

Imagine a character sheet for a game. It has labels like "Name," "HP," and "Strength," and next to each label is a value. A **table** in Lua is exactly like that\! It's a master variable that can hold a bunch of other values inside it, each with its own label (which we call a **key**).

Here’s how we turn our four separate variables...

```lua
-- The old way from Unit 1
local card_name = "Goblin Grunt"
local card_life = 5
local card_attack = 2
local card_speed = 3
```

...into one awesome table:

```lua
-- The new, organized way!
local goblin_grunt = {
  name = "Goblin Grunt",
  life = 5,
  attack = 2,
  speed = 3
}
```

We create it using curly braces `{}`. Inside, we list our `key = value` pairs, separated by commas. Now, the `goblin_grunt` variable holds everything\!

**2. Dot Notation: Accessing the Data**

Okay, so everything is inside the `goblin_grunt` box. How do we get the `life` value out? We use a dot (`.`)\! This is called **dot notation**.

You write the name of the table, then a dot, then the key you want.

```lua
-- To get the life value from the table:
print(goblin_grunt.life)  -- This will print the number 5

-- To get the name:
print(goblin_grunt.name)  -- This will print "Goblin Grunt"

-- We can even use it with our concatenation spell from last time!
print("The creature's attack power is: " .. goblin_grunt.attack)
```

### **The Training Grounds: Practice Your Spells**

Let's practice making tables for things other than cards.

**Practice \#1: The Player Profile**

  * Create a single table variable named `player`.
  * Inside this table, add keys for `name`, `gold`, and `level`. Give them any values you like (e.g., `"Gandalf"`, `500`, `10`).
  * Write three `print()` statements that use dot notation to display each piece of the player's information, like `"Player's Gold: 500"`.

**Practice \#2: A Potion's Recipe**

  * Create a table variable for a magic potion, maybe called `health_potion`.
  * Inside it, add keys like `name` ("Greater Health Potion"), `color` ("shimmering red"), `restores` (50), and `is_rare` (**`true`**).
  * **Bonus concept:** `true` and `false` are a new data type called a **boolean**. They are great for yes/no questions\!
  * Print out a sentence describing the potion using its data, like `"Greater Health Potion is a shimmering red color and restores 50 health."`

### **Your Quest: Reforge Your Creature\!**

Time to upgrade your code from Unit 1. Your mission is to "reforge" your creature using a table.

**Instructions:**

1.  Open your `my_first_card.lua` file from last time. You can save a copy of it first if you want.
2.  Delete the four separate `local` variables for the card's stats.
3.  In their place, create **one** table variable (e.g., `my_card` or `goblin_grunt`).
4.  Inside this table, add the `name`, `life`, `attack`, and `speed` as keys, and assign them the same values you had before.
5.  Go down to your `print()` statements and update them to use **dot notation** to get the information from your new table.
6.  Run the program. The output on the screen should look exactly the same as before, but you'll know that your code is now a hundred times more organized\!

### **The Troubleshooting Scroll: When Spells Go Wrong**

Crafting with tables can be tricky at first. Here are some common mistakes:

  * **Error:** `... '}' expected (to close '{' ...) near 'attack'`

      * **Meaning:** The computer got confused while reading the list of things inside your table.
      * **Check:** Did you remember to put a **comma** `,` after each key-value pair inside the table? You need one to separate `name = "Goblin",` from `life = 5,`. The last item doesn't strictly need a comma, but it's good practice to add one anyway.

  * **Error:** `... attempt to index a nil value (global 'goblin_grunt')`

      * **Meaning:** You're trying to get a value from a table that doesn't exist.
      * **Check:** Did you misspell the table's variable name? Remember, `goblin_grunt` and `Goblin_Grunt` are different\!

  * **Error:** `... attempt to concatenate a nil value (field 'attak')`

      * **Meaning:** The table exists, but the **key** you asked for (`attak`) isn't in it. "nil" means "nothing," so you're trying to print nothing.
      * **Check:** Did you misspell the key inside the dot notation? For example, writing `goblin_grunt.attak` when the key in the table is actually `attack`.

## **Assembling Your Army**

-----

### **The Story So Far...**

You've successfully crafted the "soul" of a single creature, storing all its stats neatly in one table. Your code is clean and organized. But a master summoner never relies on a single creature; they command an army\! It's time to go from one card to a full deck.

### **The Mission: What We'll Accomplish Today**

Our main goal is to create a deck of cards. By the end, we'll have a program that defines several different cards and bundles them into a single "deck" variable. We'll also take on some challenging side quests to make our code even more powerful.

### **The Spellbook: New Tools We'll Learn**

**1. Tables as Lists (The Card Box)**

We're going to use our trusty `table` tool in a new way. Instead of using named keys like `name = "..."`, we're just going to put our finished card-tables into a list, separated by commas. Think of it like putting your individual cards into a deck box.

```lua
-- First, we define our individual cards, just like in Unit 2
local goblin = { name = "Goblin Grunt", life = 5, speed = 3, attack = 2 }
local golem = { name = "Stone Golem", life = 10, speed = 1, attack = 1 }
local elf = { name = "Swift Elf", life = 3, speed = 5, attack = 3 }

-- Now, we put them all into one "deck" table!
local deck = { goblin, golem, elf }
```

**2. Accessing by Index (Picking a Card)**

How do you get the second card from the deck? You can't use a dot because there's no name. Instead, we use a number in **square brackets `[ ]`**. This number is called the **index**.

**Important:** In Lua, the first item is at index **1**.

```lua
-- Get the second card from the deck (the golem)
local second_card = deck[2]

-- Now we can use dot notation on the card we picked!
print("The second card's name is: " .. second_card.name) -- Prints "Stone Golem"
```

**3. The Length Operator (Counting Your Cards)**

Need to know how many cards are in your deck? Just put a hashtag `#` in front of the table's name.

```lua
print("There are " .. #deck .. " cards in the deck.") -- Prints "3"
```

**4. Conditionals: `if/then` (Making a Choice)**

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

### **Your Quest: Assemble the Deck\!**

First, let's get the main part done.

**Instructions:**

1.  In your `main.lua` file, create at least three different creature cards as table variables (like `goblin`, `golem`, `elf`, etc.). Give them unique names and stats.
2.  Create one final table called `deck` and place your card variables inside it, just like the example.
3.  Use `print()` and the index `[ ]` syntax to display the name of the *second* card in your deck.
4.  Use `print()` and the `#` operator to display the total number of cards in the deck.

-----

### **Side Quest 1: A Separate Spellbook 📜**

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

### **Side Quest 2: The Speed Trial 💨**

Now for a real challenge. Your program needs to figure out which card in the deck is the fastest. We don't know loops yet, so we have to do it manually by comparing the cards one by one.

**The Logic:**
You need a variable to keep track of the fastest card you've found *so far*. You start by assuming the first card is the fastest. Then you use an **`if` statement** to compare it to the second card. If the second is faster, it becomes the new "fastest so far." Then you compare the current fastest to the third, and so on.

**Instructions (in `main.lua`):**

1.  Make sure your deck is loaded.
2.  Create a variable to hold the winner. To start, assume the first card is the fastest: `local fastest_card_so_far = deck[1]`.
3.  Write an **`if` statement** that compares `deck[2].speed` to `fastest_card_so_far.speed`. If `deck[2]` is faster, update `fastest_card_so_far` to be `deck[2]`.
4.  Write *another* `if` statement that compares `deck[3].speed` to `fastest_card_so_far.speed`. If `deck[3]` is faster, update `fastest_card_so_far`.
5.  Repeat this for every card in your deck.
6.  Finally, after all the checks, print out the result: `print("The fastest card is: " .. fastest_card_so_far.name)`.

### **The Troubleshooting Scroll**

  * **Error:** `... module 'cards' not found:`
      * **Meaning:** Your `require("cards")` command couldn't find the file.
      * **Check:** Is `cards.lua` in the exact same folder as `main.lua`? Is the filename spelled correctly?
  * **Error:** `... attempt to index a nil value (local 'deck')` when using `deck[1]`
      * **Meaning:** Your `deck` variable is empty.
      * **Check:** Did you remember to add `return all_cards` at the very end of your `cards.lua` file? If you forget, `require` gets nothing back.
  * **Error:** `'then' expected near ...`
      * **Meaning:** This is a syntax error in your `if` statement.
      * **Check:** Did you remember to write `then` after your condition? The correct structure is `if condition then ... end`.

## **Automating Your Army 🔁**

-----

### **The Story So Far...**

You've assembled a mighty army and organized it into a deck. You even figured out how to find the fastest card. But... it was a bit clumsy, wasn't it? You had to write a separate `if` statement for `deck[2]`, `deck[3]`, and so on. If your deck had 50 cards, your code would be huge and fragile\!

That kind of repetitive work is for computers, not for master summoners like you. Today, you'll learn the automation spell that tells the computer: "Do this for every card in the deck\!"

### **The Mission: What We'll Accomplish Today**

By the end of this session, you will have upgraded your code with **loops**. Your new program will be able to:

1.  Display every single card in your deck with just a few lines of code.
2.  Find the fastest card in the deck, no matter if there are 3 cards or 300, using one small, elegant block of code.

### **The Spellbook: New Tools We'll Learn**

**1. `for` Loops: The Repetition Spell**

A **`for` loop** is a way to repeat a block of code over and over again. It's one of the most powerful tools a programmer has.

**2. The Numeric `for` Loop (The Countdown)**

This is the simplest type of loop. You give it a starting number and an ending number, and it runs the code inside for each number in between.

```lua
-- This loop will run 5 times.
-- The variable 'i' will be 1, then 2, then 3, all the way to 5.
for i = 1, 5 do
  print("This is repetition number: " .. i)
end
```

Think of `i` as a temporary counter variable that the loop manages for you.

**3. The `ipairs` Loop (The Grand Inspection)**

This is the perfect tool for going through a list, like our deck. The "i" in `ipairs` stands for "index," because it goes through your list in numerical index order (1, 2, 3...).

It gives you two variables for each trip through the loop: the item's position (`index`) and the item itself (`value`).

```lua
-- 'ipairs(deck)' tells the loop we want to inspect the deck.
-- For each card, 'index' will be its position (1, 2, 3...)
-- and 'card' will be the actual card table itself!
for index, card in ipairs(deck) do
  print("Checking card #" .. index .. " which is: " .. card.name)
end
```

This is much cleaner than writing `deck[1]`, `deck[2]`, etc., because the loop hands you each card automatically\!

### **Your Quest: The Grand Inspection**

Time to put this new power to use and upgrade your old code.

**Part A: Display the Whole Deck**

1.  In your `main.lua` file, right after you `require` your deck of cards, write an `ipairs` loop.
2.  Inside the loop, use `print()` to display the name and stats of each card.
3.  Run it\! You should see all the cards in your deck printed out, one after the other.

**Part B: The Ultimate Speed Trial**

1.  Now, let's refactor the "Speed Trial" logic from last time.
2.  Start by creating your `fastest_card_so_far` variable, initializing it with `deck[1]`.
3.  Create an `ipairs` loop to go through the deck.
4.  Inside the loop, write a single `if` statement that compares the current `card.speed` (from the loop) with `fastest_card_so_far.speed`.
5.  If the current `card` is faster, update `fastest_card_so_far` to be the current `card`.
6.  After the loop is finished, print the name of the winner. Your new code should be tiny compared to the old way, but much more powerful\!

-----

### **Side Quest: The Barbarian's Rage ⚔️**

Let's practice the numeric loop with a quick, fun challenge.

**The Task:** A Barbarian character has a 'Rage' ability that lets him attack 5 times in a row. Write a **numeric `for` loop** that prints "Smash\!" to the console 5 times.

-----

### **The Troubleshooting Scroll**

  * **My loop only runs once, or not at all\!**

      * **Check:** Is your deck table empty? An `ipairs` loop won't run if there's nothing in the table to loop over. Make sure your `require("cards")` is working and your deck has cards in it.

  * **I get an error like `attempt to index a nil value (field 'speed')` inside my loop.**

      * **Meaning:** The `card` variable you're trying to use inside the loop is empty (`nil`).
      * **Check:** Make sure your list only contains valid card tables. If you have an accidental `nil` value in your list (e.g., `local deck = { goblin, golem, nil, elf }`), the loop will run but crash when it gets to the empty spot.

  * **In my Speed Trial, the first card always wins.**

      * **Check:** Look at your `if` statement inside the loop. Are you comparing the loop's `card.speed` to the `fastest_card_so_far.speed`? A common mistake is to accidentally compare a card to itself or use the wrong variable. The line should be `if card.speed > fastest_card_so_far.speed then ...`.


## **Creating Reusable Spells 🪄**

-----

### **The Story So Far...**

You've become an expert at automation\! With `for` loops, you can command your program to inspect an entire army of cards with just a few lines of code. Your code is powerful, but if you look closely, our main file is becoming a bit of a messy scroll. The logic to display a card is in one place, and the logic to find the fastest card is in another.

What if you wanted to find the fastest card in the player's deck, *and also* in the computer's deck? You'd have to copy and paste that whole chunk of `for` loop code. A true master of programming never copies and pastes code; they put it in a spellbook to be used again and again.

### **The Mission: What We'll Accomplish Today**

Today, we'll learn how to create **functions**. A function is a named, reusable block of code—like a spell in a spellbook. Our mission is to clean up our code by turning our existing logic into powerful, reusable functions.

By the end of this session, our program will:

1.  Have a clean `display_card()` function that can print the stats for any card.
2.  Have a powerful `find_fastest_card()` function that can find the fastest card in *any* deck we give it.
3.  Use these functions to find the fastest card in both the player's and the computer's deck.

### **The Spellbook: New Tools We'll Learn**

**1. Defining a Function (Writing the Spell)**

This is how you create a new function, or "spell." You give it a name and tell it what "target" it needs to work on. This target is called a **parameter**.

```lua
-- This defines a function called 'shout'.
-- It takes one parameter, which we'll call 'message'.
function shout(message)
  local loud_message = string.upper(message) .. "!!!"
  print(loud_message)
end
```

The code inside the function doesn't run right away. We've just written the spell and added it to our spellbook for later.

**2. Calling a Function (Casting the Spell)**

To use the function, you "call" it by its name and give it the actual data it needs to work on. This data is called an **argument**.

```lua
-- Here, we call the 'shout' function.
-- The string "hello" is the argument we pass to the 'message' parameter.
shout("hello") -- Prints "HELLO!!!"
shout("I'm learning functions") -- Prints "I'M LEARNING FUNCTIONS!!!"
```

We wrote the logic once and can now use it on any message we want\!

**3. Returning a Value (Getting a Result)**

Some spells just perform an action (like `shout`), but others are meant to find something and give it back to you. The `return` keyword is how a function hands a value back to the code that called it.

```lua
function add(number1, number2)
  local result = number1 + number2
  return result -- This sends the value of 'result' back out.
end

-- Call the function and store the returned value in a variable.
local sum = add(5, 3)
print(sum) -- Prints 8
```

### **Your Quest Part A: The Display Charm**

Let's turn our card-display logic into a function.

**Instructions:**

1.  Near the top of your `main.lua` file, define a new function: `function display_card(a_card) ... end`.
2.  Find your `ipairs` loop that you used to print the deck. **Cut** the `print` statements from inside that loop.
3.  **Paste** those `print` statements inside your new `display_card` function.
4.  **Important:** Change the variable you use inside the function to match the parameter name (e.g., change `card.name` to `a_card.name`).
5.  Now, go back to your main `ipairs` loop. The inside of the loop should now just be one line of code: a call to your new function\!
    ```lua
    for index, card in ipairs(deck) do
      display_card(card) -- Cast the spell on each card in the deck!
    end
    ```

Your program will do the same thing, but your main loop is now much cleaner, and you have a reusable tool for displaying any card you want.

### **Your Quest Part B: The Seeker Spell**

This is where the real power becomes clear. We'll turn our "Speed Trial" code into a function and use it on two different decks.

**Instructions:**

1.  First, let's set up two decks in `main.lua`. Load your master list of cards, and then create two smaller decks from it.
    ```lua
    local all_cards = require("cards")

    -- Create two different decks for our two players.
    local player_deck = { all_cards[1], all_cards[3] }
    local computer_deck = { all_cards[2], all_cards[4] } -- Make sure you have at least 4 cards defined!
    ```
2.  Define a new function: `function find_fastest_card(a_deck) ... end`.
3.  **Cut** all the logic from your "Speed Trial" quest (creating `fastest_card_so_far` and the `ipairs` loop) and **paste** it inside this new function.
4.  Adjust the code inside the function to work on the `a_deck` parameter instead of the global `deck`.
5.  At the very end of the function, after the loop, add the line: `return fastest_card_so_far`.
6.  Now, in your main code, call your function twice—once for each deck—and store the results.
    ```lua
    local fastest_in_player_deck = find_fastest_card(player_deck)
    local fastest_in_computer_deck = find_fastest_card(computer_deck)

    print("--- Battle Analysis ---")
    print("Player's fastest card is: " .. fastest_in_player_deck.name)
    print("Computer's fastest card is: " .. fastest_in_computer_deck.name)
    ```

Run your code. You just performed a complex analysis on two different data sets using a single, reusable spell. This is what programming is all about\!

### **The Troubleshooting Scroll**

  * **Error: `... attempt to concatenate a nil value (local 'fastest_in_player_deck')`**

      * **Meaning:** The `find_fastest_card` function didn't hand anything back, so the variable is empty (`nil`).
      * **Check:** Did you remember to put `return fastest_card_so_far` at the very end of your function?

  * **My `display_card` function isn't working and gives a `nil` error.**

      * **Check:** When you defined your function, you gave the parameter a name, like `a_card`. Did you remember to use that *exact same name* for the variables inside the function (e.g., `a_card.name`, `a_card.life`)?

  * **I call my function, but nothing happens.**

      * **Check:** Remember that some functions just `return` a value; they don't print anything themselves. After you call `find_fastest_card`, you need to `print` the result that it gave you back.

## **The Random Card Forge 🏭**

-----

### **The Story So Far...**

You've mastered creating reusable spells with functions\! Your code is clean, organized, and powerful. But you still have to write out every single card by hand. This is slow, and it makes your game predictable.

What if your game could create new, surprising cards *on its own*, every time you play? Today, we're building the heart of the game factory: a function that forges brand-new, random cards from scratch.

### **The Mission: What We'll Accomplish Today**

Our mission is to build a single, powerful function: `generate_random_card()`. When we call this function, it will create and return a complete, unique, and balanced card table.

The generated card will have:

1.  A random name, created by combining adjectives and nouns (e.g., "Vengeful Knight").
2.  Random stats for life, attack, and speed.
3.  **Balanced Stats:** The card will obey a special rule: the sum of its life, attack, and speed must not be greater than a set number (e.g., 20).

### **The Spellbook: New Tools We'll Learn**

**1. `math.random()` (The Dice Roll) 🎲**

Lua has a built-in library of math tools called `math`. One of its most fun tools is `random()`, which works like rolling dice.

  * `math.random(max)`: Gives you a random whole number between 1 and `max`.
  * `math.random(min, max)`: Gives you a random whole number between `min` and `max`.

**2. Picking a Random Item from a List**

This is a classic programming pattern. To get a random item from a list, we get a random index number and use that to pick the item. Remember from Unit 3, the hashtag `#` operator gets the total number of items in a list-like table.

```lua
local names = { "Goblin", "Elf", "Golem", "Dragon" }

-- #names will be 4, so this is like calling math.random(4).
local random_index = math.random(#names)
local random_name = names[random_index] -- Pick the item at that index
```

**3. The `repeat...until` Loop (The Persistent Spell)**

You've mastered the `for` loop, which runs a *known* number of times. A **`repeat...until` loop** is for when you need to do something *at least once*, and then keep doing it until a specific condition is met.

**Analogy:** A blacksmith forging a balanced sword.

1.  "**Repeat** the following steps..."
2.  "Forge the sword. Hammer it out. Cool it in water."
3.  "...**until** the sword is perfectly balanced."

The code inside the loop always runs once, then the condition is checked at the end.

-----

### **Your Quest: The Grand Forging**

We will build our `generate_random_card()` function step-by-step.

**Step 1: The Blueprint & A New Technique**

First, create the basic shell for our function.

```lua
function generate_random_card()
  -- We'll add more here!
end
```

Inside this function, we need to build a card. But since all the data will be random, we can't create it the way we did before. This brings us to a new technique: **building a table piece by piece.**

1.  **Create an empty table:** You can create a table with nothing in it. Think of it like a blank character sheet or an empty box.
    `local new_card = {}`

2.  **Add fields later:** You can add new key-value pairs to any table at any time using the dot notation you already know.

    ```lua
    local new_card = {} -- Here's our empty box.

    -- Now let's add a key-value pair to it.
    new_card.name = "Temporary Name"

    -- The table now looks like { name = "Temporary Name" }
    print(new_card.name) -- This will print "Temporary Name"
    ```

This is the method we'll use. We'll start with an empty `new_card` table and add the random `name`, `life`, `attack`, and `speed` to it one by one.

-----

**Step 2: The Naming Ceremony**

Let's start building our card.

1.  Inside your function, create the empty `new_card` table.
2.  Create two lists: one with adjectives, one with nouns.
3.  Use the `math.random` pattern to pick one word from each list and combine them.
4.  Add the new name to your table using `new_card.name = ...`.

> **A Quick Detour: Nested vs. Step-by-Step**
>
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
3.  Inside the loop, call `generate_random_card()` and add the returned card to your `random_deck`.
4.  Use your `display_card()` function from the last unit to print out your brand-new, completely unique deck\!

### **The Troubleshooting Scroll**

  * **My program freezes and never finishes\!**
      * **Meaning:** You probably have an **infinite loop**. Your `repeat...until` loop's condition is never becoming true.
      * **Check:** Is your rule possible to achieve? If you generate stats from 10-20, their sum can *never* be less than 20. Make sure your `max_stats` value is high enough for the random numbers you are generating\!
  * **Error: `bad argument #2 to 'random' (interval is empty)`**
      * **Meaning:** You tried to do `math.random(min, max)` where `min` is larger than `max`.
      * **Check:** Make sure the first number in `math.random(min, max)` is always smaller than or equal to the second.


## **The First Clash\! ⚔️**

-----

### **The Story So Far...**

You are a true creator\! You've built a Card Forge that can generate endless unique creatures and functions that can analyze them in an instant. All the pieces are on the workshop table. Now, it's time to put them together and spark them to life. It's time to make two creatures meet on the battlefield.

### **The Mission: What We'll Accomplish Today**

Today, we will create the first interactive moment of your game. We will write a script that sets up a small skirmish, determines who attacks first, and allows a single, dramatic attack to take place, with the player making the choice if it's their turn.

### **The Spellbook: New Tools We'll Learn**

**1. Booleans: `true` and `false` (The Light Switch)**

So far, we've used two types of data: `numbers` (like 10) and `strings` (like "Hello"). It's time to learn the third major type: the **boolean**.

A boolean is super simple. It can only ever have one of two values: **`true`** or **`false`**. That's it.

**Analogy:** Think of a light switch. It can only be on or off. Booleans are perfect for tracking simple states or the answers to yes/no questions. Is the game over? `false`. Is the player hidden? `true`.

```lua
local is_game_over = false
local player_has_key = true
```

**2. Conditionals: `if/then/else` (Making Decisions)**

An **`if` statement** is how you use booleans to make your program smart. It checks if a condition is `true`, and if it is, it runs a block of code.

The "condition" part of an `if` statement always results in a boolean. For example, `player_level > 10` becomes `true` if `player_level` is 12.

```lua
-- We can use a boolean variable directly
if player_has_key == true then
  print("You unlock the door.")
else
  print("The door is locked.")
end
```

**3. User Input: `io.read()` (Listening to the Player)**

This function makes your program pause and wait for the player to type something and press Enter.

**Important:** `io.read()` always gives you back a `string`. If you need a number, you have to convert it using `tonumber()`.

```lua
print("Choose a spell (1=Fireball, 2=Ice Lance):")
local choice_text = io.read() -- Player types "1"
local choice_number = tonumber(choice_text) -- Convert the "1" string to the number 1

if choice_number == 1 then
  print("You cast Fireball!")
end
```

### **Your Quest: The First Clash\!**

We'll build this in a single script (`main.lua`) step-by-step.

**Step 1: Setting the Stage**

1.  Make sure your `generate_random_card()` and other functions are ready.
2.  Create two empty tables: `player_hand` and `computer_hand`.
3.  Use a `for` loop to generate three random cards for the `player_hand` and three for the `computer_hand`.
4.  Use your `display_card()` function to show the player both hands.

**Step 2: The Initiative**

1.  Create a single `battlefield` table and add all 6 cards into it.
2.  Use your `find_fastest_card()` function on the `battlefield` to find the `attacker` card.
3.  Announce who is attacking: `print(attacker.name .. " has the highest speed and attacks first!")`.

**Step 3: Whose Turn Is It?**
Now we'll use a boolean to track whose turn it is.

1.  Create a variable `is_player_turn = false`. This is our light switch, and we'll start with it "off".
2.  Use a `for` loop to go through the `player_hand`. Inside the loop, use an `if` statement to check if the current card is the same as the `attacker`. If it is, flip our switch to on: set `is_player_turn = true`.

**Step 4: The Attack\!**
This is where we use our big `if/then/else` brain to check our boolean "switch".

1.  Write an `if is_player_turn == true then ... else ... end` block.
2.  **Inside the `if` block (Player's Turn):**
      * Print the computer's cards as a numbered list of targets.
      * Prompt the player to choose a target.
      * Use `io.read()` and `tonumber()` to get their choice.
      * Set a `target` variable to the chosen card from the `computer_hand`.
3.  **Inside the `else` block (Computer's Turn):**
      * Use `math.random(3)` to pick a random target index.
      * Set the `target` variable to the card from the `player_hand` at that index.
      * Announce who the computer chose to attack.

**Step 5: The Aftermath**
This code goes *after* the `if/then/else` block.

1.  Calculate the new life: `target.life = target.life - attacker.attack`.
2.  Print the action: `print(attacker.name .. " attacks " .. target.name .. ", dealing " .. attacker.attack .. " damage!")`
3.  Use a final `if` statement to check if `target.life <= 0`. If so, print that the card was defeated. Otherwise, print its remaining life.

And... scene\! You've just created a fully interactive battle sequence.

### **The Troubleshooting Scroll**

  * **Error: `attempt to compare number with nil` in my `if` statement.**
      * **Meaning:** This often happens after asking for user input. If the player types "one" instead of "1", `tonumber("one")` results in `nil` (nothing). You can't compare a number to nothing.
      * **Check:** For now, just be careful to type a real number.
  * **The program crashes if I enter a number like 4 or 0 for my target.**
      * **Meaning:** You're trying to get `computer_hand[4]`, but there's nothing there, so you get `nil`.
      * **Check:** Your code is working correctly\! The player gave an invalid index. For now, just be sure to choose 1, 2, or 3.

## **The Grand Melee 💥**

-----

### **The Story So Far...**

You created an epic "First Clash" in the last unit! It was the first time your game felt truly interactive. But that single attack was just the opening move. A real battle is a chaotic melee where every creature gets a turn. As we'll see, making this happen introduces some tricky new challenges that will require some clever new tactics to solve.

### **The Mission: What We'll Accomplish Today**

Our mission is to implement a full battle round where all 6 cards on the table get to act. The program will:
1.  Create two 3-card hands for the player and computer.
2.  Intelligently determine the correct turn order, one turn at a time.
3.  Allow each living card to attack a living opponent.
4.  Print the final status of all cards after the battle is over.

---

### **1. The New Challenge: Who Attacks Next?**

Our old "find the single fastest card" logic is broken now. Why? Because in a full round:
1.  A card that is defeated before its turn can't attack at all.
2.  Once a card takes its turn, it can't attack again in the same round.

Simply finding the fastest card over and over won't work. We might pick the same card twice, or pick a card that's already been defeated. We need a smarter way to track the state of the whole battlefield.

#### **Our New Tactic: The Battlefield List**

To solve this, we'll create **one single list** of all 6 cards on the battlefield. To avoid losing track of who owns each card, our list will hold small "turn marker" tables.

It's worth noting that this tactic isn't exactly how a human would do it. You'd just look at the table and intuitively know who's left and who is fastest. But a computer doesn't have intuition; it has a very narrow focus. We need to give it a very precise recipe (an **algorithm**) to follow so that it never misses a card or makes the wrong choice. This list is the first step in that recipe.

The structure for each item in our new list will be a table like this:
`{ card = { ... }, owner = "player", has_attacked = false }`

The `has_attacked = false` is a new **boolean** flag—our "light switch" for tracking who has already had their turn this round.

---

### **2. The Targeting Problem: Who Can Be Attacked?**

The second big challenge is that an attacker can't target a card that has already been defeated. The opponent's hand might have 3 card slots, but only one or two might be valid, living targets.

#### **Our New Tactic: Filtering for Valid Targets**

This is the perfect place to use a technique called **filtering**. Filtering is the simple idea of building a new, temporary list from an old one, but only including the items that match a specific rule.

We'll look at the opponent's entire hand of 3 cards and build a *new, shorter list* that contains only the cards that are still standing (their `life` is greater than 0). This new list becomes our list of valid targets for that specific turn.

Remember our "list of shortcuts" concept: this new `valid_targets` list doesn't contain *copies* of the cards; it contains shortcuts to the originals. Damaging a card from this new list will damage the card in the opponent's actual hand.

---

### **Your Quest: The Grand Melee**

**Step 1: Setup**
1.  Generate the `player_hand` and `computer_hand` with 3 random cards each.
2.  Display the starting cards so the player knows the battlefield.

**Step 2: Create the Battlefield List**
1.  Create an empty table: `local battlefield = {}`.
2.  Use a `for` loop to go through the `player_hand`. For each card, `table.insert` a new table `{ card = the_card, owner = "player", has_attacked = false }` into your `battlefield` list.
3.  Do the same for the `computer_hand`, using `owner = "computer"`.

**Step 3: The Main Loop**
We need a loop that will run for each of the 6 "turn slots" in the round. A simple numeric `for` loop is perfect for this.
`for turn_number = 1, 6 do ... end`

**Inside the Loop (For Each Turn):**

**A. Find the Next Attacker**
* This is our core algorithm for the turn. We need to search the entire `battlefield` to find the best possible attacker right now.
* Create two variables before the search: `local next_attacker_info = nil` and `local highest_speed = -1`.
* Now, loop through the `battlefield` list (`for i, info in ipairs(battlefield) do...`). Inside this search loop, use an `if` statement with three conditions:
  `if info.card.life > 0 and info.has_attacked == false and info.card.speed > highest_speed then ...`
* If all three are true, you've found a new best attacker for this turn! Update your variables: `highest_speed = info.card.speed` and `next_attacker_info = info`.
* After this search loop finishes, `next_attacker_info` will hold the correct card to attack this turn.

**B. The Attack Sequence (If an attacker was found)**
* Use an `if` statement to check if an attacker was actually found: `if next_attacker_info then ... end`.
* **Determine Targets:** Figure out which hand is the enemy's.
* **Filter Targets:** Build the `valid_targets` list by looping through the opponent's hand and grabbing only the living cards.
* **Perform the Attack:** Check if there are any valid targets. If so, let the player or computer choose a target and perform the attack calculation.
* **Update State:** This is critical! After the attack, mark the attacker's turn as complete so they can't be chosen again: `next_attacker_info.has_attacked = true`.

**Step 4: The Aftermath**
1.  After the main `for turn_number = 1, 6 do` loop is finished, print a "--- Round Over ---" message.
2.  Loop through the original `player_hand` and `computer_hand` and display the final status of all 6 cards.

### **The Troubleshooting Scroll**

* **The same card attacks over and over!**
    * **Check:** You are likely forgetting to update the attacker's state after they attack. Make sure the line `next_attacker_info.has_attacked = true` is running correctly.
* **The program crashes trying to attack.**
    * **Check:** Are you checking if there are any `valid_targets` before trying to attack? If all opponents are defeated, your `valid_targets` list will be empty, and trying to pick a target (`valid_targets[1]`) will result in `nil`. Make sure your attack logic is inside an `if #valid_targets > 0 then ...` block.

