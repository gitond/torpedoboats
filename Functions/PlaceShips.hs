module Functions.PlaceShips where

import Datatypes.Board
import Functions.GameBoardMutator

placeShips :: Board -> Board -> Int -> Int -> Int -> String -> (Board,Board)
placeShips pBoard eBoard shipsToPlace pInpX pInpY vertChoice = ((fst (modifyOnValidInput pBoard pInpX pInpY)),(snd (modifyOnValidInput pBoard pInpX pInpY)))

-----------------------------
-- [Logic of placing ships] --
-----------------------------
-- For player: check placement validity
-- Is placement valid?
-- -- If yes: place ship. -> Enemy ship placement
-- -- If no: error message. Do not modify boards -> Returns
-- Enemy ship placement: Check validity for random coord val
-- Is it valid?
-- -- If yes: place ship. -> Returns
-- -- If no: -> Enemy ship placement
-- Returns: (pBoard,eBoard)

modifyOnValidInput :: Board -> Int -> Int -> (Board,Board)
modifyOnValidInput pBoard pInpX pInpY = ((gameBoardMutator pBoard '□' pInpX pInpY),pBoard)
