## Automating Your Army 🔁

-----

### The Story So Far...

You've assembled a mighty army and organized it into a deck. You even figured out how to find the fastest card. But... it was a bit clumsy, wasn't it? You had to write a separate `if` statement for `deck[2]`, `deck[3]`, and so on. If your deck had 50 cards, your code would be huge and fragile\!

That kind of repetitive work is for computers, not for master summoners like you. Today, you'll learn the automation spell that tells the computer: "Do this for every card in the deck\!"

### The Mission: What We'll Accomplish Today

By the end of this session, you will have upgraded your code with **loops**. Your new program will be able to:

1.  Display every single card in your deck with just a few lines of code.
2.  Find the fastest card in the deck, no matter if there are 3 cards or 300, using one small, elegant block of code.

-----

### The Spellbook: New Tools We'll Learn

**`for` Loops: The Repetition Spell**

A **`for` loop** is a way to repeat a block of code over and over again. It's one of the most powerful tools a programmer has.

-----

**The Numeric `for` Loop (The Countdown)**

This is the simplest type of loop. You give it a starting number and an ending number, and it runs the code inside for each number in between.

```lua
-- This loop will run 5 times.
-- The variable 'i' will be 1, then 2, then 3, all the way to 5.
for i = 1, 5 do
  print("This is repetition number: " .. i)
end
```

Think of `i` as a temporary counter variable that the loop manages for you.

-----

**The `ipairs` Loop (The Grand Inspection)**

This is the perfect tool for going through a list, like our deck. The "i" in `ipairs` stands for "index," because it goes through your list in numerical index order (1, 2, 3...).

It gives you two variables for each trip through the loop: the item's position (`index`) and the item itself (`value`). **Sometimes you'll only need the item's value and not its `index`, and that's perfectly okay.**

```lua
-- 'ipairs(deck)' tells the loop we want to inspect the deck.
-- For each card, 'index' will be its position (1, 2, 3...)
-- and 'card' will be the actual card table itself!
for index, card in ipairs(deck) do
  print("Checking card #" .. index .. " which is: " .. card.name)
end
```

This is much cleaner than writing `deck[1]`, `deck[2]`, etc., because the loop hands you each card automatically\!

-----

### Your Quest: The Grand Inspection

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

### Side Quest: The Barbarian's Rage ⚔️

Let's practice the numeric loop with a quick, fun challenge.

**The Task:** A Barbarian character has a 'Rage' ability that lets him attack 5 times in a row. Write a **numeric `for` loop** that prints "Smash\!" to the console 5 times.

-----

### The Troubleshooting Scroll

  * **My loop only runs once, or not at all\!**

      * **Check:** Is your deck table empty? An `ipairs` loop won't run if there's nothing in the table to loop over. Make sure your `require("cards")` is working and your deck has cards in it.

  * **I get an error like `attempt to index a nil value (field 'speed')` inside my loop.**

      * **Meaning:** The `card` variable you're trying to use inside the loop is empty (`nil`).
      * **Check:** Make sure your list only contains valid card tables. If you have an accidental `nil` value in your list (e.g., `local deck = { goblin, golem, nil, elf }`), the loop will run but crash when it gets to the empty spot.

  * **In my Speed Trial, the first card always wins.**

      * **Check:** Look at your `if` statement inside the loop. Are you comparing the loop's `card.speed` to the `fastest_card_so_far.speed`? A common mistake is to accidentally compare a card to itself or use the wrong variable. The line should be `if card.speed > fastest_card_so_far.speed then ...`.
