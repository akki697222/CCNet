local network = require("/api/network/network-Core")
local config = require("/api/config/network-Core-Config")

local ping = {
    pkt_type = 0,
    src = config.USER_CHANNEL,
    dest = 32002
}

network.transmit("32002", ping)
if network.receive() == ping then
    print("Pong!!")
elseif network.receive() == nil then
    print("Timed Out.")
else
    print("Ping returned. but received packet is invalid, so it will be discarded.")
end