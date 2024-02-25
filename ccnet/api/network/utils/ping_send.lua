local network = require("/api/network/network-Core")
network.open(32001)

network.transmit(32002, "ping")
print(network.receive())
if network.receive() == "ping" then
    print("Pong!!")
end