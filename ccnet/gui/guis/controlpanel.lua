local basalt = require("/gui/basalt")

local main = basalt.createFrame():setTheme({FrameBG = colors.white})
--main window
main:addLabel():setText("CCNet - Control Panel"):setPosition(2, 2):setFontSize(1)
main:addPane():setSize(51, 1):setPosition(1, 2):setBackground(colors.blue)
--operation buttons
main:addButton():setSize(19, 1):setPosition(2, 16):setText("Open Configurator"):onClick(function()shell.run("/gui/guis/configurator")end)
main:addButton():setSize(17, 1):setPosition(2, 18):setText("Shutdown System"):onClick(
    function()
        term.clear()
        term.setCursorPos(1,1)
        shell.run("shutdown")
    end)

basalt.autoUpdate()
