--[[
	Project: Online
	Author: LUCHARE
	Website: BlastHack.Net
	Copyright (c) 2018
]]

local module = {}

function module.new(filename)
	local list = {
		private = {
			file 	= filename;
			data 	= {};
		}
	}

	function list:load()
		local i = 0
		for line in io.lines(self.private.file) do
			i = i + 1; self.private.data[i] = line
		end
	end

	function list:insert(data)
		if data == nil then return false end
		if self:is_listed(data) then return false end
		table.insert(self.private.data, data)
		return true
	end

	function list:remove(idx)
		if idx == nil then return end
		table.remove(self.private.data, idx)
	end

	function list:save()
		local file = self.private.file
		if doesFileExist(file) then
			os.remove(file)
		end
		local out = io.open(file, 'w')
		for i, v in ipairs(self.private.data) do
			if v ~= nil then out:write(tostring(v) .. '\n') end
		end
		out:close()
	end

	function list:get_data()
		return self.private.data
	end

	function list:is_listed(data)
		for i, v in ipairs(self.private.data) do
			if v == data then return true end
		end
	end

	return list
end

return module
