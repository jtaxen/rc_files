Config { font = "-*-Fixed-Bold-R-Normal-*-13-*-*-*-*-*-*-*"
       , borderColor = "black"
       , border = TopB
       , bgColor = "black"
       , fgColor = "grey"
       , position = TopW L 100
       , commands = [ Run Date "%Y-%m-%d %H:%M:%S" "date" 10
                    , Run BatteryP ["BAT0"] [] 600
                    ]
       , alignSep = "}{"
       , template = "}{ %battery% \t %date% \t"
       }
