local basalt = require("/gui/basalt")

local main = basalt.createFrame()

local aLabel = main:addLabel()
:setText("Config")
:setPosition(4, 4)
:setFontSize(1)

basalt.autoUpdate()
