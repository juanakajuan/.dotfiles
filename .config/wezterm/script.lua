local function formatString(str)
    -- Replace dashes with spaces and capitalize the first letter of each word
    local formatted = str:gsub("%w+", function(word)
        return word:sub(1, 1):upper() .. word:sub(2):lower()
    end)
    return formatted:gsub("-", " ")
end

-- Example usage
local input = "hello-world-there-guy"
local result = formatString(input)
print(result) -- Output: "Hello World"
