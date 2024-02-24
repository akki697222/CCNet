--packages
local network = require("api.network-api")
local util = require("common.util")
local comms = require("common.comms")
--configs
local config = require("configs.client.client-config")
--main
local ping = {}

function ping.send(sendChannel)
    local ping_pkt = {
    src_channel = config.CLIENT_CHANNEL,
    dest_channel = sendChannel,
    content = nil,
    pkt_type = 0,
    }
    connection.transmit(sendChannel, config.CLIENT_CHANNEL, ping_pkt)
end

return ping