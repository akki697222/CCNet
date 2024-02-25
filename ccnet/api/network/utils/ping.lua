local network = require("/api/network/network-Core")
local config = require("/api/config/network-Core-Config")
local ping = {}
local i = 0

function ping.send(port)
    network.open(config.getUserChannel())
    network.transmit(port, "ping")
end

function ping.receive()
    network.open(config.getUserChannel())
    if network.receive() == "ping" then
        return true
    end
end

return ping
