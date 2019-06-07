module Graphics where

import qualified Graphics.Rendering.OpenGL as GL
import qualified Graphics.UI.GLFW as GLFW

import Imports
import Types

ratio :: (GL.GLfloat, GL.GLfloat)
ratio = (1, 1)

multiplier :: (GL.GLsizei)
multiplier = 400

width :: GL.GLsizei
width = round $ ratiox * fromIntegral multiplier

height :: GL.GLsizei
height = round $ ratioy * fromIntegral multiplier

ratiox =
  case ratio of
    (x, _) -> x

ratioy =
  case ratio of
    (_, y) -> y

displayScalex =
  if ratiox > ratioy
    then ratioy / ratiox
    else 1.0

displayScaley =
  if ratioy < ratiox
    then ratiox / ratioy
    else 1.0
