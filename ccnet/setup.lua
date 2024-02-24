function mkdir(directory)
    print("Creating Dir: ", directory)
    shell.run("mkdir ", directory)
    sleep(0.1)
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
    mkdir("shell")
    mkdir("network")
    mkdir("configs")
    cd("/configs")
    createBasicDir()
    cd("/network")
    createBasicDir()
    cd("/shell")
    createBasicDir()
end

function wget(name, path) --path format: "/path/file/"
    print("Downloading Package:",name)
    cd(path)
    shell.run("wget https://raw.githubusercontent.com/akki697222/CCNet/main/ccnet"..tostring(path)..tostring(name)..".lua")
end

function wgetAll()
    --download config
    wget("api-config", "/configs/api/")
    wget("network-api-config", "/configs/api/")
    wget("network-api-connection-config", "/configs/api/")
    wget("client-config", "/configs/client/")
    wget("common-config", "configs/common/")
    --download networks
    wget("network-api", "/network/api/")
    wget("comms", "/network/common/")
    wget("util", "/network/common/")
    --download shells
    wget("ping", "/shell/common/")
    --download startup(for main-loop, not used)
    wget("startup", "/")
end

function setup()
    createAllDir()
    wgetAll()
    cd("/")
end

setup()