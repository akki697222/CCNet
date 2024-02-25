local basalt = require("/gui/basalt")
local config = require("/api/config/network-Core-Config")
local log = require("/api/logger-Core")

local main = basalt.createFrame():setTheme({FrameBG = colors.white})
--main window
main:addLabel():setText("CCNet - Configurator"):setPosition(2, 2):setFontSize(1)
main:addPane():setSize(51, 1):setPosition(1, 2):setBackground(colors.blue)
main:addButton():setSize(3, 1):setPosition(48, 2):setText(" x "):setBackground(colors.red):onClick(function()shell.run("/gui/guis/controlpanel")end)
--input
main:addLabel():setText("Config - Network"):setPosition(2, 4)
local sub = main:addFrame():setPosition(2,5):setSize(16, 50)
sub:addProgram():setPosition(2,5):setSize(16, 50):execute(function ()
    shell.run("edit /api/config/network-Core-Config.lua")
end)
--setconfig
main:addButton():setSize(5,1):setPosition(45, 18):setText(" SET "):setBackground(colors.red):onClick(function ()
    
end)

basalt.autoUpdate()