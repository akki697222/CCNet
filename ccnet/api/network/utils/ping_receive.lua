local network = require("/api/network/network-Core")
network.open(32002)
if network.receive() == "ping" then
    print("Ping received. returning pings.")
    sleep(1)
    network.transmit(32001, "ping")
else
    print("Ping received. but received packet is invalid, so it will be discarded.")
end