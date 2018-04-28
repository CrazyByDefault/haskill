module Deck
( Card(..), drawCard )
where


data Card = Card { damage :: Int, block :: Int, name :: String, manaCost :: Int } deriving (Show)

type Deck' = [Card]

defaultDeck :: Deck'
defaultDeck = (replicate 5 Card {damage = 5, block = 0, name = "Strike", manaCost = 1})
    ++ (replicate 4 Card {damage = 0, block = 6, name = "Defend", manaCost = 1})

deck = defaultDeck

drawCard :: Card
drawCard = do
    topCard = (head deck)
    drop 1 deck
    return topCard