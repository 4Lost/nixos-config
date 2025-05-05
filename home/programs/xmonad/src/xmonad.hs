import Data.ByteString (maximum)
import Distribution.Compat.Prelude (print)
import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns
import XMonad.Util.ClickableWorkspaces
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.SpawnOnce (spawnOnce)

-- import Control.Monad.RWS (All(All))
import XMonad.Hooks.ManageHelpers

main = do
    xmonad . docks . ewmhFullscreen . ewmh $ myConfig

myConfig =
    def
        { modMask = mod4Mask
        , terminal = "alacritty"
        , layoutHook = avoidStruts myLayout
        , normalBorderColor = "#f5c2e7"
        , focusedBorderColor = "#cdd6f4"
        , manageHook = manageDocks <+> myManageHooks
        , startupHook = myStartupHook
        , logHook = dynamicLogWithPP myXmobarPP
        }
        `additionalKeysP` myKeys

myKeys =
    [ -- Messages
      ("M-m w", spawn "xmessage 'Test Message :)'") -- type mod+x then w to pop up 'woohoo!')
      -- System
    , ("M-p", spawn "rofi -show \"drun\"")
    , -- Screenshots
      ("<Print>", spawn "maim --format=png \"/home/$USER/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S).png\"") -- Whole Screen to File
    , ("M-<Print>", spawn "maim --format=png --window  $(xdotool getactivewindow) \"/home/$USER/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S).png\"") -- Focused Window to File
    , ("S-<Print>", spawn "maim --format=png --select \"/home/$USER/Pictures/screenshot-$(date -u +%Y-%m-%d-%H:%M:%S).png\"") -- Selection to File
    , ("C-<Print>", spawn "maim --format=png | xclip -selection clipboard -t image/png") -- Whole Screen to Clipboard
    , ("M-C-<Print>", spawn "maim --format=png --window $(xdotool getactivewindow) | xclip -section clipboard -t image/png") -- Focused Window to Clipboard
    , ("C-S-<Print>", spawn "maim --format=png --select | xclip -selection clipboard -t image/png") -- Selection to Clipboard
    -- Program
    , ("M-c", spawn "firefox")
    , ("M-y", spawn "signal-desktop")
    , ("M-x", spawn "telegram-desktop")
    , ("M-v", spawn "thunderbird")
    , -- Brightness
      ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
    , -- Audio
      ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
    , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
    , ("<XF86AudioMicMute>", spawn "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
    , -- Powerbutton
      ("<XF86PowerOff>", spawn "/home/$USER/.config/eww/scripts/powermenu.sh")
    ]

-- `removeKeysP` [ "M-S-q" ]

myXmobarPP :: PP
myXmobarPP =
    def
        { ppOutput = \str -> do
            writeFile "/tmp/xmonad-eww-log" str
        , ppCurrent = wrap "[" "]"
        , ppVisible = wrap "(" ")"
        , ppHidden = wrap "{" "}"
        , ppHiddenNoWindows = id
        , ppUrgent = wrap "!" "!"
        , ppSep = "|"
        , ppOrder = \(ws : layout : _ : wins : _) -> [ws, layout, wins]
        , ppExtras = [logTitles formatFocused formatUnfocused]
        }
  where
    formatFocused = wrap "(" ")" . ppWindow
    formatUnfocused = wrap "[" "]" . ppWindow

    ppWindow :: String -> String
    ppWindow w = if null w then "???" else take 30 w

myLayout = Tall 1 (3 / 100) (1 / 2) ||| Mirror (Tall 1 (3 / 100) (1 / 2)) ||| Full ||| ThreeColMid 1 (3 / 100) (1 / 2) -- wenn wieder zoom von fokusierten Seitenfenstern gewünscht, dann Fireox fixn und: magnifiercz' 1.3 (ThreeColMid 1 (3/100) (1/2))

myManageHooks :: ManageHook
myManageHooks =
    composeAll
        [ isDialog --> doFloat
        , className =? "Xmessage" --> doCenterFloat
        ]

myStartupHook :: X ()
myStartupHook = do
    spawnOnce "nextcloud --background"
    spawnOnce "trayer --edge top --align left --widthtype request --height 25 --transparent true --alpha 0 --expand true --SetDockType true --SetPartialStrut true"
    spawnOnce "eww open bar"
    spawnOnce "xss-lock -- ~/.config/eww/scripts/blur-lock.sh &"
    spawnOnce "xset s 600 600 && xset +dpms && xset dpms 600 900 1200"
