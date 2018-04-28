module World where

import Graphics.Gloss
import Entity
import Entity.Paddle
import Entity.Ball

type Score = Int
type Energy = Int
type Health = Int

data World = World Paddle Ball Score Energy Energy Health Health
-- data World = World Paddle Ball Score

-- starting world
genesis :: World
genesis =  World (Paddle 0.0 (-240.0) 128 32 0.0)
                 (Ball 0.0 0.0 8.0 0 600)
                 0
                 0
                 0
                 100
                 100
           
-- display text in the top-left corner
drawTextTL message = Translate (-390) 288
                 $ Color white
                 $ Scale 0.1 0.1
                 $ Text message

drawTextTR message = Translate (305) 288
                 $ Color white
                 $ Scale 0.1 0.1
                 $ Text message

drawTextBL message = Translate (-390) (-288)
                 $ Color white
                 $ Scale 0.1 0.1
                 $ Text message

drawTextBR message = Translate (315) (-288)
                 $ Color white
                 $ Scale 0.1 0.1
                 $ Text message


-- draw the paddle, ball, and score
drawEntities :: World -> Picture
drawEntities (World p b s e1 e2 h1 h2) = Pictures [ render p
                                      , render b
                                      , drawTextTL 
                                        $ "Energy 1: " ++ show e1
                                      , drawTextTR
                                        $ "Energy 2: " ++ show e2
                                      , drawTextBL
                                        $ "Health : " ++ show h1
                                      , drawTextBR
                                        $ "Health : " ++ show h2 ]

-- move the paddle based on its velocity, check if the ball bounces, and check
-- if score needs to be reset or incremented
moveEntities :: Float -> World -> World
moveEntities time (World p b s e1 e2 h1 h2) =
  let p' = move p time; b' = ballMove b p time; s'  = checkScore b b' s; e1' = checkEnergy b b' e1; e2' = checkEnergy b b' e2 in World p' b' s' e1' e2' h1 h2

-- Change the paddle's velocity to the given float 
-- movePaddle :: World -> Float -> World
-- movePaddle (World p b s) vel =  World (changeDir p vel) b s
                          
-- See if the old ball was hitting the correct wall, then once the updated
-- version of the ball has bounced from the wall, update score accourdingly
checkScore :: Ball -> Ball -> Score -> Score
checkScore oldball newball score
  -- if the ball has hit the bottom, reset score
  | bottom newball <= (-290.0) && 
    bottom oldball > (-290.0) = score + 1
                                
  -- if the ball has hit the ceiling, increment score
  | top newball >= 290.0 &&  
    top oldball < 290.0       = score + 1
                                
  | otherwise                 = score

checkEnergy :: Ball -> Ball -> Energy -> Energy
checkEnergy oldball newball energy
  -- if the ball has hit the bottom, reset Energy
  | bottom newball <= (-290.0) && 
    bottom oldball > (-290.0) = energy + 1
                                
  -- if the ball has hit the ceiling, increment Energy
  | top newball >= 290.0 &&  
    top oldball < 290.0       = energy + 1
                                
  | otherwise                 = energy


useEnergyP1 :: World -> World
useEnergyP1 (World p b s e1 e2 h1 h2) =
  if e1 >= 1 then World p b s (e1 - 1) e2 h1 h2 else World p b s e1 e2 h1 h2

useEnergyP2 :: World -> World
useEnergyP2 (World p b s e1 e2 h1 h2) =
  if e2 >= 1 then World p b s e1 (e2 - 1) h1 h2 else World p b s e1 e2 h1 h2

-- Strikes - Cost: 1, Damage: 5, Heal: 0
playStrikeP1 :: World -> World
playStrikeP1 (World p b s e1 e2 h1 h2) =
  if e1 >= 1 then World p b s (e1 - 1) e2 h1 (h2 - 5) else World p b s e1 e2 h1 h2

playStrikeP2 :: World -> World
playStrikeP2 (World p b s e1 e2 h1 h2) =
  if e2 >= 1 then World p b s e1 (e2 - 1) (h1 - 5) h2 else World p b s e1 e2 h1 h2

-- Heals - Cost: 1, Damage: 0, Heal: 5
playHealP1 :: World -> World
playHealP1 (World p b s e1 e2 h1 h2) =
  if e1 >= 1 then World p b s (e1 - 1) e2 (h1 + 5) h2 else World p b s e1 e2 h1 h2

playHealP2 :: World -> World
playHealP2 (World p b s e1 e2 h1 h2) =
  if e2 >= 1 then World p b s e1 (e2 - 1) h1 (h2 + 5) else World p b s e1 e2 h1 h2
