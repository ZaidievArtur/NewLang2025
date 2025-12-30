os.execute("chcp 65001 > nul")

local function parse_url_params(url)
    local params = {}
    
    local query_string = url:match("%?(.+)")
    if not query_string then return params end


    for key, value in query_string:gmatch("([^&=]+)=([^&=]+)") do
        params[key] = value
    end

    return params
end

local test_url = "https://example.com/search?user=admin&priority=high&lang=ru"
local result = parse_url_params(test_url)

print("--- Результат парсинга в VS Code ---")
for k, v in pairs(result) do
    print(string.format("[%s]: %s", k, v))
end

print("\nПрограмма успешно завершена!")