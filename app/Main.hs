module Main where

import qualified Graphics.Rendering.OpenGL     as GL
import qualified Graphics.UI.GLFW              as GLFW

import           Callbacks
import           Graphics
import           Imports
import           Lib
import           REngine
import           Types

main = do
  args <- getArgs
  prog <- getProgName
  initialise 1 renderer
  exitSuccess

renderer = do
  stuff

initResources :: IO Descriptor
initResources = do
  triangle <- GL.genObjectName
  GL.bindVertexArrayObject $= Just triangle
  let verts =
        [GL.Vertex2 (-0.5) (-0.5), GL.Vertex2 0.5 (-0.5), GL.Vertex2 0.0 0.5]
      numVerts = length vertices
  arrayBuffer <- GL.genObjectName
  GL.bindBuffer GL.ArrayBuffer $= Just arrayBuffer
  withArray verts $ \ptr -> do
    let size = fromIntegral (numVerts * sizeOf (head verts))
    bufferData GL.ArrayBuffer $= (size, ptr, StaticDraw)
  program <- loadShaders

  vbo :: GL.GLuint
