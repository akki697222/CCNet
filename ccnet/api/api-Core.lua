local log = require("/api/logger-Core")
local api = {}

function api.load()
    log.initilize()
    print("API Succeesfly loaded")
    log.write("API Loaded.", "API")
end

function api.initilize()
    print("api.initilize is not used.")
end

return api