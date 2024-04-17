local ping = require("/api/network/utils/ping")
local config = require("/api/config/network-Core-Config")
local network = require("/api/network/network-Core")
local port = 32001
local basalt = require("/gui/basalt")

local main = basalt.createFrame()

main:addLabel():setText("CCNet - Utility"):setPosition(2, 1):setFontSize(1)
main:addPane():setSize(51, 1):setPosition(1, 1):setBackground(colors.blue)
main:addButton():setSize(3, 1):setPosition(48, 1):setText(" x "):setBackground(colors.red):onClick(function()
    shell.run(
        "/gui/guis/controlpanel")
end)
--utility-sendping
main:addLabel():setText("Send port to: "):setPosition(2, 3)
local input = main:addInput():setSize(6, 1):setPosition(16, 3):setDefaultText("32001"):setInputLimit(5):setInputType(
    "number")
main:addButton():setSize(11, 1):setPosition(23, 3):setText(" Send Ping "):setBackground(colors.red):onClick(function()
    port = input:getValue()
    network.open(port)
    basalt.debug("Ping sended to " .. port .. "")
    if port ~= nil then
        ping.send(port)
    else
        basalt.debug("Plaese type sender port.")
    end
end)
main:addLabel():setText("Send value: "):setPosition(2, 4)
local str = main:addInput():setSize(12, 1):setPosition(13, 4)
main:addButton():setSize(6, 1):setPosition(27, 4):setText(" Send "):setBackground(colors.red):onClick(function()
    port = input:getValue()
    network.open(port)
    basalt.debug(str:getValue() .. " > " .. port)
    network.open(config.getUserChannel())
    network.transmit(port, str:getValue())
end)
--utility-receiveping
main:addLabel():setText("Wait for receive ping"):setPosition(2, 6)
main:addLabel():setText("(Receive Port:" .. config.getUserChannel() .. ")"):setPosition(2, 7)
main:addButton():setSize(9, 1):setPosition(24, 6):setBackground(colors.red):setText("Receive"):onClick(function()
    if ping.receive() == true then
        basalt.debug("Ping Received!!")
    end
end)

main:addLabel():setText("Wait for receive any value"):setPosition(2, 9)
main:addButton():setSize(9, 1):setPosition(30, 9):setBackground(colors.red):setText("Receive"):onClick(function()
    network.open(config.getUserChannel())
    basalt.debug(network.receive())
end)



basalt.autoUpdate()
