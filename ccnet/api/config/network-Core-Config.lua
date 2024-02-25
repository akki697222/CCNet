local config = {}

local USER_CHANNEL = 32001 --001 ~ 999 don't change "32"
function config.getUserChannel()
    return USER_CHANNEL
end

function config.setUserChannel(value)
    USER_CHANNEL = value
end

return config