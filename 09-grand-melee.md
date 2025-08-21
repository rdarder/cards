## The Grand Melee 💥

-----

### The Story So Far...

You created an epic "First Clash" in the last unit! It was the first time your game felt truly interactive. But that single attack was just the opening move. A real battle is a chaotic melee where every creature gets a turn. As we'll see, making this happen introduces some tricky new challenges that will require some clever new tactics to solve.

### The Mission: What We'll Accomplish Today

Our mission is to implement a full battle round where all 6 cards on the table get to act. The program will:
1.  Create two 3-card hands for the player and computer.
2.  Intelligently determine the correct turn order, one turn at a time.
3.  Allow each living card to attack a living opponent.
4.  Print the final status of all cards after the battle is over.

---

### 1. The New Challenge: Who Attacks Next?

Our old "find the single fastest card" logic is broken now. Why? Because in a full round:
1.  A card that is defeated before its turn can't attack at all.
2.  Once a card takes its turn, it can't attack again in the same round.

Simply finding the fastest card over and over won't work. We might pick the same card twice, or pick a card that's already been defeated. We need a smarter way to track the state of the whole battlefield.

#### Our New Tactic: The Battlefield List

To solve this, we'll create **one single list** of all 6 cards on the battlefield. To avoid losing track of who owns each card, our list will hold small "turn marker" tables.

It's worth noting that this tactic isn't exactly how a human would do it. You'd just look at the table and intuitively know who's left and who is fastest. But a computer doesn't have intuition; it has a very narrow focus. We need to give it a very precise recipe (an **algorithm**) to follow so that it never misses a card or makes the wrong choice. This list is the first step in that recipe.

The structure for each item in our new list will be a table like this:
`{ card = { ... }, owner = "player", has_attacked = false }`

The `has_attacked = false` is a new **boolean** flag—our "light switch" for tracking who has already had their turn this round.

---

### 2. The Targeting Problem: Who Can Be Attacked?

The second big challenge is that an attacker can't target a card that has already been defeated. The opponent's hand might have 3 card slots, but only one or two might be valid, living targets.

#### Our New Tactic: Filtering for Valid Targets

This is the perfect place to use a technique called **filtering**. Filtering is the simple idea of building a new, temporary list from an old one, but only including the items that match a specific rule.

We'll look at the opponent's entire hand of 3 cards and build a *new, shorter list* that contains only the cards that are still standing (their `life` is greater than 0). This new list becomes our list of valid targets for that specific turn.

Remember our "list of shortcuts" concept: this new `valid_targets` list doesn't contain *copies* of the cards; it contains shortcuts to the originals. Damaging a card from this new list will damage the card in the opponent's actual hand.

---

### Your Quest: The Grand Melee

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

### The Troubleshooting Scroll

* **The same card attacks over and over!**
    * **Check:** You are likely forgetting to update the attacker's state after they attack. Make sure the line `next_attacker_info.has_attacked = true` is running correctly.
* **The program crashes trying to attack.**
    * **Check:** Are you checking if there are any `valid_targets` before trying to attack? If all opponents are defeated, your `valid_targets` list will be empty, and trying to pick a target (`valid_targets[1]`) will result in `nil`. Make sure your attack logic is inside an `if #valid_targets > 0 then ...` block.

