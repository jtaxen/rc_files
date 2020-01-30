import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig(additionalKeys)

myModMask = mod1Mask

-- Spotify commands
spotifyRootCommand = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify "
spotifyPlayPauseToggle = spotifyRootCommand ++ "/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
spotifyNext = spotifyRootCommand ++ "/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"

main = do
    xmonad $ defaultConfig { terminal = "urxvt"
                           , startupHook = setWMName "LG3D"
                           , manageHook = manageDocks <+> manageHook defaultConfig
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
