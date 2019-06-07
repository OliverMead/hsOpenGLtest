module Callbacks where

import qualified Graphics.Rendering.OpenGL as GL
import qualified Graphics.UI.GLFW as GLFW

import Graphics
import Imports
import Types

errorCallback :: GLFW.Error -> String -> IO ()
errorCallback errorCode description = do
  GLFW.terminate
  die $ "Error: " ++ description

closeCallback :: GLFW.Window -> IO ()
closeCallback win =
  putStrLn "Closed Window" >> GLFW.destroyWindow win >> GLFW.terminate >>
  exitSuccess

keyCallbackGen :: InputHandler -> GLFW.KeyCallback
keyCallbackGen f win = f

bufferSizeCallback :: GLFW.Window -> Int -> Int -> IO ()
bufferSizeCallback theWindow containerWidth containerHeight = do
  GLFW.makeContextCurrent $ Just theWindow
  GL.viewport $=
    (GL.Position xoffset yoffset, GL.Size newDisplayWidth newDisplayHeight)
  GL.matrixMode $= GL.Projection
  GL.loadIdentity
  GL.ortho2D 0 (realToFrac newDisplayWidth) (realToFrac newDisplayHeight) 0
  where
    newDisplayWidth :: GL.GLsizei
    newDisplayWidth
      | containerTooTall = round $ scaledWidth / displayScalex
      | otherwise = round scaledHeight
    newDisplayHeight :: GL.GLsizei
    newDisplayHeight
      | containerTooWide = round $ scaledHeight / displayScaley
      | otherwise = round scaledWidth
    xoffset :: GL.GLsizei
    xoffset
      | containerTooWide =
        (round . fromIntegral $ containerWidth `div` 2) -
        newDisplayWidth `div` 2
      | otherwise = 0
    yoffset :: GL.GLsizei
    yoffset
      | containerTooTall =
        (round . fromIntegral $ containerHeight `div` 2) -
        newDisplayHeight `div` 2
      | otherwise = 0
    containerTooTall = fromIntegral containerWidth < scaledHeight
    containerTooWide = fromIntegral containerHeight < scaledWidth
    scaledWidth = fromIntegral containerWidth * displayScalex
    scaledHeight = fromIntegral containerHeight * displayScaley
