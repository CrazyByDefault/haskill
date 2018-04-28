module Main(main) where


import Graphics.Gloss
import Data.Word
import Data.ByteString (ByteString, pack)

purple :: [Word8]
purple = [128, 0, 128, 64]

drawing :: Picture
drawing = pictures
  [ translate 0 (-150) $ color paddleColor $ rectangleSolid 400 100
  , translate (150) (-150) $ color ballColor $ rectangleSolid 50 70
  , translate (-150) (-150) $ color ballColor $ rectangleSolid 50 70
  , translate (-50) (-150) $ color ballColor $ rectangleSolid 50 70
  , translate (50) (-150) $ color ballColor $ rectangleSolid 50 70
  ]
  where
    ballColor = addColors (bright yellow) orange
    paddleColor = light (bright red)

-- ourPicture :: Picture
-- ourPicture = bitmapOfByteString 100 100 (BitmapFormat TopToBottom PxRGBA) bitmapData True

main :: IO ()
main =  animate (InWindow "t" (400,400) (800,0)) white pictures[texture1] -- (Circle 80)

draw :: Float -> Picture
draw t
   | t <= 0    = blank                                             -- in the first secon             -- between 1s and 2s
   | otherwise = drawing 