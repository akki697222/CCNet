local basalt = require("/gui/basalt")

local main = basalt.createFrame():setTheme({FrameBG = colors.white})
main:addLabel():setText("CCNet - Control Panel"):setPosition(2, 2):setFontSize(1)
main:addPane():setSize(51, 1):setPosition(1, 2):setBackground(colors.blue)
main:addButton():setSize(19, 1):setPosition(2, 18):setText("Open Configurator")
:onClick(function ()
    shell.run("/gui/guis/configurator")
end)

basalt.autoUpdate()
