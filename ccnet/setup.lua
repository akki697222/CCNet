function mkdir(directory)
    print("Creating Dir: ", directory)
    shell.run("mkdir ", directory)
    sleep(0.1)
end

function cd(path)
    shell.run("cd ", path)
end

function wget(name, path) --path format: "/path/file/"
    print("Downloading Package:",name)
    cd(path)
    shell.run("wget https://raw.githubusercontent.com/akki697222/CCNet/main/ccnet"..tostring(path)..tostring(name)..".lua")
end

function setup()
    print("Installing CCNet...")
end

setup()