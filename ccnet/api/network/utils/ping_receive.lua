local network = require("/api/network/network-Core")
if network.receive() == "ping" then
    print("Ping received. returning pings.")
    network.transmit(32001, "ping")
else
    print("Ping received. but received packet is invalid, so it will be discarded.")
end