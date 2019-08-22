import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

myModMask = mod1Mask

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig { terminal = "tilda" } `additionalKeys` [((myModMask, xK_u), spawn "slock")]
