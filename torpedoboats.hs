--import Control.Lens

import Datatypes.Board
import Functions.GameBoardPrinter
import Functions.GameBoardMutator

main = do
    putStrLn " TORPEDOBOATS: A Battleship game in Haskell"
    putStrLn " written by Botond Ortutay"

    let emptyBoard = [[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']]
    gameLoop emptyBoard True

gameLoop :: Board -> Bool -> IO()
gameLoop board setupPhaseOn = do
    gameBoardPrinter board

    putStrLn "Input here: "
    inp <- getLine

    if inp == "quit"
        then putStrLn ""
    else gameLoop (gameBoardMutator board 'b' 0 4) True
