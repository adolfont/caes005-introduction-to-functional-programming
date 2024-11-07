-- ChatGPT helped me create these examples https://chatgpt.com/share/672cd10e-29c4-8002-96df-56cf62c2f611


-- A curried function that takes two arguments
add :: Int -> Int -> Int
add x y = x + y
-- Actually, it is a function that returns another function!

----------------------

add 3 5

resultCurried = add 3 5  -- This will give 8

add3 = add 3  -- This will return a function such as add3 x = 3 + y

add3 10
resultAdd3 = add3 10 -- This will give 13

----------------------

-- The uncurried version of add
-- Actually, it is a function that receives a tuple as an argument

add' :: (Int, Int) -> Int
add' (x, y) = x + y


----------------------
add' (3, 5)

resultUncurried = add' (3, 5)  -- This will also give 8

add3B = add'(3) -- This does not work

----------------------

-- Using curry to convert add' (uncurried) to a curried form
curriedAdd = curry add' 

-- Using uncurry to convert add (curried) to an uncurried form
uncurriedAdd = uncurry add

----------------------
curriedAdd 3 5
resultFromCurriedAdd = curriedAdd 3 5       -- Gives 8
uncurriedAdd (3,5)
resultFromUncurriedAdd = uncurriedAdd (3,5) -- Gives 8

