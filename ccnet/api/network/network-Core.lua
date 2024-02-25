local modem = peripheral.find("modem") or error("modem not found", 0)
local config = require("/api/config/network-Core-Config")
local network = {}

function network.transmit(channel, packet)
    modem.open(config.getUserChannel())
    modem.transmit(channel, config.getUserChannel(), packet)
    modem.close(config.getUserChannel())
end

function network.receive()
    modem.open(config.getUserChannel())
    local event, side, channel, replyChannel, message, distance
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == config.getUserChannel()
    modem.close(config.getUserChannel())
    return message
end

function network.open(channel)
    modem.open(channel)
end

function network.close(channel)
    modem.close(channel)
end

return network
