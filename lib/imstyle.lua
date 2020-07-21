--[[
	Project: ImStyle
	Author: LUCHARE
	Website: BlastHack.Net
	Copyright (c) 2018
]]

local style = {}

function style.blue(imgui)
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0
	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = colors[clr.PopupBg]
	colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
	colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
	colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
	colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
	colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
	colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Separator]              = colors[clr.Border]
	colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
	colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
	colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
	colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function style.white(imgui)
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	style.Alpha = 1.0
	style.FrameRounding = 3.0
	colors[clr.Text]                  = ImVec4(0.00, 0.00, 0.00, 1.00)
	colors[clr.TextDisabled]          = ImVec4(0.60, 0.60, 0.60, 1.00)
	colors[clr.WindowBg]              = ImVec4(0.94, 0.94, 0.94, 0.94)
	colors[clr.ChildWindowBg]         = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.PopupBg]               = ImVec4(1.00, 1.00, 1.00, 0.94)
	colors[clr.Border]                = ImVec4(0.00, 0.00, 0.00, 0.39)
	colors[clr.BorderShadow]          = ImVec4(1.00, 1.00, 1.00, 0.10)
	colors[clr.FrameBg]               = ImVec4(1.00, 1.00, 1.00, 0.94)
	colors[clr.FrameBgHovered]        = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.FrameBgActive]         = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.TitleBg]               = ImVec4(0.96, 0.96, 0.96, 1.00)
	colors[clr.TitleBgCollapsed]      = ImVec4(1.00, 1.00, 1.00, 0.51)
	colors[clr.TitleBgActive]         = ImVec4(0.82, 0.82, 0.82, 1.00)
	colors[clr.MenuBarBg]             = ImVec4(0.86, 0.86, 0.86, 1.00)
	colors[clr.ScrollbarBg]           = ImVec4(0.98, 0.98, 0.98, 0.53)
	colors[clr.ScrollbarGrab]         = ImVec4(0.69, 0.69, 0.69, 1.00)
	colors[clr.ScrollbarGrabHovered]  = ImVec4(0.59, 0.59, 0.59, 1.00)
	colors[clr.ScrollbarGrabActive]   = ImVec4(0.49, 0.49, 0.49, 1.00)
	colors[clr.ComboBg]               = ImVec4(0.86, 0.86, 0.86, 0.99)
	colors[clr.CheckMark]             = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.SliderGrab]            = ImVec4(0.24, 0.52, 0.88, 1.00)
	colors[clr.SliderGrabActive]      = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Button]                = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.ButtonHovered]         = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ButtonActive]          = ImVec4(0.06, 0.53, 0.98, 1.00)
	colors[clr.Header]                = ImVec4(0.26, 0.59, 0.98, 0.31)
	colors[clr.HeaderHovered]         = ImVec4(0.26, 0.59, 0.98, 0.80)
	colors[clr.HeaderActive]          = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ResizeGrip]            = ImVec4(1.00, 1.00, 1.00, 0.50)
	colors[clr.ResizeGripHovered]     = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.ResizeGripActive]      = ImVec4(0.26, 0.59, 0.98, 0.95)
	colors[clr.CloseButton]           = ImVec4(0.59, 0.59, 0.59, 0.50)
	colors[clr.CloseButtonHovered]    = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]             = ImVec4(0.39, 0.39, 0.39, 1.00)
	colors[clr.PlotLinesHovered]      = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]         = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]  = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.TextSelectedBg]        = ImVec4(0.26, 0.59, 0.98, 0.35)
	colors[clr.ModalWindowDarkening]  = ImVec4(0.20, 0.20, 0.20, 0.35)
end

function style.default(imgui)
	imgui.StyleColorsClassic()
end

local module = {}

function module.set(imgui, name)
	if name == nil then return false end
	if style[name] == nil then return false end
	style[name](imgui)
	return true
end

return module
