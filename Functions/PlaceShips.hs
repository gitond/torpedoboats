module Functions.PlaceShips where

import Datatypes.Board
import Functions.GameBoardMutator

placeShips :: Board -> Board -> Int -> Int -> Int -> String -> (Board,Board)
placeShips pBoard eBoard shipsToPlace pInpX pInpY vertChoice = ((gameBoardMutator pBoard '□' pInpX pInpY),eBoard)
