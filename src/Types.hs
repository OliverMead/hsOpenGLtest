module Types where

import qualified Graphics.Rendering.OpenGL as GL
import qualified Graphics.UI.GLFW as GLFW

import Imports

data Action =
  Action (IO Action)

type InputHandler
   = (GLFW.Key -> Int -> GLFW.KeyState -> GLFW.ModifierKeys -> IO ())
