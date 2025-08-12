-----------------------------------------------------------
-- Standard Library Functions
-- MattS
-----------------------------------------------------------
-- mostly from http://lua-users.org/wiki/StandardLibraries
-- BUT with some modifications!
--
-- pull in anything else you need as necessary and stick it 
-- in here :)
-----------------------------------------------------------

-----------------------------------------------------------
-- string functions

-- @func string.ordinalSuffix: Return the English suffix for an ordinal
--   @param n: number
-- @returns
--   @param s: suffix
function string.ordinalSuffix(n)
  if n == 1 then
    return "st"
  elseif n == 2 then
    return "nd"
  elseif n == 3 then
    return "rd"
  else
    return "th"
  end
--[[
  n = math.mod(n, 100)
  local d = math.mod(n, 10)
  if d == 1 and n ~= 11 then
    return "st"
  elseif d == 2 and n ~= 12 then
    return "nd"
  elseif d == 3 and n ~= 13 then
    return "rd"
  else
    return "th"
  end
]]
end

-----------------------------------------------------------
-- list functions

list = {}

-- @func list.concat: Concatenate two lists
--   @param l: list
--   @param m: list
-- @returns
--   @param n: result {l[1] ... l[table.getn (l)], m[1] ...
--     m[table.getn (m)]}
function list.concat(l, m)
  local n = {}
  for _, v in ipairs(l) do
    table.insert(n, v)
  end
  for _, v in ipairs(m) do
    table.insert(n, v)
  end
  return n
end

-- @func list.filter: Filter a list according to a predicate
--   @param p: predicate
--     @param a: argument
--   @returns
--     @param f: flag (nil for false, non-nil for true)
--   @param l: list
-- @returns
--   @param m: result list containing elements e of l for which p (e)
--     is true
function list.filter(l, p)
  local m = {}
  for _, v in ipairs(l) do
    if p(v) then
      table.insert(m, v)
    end
  end
  return m
end

function list.find(t, s)
  return table.foreachi(t, 
    function(i, v) 
        if v == s then 
            return i 
        end 
    end)
end


-- set stuff - very primitive now :)
set = {}

function set.insert(t, v)
    if not list.find(t, v) then
        table.insert(t, v)
    end
end

-----------------------------------------------------------
-- table functions

-- @func table.permute: Permute some indices of a table
--   @param p: table {oldindex=newindex ...}
--   @param t: table to permute
-- @returns
--   @param u: permuted table
function table.permute(p, t)
  local u = {}
  for i, v in pairs(t) do
    if p[i] ~= nil then
      u[p[i]] = v
    else
      u[i] = v
    end
  end
  return u
end

-- @func table.clone: Make a shallow copy of a table, including any
-- metatable
--   @param t: table
-- @returns
--   @param u: copy of table
function table.clone(t)
  local u = setmetatable({}, getmetatable(t))
  for i, v in pairs(t) do
    u[i] = v
  end
  return u
end

-- makes a deep copy of a given table (the 2nd param is optional and for internal use)
-- circular dependencies are correctly copied.
function table.deepcopy(t, lookup_table)
 local copy = {}
 for i,v in t do
  if type(v) ~= "table" then
   copy[i] = v
  else
   lookup_table = lookup_table or {}
   lookup_table[t] = copy
   if lookup_table[v] then
    copy[i] = lookup_table[v] -- we already copied this table. reuse the copy.
   else
    copy[i] = table.deepcopy(v,lookup_table) -- not yet copied. copy it.
   end
  end
 end
 return copy
end

-- @func table.merge: Merge two tables
-- If there are duplicate fields, u's will be used. The metatable of
-- the returned table is that of t
--   @param t, u: tables
-- @returns
--   @param r: the merged table
function table.merge(t, u)
  local r = table.clone(t)
  for i, v in pairs(u) do
    r[i] = v
  end
  return r
end

-- return a list of the keys in a table
function table.keys(t)
  local keys = {}
  table.foreach(t, function(k,v) table.insert(keys, k) end)
  return keys
end

-- return a list of the values in a table
function table.values(t)
  local values = {}
  table.foreach(t, function(k,v) table.insert(values, v) end)
  return values
end

-- print entire table, good for debugging
function table.dump(t)
 if type(t) ~= "table" then
  print(t) -- dump is the same as print on non-table values
 else
  local keys = table.keys(t)
  if table.getn(keys) == 0 then
   print("<empty table>")
  else
   table.sort(keys)
   table.foreachi(keys, function(_, index)
    local value = t[index]
    if type(index) == "string" then
     print(index .. ":\t" .. tostring(value))
    else
     print("[" .. index .. "]\t" .. tostring(value))
    end
   end)
  end
 end
end

-----------------------------------------------------------
-- bind
-- return a function object with some fixed arguments (as 
-- passed in)
-- e.g. bind(MultiRace, track) returns a function that 
-- calls MultiRace(track)
function bind(f, ...)
    local fix = arg
    return 
        function(...)
            return f(unpack(list.concat(fix, arg)))
        end
end

function pack(...)
	return arg
end

-----------------------------------------------------------
-- oop

class = {}
function class:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

-- Prototype-based objects


-- Usage:

-- Create an object/class:
--   object/class = parent {value, ...; field = value ...}
--   An object's metatable is itself.
--   In the initialiser, unnamed values are assigned to the fields
--   given by _init (assuming the default _clone).
--   Private fields and methods start with "_"
-- Access an object field: object.field
-- Call an object method: object:method (...)
-- Add a field: object.field = x
-- Add a method: function object:method (...) ... end
-- Call a class method: class.method (self, ...)

-- Root object
Object = {
  -- List of fields to be initialised by the
  -- constructor: assuming the default _clone, the
  -- numbered values in an object constructor are
  -- assigned to the fields given in _init
  _init = {}
}
setmetatable(Object, Object)
  
-- @func Object:_clone: Object constructor
--   @param values: initial values for fields in
--   _init
-- @returns
--   @param object: new object
function Object:_clone(values)
  local object = table.merge(self, table.permute(self._init, values or {}))
  return setmetatable(object, object)
end
  
-- @func Object:__call: Sugar instance creation
function Object.__call(...)
  return arg[1]._clone(unpack(arg))
end
