local level = {}

function level.load(filename)
    local result = {}
    local f = assert(io.open(filename, "r"))
    local count = 0

    while true do
        local levelLine = {}
        local line = f:read("*line")
        if line == nil then break end

        for i = 1, #line do
            local c = line:sub(i,i)
            levelLine[#levelLine+1]=c
        end

        count = count + 1

        result[#result+1] = levelLine
    end

    f:close()
    return result
end

return level
