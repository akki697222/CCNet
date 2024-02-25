local timer = {}
local i = 0

function timer.start(time)
    repeat 
        i = i + 1
    until i == time
    return true
end

return timer