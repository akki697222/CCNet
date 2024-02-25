local basalt = require("/gui/basalt")

local main = basalt.createFrame()

main:addLabel():setText("CCNet - Configurator"):setPosition(2, 1):setFontSize(1)
main:addPane():setSize(51, 1):setPosition(1, 1):setBackground(colors.blue)
main:addButton():setSize(3, 1):setPosition(48, 1):setText(" x "):setBackground(colors.red):onClick(function()shell.run("/gui/guis/controlpanel")end)

basalt.autoUpdate()