module Main where
import World
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

pVel :: Float
pVel   = 310.0                                 -- paddle velocity

window :: Display
window = InWindow "Haskill" (800, 600) (10, 10)

main :: IO ()
main = play 
       window
       black
       60
       genesis
       drawEntities
       handleKey
       moveEntities
       
-- handle a or d keys to move left or right
handleKey :: Event -> World -> World
handleKey (EventKey (Char 'q') Down _ _) w            = playStrikeP1 w
handleKey (EventKey (Char 'w') Down _ _) w            = playHealP1 w
handleKey (EventKey (Char 'e') Down _ _) w            = playBashP1 w
handleKey (EventKey (Char 'r') Down _ _) w            = manaBlastP1 w

handleKey (EventKey (Char 'z') Down _ _) w            = playStrikeP2 w
handleKey (EventKey (Char 'x') Down _ _) w            = playHealP2 w
handleKey (EventKey (Char 'c') Down _ _) w            = playBashP2 w
handleKey (EventKey (Char 'v') Down _ _) w            = manaBlastP2 w

handleKey _ w = w