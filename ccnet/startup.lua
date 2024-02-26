local api = require("/api/api-Core")

api.load()

local menuItems = {
    "Start Debugging Client",
    "Start server",
    "Exit"
}

local guis = {
    "/gui/guis/controlpanel.lua",
    "/gui/guis/panel_server.lua" 
}

local function drawMenu()
    term.clear()
    term.setCursorPos(1, 1)
    print("CCNet Boot Loader")

    for i, item in ipairs(menuItems) do
        print(i .. ". " .. item)
    end
end

local function startMenu()
    drawMenu()

    while true do
        print("Enter your choice:")
        local choice = tonumber(read())

        if choice and choice >= 1 and choice <= #menuItems then
            if choice == #menuItems then
                return
            else
                local gui = guis[choice]
                print("Starting Core GUI: " .. gui)
                if fs.exists(gui) then
                    shell.run(gui)
                else
                    print("Core: " .. gui)
                end
                return
            end
        else
            print("Invalid choice. Please enter a number between 1 and " .. #menuItems)
        end
    end
end

startMenu()