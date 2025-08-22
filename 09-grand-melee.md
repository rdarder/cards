## The Grand Melee 💥

-----

### The Story So Far...

You created an epic "First Clash" in the last unit\! It was the first time your game felt truly interactive. But that single attack was just the opening move. A real battle is a chaotic melee where every creature gets a turn. As we'll see, making this happen introduces some tricky new challenges that will require some clever new tactics to solve.

### The Mission: What We'll Accomplish Today

Our mission is to implement a full battle round where all 6 cards on the table get to act. The program will:

1.  Create two 3-card hands for the player and computer.
2.  Intelligently determine the correct turn order, one turn at a time.
3.  Allow each living card to attack a living opponent.
4.  Print the final status of all cards after the battle is over.

-----

### The New Challenge: Who Attacks Next?

Our old "find the single fastest card" logic is broken now. Why? Because in a full round:

1.  A card that is defeated before its turn can't attack at all.
2.  Once a card takes its turn, it can't attack again in the same round.

We need a smarter way to track the state of the battlefield.

#### Our New Tactic: The Battlefield List

To solve this, we'll create **one single list** of all 6 cards on the battlefield. To avoid losing track of who owns each card, our list will hold small "turn marker" tables. Each one will look like this:

`{ card = { ... }, owner = "player", has_attacked = false }`

**New Technique: Nested Access**
Think of this structure like a folder (the outer table) that contains a character sheet (`card`) inside it. To get the speed from the character sheet, you first have to open the folder, then look at the sheet. In code, you just chain the dots together: `my_folder.character_sheet.speed`. You're just telling the computer the path to the data you want.

-----

### The Spellbook: A Few New Spells

Before we start the quest, let's add two powerful new modifications to our `if` statement spell.

**1. Combining Rules with `and`**
What if you need to check multiple things at once? Like a magic door that requires you to have a key **AND** be a certain level. The `and` keyword lets you chain rules together. The whole `if` statement is only `true` if *every single condition* is `true`.

```lua
if has_key == true and player_level > 10 then
  print("The door opens!")
end
```

We'll need this for our attack algorithm to check if a card is alive **AND** hasn't attacked **AND** is the fastest so far.

**2. A Shortcut for `if`: Checking for "Something"**
Lua's `if` statement has a handy shortcut. If you give it a variable directly, like `if my_variable then...`, it treats it as `true` as long as the variable is not `nil` or `false`. 

This is perfect for our quest. After we search for an attacker, we can just write `if next_attacker_info then` to check if we actually found one. If our search failed, the variable would still be `nil`, and the code inside the `if` block wouldn't run.

In general you'll want to be careful with these shortcuts, because when we have a bug, this shortcut may hide it and just get the program through instead of giving you an error. 

-----

### Your Quest: The Grand Melee

**Step 1: Setup**

1.  Generate the `player_hand` and `computer_hand` with 3 random cards each.
2.  Display the starting cards so the player knows the battlefield.

**Step 2: Create the Battlefield List**

1.  Create an empty table: `local battlefield = {}`.
2.  Use a `for` loop to go through the `player_hand`. For each card, `table.insert` a new table `{ card = the_card, owner = "player", has_attacked = false }` into your `battlefield` list.
3.  Do the same for the `computer_hand`, using `owner = "computer"`.

**Step 3: The Main Loop**

**New Tactic: A Loop Inside a Loop**
Our quest requires us to do something for each of the 6 turns. That's a `for` loop. But *inside* each turn, we have to search through all 6 cards on the battlefield to find the attacker. That's *another* `for` loop\! Putting a loop inside another is a normal and powerful pattern. Think of it like dealing cards: for each player (outer loop), you deal them 5 cards (inner loop).

Now, let's write the main loop for the turns: `for turn_number = 1, 6 do ... end`

**Inside the Loop (For Each Turn):**

**A. Find the Next Attacker**

  * This is our core algorithm. We need to search the `battlefield` to find the best possible attacker for this turn.

**New Tactic: The "Impossibly Low" Starting Number**
To find the highest speed, we need a number to start comparing against. We'll create a variable `local highest_speed = -1`. Why -1? Because we know all card speeds are 1 or higher. By starting with an impossibly low number, we guarantee that the very first *living, ready* card we check will have a higher speed and will become our first candidate for "fastest attacker".

  * Create two variables before the search: `local next_attacker_info = nil` and `local highest_speed = -1`.
  * Now, loop through the `battlefield` list. Inside this search loop, use your new `and` spell in an `if` statement:
    `if info.card.life > 0 and info.has_attacked == false and info.card.speed > highest_speed then ...`
  * If all three are true, you've found a new best attacker for this turn\! Update your variables: `highest_speed = info.card.speed` and `next_attacker_info = info`.
  * After this search loop finishes, `next_attacker_info` will hold the correct card to attack this turn.

**B. The Attack Sequence (If an attacker was found)**

  * Use your new `if` shortcut to check if an attacker was actually found: `if next_attacker_info then ... end`.
  * **Determine & Filter Targets:** Inside that `if`, figure out which hand is the enemy's and build a `valid_targets` list containing only their living cards.
  * **Perform the Attack:** Check if there are any valid targets. If so, let the player or computer choose a target from the `valid_targets` list and perform the attack calculation.
  * **Update State:** This is critical\! After the attack, mark the attacker's turn as complete: `next_attacker_info.has_attacked = true`.

**Step 4: The Aftermath**

1.  After the main `for turn_number = 1, 6 do` loop is finished, print a "--- Round Over ---" message.
2.  Loop through the original `player_hand` and `computer_hand` and display the final status of all 6 cards.

### The Troubleshooting Scroll

  * **The same card attacks over and over\!**
      * **Check:** You are likely forgetting to update the attacker's state. Make sure the line `next_attacker_info.has_attacked = true` is running correctly.
  * **The program crashes trying to attack.**
      * **Check:** Are you checking if there are any `valid_targets`? If all opponents are defeated, your `valid_targets` list will be empty, and trying to pick a target (`valid_targets[1]`) will result in `nil`. Make sure your attack logic is inside an `if #valid_targets > 0 then ...` block.
