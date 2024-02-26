local basalt = require("/gui/basalt") --load basalt
local gui = {}

function gui.xml(layout_path)
    basalt.createFrame():loadLayout("/gui/layouts/"..layout_path..".xml")
    basalt.autoUpdate()
end

function gui.load(lua_name) -- There is no need to include the extension.
    shell.run("/gui/guis/"..tostring(lua_name)..".lua")
end

return gui
