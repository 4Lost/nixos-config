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
import Distribution.Compat.Prelude (print)
import Control.Monad.RWS (All(All))
import XMonad.Hooks.ManageHelpers


main = xmonad . ewmhFullscreen . ewmh . withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey $ myconfig

myconfig = def
  {
    modMask               = mod4Mask
    , layoutHook          = myLayout
    , terminal            = "alacritty"
    , normalBorderColor   = "#f5c2e7"
    , focusedBorderColor  = "#cdd6f4"
    , manageHook          = myManageHooks
    , startupHook         = myStartupHook
  }
  `additionalKeysP`
  [
    -- Messages
    ("M-m w", spawn "xmessage 'Test Message :)'")  -- type mod+x then w to pop up 'woohoo!')
    -- System
    , ("M-p", spawn "rofi -show \"drun\"")
    -- Screenshots
    , ("<Print>", spawn "maim --format=png \"/home/$USER/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S).png\"") -- Whole Screen to File
    , ("M-<Print>", spawn "maim --format=png --window  $(xdotool getactivewindow) \"/home/$USER/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S).png\"") -- Focused Window to File
    , ("S-<Print>", spawn "maim --format=png --select \"/home/$USER/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S).png\"") -- Selection to File
    , ("C-<Print>", spawn "maim --format=png | xclip -selection clipboard -t image/png") -- Whole Screen to Clipboard
    , ("M-C-<Print>", spawn "maim --format=png --window $(xdotool getactivewindow) | xclip -section clipboard -t image/png") -- Focused Window to Clipboard
    , ("C-S-<Print>", spawn "maim --format=png --select | xclip -selection clipboard -t image/png") -- Selection to Clipboard
    --Program
    , ("M-c", spawn "firefox")
    , ("M-y", spawn "signal-desktop")
    , ("M-x", spawn "telegram-desktop")
    , ("M-c", spawn "firefox")
    , ("M-v", spawn "thunderbird")
    -- Brightness
    , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
    -- Audio
    , ("<XF86AudioMute>", spawn "pulseaudio-ctl mute")
    , ("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up 5")
    , ("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down 5")
    , ("<XF86AudioMicMute>", spawn "pulseaudio-ctl mute-input")
  ]
  --`removeKeysP` [ "M-S-q" ]

myXmobarPP :: PP
myXmobarPP = def
    {
      ppSep               = pink " • "
      , ppWsSep           = ""
      , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#f38ba8" 2
      , ppVisible         = wrap " " "" . xmobarBorder "Top" "#a6e3a1" 2
      , ppHidden          = green . wrap " " ""
      , ppHiddenNoWindows = gray . wrap " " ""
      , ppUrgent          = red . wrap (yellow "!") (yellow "!")
      , ppTitleSanitize   = xmobarStrip
      , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
      , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap "[" "]" . pink . ppWindow
    formatUnfocused = wrap "[" "]" . gray . ppWindow

    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "???" else w) . shorten 15 -- set maximum length of windowtitle to 15

    pink, gray, red, yellow, green :: String -> String
    pink   = xmobarColor "#f5c2e7" ""
    green = xmobarColor "#a6e3a1" ""
    gray = xmobarColor "#cdd6f4" ""
    red      = xmobarColor "#f38ba8" ""
    yellow   = xmobarColor "#f9e2af" ""


myLayout = Tall 1 (3/100) (1/2) ||| Mirror (Tall 1 (3/100) (1/2)) ||| Full ||| ThreeColMid 1 (3/100) (1/2) -- wenn wieder zoom von fokusierten Seitenfenstern gewünscht, dann Fireox fixn und: magnifiercz' 1.3 (ThreeColMid 1 (3/100) (1/2))

myManageHooks :: ManageHook
myManageHooks = composeAll
  [
    isDialog --> doFloat
    , className =? "Xmessage" --> doCenterFloat
  ]

myStartupHook :: X ()
myStartupHook = do
  mapM_ spawnOnce ["xmobar -x " ++ show sid | sid <- [0..9]]
  spawnOnce "dropbox"
  spawnOnce "nextcloud --background"
