local api = require("/api/api-Core")
local config = require("/api/config/logger-Core-Config")

local log = {}

function log.write(msg, type) --msg: log message. type: log type. type any string
    local currentTime = os.date("%Y-%m-%d %H:%M:%S")
    local log = string.format("<%s> [%s]: %s\n", currentTime, type, msg)
    local file = fs.open(config.CONFIG_PATH, "a") or fs.open(config.CONFIG_PATH, "w")
    file.write(log)
    file.close()
end

function log.initilize()
    fs.delete(config.CONFIG_PATH)
    fs.open(config.CONFIG_PATH, "w")
    fs.close()
end

return log