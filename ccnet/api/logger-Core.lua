local config = require("/api/config/logger-Core-Config")
local path = config.CONFIG_PATH

local log = {}

function log.write(msg, type) --msg: log message. type: log type. type any string
    local currentTime = os.date("%Y-%m-%d %H:%M:%S")
    local log = string.format("<%s> [%s]: %s\n", currentTime, type, msg)
    local file = fs.open(path, "a") or fs.open(path, "w")
    file.write(log)
    file.close()
end

function log.initilize()
    fs.delete(path)
    fs.open(path, "w")
    fs.close()
end

return log