local api = require("/api/api-Core")

api.load()

if not fs.exists("log.txt") then
    local file = fs.open("log.txt", "w")
    file.write(os.time("local"))
end

shell.run("/gui/guis/controlpanel")
