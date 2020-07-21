local _ = require('underscore')
local json = require('json')

local DB = {}
local I = {}
local all = {}
local file_lines
local file_path = nil

local function file_load(path)
	local file = io.open(path, 'r')
	if file then
		local c = file:read('*a')
		file:close()
		return c
	end
end

local function init(fp)
	file_path = fp
	if not file_path or type(file_path) ~= 'string' then
		file_path = nil
	end
	
	assert(file_path, 'No file specified!')
	
	file_lines = file_load(file_path)
	
	for x in file_lines:gmatch('[^\r\n]+') do
		_.push(all, json.decode(x))
	end
	
	return DB
end

I.init = init

DB.init = init

local function FindInTable(t1, t2)
	local trueIf = 0
	local t1k = _.keys(t1)
	local t2k = _.keys(t2)
	if #t1k < #t2k then return false end
	_.each(t1k, function(i)
		_.each(t2k, function(o)
			if i == o then
				if t1[i] == t2[o] then
					trueIf = trueIf+1
				elseif type(t1[i]) == 'table' and type(t2[o]) == 'table' then
					if FindInTable(t1[i], t2[o]) then
						trueIf = trueIf+1
					end
				end
			end
		end)
	end)
	if trueIf == #t2k then
		return true
	else
		return false
	end
end

local function cursor(t)
	local result = {}
	local trueIf = 0
	local tk = _.keys(t)
	local allk = _.keys(all)
	_.each(allk, function(i)
		local k = _.keys(all[i])
		if #k < #tk then return end
		_.each(k, function(o)
			_.each(tk, function(p)
				if o == p then
					if all[i][o] == t[p] then
						trueIf = trueIf+1
					elseif type(all[i][o]) == 'table' and type(t[p]) == 'table' then
						if FindInTable(all[i][o], t[p]) then
							trueIf = trueIf+1
						end
					end
				end
			end)
		end)
		if trueIf == #tk then table.insert(result, i) end
		trueIf = 0
	end)
	if #result > 0 then
		return result
	else
		return false
	end
end

local function insert(t)
	if type(t) ~= 'table' then return nil end
	_.push(all, t)
	local file = io.open(file_path, 'a')
	file:write(json.encode(t)..'\n')
	file:close()
	return true
end

DB.insert = insert

local function delete(t)
	if type(t) ~= 'table' then return nil end
	local cur = cursor(t)
	if cur then
		result = _.reverse()
		_.each(result, function(i) table.remove(all, i) end)
		if save() then
			return true
		else
			return nil
		end
	else
		return nil
	end
end

DB.delete = delete

local function find(t)
	if type(t) ~= 'table' then return nil end
	local f = cursor(t)
	if f then
		local tab = {}
		_.each(f, function(i)
			_.push(tab, all[i])
		end)
		return tab
	else
		return nil
	end
end

DB.find = find

local function save()
	local fl = ''
	local allk = _.keys(all)
	_.each(allk, function(i)
		fl = fl..json.encode(all[i])..'\n'
	end)
	file_lines = fl
	local file = io.open(file_path, 'w')
	file:write(file_lines)
	file:close()
	return true
end

local function getAll()
	return all
end

DB.getAll = getAll

return I