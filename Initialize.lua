local E, _, V, P, G = unpack(ElvUI)
local AddOnName, NameSpace = ...
local EP = E.Libs.EP

local _G = _G
local tonumber = tonumber
local hooksecurefunc = hooksecurefunc

-- 注册 Wind 工具箱为 Ace3 插件
local WT = LibStub("AceAddon-3.0"):NewAddon(AddOnName, "AceConsole-3.0", "AceEvent-3.0", 'AceTimer-3.0', 'AceHook-3.0');

NameSpace[1] = WT
NameSpace[2] = {} -- 函数
NameSpace[3] = {} -- 数据库
NameSpace[4] = E
NameSpace[5] = E.Libs.ACL:GetLocale('ElvUI', E.global.general.locale)
NameSpace[6] = V
NameSpace[7] = P
NameSpace[8] = G

_G[AddOnName] = NameSpace

---------------------------------------------------
-- ElvUI 模块注册回调
---------------------------------------------------
function WT:PluginCallback()
    -- 标题添加
    E.Options.name = E.Options.name .. " + WindUI 0.1"
end

---------------------------------------------------
-- 配置更改后的模块更新
---------------------------------------------------
function WT:UpdateAll()

end

---------------------------------------------------
-- 注册 ElvUI 模块
---------------------------------------------------
function WT:Initialize()
    EP:RegisterPlugin(AddOnName, WT.PluginCallback)
    hooksecurefunc(E, "UpdateAll", WT.UpdateAll)
end

EP:HookInitialize(WT, WT.Initialize)