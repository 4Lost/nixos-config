import XMonad
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Util.ClickableWorkspaces
import XMonad.Util.Loggers
import Data.ByteString (maximum)
import Text.XHtml (gray)


main = xmonad . ewmhFullscreen . ewmh . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey $ myconfig

myconfig = def
  {
    layoutHook = myLayout
    , terminal = "alacritty"
    , normalBorderColor = "#050508"
    , focusedBorderColor = "#89b4fa"
  }
  `additionalKeysP`
  [
    ("M-p", spawn "rofi -show \"drun\"")
    , ("M-c", spawn "firefox")
    , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
    --, ("<XF86AudioMute>", spawn "wpctl set-mute 58 toggle")
    --, ("<XF86AudioRaiseVolume>", spawn "wpctl set-volume 58 0.05+")
    --, ("<XF86AudioLowerVolume>", spawn "wpctl set-volume 58 0.05-")
    --, ("<XF86AudioMicMute>", spawn "wpctl set-mute 52 toggle")
  ]
  `removeKeysP` []

myXmobarPP :: PP
myXmobarPP = def
    {
      ppSep               = magenta " • "
      , ppWsSep           = ""
      , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#a8dfe3" 2
      , ppHidden          = wrap " " ""
      , ppHiddenNoWindows = gray . wrap " " ""
      , ppUrgent          = red . wrap (yellow "!") (yellow "!")
      , ppTitleSanitize   = xmobarStrip
      , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
      , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap "[" "]" . magenta . ppWindow
    formatUnfocused = wrap "[" "]" . gray . ppWindow

    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "???" else w) . shorten 15 -- set maximum length of windowtitle to 15

    magenta, gray, red, yellow :: String -> String
    magenta   = xmobarColor "#ff79c6" ""
    gray = xmobarColor "#5c5e5e" ""
    red      = xmobarColor "#ff5555" ""
    yellow   = xmobarColor "#f1fa8c" ""


myLayout = Tall 1 (3/100) (1/2) ||| Mirror (Tall 1 (3/100) (1/2)) ||| Full ||| ThreeColMid 1 (3/100) (1/2) -- wenn wieder zoom von fokusierten Seitenfenstern gewünscht, dann Fireox fixn und: magnifiercz' 1.3 (ThreeColMid 1 (3/100) (1/2))

myStartupHook :: X ()
myStartupHook = do
  mapM_ spawnOnce ["xmobar -x " ++ show sid | sid <- [0..9]]
