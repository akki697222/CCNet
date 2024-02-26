local ping = require("/api/network/utils/ping")
local network = require("/api/network/network-Core")
local port = 32001
local basalt = require("/gui/basalt")

local main = basalt.createFrame()

main:addLabel():setText("CCNet - Utility"):setPosition(2, 1):setFontSize(1)
main:addPane():setSize(51, 1):setPosition(1, 1):setBackground(colors.blue)
main:addButton():setSize(3, 1):setPosition(48, 1):setText(" x "):setBackground(colors.red):onClick(function()shell.run("/gui/guis/controlpanel")end)
--utility-sendping
main:addLabel():setText("Send ping to: "):setPosition(2, 3)
local input = main:addInput():setSize(6,1):setPosition(16,3):setDefaultText("32001"):setInputLimit(5):setInputType("number")
main:addButton():setSize(6, 1):setPosition(23, 3):setText(" Send "):setBackground(colors.red):onClick(function()
    port = input:getValue()
    network.open(port)
    basalt.debug("Ping sended to " .. port .. "")
    if port ~= nil then
        ping.send(port)
    else
        basalt.debug("Plaese type sender port.")
    end
end)
--utility-receiveping
main:addLabel():setText("Wait for receive ping"):setPosition(2,5)
main:addButton():setSize(9, 1):setPosition(24,5):setBackground(colors.red):setText("Receive"):onClick(function()
    if ping.receive() == true then
        basalt.debug("Ping Received!!")
    end
end)


basalt.autoUpdate()