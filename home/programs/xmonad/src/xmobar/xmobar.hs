import Xmobar

config :: Config
config =
  defaultConfig
    { font = "Fira Code 9"
    , position    = TopH 30
    , borderColor = "#402339"
    , border      = FullB
    , borderWidth = 2
    , bgColor     = "#381f32"
    , fgColor     = "#a8dfe3"
    , commands =
      [
        Run $ Com "./scripts/backlight.sh" [] "backlight" 10
        Run $ Com "./scripts/audio.sh" [] "audio" 10
        Run $ Cpu
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
        , Run $ Alsa "default" "Master"
        [
          "--template", "<fc=#5c0714><fn=1>\xe050</fn>>/fc> <volumestatus>"
          , "--suffix"  , "True"
          , "--"
          , "--on", "<fc=#5c0714><fn=1>\xe050</fn>>/fc> <volumestatus>"
        ]
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

