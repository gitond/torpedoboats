module Functions.GameBoardMutator where

import Control.Lens

import Datatypes.Board

-- replace cell (x,y) of board b with char c
gameBoardMutator :: Board -> Char -> Int -> Int -> Board
gameBoardMutator b c x y = (b & element y . element x .~ c)
