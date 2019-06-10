module Lib where

import qualified Graphics.Rendering.OpenGL     as GL
import qualified Graphics.UI.GLFW              as GLFW

import           Imports
import           Types

inputHandler :: GLFW.Window -> InputHandler
inputHandler win key code state mod
  | key == GLFW.Key'Escape && state == GLFW.KeyState'Pressed
  = GLFW.setWindowShouldClose win True
  | otherwise
  = return ()
