local network = require("/api/network/network-Core")
local config = require("/api/config/network-Core-Config")
local channel = config.getUserChannel

network.transmit(32002, "ping")
if network.receive() == "ping" then
    print("Pong!!")
elseif network.receive() == nil then
    print("Timed Out.")
else
    print("Ping returned. but received packet is invalid, so it will be discarded.")
end