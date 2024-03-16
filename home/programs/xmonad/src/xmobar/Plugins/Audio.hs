-----------------------------------------------------------------------------
-- |
-- Module      :  Plugins.Audio
-- Copyright   :  (c) Elias Schröter
-- License     :  ???
--
-- Maintainer  :  Elias Schröter <elias.schroeter@e.email>
-- Stability   :  unstable
-- Portability :  untested
--
-- A simple plugin to display the Audio status.
--
-- This plugin needs 7 parameters : The MuteColor UnMuteColor SpeakerMuteIcon SpeakerIcon MicrophoneMuteIcon MicrophoneIcon and the update rate of the plugin
-- in tenth of seconds.
-----------------------------------------------------------------------------

module Plugins.Audio where

import Plugins
import System.Process

-- | Color for Muted
type MuteColor = String
-- | Color for Unmuted
type UnMuteColor = String
-- | The Icon of the muted Speaker
type SpeakerMuteIcon = String
-- | The Icon of the unmuted Speaker
type SpeakerIcon = String
-- | The Icon of the muted Microphone
type MicrophoneMuteIcon = String
-- | The Icon of the unmuted Microphone
type MicrophoneIcon = String

data Audio = Audio MuteColor UnMuteColor SpeakerMuteIcon SpeakerIcon MicrophoneMuteIcon MicrophoneIcon Int deriving (Read, Show)

-- | Counts the days to a specific date from today. This function returns the number 
-- of days followed by a String
cdw :: Cyear -> Cmonth -> Cday -> String -> IO String
cdw y m d s = do  currentTime <- getCurrentTime
                  let currentDay = utctDay currentTime
                  let countdownDay = fromGregorian y m d
                  return $ show (diffDays countdownDay currentDay) ++ s

getAudio :: MuteColor -> UnMuteColor -> SpeakerMuteIcon -> SpeakerIcon -> MicrophoneMuteIcon -> MicrophoneIcon -> IO String
getAudio mC umC smI sI mmI mI = do
  let status = readProcess "pulseaudio-ctl full-status"
  let infoList = [w | w <- words status]

instance Exec Countdown where
    alias ( Audio _ _ _ _ _ _ _) = "audio"
    run   ( Audio mC umC smI sI mmI mI _ ) = getAudio 
    rate  ( Countdown _ _ _ _ _ _ r ) = r
