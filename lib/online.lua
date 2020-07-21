--[[
	Project: Online
	Author: LUCHARE
	Website: BlastHack.Net
	Copyright (c) 2018
]]

local inicfg 		= require 'inicfg'
local list 	 		= require 'list'

local public  = {}
local private = {
	path = {
		list = nil;
		config = nil;
		work_dir = nil;
	};
	list 	 = nil;
	config = nil;
	listed = {};
	online = 0;
}

local function force_update() -- thread
	for i = 0, sampGetMaxPlayerId(false) do
		if sampIsPlayerConnected(i) then
			local nick = sampGetPlayerNickname(i)
			if private.list:is_listed(nick) then
				if not public.is_listed(i) then
					public.insert(i); wait(1000)
				end
			else
				public.remove(i)
			end
		end
		wait(0)
	end
end

local function init_paths()
	private.path.work_dir = getWorkingDirectory() .. '\\online\\'
	local work_dir = private.path.work_dir
	private.path.config = work_dir .. 'online.cfg'
	private.path.list = work_dir .. 'list.txt' -- default

	assert(doesDirectoryExist(private.path.work_dir), 'Assertion failed! Work directory does not exist.')
	assert(doesFileExist(private.path.config), 'Assertion failed! Configuration file does not exist.')
end

local function init_config()
	private.config = inicfg.load(nil, private.path.config)
end

local function init_list()
	public.load_list(private.config.general.list, false)
end

local function shutdown_list()
	if private.list ~= nil then
		private.list:save()
	end
end

local function shutdown_config()
	if private.config ~= nil then
		inicfg.save(private.config, private.path.config)
	end
end

function public.load_list(file, update_online)
	file = private.path.work_dir .. file
	if not doesFileExist(file) then return false end
	if private.list ~= nil then
		private.list:save()
	end
	private.list = list.new(file)
	private.list:load()
	if update_online then
		public.force_update()
	end
	return true
end

function public.init()
	init_paths()
	init_config()
	init_list()
end

function public.insert(id, nick)
	if private.list:is_listed(nick) then
		private.listed[id] = nick
		private.online = private.online + 1
	end
	return true
end

function public.remove(id)
	if public.is_listed(id) then
		private.listed[id] = nil
		private.online = private.online - 1
	end
end

function public.is_listed(id)
	return private.listed[id] ~= nil
end

function public.force_update()
	lua_thread.create(force_update)
end

function public.shutdown()
	shutdown_list()
	shutdown_config()
end

setmetatable(public, {
	__index = function(t, k)
		local key = string.match(k, 'get_(.*)')
		if key ~= nil then
			return function() return private[key] end
		else
			return rawget(t, k)
		end
	end
})

return public
