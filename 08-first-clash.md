## The First Clash\! ⚔️

-----

### The Story So Far...

You are a true creator\! You've built a Card Forge that can generate endless unique creatures and functions that can analyze them in an instant. All the pieces are on the workshop table. Now, it's time to put them together and spark them to life. It's time to make two creatures meet on the battlefield.

### The Mission: What We'll Accomplish Today

Today, we will create the first interactive moment of your game. We will write a script that sets up a small skirmish, determines who attacks first, and allows a single, dramatic attack to take place, with the player making the choice if it's their turn.

### The Spellbook: New Tools We'll Learn

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

### Your Quest: The First Clash\!

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

### The Troubleshooting Scroll

  * **Error: `attempt to compare number with nil` in my `if` statement.**
      * **Meaning:** This often happens after asking for user input. If the player types "one" instead of "1", `tonumber("one")` results in `nil` (nothing). You can't compare a number to nothing.
      * **Check:** For now, just be careful to type a real number.
  * **The program crashes if I enter a number like 4 or 0 for my target.**
      * **Meaning:** You're trying to get `computer_hand[4]`, but there's nothing there, so you get `nil`.
      * **Check:** Your code is working correctly\! The player gave an invalid index. For now, just be sure to choose 1, 2, or 3.

