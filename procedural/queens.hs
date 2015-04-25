import System.Environment
import Data.Array.IO
import Control.Monad

main = do
    cs <- getArgs
    let size = read $ head cs :: Int
    row <- newArray (1, size) True :: IO (IOArray Int Bool)
    up <- newArray (2, 2 * size) True :: IO (IOArray Int Bool)
    down <- newArray (1 - size , size - 1) True :: IO (IOArray Int Bool)
    board <- newArray (1, size) 0 :: IO (IOArray Int Int)
    let queen n = if n > size
        then do
            forM_ [1..size-1] (\i -> readArray board i >>= putStr.(++ " ").show)
            readArray board size >>= putStrLn.show
        else
            forM_ [1..size] (\i -> do
                r <- readArray row i
                u <- readArray up (n+i)
                d <- readArray down (n-i)
                when (r && u && d) $ do
                    writeArray row i False
                    writeArray up (n+i) False
                    writeArray down (n-i) False
                    writeArray board n i
                    queen (n + 1)
                    writeArray row i True
                    writeArray up (n+i) True
                    writeArray down (n-i) True)
    queen 1
