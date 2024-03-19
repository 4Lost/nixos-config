module Plugins.Audio where

import Xmobar
import System.Process
import Control.Concurrent

data Audio = Audio Int deriving (Read, Show)

instance Exec Audio where
  alias (Audio _) = "audio"
  start (Audio r) cb = if r > 0 then go cb r else go cb 1000
    where
      go :: (String -> IO ()) -> Int -> IO ()
      go cb r = do
        response <- readProcess "/bin/sh" ["-c", "pulseaudio-ctl full-status"] ""
        let list = [w | w <- words (init response)]
        audio (head list) (list !! 1) (last list) cb
        threadDelay r
        go cb r

audio :: String -> String -> String -> (String -> IO ()) -> IO ()
audio vol speaker mic cb
  | speaker == "yes" = chooseMic vol "#f38ba8" "\xf466" mic cb
  | elem vol [show i | i <- [0..49]] = chooseMic vol "#a6e3a1" "\xf027" mic cb
  | otherwise = chooseMic vol "#a6e3a1" "\xf028" mic cb
  | otherwise = formatAudio vol "a" "c" "d" "e" cb
  where
    chooseMic :: String -> String -> String -> String -> (String -> IO ()) -> IO ()
    chooseMic vol speakerC speakerI mic cb
      | mic == "yes" = formatAudio vol speakerC speakerI "#f38ba8" "\xf036d" cb
      | otherwise = formatAudio vol speakerC speakerI "#a6e3a1" "\xf036c" cb
    formatAudio :: String -> String -> String -> String -> String -> (String -> IO ()) -> IO ()
    formatAudio vol speakerC speakerI micC micI cb = cb ("<fc=" ++ speakerC ++ "><fn=1>" ++ speakerI ++ "</fn></fc> " ++ vol ++ "% <fc=" ++ micC ++ "><fn=1>" ++ micI ++ "</fn></fc>")
