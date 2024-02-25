local basalt = require("basalt") --load basalt
local gui = {}

function gui.load(layout_path)
    basalt.createFrame():loadLayout("/gui/layout/"..layout_path..".xml")
end

return gui