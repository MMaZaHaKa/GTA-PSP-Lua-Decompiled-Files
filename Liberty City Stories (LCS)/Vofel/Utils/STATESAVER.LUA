function math.ceil(number)
    return math.floor(number) - math.floor(math.floor(number) - number)
end

function math.pow(base, power)
    local result = 1
    while power > 0 do
        if math.mod(power, 2) == 1 then
        result = result * base
        power = power - 1
        end

        power = power / 2
        base = base * base
    end

    return result
end

local function get_bit(pos)
    return math.pow(2, pos - 1)
end

local function has_bit(integer, pos)
    return math.mod(integer, 2 * get_bit(pos)) >= get_bit(pos)
end


-- bit array class
local BitArray = {}
BitArray.__index = BitArray

setmetatable(BitArray, {
    __call = function(cls, ...)
        return cls.new(unpack(arg))
    end
})

function BitArray.new(size)
    local self = {}
    setmetatable(self, BitArray)
    self.size = size
    if size then
        self.array = string.rep('\000', math.ceil(size / 8))
    end
    return self
end

function BitArray:get_size()
    return self.size
end

function BitArray:resize(size)
    if self.size > size then
        -- shrinking
        if math.mod(size, 8) == 0 then
            self.array = string.sub(self.array, 1, size / 8)
        else
            local last_byte = 0
            local bytes_to_leave = math.floor(size / 8)
            for pos = bytes_to_leave * 8 + 1, size do
                if self:has_bit(pos) then
                    last_byte = last_byte + self.bit
                end
            end

            if size < 8 then
                self.array = string.char(last_byte)
            else
                self.array = string.sub(self.array, 1, bytes_to_leave) .. string.char(last_byte)
            end
        end
    elseif self.size < size then
        -- expanding
        local free_bits = 7 - math.mod(self.size - 1, 8)
        local extra_bytes = math.ceil((size - self.size - free_bits) / 8)
        self.array = self.array .. string.rep('\000', extra_bytes)
    end
    self.size = size
end

function BitArray:has_bit(pos)
    if pos > self.size then
        return
    end
    self.byte_idx = math.ceil(pos / 8)
    self.byte = string.byte(self.array, self.byte_idx)
    local pos_clamped = pos - (self.byte_idx - 1) * 8
    self.bit = get_bit(pos_clamped)
    return has_bit(self.byte, pos_clamped)
end

function BitArray:set_bit(pos)
    if pos <= self.size and not self:has_bit(pos) then
        self.array = string.sub(self.array, 1, self.byte_idx - 1) ..
                     string.char(self.byte + self.bit)            ..
                     string.sub(self.array, self.byte_idx + 1)
    end
end

function BitArray:clear_bit(pos)
    if self:has_bit(pos) then
        self.array = string.sub(self.array, 1, self.byte_idx - 1) ..
                     string.char(self.byte - self.bit)            ..
                     string.sub(self.array, self.byte_idx + 1)
    end
end

function BitArray:extend(array)
    self:resize(self.size + array.size)
    for idx = 1, array.size do
        if array:has_bit(idx) then
            self:set_bit(self.size - array.size + idx)
        end
    end
end

function BitArray:subarray(from, till)
    if not till then
        till = self.size
    end
    local array = BitArray(till - from + 1)
    for idx = from, till do
        if self:has_bit(idx) then
            array:set_bit(idx - from + 1)
        end
    end
    return array
end


-- Rice-Golomb encoding
local function rg_calculate_k(integers)
    local k = 0
    local size = table.getn(integers)
    while math.pow(2, k) <= integers[size] / size / 2 do
        k = k + 1
    end

    return k
end

local function rg_compress(integers, k)
    local ttk = math.pow(2, k)  -- two_to_k
    local size = table.getn(integers)
    local result = BitArray(math.floor(integers[size] / ttk) + size * (k + 1))
    local prev = 0
    local idx = 1
    for _, int in ipairs(integers) do
        while int - prev >= ttk do
            prev = prev + ttk
            result:set_bit(idx)
            idx = idx + 1
        end

        idx = idx + 1
        for i = 1, k do
            if has_bit(int - prev, i) then
                result:set_bit(idx)
            end
            idx = idx + 1
        end
        prev = int
    end

    result:resize(idx - 1)
    return result
end


local function rg_decompress(bitarray, k, output_size)
    local ttk = math.pow(2, k)  -- two_to_k
    local result = {}
    local idx = 1
    local prev = 0
    local acc = 0  -- accumulator
    while idx <= bitarray:get_size() do
        if bitarray:has_bit(idx) then
            acc = acc + ttk
            idx = idx + 1
        else
            for delta_idx = 1, k do
                if bitarray:has_bit(idx + delta_idx) then
                    acc = acc + get_bit(delta_idx)
                end
            end
            prev = prev + acc
            acc = 0
            idx = idx + k + 1
            table.insert(result, prev)
            if output_size and table.getn(result) == output_size then
                break
            end
        end
    end

    return result
end


-- base256
local ALPHABET = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz123456789#$%&?@"
local ENC_TABLE = {}
local DEC_TABLE = {}
for idx = 1, 64 do
    ENC_TABLE[idx] = "w" .. string.sub(ALPHABET, idx, idx)
    ENC_TABLE[64 + idx] = "r" .. string.sub(ALPHABET, idx, idx)
    ENC_TABLE[128 + idx] = "b" .. string.sub(ALPHABET, idx, idx)
    ENC_TABLE[192 + idx] = "g" .. string.sub(ALPHABET, idx, idx)
    DEC_TABLE["w" .. string.sub(ALPHABET, idx, idx)] = idx
    DEC_TABLE["r" .. string.sub(ALPHABET, idx, idx)] = 64 + idx
    DEC_TABLE["b" .. string.sub(ALPHABET, idx, idx)] = 128 + idx
    DEC_TABLE["g" .. string.sub(ALPHABET, idx, idx)] = 192 + idx
end
ALPHABET = nil


local function base256_encode(bitarray)
    local result = {}
    local size = bitarray:get_size()
    local length = (math.mod(size, 8) > 0) and (math.floor(size / 8) + 1) or math.floor(size / 8)
    for idx = 1, length do
        local character = ENC_TABLE[string.byte(bitarray.array, idx) + 1]
        table.insert(result, "~")
        table.insert(result, string.sub(character, 1, 1))
        table.insert(result, "~")
        table.insert(result, string.sub(character, 2, 2))
    end
    return table.concat(result)
end

local function base256_decode(str)
    local str_len = string.len(str)
    local array = {}
    for idx = 4, str_len, 4 do
        local character = string.sub(str, idx - 2, idx - 2) .. string.sub(str, idx, idx)
        table.insert(array, string.char(DEC_TABLE[character] - 1))
    end

    local result = BitArray(str_len * 2)  -- 8 bits per character, but with colour info its length is 4, so 8 / 4
    result.array = table.concat(array)
    return result
end


return {
    BitArray = BitArray,
    rg_calculate_k = rg_calculate_k,
    rg_compress = rg_compress,
    rg_decompress = rg_decompress,
    base256_encode = base256_encode,
    base256_decode = base256_decode,
    base256_ALPHABET = ENC_TABLE,
}
