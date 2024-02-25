local log = require("/api/logger-Core")
local modem = peripheral.find("modem")
local config = require("/api/config/network-Core-Config")

local network = {}

function network.transmit(channel, packet)
    log.write("network.transmit send "..packet"", "INFO")
    modem.transmit(channel, config.USER_CHANNEL, packet)
end

function network.receive()
    local channel, message
    local i = 0
    while true do
        channel, message = os.pullEvent("modem_message")
        if channel == config.USER_CHANNEL then
            log.write("network.receive successfly received packet.", "INFO")
            break
        elseif i >= 5 then
            do return nil end
            log.write("network.receive Timed out.", "ERROR")
            break
        end
        i = i + 1
        sleep(1)
    end
    return message
end

return network
