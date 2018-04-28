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