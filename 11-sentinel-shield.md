## The Sentinel's Shield (Protecting Your Code) 🛡️

-----

### The Story So Far...

You've built a truly complex and exciting "Grand Melee"\! But with this complexity comes a new danger. If you change one part of the code, how can you be sure you didn't accidentally break something else? Checking everything by hand after every change is slow and impossible. It's time to build a sentinel—an automated guard for your code.

### The Mission: What We'll Accomplish Today

Our mission is to pause on adding new game features and instead build a "test suite"—a separate script that automatically runs simulations and checks if our game logic behaves exactly as we promise it will. To do this, we'll first learn how to properly organize our code into reusable **modules**.

### The Spellbook: The Art of Guardianship

#### The Blueprint and the Factory: A New Way to Think About `require()`

You've already used `require()` to load your deck of cards, but now we're using it for something much more powerful: loading a whole collection of functions. Let's break down how it really works.

**The Blueprint (The Module File)**
Think of a module file (like `game_logic.lua`) as a **factory blueprint**. It's a piece of paper with a list of instructions written on it from top to bottom. These instructions might say "define an `attack` function" or "figure out the rules for `summon`." A blueprint doesn't do anything on its own; it just sits there, holding the plans.

**The "Build It\!" Command (`require`)**
The `require()` command is like handing the blueprint to the factory foreman and shouting, "**Build it\!**" When your code says `require("game_logic")`, Lua finds that 'blueprint' file, runs all the code inside it from top to bottom exactly once, and builds whatever the blueprint describes.

**The Finished Product (`return`)**
A factory needs to give you something back when it's done. The `return` statement at the very end of the module file is the "shipping dock." Whatever you tell the module to `return` is the finished product that gets handed back. In our case, the last line is `return MyToolbox`, which tells the factory, "After you've built all the tools, pack them into this toolbox and hand the whole toolbox back."

**Putting it on Your Workbench (The Variable)**
Just telling the factory to build something isn't enough; you need to catch the finished product. That's the final piece of the puzzle: `local GameLogic = require("game_logic")`.

This line tells the whole story:

  * **`require("game_logic")`**: "Build me everything on the `game_logic` blueprint\!"
  * **`local GameLogic = ...`**: "Take the finished toolbox you hand me back and put it on my workbench with the label **GameLogic**."

After this line runs, your `GameLogic` toolbox is ready to go, and you can start using the tools inside it, like `GameLogic.attack()`.

**A Quick Note on Naming**
You can name your toolbox variable anything, but it's a good habit to be consistent. A common style is to use **`CamelCase`** for module names (like `GameLogic` or `CardLibrary`). This makes it easy to see when you're using a tool from an external toolbox versus a simple variable.

-----

#### `assert()` (The Sentinel's Alarm)

This is our simple tool for checking promises. `assert(condition, "message")` is a silent guardian.

  * If the `condition` is `true`, it does nothing.
  * If the `condition` is `false`, it stops the program and shouts the error `message`.

### Your Quest: Forging the Shield

**Quest A: The Single-Strike Test**

Let's start by testing a single piece of our game's logic.

1.  **Create Your Toolbox:** Create a new file, `game_logic.lua`. This will be our module. Inside it, create an `attack(attacker, target)` function. Make sure your module returns its main table at the end.
2.  **Create the Test Script:** Create a new file, `tests.lua`.
3.  **Setup:** In `tests.lua`, `require` your new module: `local GameLogic = require("game_logic")`.
4.  **Craft the Actors:** Create two simple, predictable card tables by hand.
    ```lua
    local knight = { name = "Test Knight", attack = 7, life = 20 }
    local goblin = { name = "Test Goblin", attack = 3, life = 10 }
    ```
5.  **Execute and Assert:** Call the function from your toolbox and assert the promise about the outcome.
    ```lua
    GameLogic.attack(knight, goblin)
    assert(goblin.life == 3, "Single-strike test failed: Goblin's final health was not 3!")
    ```
6.  **Run the Test:** Run `lua tests.lua`. If it passes silently, the first part of your shield is in place.

**Quest B: The Full Melee Simulation**

Now let's move our bigger game logic into the toolbox so we can test it.

1.  **The Refactor:** Open `game_logic.lua`. Create a new function in your toolbox called `run_round(player_cards, computer_cards)`. **Cut** the entire Grand Melee logic from your old `main.lua` and **paste** it into this new function. The function should `return` a single table containing the final state of the two hands.
2.  **Update Your `main.lua`:** Your `main.lua` should now be a pure script. Its job is to `require` the `game_logic` toolbox, generate the starting hands, and then call `GameLogic.run_round()` to run the battle.
3.  **Craft the Battlefield:** Back in `tests.lua`, create two full, hand-crafted hands designed to have a predictable outcome.
4.  **Execute the Simulation:** Call your new round function, capturing the single table it returns.
    ```lua
    local final_state = GameLogic.run_round(test_player_hand, test_computer_hand)
    ```
5.  **Assert the Final State:** Make a series of promises about what the battlefield should look like after the dust settles. Access the hands through the `final_state` table.
    ```lua
    print("Running full melee simulation test...")
    assert(final_state.player[1].life == 13, "Player Hero failed health check.")
    assert(final_state.computer[1].life == 7, "Computer Minion failed health check.")
    print("Full melee simulation passed!")
    ```

### The Payoff

By building this sentinel's shield and organizing your code into modules, you've adopted one of the most professional habits in programming. You can now change your game with confidence, knowing your sentinel will instantly warn you if you break one of your core promises.
