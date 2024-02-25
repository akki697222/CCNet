local basalt = require("/gui/basalt")
local api = require("/api/api-Core")
local log = require("/api/logger-Core")

local main = basalt.createFrame()

local label = main
        :setText("Config")
        :setPosition(4, 4)
        :setFontSize(1)

basalt.autoUpdate()
