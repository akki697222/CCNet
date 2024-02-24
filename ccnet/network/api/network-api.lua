local comms = require("network.common.comms")


local network = {}
local modem = peripheral.find("modem")

function network.nic()

    local connection = {}
    function connection.transmit(send_channel, client_channel, packet)
        modem.transmit(send_channel, client_channel, packet)
    end

    function connection.decode(packet)
        if packet.pkt_type == comms.DEFAULT_PKT_TYPE.PING then
            print("ping received.")
        end
    end

    return connection
end

return network