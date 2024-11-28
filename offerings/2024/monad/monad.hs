import Control.Monad.State

-- Define a type alias for the State monad that carries an `Int` as state
type Counter = State Int

-- Increment the counter by 1
increment :: Counter Int
increment = do
  current <- get          -- Get the current state
  let next = current + 1
  put next                -- Update the state
  return next             -- Return the updated value

-- Run a sequence of increments
runCounter :: Counter [Int]
runCounter = do
  val1 <- increment
  val2 <- increment
  val3 <- increment
  return [val1, val2, val3]

-- Main function to execute
main :: IO ()
main = do
  let initialState = 0
      (result, finalState) = runState runCounter initialState
  putStrLn $ "Sequence of results: " ++ show result
  putStrLn $ "Final state: " ++ show finalState

