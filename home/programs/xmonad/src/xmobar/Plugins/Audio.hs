module Plugins.Audio where

import Xmobar

data Audio = Audio String Int deriving (Read, Show)

instance Exec Audio where
  alias (Audio _ _) = "audio"
  run (Audio f _) = audio f
  rate (Audio _ r) = r

audio :: String -> IO String
audio format = do
  return $ show (format)
