local modem = peripheral.find("modem") or error("modem not found", 0)
local config = require("/api/config/network-Core-Config")
local network = {}

function network.transmit(channel, packet)
    modem.transmit(channel, config.getUserChannel(), packet)
end

function network.receive()
    local event, side, channel, replyChannel, message, distance
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == config.getUserChannel()
    return message
end

return network
