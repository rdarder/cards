## Creating Reusable Spells 🪄

-----

### The Story So Far...

You've become an expert at automation\! With `for` loops, you can command your program to inspect an entire army of cards with just a few lines of code. Your code is powerful, but if you look closely, our main file is becoming a bit of a messy scroll. The logic to display a card is in one place, and the logic to find the fastest card is in another.

What if you wanted to find the fastest card in the player's deck, *and also* in the computer's deck? You'd have to copy and paste that whole chunk of `for` loop code. A true master of programming never copies and pastes code; they put it in a spellbook to be used again and again.

### The Mission: What We'll Accomplish Today

Today, we'll learn how to create **functions**. A function is a named, reusable block of code—like a spell in a spellbook. Our mission is to clean up our code by turning our existing logic into powerful, reusable functions.

By the end of this session, our program will:

1.  Have a clean `display_card()` function that can print the stats for any card.
2.  Have a powerful `find_fastest_card()` function that can find the fastest card in *any* deck we give it.
3.  Use these functions to find the fastest card in both the player's and the computer's deck.

### The Spellbook: New Tools We'll Learn

**1. Defining a Function (Writing the Spell)**

This is how you create a new function, or "spell." You give it a name and tell it what "target" it needs to work on. This target is called a **parameter**.

```lua
-- This defines a function called 'shout'.
-- It takes one parameter, which we'll call 'message'.
function shout(message)
  local loud_message = message .. "!!!"
  print(loud_message)
end
```

The code inside the function doesn't run right away. We've just written the spell and added it to our spellbook for later.

**2. Calling a Function (Casting the Spell)**

To use the function, you "call" it by its name and give it the actual data it needs to work on. This data is called an **argument**.

```lua
-- Here, we call the 'shout' function.
-- The string "hello" is the argument we pass to the 'message' parameter.
shout("hello") -- Prints "hello!!!"
shout("I'm learning functions") -- Prints "I'm learning functions!!!"
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

### Your Quest Part A: The Display Charm

Let's turn our card-display logic into a function.

**Instructions:**

1.  Near the top of your `main.lua` file, define a new function: `function display_card(a_card) ... end`.
2.  Find your `ipairs` loop that you used to print the deck. **Cut** the `print` statement from inside that loop.
3.  **Paste** that `print` statement inside your new `display_card` function.
4.  **Important:** Change the variable you use inside the function to match the parameter name (e.g., change `card.name` to `a_card.name`).
5.  Now, go back to your main `ipairs` loop. The inside of the loop should now just be one line of code: a call to your new function\!
    ```lua
    for index, card in ipairs(deck) do
      display_card(card) -- Cast the spell on each card in the deck!
    end
    ```

Your program will do the same thing, but your main loop is now much cleaner, and you have a reusable tool for displaying any card you want.

### Your Quest Part B: The Seeker Spell

This is where the real power becomes clear. We'll turn our "Speed Trial" code into a function and use it on two different decks.

**New Technique: Creating Decks from a Master List**

For this quest, we'll need two different decks for our two players. A simple way to do this is to "deal" cards from our master `all_cards` list. Think of it like a real deck of cards: you can create a new hand by taking the 1st card, the 3rd card, and so on. In Lua, we do that by grabbing cards by their index and placing them in a new table.

**Instructions:**

1.  First, let's set up two decks in `main.lua`. Load your master list of cards, and then create two smaller decks from it using the technique above.
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

### The Troubleshooting Scroll

  * **Error: `... attempt to concatenate a nil value (local 'fastest_in_player_deck')`**

      * **Meaning:** The `find_fastest_card` function didn't hand anything back, so the variable is empty (`nil`).
      * **Check:** Did you remember to put `return fastest_card_so_far` at the very end of your function?

  * **My `display_card` function isn't working and gives a `nil` error.**

      * **Check:** When you defined your function, you gave the parameter a name, like `a_card`. Did you remember to use that *exact same name* for the variables inside the function (e.g., `a_card.name`, `a_card.life`)?

  * **I call my function, but nothing happens.**

      * **Check:** Remember that some functions just `return` a value; they don't print anything themselves. After you call `find_fastest_card`, you need to `print` the result that it gave you back.
