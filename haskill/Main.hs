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
handleKey (EventKey (Char 'q') Down _ _) w            = useEnergyP1 w 1
handleKey (EventKey (Char 'w') Down _ _) w            = useEnergyP1 w 2
handleKey (EventKey (Char 'e') Down _ _) w            = useEnergyP1 w 3
handleKey (EventKey (Char 'r') Down _ _) w            = useEnergyP1 w 4

handleKey (EventKey (Char 'z') Down _ _) w            = useEnergyP2 w 1
handleKey (EventKey (Char 'x') Down _ _) w            = useEnergyP2 w 2
handleKey (EventKey (Char 'c') Down _ _) w            = useEnergyP2 w 3
handleKey (EventKey (Char 'v') Down _ _) w            = useEnergyP2 w 4

handleKey _ w = w