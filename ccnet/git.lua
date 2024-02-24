--packages
local packages = {

}

for index, packages in next, packages do
    print("[".. index .."] Downloading Packages...")
    shell.run("wget ", packages)
end