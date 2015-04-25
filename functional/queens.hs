import System.Environment

main = do
    cs <- getArgs
    putStr $
        unlines.map (unwords.reverse.map (\x->show $ snd x)) $
        nqueens (read $ head cs :: Int)

nqueens size =
    queen size
    where
        queen 0 = [[]]
        queen n = concat $ map (\x->map (\y->(n,y):x) $ filter (\y->(not $ any (== y) $ map snd x) && (not $ any (== 0) $ map (\z->n-fst z-abs(y-snd z)) x)) [1..size]) $ queen (n-1)
