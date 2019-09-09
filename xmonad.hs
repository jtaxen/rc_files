import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

myModMask = mod1Mask

-- Spotify commands
spotifyRootCommand = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify "
spotifyPlayPauseToggle = spotifyRootCommand ++ "/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
spotifyNext = spotifyRootCommand ++ "/org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig { terminal = "tilda"
    } `additionalKeys` myKeys
  where
    myKeys = [ ((myModMask, xK_u), spawn "slock")
             , ((myModMask, xK_p), spawn "rofi -show run -m DVI-I-1-1")
             , ((0, 0x1008ff13), spawn "amixer -q -D pulse sset Master 4%+")
             , ((0, 0x1008ff11), spawn "amixer -q -D pulse sset Master 4%-")
             , ((0, 0x1008ff14), spawn spotifyPlayPauseToggle)
             , ((0, 0x1008ff17), spawn spotifyNext)
             ]
