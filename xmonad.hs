import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.StackSet
import XMonad.Util.EZConfig(additionalKeys)

myModMask = mod1Mask


-- Set size and position of dialog windows
myManageHook :: ManageHook
myManageHook = composeAll
 [isDialog --> doRectFloat (RationalRect (1 / 4) (1 / 4) (1 / 2) (1 / 2))
 ]

-- Spotify commands
spotifyRootCommand = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify "
spotifyPlayPauseToggle = spotifyRootCommand ++ "/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
spotifyNext = spotifyRootCommand ++ "/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"

main = do
    xmonad $ defaultConfig { terminal = "alacritty"
                           , startupHook = setWMName "LG3D"
                           , manageHook = manageDocks <+> myManageHook
                           , layoutHook = avoidStruts $ layoutHook defaultConfig
                           , borderWidth = 2
    } `additionalKeys` myKeys
  where
    myKeys = [ ((myModMask, xK_u), spawn "slock")
             , ((myModMask, xK_p), spawn "rofi -show run")
             , ((0, 0x1008ff13), spawn "amixer -q -D pulse sset Master 4%+")
             , ((0, 0x1008ff11), spawn "amixer -q -D pulse sset Master 4%-")
             , ((0, 0x1008ff14), spawn spotifyPlayPauseToggle)
             , ((0, 0x1008ff17), spawn spotifyNext)
             ]
