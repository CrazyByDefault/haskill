module Main(main) where


import Graphics.Gloss
import Data.Word
import Data.ByteString (ByteString, pack)

purple :: [Word8]
purple = [128, 0, 128, 64]
dimensions = [1920, 1080] 

drawing :: Picture
drawing = pictures
  [ translate 0 ((last dimensions/8)-(last dimensions)/2) $ color paddleColor $ rectangleSolid (head dimensions) (last dimensions/4)
  , translate (720) ((last dimensions/8)-(last dimensions)/2) $ color ballColor $ rectangleSolid (head dimensions/8) (last dimensions/4)
  , translate (-720) ((last dimensions/8)-(last dimensions)/2) $ color ballColor $ rectangleSolid (head dimensions/8) (last dimensions/4)
  , translate (0) ((last dimensions/8)-(last dimensions)/2) $ color ballColor $ rectangleSolid (head dimensions/8) (last dimensions/4)
  , translate (-360) ((last dimensions/8)-(last dimensions)/2) $ color ballColor $ rectangleSolid (head dimensions/8) (last dimensions/4)
  , translate (360) ((last dimensions/8)-(last dimensions)/2) $ color ballColor $ rectangleSolid (head dimensions/8) (last dimensions/4)
  ]
  where
    ballColor = addColors (bright yellow) orange
    paddleColor = light (bright red)

-- ourPicture :: Picture
-- ourPicture = bitmapOfByteString 100 100 (BitmapFormat TopToBottom PxRGBA) bitmapData True

main :: IO ()
main =  animate (InWindow "t" ((round (head dimensions)), (round (last dimensions))) (800,0)) white draw -- (Circle 80)

draw :: Float -> Picture
draw t
   | t <= 0    = blank                                             -- in the first secon             -- between 1s and 2s
   | otherwise = drawing 