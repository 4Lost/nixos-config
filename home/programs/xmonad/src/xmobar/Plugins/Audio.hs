-- -----------------------------------------------------------------------------
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
import GHC.Show (Show(show))

-- | Color for Muted
type MuteColor = String
-- | Color for Unmuted
type UnMuteColor = String
-- | The Icon of the muted Speaker
type SpeakerMuteIcon = String
-- | The Icon of half volume Speaker
type SpeakerHalfIcon = String
-- | The Icon of the unmuted Speaker
type SpeakerIcon = String
-- | The Icon of the muted Microphone
type MicrophoneMuteIcon = String
-- | The Icon of the unmuted Microphone
type MicrophoneIcon = String

data Audio = Audio MuteColor UnMuteColor SpeakerMuteIcon SpeakerHalfIcon SpeakerIcon MicrophoneMuteIcon MicrophoneIcon Int deriving (Read, Show)

-- | Counts the days to a specific date from today. This function returns the number 
-- of days followed by a String
cdw :: Cyear -> Cmonth -> Cday -> String -> IO String
cdw y m d s = do  currentTime <- getCurrentTime
                  let currentDay = utctDay currentTime
                  let countdownDay = fromGregorian y m d
                  return $ show (diffDays countdownDay currentDay) ++ s

getAudio :: MuteColor -> UnMuteColor -> SpeakerMuteIcon -> SpeakerIcon -> MicrophoneMuteIcon -> MicrophoneIcon -> IO String
getAudio mC umC smI sI mmI mI = do
  let status = words readProcess "pulseaudio-ctl full-status"
  return $ show status

instance Exec Audio where
    alias ( Audio {}) = "audio"
    run   ( Audio mC umC smI shI sI mmI mI _ ) = getAudio 
    rate  ( Audio _ _ _ _ _ _ _ r ) = r
