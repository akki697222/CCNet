local network = require("/api/network/network-Core")

network.transmit(32002, "ping")
if network.receive() == "ping" then
    print("Pong!!")
else
    print("Ping returned. but received packet is invalid, so it will be discarded.")
end