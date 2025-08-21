## The Sentinel's Shield (Protecting Your Code) 🛡️

-----

### The Story So Far...

You've built a truly complex and exciting "Grand Melee"\! But with this complexity comes a new danger. If you change one part of the code, how can you be sure you didn't accidentally break something else? Checking everything by hand after every change is slow and impossible. It's time to build a sentinel—an automated guard for your code.

### The Mission: What We'll Accomplish Today

Our mission is to pause on adding new game features and instead build a "test suite"—a separate script that automatically runs simulations and checks if our game logic behaves exactly as we promise it will. To do this, we'll first learn how to properly organize our code into "libraries" and "scripts."

### The Spellbook: The Art of Guardianship

**1. Libraries vs. Scripts (The Spellbook vs. The Incantation)**

This is the most important organizational idea in programming. Not all `.lua` files are the same.

**Analogy:** A **library** is like a **spellbook**. It's a collection of powerful spells (functions) and definitions (data). Sitting on the shelf, a spellbook doesn't *do* anything. Its job is to simply be a source of knowledge. A **script** is like an **incantation** or a ritual. It's a sequence of actions that *uses* the spellbook (`require`) to actually make something happen.

  * **Libraries (`game_logic.lua`, `cards.lua`):** These files should only contain definitions. They define functions and data and, at the very end, `return` a table containing those tools. A library file should **never** run the game or print things on its own.
  * **Scripts (`main.lua`, `tests.lua`):** These are the "do-ers." Their job is to `require` the libraries and then call the functions to perform a task, whether it's playing the game or testing it.

By separating our code this way, we can `require` our `game_logic.lua` spellbook in our test file without worrying about the whole game starting up unexpectedly.

**2. The "Why" of Testing: A Promise to the Future**

An automated test is a **contract** or a **promise** you make about your code. When you test your `attack` function, you are promising: "I guarantee this function will always reduce the target's life by the correct amount." This protects your future self from breaking your game's most important rules.

**3. What Should We Test? Protecting the Crown Jewels**

Deciding *what* to test is a conscious effort. We focus on the "crown jewels": the core, stable rules of our game. The `attack` logic is a perfect example. It's a fundamental rule that many future features will depend on. We test it to ensure we're building on a solid foundation.

**4. `assert()` (The Sentinel's Alarm)**

This is our simple tool for checking promises. `assert(condition, "message")` is a silent guardian.

  * If the `condition` is `true`, it does nothing.
  * If the `condition` is `false`, it stops the program and shouts the error `message`.

### Your Quest: Forging the Shield

**Quest A: The Single-Strike Test**
Let's start by testing our most important "crown jewel."

1.  **Refactor into a Library:** Make sure your `game_logic.lua` file is a proper library. It should define the `attack` function and `return` it in a table. It should not run any game logic itself.
2.  **Create the Test Script:** Create a new file, `tests.lua`.
3.  **Setup:** In `tests.lua`, `require` your `game_logic.lua` library.
4.  **Craft the Actors:** Create two simple, predictable card tables by hand.
    ```lua
    local knight = { name = "Test Knight", attack = 7, life = 20 }
    local goblin = { name = "Test Goblin", attack = 3, life = 10 }
    ```
5.  **Execute and Assert:** Call the function and assert the promise about the outcome.
    `game_logic.attack(knight, goblin)`
    `assert(goblin.life == 3, "Single-strike test failed: Goblin's final health was not 3!")`
6.  **Run the Test:** Run `lua tests.lua`. If it passes silently, the first part of your shield is in place.

**Quest B: The Full Melee Simulation**
Now for the bigger test. To test the entire round, we need to make sure that logic also lives in our library.

1.  **The Refactor:** Create a new function in your `game_logic.lua` library called `run_round(player_cards, computer_cards)`. **Cut** the entire Grand Melee logic from `main.lua` and **paste** it into this new function. The function should `return` the final state of the two hands. Your `main.lua` should now be a pure **script**—it just requires libraries, generates random hands, and then calls `game_logic.run_round()`.
2.  **Craft the Battlefield:** Back in `tests.lua`, create two full, hand-crafted 3-card hands designed to have a predictable outcome.
3.  **Execute the Simulation:** Call your new round function: `local final_player_hand, final_computer_hand = game_logic.run_round(test_player_hand, test_computer_hand)`.
4.  **Assert the Final State:** Make a series of promises about what the battlefield should look like after the dust settles.
    ```lua
    print("Running full melee simulation test...")
    assert(final_player_hand[1].life == 12, "Player Card 1 failed health check.")
    assert(final_computer_hand[2].life <= 0, "Computer Card 2 should have been defeated.")
    print("Full melee simulation passed!")
    ```

### The Payoff

By building this sentinel's shield and organizing your code into libraries and scripts, you've adopted two of the most professional habits in programming. You can now change your game with confidence, knowing your sentinel will instantly warn you if you break one of your core promises.
