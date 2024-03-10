module Functions.GameBoardPrinter where

import Datatypes.Board

gameBoardPrinter :: Board -> IO()
gameBoardPrinter b = do
    xCoordPrinter
    playAreaPrinter b 0

xCoordPrinter :: IO()
xCoordPrinter = putStrLn "    A | B | C | D | E | F | G | H | I | J |"

playAreaPrinter :: Board -> Int -> IO()
playAreaPrinter (r:b) i = do
    putStr " "
    putStr (show i) -- show is the opposite of read (it turns i (Int) to string for use with putStr)
    putStr "|"
    recursiveRowPrinter r -- r should be current row
    playAreaPrinter b (i + 1) -- b should be the tail of the input, meaning {the input}-{the first element (r)}

-- case: no rows left: stop recursion, print empty line
playAreaPrinter r i = do
    putStrLn ""

recursiveRowPrinter :: Row -> IO()
recursiveRowPrinter (cell:r) = do
    putStr " "
    putStr [cell]
    putStr " |"
    recursiveRowPrinter r

-- case: no cells left: stop recursion, print empty line
recursiveRowPrinter r = do
    putStrLn ""
