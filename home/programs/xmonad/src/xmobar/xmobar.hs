import Xmobar
import Plugins.Audio
--import Xmobar.Run.Exec
--import Xmobar (Command(ComX))
--import GHC.Real (Integral(rem))


config :: Config
config =
  defaultConfig
    { font = "Fira Code 10"
    , position    = TopH 25
    , borderColor = "#11111b"
    , border      = FullB
    , borderWidth = 2
    , bgColor     = "#1e1e2e"
    , fgColor     = "#f5e0dc"
    , commands =
      [
        Run $ Audio "abc" 200
        --Run $ Com "/bin/sh" ["-c", "Status=$(pulseaudio-ctl full-status); Volume=$(cut -d ' ' -f 1 <<<$Status); Mute=$(cut -d ' ' -f 2 <<<$Status); Microphone=$(cut -d ' ' -f 3 <<<$Status); SpeakerColor=\"#a6e3a1\"; MicColor=\"#a6e3a1\"; if [[ $Mute == \"yes\" ]]; then Symbol=\"\xf466\"; SpeakerColor=\"#f38ba8\"; elif [[ $Volume -le 50 ]]; then Symbol=\"\xf027\"; elseSymbol=\"\xf028\"; fi; if [[ $Microphone == \"yes\" ]]; then MicOut=\"\xf036d\"; MicColor=\"#f38ba8\"; else MicOut=\"\xf036c\"; fi; echo \"<fc=$SpeakerColor><fn=1>$Symbol</fn></fc> $Volume% <fc=$MicColor><fn=1>$MicOut</fn></fc>\""] "audio" 10
        --Run $ Com "/bin/sh" ["-c", "Status=$(pulseaudio-ctl full-status);
        --  Volume=$(cut -d ' ' -f 1 <<<$Status);
        --  Mute=$(cut -d ' ' -f 2 <<<$Status);
        --  Microphone=$(cut -d ' ' -f 3 <<<$Status);
        --  SpeakerColor=\"#a6e3a1\";
        --  MicColor=\"#a6e3a1\";
        --  if [[ $Mute == \"yes\" ]];
        --  then
        --    Symbol=\"\xf466\";
        --    SpeakerColor=\"#f38ba8\";
        --  elif [[ $Volume -le 50 ]];
        --  then
        --    Symbol=\"\xf027\";
        --  else Symbol=\"\xf028\";
        --  fi;
        --
        --  if [[ $Microphone == \"yes\" ]];
        --  then
        --    MicOut=\"\xf036d\";
        --    MicColor=\"#f38ba8\";
        --  else MicOut=\"\xf036c\";
        --  fi;
        --
        --  echo \"<fc=$SpeakerColor><fn=1>$Symbol</fn></fc> $Volume% <fc=$MicColor><fn=1>$MicOut</fn></fc>\""] "audio" 10
        --Run $ Audio
        --[
        --  "--template", "<fc=<speakerColor>><fn=1><speakerIcon></fn></fc> <Volume>% <fc=<micColor>><fn=1><micIcon></fn></fc>"
        --  , "" ""
        --] 10
        -- Run $ Audio "#f38ba8" "#a6e3a1" "\xf466" "\xf027" "\xf027" "\xf036d" "\xf036c" 10
        --Run $ Audio "<fc=#fab387><fn=1>\xf017</fn></fc> %a %d.%m.%y %H:%M" "date" 300
        , Run $ Com "/bin/sh" ["-c", "echo \"<fc=#f9e2af><fn=1>\xf00e0</fn></fc> $(xbacklight -get)%\""] "backlight" 10
        , Run $ Cpu
        [
          "--template", "<fc=#b4befe><fn=1>\xf085</fn></fc> <total>%"
          , "--Low","3"
          , "--High","50"
          , "--low","#f5e0dc"
          , "--normal","#f5e0dc"
          , "--high","#f38ba8"
        ] 50
        , Run $ Memory
        [
          "-t","<fc=#74c7ec><fn=1>\xF2DB</fn></fc> <usedratio>%"
          ,"-H","80"
          ,"-L","10"
          ,"-l","#f5e0dc"
          ,"-n","#f5e0dc"
          ,"-h","#f38ba8"
        ] 50
        , Run $ Date "<fc=#fab387><fn=1>\xf017</fn></fc> %a %d.%m.%y %H:%M" "date" 300
        , Run $ DynNetwork
        [
          "-t","<fc=#74c7ec><fn=1>\xf063</fn></fc> <rx> <fc=#f38ba8><fn=1>\xf062</fn></fc> <tx>"
          ,"-H","200"
          ,"-L","10"
          ,"-h","#f5e0dc"
          ,"-l","#f5e0dc"
          ,"-n","#f38ba8"
        ] 50
        , Run $ BatteryP [ "BAT0" ]
        [
          "--template" , "<fc=#a6e3a1><fn=1>\xf240</fn></fc> <acstatus>"
          , "--Low"      , "10"        -- units: %
          , "--High"     , "80"        -- units: %
          , "--low"      , "#f38ba8"
          , "--normal"   , "#f5e0dc"
          , "--high"     , "#a6e3a1"
          , "--" -- battery specific options
          -- discharging status
          , "-o"   , "<left>% (<timeleft>)"
          -- AC "on" status
          , "-O"   , "<left>% (<fc=#a6e3a1>Charging</fc>)"
          -- charged status
          , "-i"   , "<fc=#f9e2af>Charged</fc>"
      ] 50
      , Run XMonadLog
    ]
    , sepChar     = "%"
    , alignSep    = "}{"
    , template = "%XMonadLog% }{ %audio% | %backlight% | %cpu% | %memory% | %battery% | %dynnetwork% | %date% "
    }

--instance Exec Audio where
--  alias (Audio _ _ ) = "audio"
--  start (Audio a r) = startAudio a r
--    where
--      startAudio :: [String] -> Int -> (String -> IO ()) -> IO ()
--      startAudio =
        --Run $ Com "/bin/sh" ["-c", "Status=$(pulseaudio-ctl full-status);
        --  Volume=$(cut -d ' ' -f 1 <<<$Status);
        --  Mute=$(cut -d ' ' -f 2 <<<$Status);
        --  Microphone=$(cut -d ' ' -f 3 <<<$Status);
        --  SpeakerColor=\"#a6e3a1\";
        --  MicColor=\"#a6e3a1\";
        --  if [[ $Mute == \"yes\" ]];
        --  then
        --    Symbol=\"\xf466\";
        --    SpeakerColor=\"#f38ba8\";
        --  elif [[ $Volume -le 50 ]];
        --  then
        --    Symbol=\"\xf027\";
        --  else Symbol=\"\xf028\";
        --  fi;
        --
        --  if [[ $Microphone == \"yes\" ]];
        --  then
        --    MicOut=\"\xf036d\";
        --    MicColor=\"#f38ba8\";
        --  else MicOut=\"\xf036c\";
        --  fi;
        --
        --  echo \"<fc=$SpeakerColor><fn=1>$Symbol</fn></fc> $Volume% <fc=$MicColor><fn=1>$MicOut</fn></fc>\""] "audio" 10

main :: IO ()
main = xmobar config

