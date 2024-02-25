local basalt = require("/gui/basalt")

local configurator = basalt.createFrame():setTheme({FrameBG = colors.white})
configurator:addLabel():setText("CCNet - Configurator"):setPosition(2, 2):setFontSize(1)
configurator:addPane():setSize(51, 1):setPosition(1, 2):setBackground(colors.blue)
configurator:addButton():setSize(3, 1):setPosition(48, 2):setText(" x "):setBackground(colors.red)
:onClick(function ()
    shell.run("/gui/guis/controlpanel")
end)

basalt.autoUpdate()