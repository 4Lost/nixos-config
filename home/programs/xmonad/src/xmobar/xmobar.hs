import Xmobar

config :: Config
config =
  defaultConfig
    { font = "Fira Code 10"
    , position    = TopH 25
    , borderColor = "#f38ba8"
    , border      = FullB
    , borderWidth = 2
    , bgColor     = "#eba0ac"
    , fgColor     = "#b4befe"
    , commands =
      [
        Run $ Com "/bin/sh" ["-c", "Status=$(pulseaudio-ctl full-status); Volume=$(cut -d ' ' -f 1 <<<$Status); Mute=$(cut -d ' ' -f 2 <<<$Status); Microphone=$(cut -d ' ' -f 3 <<<$ Status); if [[ $Mute == \"yes\" ]]; then Symbol=\"\xf466\"; elif [[ $Volume -le 50 ]]; then Symbol=\"\xf027\"; elseSymbol=\"\xf028\"; fi; if [[ $Microphone == *\"yes\"* ]]; then MicOut=\"\xf036d\"; else MicOut=\"\xf036c\"; fi; echo \"<fc=#db4d65><fn=1>$Symbol</fn></fc> $Volume% <fc=#db4d65><fn=1>$MicOut</fn></fc>\""] "audio" 100
        , Run $ Com "/bin/sh" ["-c", "echo \"<fc=#dbb302><fn=1>\xf00e0</fn></fc> $(xbacklight -get)%\""] "backlight" 100
        , Run $ Cpu
        [
          "--template", "<fc=#a9a1e1><fn=1>\xf085</fn></fc> <total>%"
          , "--Low","3"
          , "--High","50"
          , "--low","#bbc2cf"
          , "--normal","#bbc2cf"
          , "--high","#fb4934"
        ] 50
        , Run $ Memory
        [
          "-t","<fc=#51afef><fn=1>\xF2DB</fn></fc> <usedratio>%"
          ,"-H","80"
          ,"-L","10"
          ,"-l","#bbc2cf"
          ,"-n","#bbc2cf"
          ,"-h","#fb4934"
        ] 50
        , Run $ Date "<fc=#ECBE7B><fn=1>\xf017</fn></fc> %a %d.%m.%y %H:%M" "date" 300
        , Run $ DynNetwork
        [
          "-t","<fc=#4db5bd><fn=1>\xf063</fn></fc> <rx> <fc=#c678dd><fn=1>\xf062</fn></fc> <tx>"
          ,"-H","200"
          ,"-L","10"
          ,"-h","#bbc2cf"
          ,"-l","#bbc2cf"
          ,"-n","#bbc2cf"
        ] 50
        , Run $ BatteryP [ "BAT0" ]
        [
          "--template" , "<fc=#B1DE76><fn=1>\xf240</fn></fc> <acstatus>"
          , "--Low"      , "10"        -- units: %
          , "--High"     , "80"        -- units: %
          , "--low"      , "#fb4934"
          , "--normal"   , "#bbc2cf"
          , "--high"     , "#98be65"
          , "--" -- battery specific options
          -- discharging status
          , "-o"   , "<left>% (<timeleft>)"
          -- AC "on" status
          , "-O"   , "<left>% (<fc=#98be65>Charging</fc>)"
          -- charged status
          , "-i"   , "<fc=#98be65>Charged</fc>"
      ] 50
      , Run XMonadLog
    ]
    , sepChar     = "%"
    , alignSep    = "}{"
    , template = "%XMonadLog% }{ %audio% | %backlight% | %cpu% | %memory% | %battery% | %dynnetwork% | %date% "
    }

main :: IO ()
main = xmobar config

