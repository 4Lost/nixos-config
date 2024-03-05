import XMonad
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP


main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ def
  { terminal = "alacritty"
          , normalBorderColor = "#050508"
        , focusedBorderColor = "#89b4fa"
        }
      `additionalKeysP`
        [ ("M-p", spawn "rofi -show \"drun\"")
        , ("M-c", spawn "firefox")
        --, ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
        --, ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
        --, ("<XF86AudioMute>", spawn "wpctl set-mute 58 toggle")
        --, ("<XF86AudioRaiseVolume>", spawn "wpctl set-volume 58 0.05+")
        --, ("<XF86AudioLowerVolume>", spawn "wpctl set-volume 58 0.05-")
        --, ("<XF86AudioMicMute>", spawn "wpctl set-mute 52 toggle")
        ]
      `removeKeysP`
        [ "M-q"
        ]

myStartupHook :: X ()
myStartupHook = do
  mapM_ spawnOnce ["xmobar -x " ++ show sid | sid <- [0..9]]


