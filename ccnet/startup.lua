local api = require("/api/api-Core")
local log = require("/api/logger-Core")

log.initilize()
log.write("STARTUP", "INFO")
api.load()