module Main where
  {-import Graphics.Rendering.OpenGL as GL
import Graphics.Rendering.OpenGL (($=))
import Graphics.UI.GLFW as GLFW

import Control.Monad
import Data.IORef
import System.Environment (getArgs, getProgName)
import System.Exit
import System.IO
-}

import qualified Graphics.Rendering.OpenGL as GL
import qualified Graphics.UI.GLFW as GLFW

import Callbacks
import Graphics
import Imports
import Lib
import Types

main = do
  args <- getArgs
  prog <- getProgName
  initialise 1 renderer
  exitSuccess

initialise interval renderer = do
  initWorked <- GLFW.init
  case initWorked of
    False -> errorCallback GLFW.Error'NotInitialized "Failed to init"
    True -> do
      GLFW.setErrorCallback $ Just errorCallback
      maybeWindow <- GLFW.createWindow 800 400 "GLFW Demo" Nothing Nothing
      case maybeWindow of
        Nothing ->
          errorCallback GLFW.Error'NotInitialized "Failed to create window"
        Just theWindow -> do
          GLFW.makeContextCurrent $ Just theWindow
          GLFW.setWindowCloseCallback theWindow $ Just closeCallback
          GLFW.setKeyCallback theWindow . Just . keyCallbackGen . inputHandler $
            theWindow
          GLFW.setFramebufferSizeCallback theWindow $ Just bufferSizeCallback
          GLFW.swapInterval interval
          GL.viewport $= (GL.Position 0 0, GL.Size 400 400)
          loop theWindow renderer
          -- GLFW.destroyWindow theWindow
  -- GLFW.terminate

loop :: GLFW.Window -> (GLFW.Window -> IO ()) -> IO ()
loop window render = do
  shouldbool <- GLFW.windowShouldClose window
  if shouldbool
    then return ()
    else do
      GL.clearColor $= (GL.Color4 0.15625 0.15625 0.15625 1.0)
      GL.clear [GL.ColorBuffer]
      GLFW.swapBuffers window
      GLFW.pollEvents
      loop window

renderer
