local basalt = require("/gui/basalt")

function exitbutton(frameid)
    frameid:hide()
    controlpanel:show()
end

local controlpanel = basalt.createFrame()
local windowlabel = controlpanel:addLabel():setText("CCNet - Control Panel"):setPosition(2, 2):setFontSize(1)
local windowpane = controlpanel:addPane():setSize(51, 1):setPosition(1, 2):setBackground(colors.blue)

local configurator = basalt.createFrame()
local windowlabel = configurator:addLabel():setText("CCNet - Configurator"):setPosition(2, 2):setFontSize(1)
local windowpane = configurator:addPane():setSize(51, 1):setPosition(1, 2):setBackground(colors.blue)
local exitbutton = configurator:addButton():setSize(3, 1):setPosition(48, 2):setText(" x "):setBackground(colors.red):onClick(exitbutton)


basalt.autoUpdate()