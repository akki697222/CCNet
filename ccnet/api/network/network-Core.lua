local modem = peripheral.find("modem") or error("modem not found", 0)
local config = require("/api/config/network-Core-Config")
local channels = config.getUserChannel
local network = {}

function network.transmit(channel, packet)
    modem.transmit(channel, channels, packet)
end

function network.receive()
    local i = 0
    while true do
        local event, side, channel, replyChannel, message, distance
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
        if channel == channels then
            do return message end
            break
        elseif i >= 5 then
            do return nil end
            break
        end
        i = i + 1
        sleep(1)
    end
end

return network
