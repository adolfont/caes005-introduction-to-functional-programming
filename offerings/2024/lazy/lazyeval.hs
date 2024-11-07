{-# LANGUAGE InstanceSigs #-}

-- Private link https://claude.ai/chat/87e8d68e-5414-45b3-b74b-c99a3247e70a

import Data.List (take, drop)

-- Define an infinite list of Fibonacci numbers
fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (drop 1 fibs)

-- Define a function that takes the first n Fibonacci numbers
takeFibs :: Int -> [Integer]
takeFibs n = take n fibs

main :: IO ()
main = do
  let first10Fibs = takeFibs 10
  print first10Fibs
  -- Output: [1,1,2,3,5,8,13,21,34,55]

  -- Now, let's try taking the first 1000 Fibonacci numbers
  let first1000Fibs = takeFibs 1000
  print (length first1000Fibs)
  -- Output: 1000
  -- Notice that the program doesn't hang or use an excessive amount of memory, even though we're working with an infinite list.