module Entity.Paddle where

import Graphics.Gloss
import Entity

--            Paddle x     y     w     h     xv
data Paddle = Paddle Float Float Float Float Float
                                

-- change the  direction of the paddle, return a paddle that needs a new x-vel
changeDir :: Paddle -> Float -> Paddle
changeDir (Paddle x y w h v) = Paddle x y w h


paddleColor = Color (makeColor 0.6 0.6 0.6 0.0)

  
  move (Paddle x y w h v) time
    | x <= (-336) && v <= 0 = Paddle x y w h v
    | x >=   336  && v >= 0 = Paddle x y w h v
    | otherwise = Paddle (x + v * time) y w h v 

  render (Paddle x y w h _) = paddleColor
                $ Translate x y
                $ rectangleSolid w h
