# Haskill
## A live 2 player card battle game., written in Haskell. 

To build -  
`$ cabal install gloss`  
`$ ghc --make haskill/Main.hs`

To run -  
`$ ./Main`

## The Game

The game is a live 2 player card battle game. Each player (left and right) has energy that increases with time, as well as health.

The keybinds for P1 are Q, W, E and R, and for P2 are Z, X, C and V.

> Q/Z - Strike - Cost: 1, Damage: 5, Heal: 0  
> W/X - Heal - Cost: 1, Damage: 0, Heal: 5  
> E/C - Bash - Cost: 2, Damage: 12, Heal: 0  
> R/V - Mana Blast - Cost: 5, Damage: 3xTotalEnergy, Heal: 12  

## What we did

This game is based off of an old Haskell game of pong, which we repurposed for our use. The ball has been made invisible, and acts as our timer. We chose this approach over using the inbuilt time function as controlling the velocity of the ball gives us greater control over the rate at which players gain energy.

The project is based on [Gloss](https://hackage.haskell.org/package/gloss)

## TODO - 

* Assets
* More moves for players
* Variety of players with different movesets