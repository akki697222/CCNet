local basalt = require("/gui/basalt") --load basalt
local gui = {}

function gui.load(layout_path)
    basalt.createFrame():loadLayout("/gui/layouts/"..layout_path..".xml")
    basalt.autoUpdate()
end

return gui
