local log = require("logger-Core")
local api = {}

function api.load()
    print("API Succeesfly loaded")
    log.write("API Loaded.", "API")
end

return api