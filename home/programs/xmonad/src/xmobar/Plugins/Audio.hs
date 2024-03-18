module Plugins.Audio where

import Xmobar
import Xmobar.Run.Timer (doEveryTenthSeconds)
import System.Process
import System.Exit
import System.IO (hClose, hGetLine)

data Audio = Audio String Int deriving (Read, Show)

instance Exec Audio where
  alias (Audio _ _) = "audio"
  start (Audio f r) cb = if r > 0 then (doEveryTenthSeconds r (audio f cb)) else audio f cb

audio :: String -> (String -> IO ()) -> IO ()
audio format cb = do
  (i,o,e,p) <- runInteractiveProcess "pulseaudio-ctl full-status" [] Nothing Nothing
  exit <- waitForProcess p
  let closeHandles = hClose o >> hClose i >> hClose e
      getL = hGetLine o
  str <- getL
  closeHandles
  cb str
--readProcess "pulseaudio-ctl full-status" []
