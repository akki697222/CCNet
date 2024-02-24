local DEFAULT_PKT_TYPE = {
    PING = 0,
}

local comms = {}

local COMPUTER_ID = os.getComputerID()

function comms.packet()
    local self = {
        src_channel = nil,
        dest_channel = nil,
        content = nil,
        pkt_type = nil,
    }

end
return comms