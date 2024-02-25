local basalt = require("/gui/basalt")
local config = require("/api/config/network-Core-Config")

local main = basalt.createFrame():setTheme({FrameBG = colors.white})
--main window
main:addLabel():setText("CCNet - Configurator"):setPosition(2, 2):setFontSize(1)
main:addPane():setSize(51, 1):setPosition(1, 2):setBackground(colors.blue)
main:addButton():setSize(3, 1):setPosition(48, 2):setText(" x "):setBackground(colors.red):onClick(function()shell.run("/gui/guis/controlpanel")end)
--main
main:addLabel():setText("Config - User Channel: "):setPosition(7, 4)
main:addInput():setInputType("number"):setDefaultText("00000"):setInputLimit(5):setPosition(30, 4)
main:addButton():setSize(5, 1):setPosition(2, 4):setText(" SET "):setBackground(colors.red):onClick(function()
    config.USER_CHANNEL = main:getInputType()
    shell.run("/gui/guis/configurator")
end)

basalt.autoUpdate()