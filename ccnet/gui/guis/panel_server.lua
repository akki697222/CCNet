local modem = peripheral.find("modem")
local svr_channel = 16001

print("Starting server client...")
modem.open(svr_channel)
local event, side, channel, replyChannel, message, distance

local server = {}

function server.receive()
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == svr_channel
    return message
end

function server.receivechannel()
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == svr_channel
    return replyChannel
end

function server.receivemessage()
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == svr_channel
    return message
end

while true do
    local replych = server.receivechannel()
    modem.transmit(replych, svr_channel, "ping")
    if server.receive() == "pong" then
        modem.transmit(replych, svr_channel, "ping")
        local sender = server.receive()
        modem.transmit(replych, svr_channel, "ping")
        if server.receive() == "pong" then
            modem.transmit(replych, svr_channel, "ping")
            modem.transmit(sender, svr_channel, server.receivemessage())
        end
    end
end

return server