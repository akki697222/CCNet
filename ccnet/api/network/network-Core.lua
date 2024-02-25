local modem = peripheral.find("modem") or error("modem not found", 0)
local config = require("/api/config/network-Core-Config")

local network = {}

function network.transmit(channel, packet)
    modem.transmit(channel, config.getUserChannel, packet)
end

function network.receive()
    local channel, message
    local i = 0
    while true do
        channel, message = os.pullEvent("modem_message")
        if channel == config.getUserChannel then
            break
        elseif i >= 5 then
            do return nil end
            break
        end
        i = i + 1
        sleep(1)
    end
    return message
end

return network
