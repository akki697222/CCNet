local modem = peripheral.find("modem")
local config = require("/api/config/network-Core-Config")
local usr_channel = config.USER_CHANNEL

local network = {}

function network.transmit(channel, packet)
    modem.transmit(channel, usr_channel, packet)
end

function network.receive()
    local channel, message
    local i = 0
    while true do
        channel, message = os.pullEvent("modem_message")
        if channel == usr_channel then
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
