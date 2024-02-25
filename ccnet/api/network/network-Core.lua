local modem = peripheral.find("modem") or error("modem not found", 0)
local config = require("/api/config/network-Core-Config")
local channels = config.getUserChannel
local network = {}

function network.transmit(channel, packet)
    modem.transmit(channel, channels, packet)
end

function network.receive()
    local event, side, channel, replyChannel, message, distance
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == channels
    return message
end

return network
