function mkdir(directory)
    print("Creating Dir: ", directory)
    shell.run("mkdir ", directory)
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

function wget(name, path) --path format: "path/file/"
    print("Downloading Package: ",name,".lua")
    shell.run("wget https://raw.githubusercontent.com/akki697222/CCNet/main/ccnet/",path,name,".lua")
end

function wgetAll()
    cd("/configs/api")
    wget("network-api-config")
    cd("/config/common")
    wget("ping-config")
    cd("/network/api")
    wget("network-api")
    cd("/network/common")
    wget("ping")
end

function setup()
    createAllDir()
    wgetAll()
end

setup()