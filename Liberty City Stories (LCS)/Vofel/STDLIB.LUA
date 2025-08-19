function string.ordinalSuffix(position)
    if position == 1 then
        return "st"
    elseif position == 2 then
        return "nd"
    elseif position == 3 then
        return "rd"
    else
        return "th"
    end
end

list = {}

function list.concat(lst1, lst2)
    local result = {}
    for _, v in ipairs(lst1) do
        table.insert(result, v)
    end
    for _, v in ipairs(lst2) do
        table.insert(result, v)
    end
    return result
end

function list.filter(lst, filter_func)
    local result = {}
    for _, v in ipairs(lst) do
        if filter_func(v) then
            table.insert(result, v)
        end
    end
    return result
end

function list.find(lst, value)
    return table.foreachi(lst, function (i, v)
        if v == value then
            return i
        end
    end)
end

set = {}

function set.insert(set, value)
    if not list.find(set, value) then
        table.insert(set, value)
    end
end

function table.permute(tbl1, tbl2)
    local result = {}
    for k, v in pairs(tbl2) do
        if tbl1[k] ~= nil then
            result[tbl1[k]] = v
        else
            result[k] = v
        end
    end
    return result
end

function table.clone(tbl)
    local result = setmetatable({}, getmetatable(tbl))
    for k, v in pairs(tbl) do
        result[k] = v
    end
    return result
end

function table.deepcopy(tbl, copied_tbls)
    local result = {}
    -- this is Lua 4.x style which is wrong for 5.0.2, but still works
    for k, v in tbl do
        if type(v) ~= "table" then
            result[k] = v
        else
            if not copied_tbls then
                copied_tbls = {}
            end
            copied_tbls[tbl] = result
            if copied_tbls[v] then
                result[k] = copied_tbls[v]
            else
                result[k] = table.deepcopy(v, copied_tbls)
            end
        end
    end
    return result
end

function table.merge(tbl1, tbl2)
    local result = table.clone(tbl1)
    for k, v in pairs(tbl2) do
        result[k] = v
    end
    return result
end

function table.keys(tbl)
    local result = {}
    table.foreach(tbl, function (k, unused_arg)
        table.insert(result, k)
    end)
    return result
end

function table.values(tbl)
    local result = {}
    table.foreach(tbl, function (unused_arg, v)
        table.insert(result, v)
    end)
    return result
end

function table.dump(obj)
    if type(obj) ~= "table" then
        print(obj)
    else
        local tbl_keys = table.keys(obj)
        if table.getn(tbl_keys) == 0 then
            print("<empty table>")
        else
            table.sort(tbl_keys)
            table.foreachi(tbl_keys, function (unused_arg, k)
                local v = obj[k]
                if type(k) == "string" then
                    print(k .. ":\t" .. tostring(v))
                else
                    print("[" .. k .. "]\t" .. tostring(v))
                end
            end)
        end
    end
end

function bind(func, ...)
    local args = arg
    return function (...)
        return func(unpack(list.concat(args, arg)))
    end
end

function pack(...)
    return arg
end

class = {}

function class.new(mt, tbl)
    if not tbl then
        tbl = {}
    end
    setmetatable(tbl, mt)
    mt.__index = mt
    return tbl
end

Object = {_init={}}
setmetatable(Object, Object)

function Object:_clone(args)
    local merged = table.merge(self, table.permute(self._init, args or {}))
    return setmetatable(merged, merged)
end

function Object.__call(...)
    -- arg[1] == self
    return arg[1]._clone(unpack(arg))
end
