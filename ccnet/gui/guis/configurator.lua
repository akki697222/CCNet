local basalt = require("/gui/basalt")
local main = basalt.createFrame()

local sub = {
    main:addFrame():setPosition(1,3):setSize(51, 17),
    main:addFrame():setPosition(1,3):setSize(51, 17):hide()
}

local function openSubFrame(id) -- we create a function which switches the frame for us
    if(sub[id]~=nil)then
        for k,v in pairs(sub)do
            v:hide()
        end
        sub[id]:show()
    end
end

local menubar = main:addMenubar():setScrollable() -- we create a menubar in our main frame.
    :setSize(51, 1)
    :setPosition(1, 2)
    :onChange(function(self, val)
        openSubFrame(self:getItemIndex()) -- here we open the sub frame based on the table index
    end)
    :addItem("Network")
    :addItem("Logger")

--main window
main:addLabel():setText("CCNet - Configurator"):setPosition(2, 1):setFontSize(1)
main:addPane():setSize(51, 1):setPosition(1, 1):setBackground(colors.blue)
main:addButton():setSize(3, 1):setPosition(48, 1):setText(" x "):setBackground(colors.red):onClick(function()shell.run("/gui/guis/controlpanel")end)
--input
sub[1]:addLabel():setText("Config - Network"):setPosition(2, 17)
sub[1]:addProgram():setPosition(1,1):setSize(51, 16):execute(function ()
    shell.run("edit /api/config/network-Core-Config.lua")
end)

sub[2]:addLabel():setText("Config - Logger"):setPosition(2, 17)
sub[2]:addProgram():setPosition(1,1):setSize(51, 16):execute(function ()
    shell.run("edit /api/config/logger-Core-Config.lua")
end)

basalt.autoUpdate()