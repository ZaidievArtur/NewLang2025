local function parse_url_params(url)
    local params = {}
    
    local query_string = url:match("%?(.+)")
    
    if not query_string then
        return params
    end

    for key, value in query_string:gmatch("([^&=]+)=([^&=]+)") do
        params[key] = value
    end

    return params
end

local test_url = "https://example.com/search?user=alex&id=42&mode=dark"
local result = parse_url_params(test_url)

print("Извлеченные параметры:")
for k, v in pairs(result) do
    print(string.format("Ключ: %-10s | Значение: %s", k, v))
end
