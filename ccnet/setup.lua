function mkdir(directory)
    print(directory)
    shell.run("mkdir ", directory)
    sleep(0.1)
end

function mkdirall()
    print("Creating directory...")
    mkdir("gui")
    cd("gui")
    mkdir("layouts")
    cd("/")
    mkdir("api")
    cd("api")
    mkdir("network")
    mkdir("config")
    cd("/")
    print("Directory creation has complete!!")
end

function wgetpackages()
    print("Downloading GUI Package...")
    
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
        error("Install canceled")
    elseif input == "yes" then
        term.clear()
        term.setCursorPos()
        print("Creating directory....")
        mkdirall()
        print("Donwloading installation package...")
        wgetpackages()
    end 
end

pre_install()