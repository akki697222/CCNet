function mkdir(directory)
    print(directory)
    shell.run("mkdir ", directory)
    sleep(0.1)
end

function mkdirall()
    print("Creating directory...")
    mkdir("gui")
    cd("gui")
    mkdir("guis")
    cd("/")
    mkdir("api")
    cd("api")
    mkdir("network")
    mkdir("config")
    cd("network")
    mkdir("utils")
    cd("/")
    print("Directory creation has complete!!")
end

function wgetpackages()
    wget("startup", "/")
    print("Downloading GUI Package...")
    wget("basalt", "/gui/")
    wget("gui-Core", "/gui/")
    wget("configurator", "/gui/guis/")
    wget("controlpanel", "/gui/guis/")
    wget("utility", "/gui/guis/")
    wget("panel_server", "/gui/guis/")
    print("Downloading API Package...")
    wget("api-Core", "/api/")
    wget("controlpanel-Core", "/api/")
    wget("network-Core", "/api/network/")
    print("Downloading Utility Package...")
    wget("ping", "/api/network/utils/")
    wget("timer", "/api/network/utils/")
    print("Initilizing & Downloading Config...")
    wget("network-Core-Config", "/api/config/")
end

function cd(path)
    shell.run("cd ", path)
end

function wget(name, path) --path format: "/path/file/"
    print("Downloading Package:",name)
    cd(path)
    shell.run("wget https://raw.githubusercontent.com/akki697222/CCNet/main/ccnet"..tostring(path)..tostring(name)..".lua")
end

function pre_install()
    term.clear()
    term.setCursorPos(1, 1)
    print("Do you install CCNet?")
    print("yes or no")
    local input = read()
    if input ~= "yes" then
        error("Install canceled", 0)
    elseif input == "yes" then
        term.clear()
        term.setCursorPos(1,1)
        print("Creating directory....")
        mkdirall()
        print("Donwloading installation package...")
        wgetpackages()
        shell.run("reboot")
    end 
end

pre_install()