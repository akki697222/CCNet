function mkdir(directory)
    print("Creating Dir: ", directory)
    shell.run("mkdir ", directory)
    sleep(0.2)
end

function cd(path)
    shell.run("cd ", path)
end

function createBasicDir()
    mkdir("api")
    mkdir("common")
    mkdir("client")
end

function createAllDir()
    mkdir("network")
    mkdir("configs")
    cd("/configs")
    createBasicDir()
    cd("/network")
    createBasicDir()
end

function wget(name, path) --path format: "/path/file/"
    print("Downloading Package:",name)
    shell.run("wget https://raw.githubusercontent.com/akki697222/CCNet/main/ccnet"..tostring(path)..tostring(name)..".lua")
end

function wgetAll()
    cd("/configs/api")
    wget("network-api-config", "/configs/api/")
    cd("/config/common")
    wget("ping-config", "/configs/common/")
    cd("/network/api")
    wget("network-api", "/network/api/")
    cd("/network/common")
    wget("ping", "/network/common/")
    cd("/")
    wget("startup", "/")
end

function setup()
    createAllDir()
    wgetAll()
    cd("/")
end

setup()