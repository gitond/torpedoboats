--import Control.Lens
import Data.Char
import Data.List
import Data.Maybe

import Datatypes.Board
import Functions.GameBoardPrinter
import Functions.GameBoardMutator
import Functions.PlaceShips

main = do
    putStrLn " TORPEDOBOATS: A Battleship game in Haskell"
    putStrLn " written by Botond Ortutay"
--    putStrLn ""
--    putStrLn "note: we recommend you play with a terminal with a height of at least 30 characters"

    let emptyBoard = [[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']]
    gameLoop emptyBoard emptyBoard 5

gameLoop :: Board -> Board -> Int -> IO()
gameLoop pBoard eBoard shipsToPlace = do
    putStrLn "Player Board:"
    gameBoardPrinter pBoard
    putStrLn "Enemy Board:"
    gameBoardPrinter eBoard

    putStrLn "Input here: "
    inp <- getLine

    if inp == "quit"
        then putStrLn ""
    else if (elem (toLower (inp !! 0)) "abcdefghij") && (isDigit (inp !! 1)) && ((length inp) == 2)
     -- checking whether input points to a valid grid cell (x:a-j, y:0-9, input length == 2)
        then
        (if shipsToPlace > 0 then do -- placing ships
            putStrLn "(V)ertical or (H)orizontal ship? "
            vertChoice <- getLine
            gameLoop (fst (placeShips pBoard eBoard shipsToPlace (fromMaybe (-1) (elemIndex (toLower (inp !! 0)) "abcdefghij")) (digitToInt (inp !! 1)) vertChoice)) (snd (placeShips pBoard eBoard shipsToPlace (fromMaybe (-1) (elemIndex (toLower (inp !! 0)) "abcdefghij")) (digitToInt (inp !! 1)) vertChoice)) (shipsToPlace - 1)
        else do -- shooting
            gameLoop pBoard (gameBoardMutator eBoard '~' (fromMaybe (-1) (elemIndex (toLower (inp !! 0)) "abcdefghij")) (digitToInt (inp !! 1))) shipsToPlace
        )
    else do
        putStrLn "Sorry didn't quite get that"
        gameLoop pBoard eBoard shipsToPlace
