local W, F, E, L = unpack(select(2, ...))
local S = W:GetModule("Skins")
local GB = W:NewModule("GameBar", "AceEvent-3.0", "AceHook-3.0")
local DT = E:GetModule("DataTexts")

local _G = _G
local collectgarbage = collectgarbage
local date = date
local floor = floor
local format = format
local ipairs = ipairs
local max = max
local mod = mod
local pairs = pairs
local select = select
local tinsert = tinsert
local tonumber = tonumber
local tostring = tostring
local type = type
local unpack = unpack

local CreateFrame = CreateFrame
local EncounterJournal_LoadUI = EncounterJournal_LoadUI
local GetGameTime = GetGameTime
local GetItemCooldown = GetItemCooldown
local GetItemIcon = GetItemIcon
local GetNumGuildMembers = GetNumGuildMembers
local GetTime = GetTime
local HideUIPanel = HideUIPanel
local InCombatLockdown = InCombatLockdown
local IsAddOnLoaded = IsAddOnLoaded
local IsInGuild = IsInGuild
local IsModifierKeyDown = IsModifierKeyDown
local ResetCPUUsage = ResetCPUUsage
local Screenshot = Screenshot
local ShowUIPanel = ShowUIPanel
local SpellBookFrame = SpellBookFrame
local TalentFrame_LoadUI = TalentFrame_LoadUI
local ToggleAllBags = ToggleAllBags
local ToggleCalendar = ToggleCalendar
local ToggleCharacter = ToggleCharacter
local ToggleCollectionsJournal = ToggleCollectionsJournal
local ToggleFrame = ToggleFrame
local ToggleFriendsFrame = ToggleFriendsFrame
local ToggleGuildFinder = ToggleGuildFinder
local ToggleGuildFrame = ToggleGuildFrame
local ToggleTimeManager = ToggleTimeManager

local C_FriendList_GetNumFriends = C_FriendList.GetNumFriends
local C_FriendList_GetNumOnlineFriends = C_FriendList.GetNumOnlineFriends
local C_Garrison_GetCompleteMissions = C_Garrison.GetCompleteMissions
local C_Item_GetItemNameByID = C_Item.GetItemNameByID
local C_Timer_After = C_Timer.After
local C_Timer_NewTicker = C_Timer.NewTicker

local FollowerType_8_0 = Enum.GarrisonFollowerType.FollowerType_8_0
local FollowerType_9_0 = Enum.GarrisonFollowerType.FollowerType_9_0

local NUM_PANEL_BUTTONS = 7
local IconString = "|T%s:16:18:0:0:64:64:4:60:7:57"
local LeftButtonIcon = "|TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:230:307|t"
local RightButtonIcon = "|TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:333:410|t"
local ScrollButtonIcon = "|TInterface\\TUTORIALFRAME\\UI-TUTORIAL-FRAME:13:11:0:-1:512:512:12:66:127:204|t"

local Heartstones = {
    6948, -- 爐石
    110560, -- 要塞爐石
    140192, -- 達拉然爐石
    141605, -- 飛行管理員的哨子
    162973, -- 冬天爺爺的爐石
    163045, -- 無頭騎士的爐石
    165669, -- 新年長者的爐石
    165670, -- 傳播者充滿愛的爐石
    165802, -- 貴族園丁的爐石
    166746, -- 吞火者的爐石
    166747, -- 啤酒節狂歡者的爐石
    168907, -- 全像數位化爐石
    172179, -- 永恆旅人的爐石
    180290, -- 暗夜妖精的爐石
    182773, -- 死靈領主爐石
    184353 -- 琪瑞安族爐石
}

local HeartstonesTable

local function AddDoubleLineForItem(itemID, prefix)
    if type(itemID) == "string" then
        itemID = tonumber(itemID)
    end

    prefix = prefix and prefix .. " " or ""

    local name = HeartstonesTable[tostring(itemID)]
    local texture = GetItemIcon(itemID)
    local icon = format(IconString .. ":255:255:255|t", texture)
    local startTime, duration = GetItemCooldown(itemID)
    local cooldownTime = startTime + duration - GetTime()
    local canUse = cooldownTime <= 0
    local cooldownTimeString
    if not canUse then
        local min = floor(cooldownTime / 60)
        local sec = floor(mod(cooldownTime, 60))
        cooldownTimeString = format("%02d:%02d", min, sec)
    end

    DT.tooltip:AddDoubleLine(
        prefix .. icon .. " " .. name,
        canUse and L["Ready"] or cooldownTimeString,
        1,
        1,
        1,
        canUse and 0 or 1,
        canUse and 1 or 0,
        0
    )
end

local ButtonTypes = {
    ACHIEVEMENTS = {
        name = L["Achievements"],
        icon = W.Media.Icons.barAchievements,
        click = {
            LeftButton = ToggleAchievementFrame
        },
        tooltips = {
            L["Achievements"]
        }
    },
    BAGS = {
        name = L["Bags"],
        icon = W.Media.Icons.barBags,
        click = {
            LeftButton = ToggleAllBags
        },
        tooltips = "Bags"
    },
    CHARACTER = {
        name = L["Character"],
        icon = W.Media.Icons.barCharacter,
        click = {
            LeftButton = function()
                ToggleCharacter("PaperDollFrame")
            end
        },
        tooltips = {
            L["Character"]
        }
    },
    ENCOUNTER_JOURNAL = {
        name = L["Encounter Journal"],
        icon = W.Media.Icons.barEncounterJournal,
        click = {
            LeftButton = function()
                if not IsAddOnLoaded("Blizzard_EncounterJournal") then
                    EncounterJournal_LoadUI()
                end

                ToggleFrame(_G.EncounterJournal)
            end
        },
        tooltips = {
            L["Encounter Journal"]
        }
    },
    FRIENDS = {
        name = L["Friend List"],
        icon = W.Media.Icons.barFriends,
        click = {
            LeftButton = function()
                ToggleFriendsFrame(1)
            end
        },
        additionalText = function()
            local number = C_FriendList_GetNumOnlineFriends()
            return number > 0 and number or ""
        end,
        tooltips = "Friends"
    },
    GROUP_FINDER = {
        name = L["Group Finder"],
        icon = W.Media.Icons.barGroupFinder,
        click = {
            LeftButton = ToggleLFDParentFrame
        },
        tooltips = {
            L["Group Finder"]
        }
    },
    GUILD = {
        name = L["Guild"],
        icon = W.Media.Icons.barGuild,
        click = {
            LeftButton = function()
                if IsInGuild() then
                    ToggleGuildFrame()
                else
                    ToggleGuildFinder()
                end
            end
        },
        additionalText = function()
            return IsInGuild() and select(2, GetNumGuildMembers()) or ""
        end,
        tooltips = "Guild"
    },
    HOME = {
        name = L["Home"],
        icon = W.Media.Icons.barHome,
        item = {},
        tooltips = function(button)
            DT.tooltip:ClearLines()
            DT.tooltip:SetText(L["Home"])
            DT.tooltip:AddLine("\n")
            AddDoubleLineForItem(GB.db.home.left, LeftButtonIcon)
            AddDoubleLineForItem(GB.db.home.right, RightButtonIcon)
            DT.tooltip:Show()

            button.tooltipsUpdateTimer =
                C_Timer_NewTicker(
                1,
                function()
                    DT.tooltip:ClearLines()
                    DT.tooltip:SetText(L["Home"])
                    DT.tooltip:AddLine("\n")
                    AddDoubleLineForItem(GB.db.home.left, LeftButtonIcon)
                    AddDoubleLineForItem(GB.db.home.right, RightButtonIcon)
                    DT.tooltip:Show()
                end
            )
        end,
        tooltipsLeave = function(button)
            if button.tooltipsUpdateTimer and button.tooltipsUpdateTimer.Cancel then
                button.tooltipsUpdateTimer:Cancel()
            end
        end
    },
    MISSION_REPORTS = {
        name = L["Mission Reports"],
        icon = W.Media.Icons.barMissionReports,
        click = {
            LeftButton = function(button)
                DT.RegisteredDataTexts["Missions"].onClick(button)
            end
        },
        additionalText = function()
            local numMissions =
                #C_Garrison_GetCompleteMissions(FollowerType_9_0) + #C_Garrison_GetCompleteMissions(FollowerType_8_0)
            if numMissions == 0 then
                numMissions = ""
            end
            return numMissions
        end,
        tooltips = "Missions"
    },
    NONE = {
        name = L["None"]
    },
    PET_JOURNAL = {
        name = L["Pet Journal"],
        icon = W.Media.Icons.barPetJournal,
        click = {
            LeftButton = function()
                ToggleCollectionsJournal(2)
            end
        },
        tooltips = {
            L["Pet Journal"]
        }
    },
    SCREENSHOT = {
        name = L["Screenshot"],
        icon = W.Media.Icons.barScreenShot,
        click = {
            LeftButton = Screenshot,
            RightButton = function()
                C_Timer_After(2, Screenshot)
            end
        },
        tooltips = {
            L["Screenshot"],
            "\n",
            LeftButtonIcon .. " " .. L["Screenshot immediately"],
            RightButtonIcon .. " " .. L["Screenshot after 2 secs"]
        }
    },
    SPELLBOOK = {
        name = L["Spell Book"],
        icon = W.Media.Icons.barSpellBook,
        click = {
            LeftButton = function()
                if not SpellBookFrame:IsShown() then
                    ShowUIPanel(SpellBookFrame)
                else
                    HideUIPanel(SpellBookFrame)
                end
            end
        },
        tooltips = {
            L["Spell Book"]
        }
    },
    TALENTS = {
        name = L["Talents"],
        icon = W.Media.Icons.barTalents,
        click = {
            LeftButton = function()
                if not _G.PlayerTalentFrame then
                    TalentFrame_LoadUI()
                end

                local PlayerTalentFrame = _G.PlayerTalentFrame
                if not PlayerTalentFrame:IsShown() then
                    ShowUIPanel(PlayerTalentFrame)
                else
                    HideUIPanel(PlayerTalentFrame)
                end
            end
        },
        tooltips = {
            L["Talents"]
        }
    },
    TOY_BOX = {
        name = L["Toy Box"],
        icon = W.Media.Icons.barToyBox,
        click = {
            LeftButton = function()
                ToggleCollectionsJournal(3)
            end
        },
        tooltips = {
            L["Toy Box"]
        }
    }
}

function GB:ConstructBar()
    if self.bar then
        return
    end

    local bar = CreateFrame("Frame", "WTGameBar", E.UIParent)
    bar:Size(800, 60)
    bar:Point("TOP", 0, -20)

    local middlePanel = CreateFrame("Button", "WTGameBarMiddlePanel", bar, "SecureActionButtonTemplate")
    middlePanel:Size(81, 50)
    middlePanel:Point("CENTER")
    middlePanel:CreateBackdrop("Transparent")
    middlePanel:RegisterForClicks("AnyUp")
    bar.middlePanel = middlePanel

    local leftPanel = CreateFrame("Frame", "WTGameBarLeftPanel", bar)
    leftPanel:Size(300, 40)
    leftPanel:Point("RIGHT", middlePanel, "LEFT", -10, 0)
    leftPanel:CreateBackdrop("Transparent")
    bar.leftPanel = leftPanel

    local rightPanel = CreateFrame("Frame", "WTGameBarRightPanel", bar)
    rightPanel:Size(300, 40)
    rightPanel:Point("LEFT", middlePanel, "RIGHT", 10, 0)
    rightPanel:CreateBackdrop("Transparent")
    bar.rightPanel = rightPanel

    if E.private.WT.skins.enable and E.private.WT.skins.windtools then
        S:CreateShadow(leftPanel.backdrop)
        S:CreateShadow(middlePanel.backdrop)
        S:CreateShadow(rightPanel.backdrop)
    end

    self.bar = bar

    E:CreateMover(
        self.bar,
        "WTGameBarAnchor",
        L["Game Bar"],
        nil,
        nil,
        nil,
        "ALL,WINDTOOLS",
        function()
            return GB.db and GB.db.enable
        end
    )
end

function GB:ConstructTimeArea()
    local colon = self.bar.middlePanel:CreateFontString(nil, "OVERLAY")
    colon:Point("CENTER")
    F.SetFontWithDB(colon, self.db.time.font)
    self.bar.middlePanel.colon = colon

    local hour = self.bar.middlePanel:CreateFontString(nil, "OVERLAY")
    hour:Point("RIGHT", colon, "LEFT", 1, 0)
    F.SetFontWithDB(hour, self.db.time.font)
    self.bar.middlePanel.hour = hour

    local hourHover = self.bar.middlePanel:CreateFontString(nil, "OVERLAY")
    hourHover:Point("RIGHT", colon, "LEFT", 1, 0)
    F.SetFontWithDB(hourHover, self.db.time.font)
    hourHover:SetAlpha(0)
    self.bar.middlePanel.hourHover = hourHover

    local minutes = self.bar.middlePanel:CreateFontString(nil, "OVERLAY")
    minutes:Point("LEFT", colon, "RIGHT", 0, 0)
    F.SetFontWithDB(minutes, self.db.time.font)
    self.bar.middlePanel.minutes = minutes

    local minutesHover = self.bar.middlePanel:CreateFontString(nil, "OVERLAY")
    minutesHover:Point("LEFT", colon, "RIGHT", 0, 0)
    F.SetFontWithDB(minutesHover, self.db.time.font)
    minutesHover:SetAlpha(0)
    self.bar.middlePanel.minutesHover = minutesHover

    local text = self.bar.middlePanel:CreateFontString(nil, "OVERLAY")
    text:Point("TOP", self.bar, "BOTTOM", 0, -5)
    F.SetFontWithDB(text, self.db.additionalText.font)
    text:SetAlpha(0)
    self.bar.middlePanel.text = text

    self.bar.middlePanel:Size(self.db.timeAreaWidth, self.db.timeAreaHeight)

    self:UpdateTimeFormat()
    self:UpdateTime()
    self.timeAreaUpdateTimer =
        C_Timer_NewTicker(
        self.db.time.interval,
        function()
            GB:UpdateTime()
        end
    )

    DT.RegisteredDataTexts["System"].onUpdate(self.bar.middlePanel, 10)

    self:HookScript(
        self.bar.middlePanel,
        "OnEnter",
        function(panel)
            DT.RegisteredDataTexts["System"].onUpdate(panel, 10)

            E:UIFrameFadeIn(panel.hourHover, self.db.fadeTime, panel.hourHover:GetAlpha(), 1)
            E:UIFrameFadeIn(panel.minutesHover, self.db.fadeTime, panel.minutesHover:GetAlpha(), 1)
            E:UIFrameFadeIn(panel.text, self.db.fadeTime, panel.text:GetAlpha(), 1)

            DT.tooltip:SetOwner(panel.text, "ANCHOR_BOTTOM", 0, -5)

            if IsModifierKeyDown() then
                DT.RegisteredDataTexts["System"].eventFunc()
                DT.RegisteredDataTexts["System"].onEnter()
                self.tooltipTimer =
                    C_Timer_NewTicker(
                    1,
                    function()
                        DT.RegisteredDataTexts["System"].onUpdate(panel, 10)
                        DT.RegisteredDataTexts["System"].eventFunc()
                        DT.RegisteredDataTexts["System"].onEnter()
                    end
                )
            else
                DT.tooltip:ClearLines()
                DT.tooltip:SetText(L["Time"])
                DT.tooltip:AddLine("\n", 1, 1, 1)
                DT.tooltip:AddLine(LeftButtonIcon .. " " .. L["Calendar"], 1, 1, 1)
                DT.tooltip:AddLine(RightButtonIcon .. " " .. L["Time Manager"], 1, 1, 1)
                DT.tooltip:AddLine("\n")
                DT.tooltip:AddLine(L["(Modifer Click) Collect Garbage"], unpack(E.media.rgbvaluecolor))
                DT.tooltip:Show()
                self.tooltipTimer =
                    C_Timer_NewTicker(
                    1,
                    function()
                        DT.RegisteredDataTexts["System"].onUpdate(panel, 10)
                    end
                )
            end
        end
    )

    self:HookScript(
        self.bar.middlePanel,
        "OnLeave",
        function(panel)
            E:UIFrameFadeOut(panel.hourHover, self.db.fadeTime, panel.hourHover:GetAlpha(), 0)
            E:UIFrameFadeOut(panel.minutesHover, self.db.fadeTime, panel.minutesHover:GetAlpha(), 0)
            E:UIFrameFadeOut(panel.text, self.db.fadeTime, panel.text:GetAlpha(), 0)

            DT.RegisteredDataTexts["System"].onLeave()
            DT.tooltip:Hide()
            self.tooltipTimer:Cancel()
        end
    )

    self.bar.middlePanel:SetScript(
        "OnClick",
        function(_, mouseButton)
            if IsModifierKeyDown() then
                collectgarbage("collect")
                ResetCPUUsage()
                DT.RegisteredDataTexts["System"].eventFunc()
                DT.RegisteredDataTexts["System"].onEnter()
            elseif mouseButton == "LeftButton" then
                ToggleCalendar()
            elseif mouseButton == "RightButton" then
                ToggleTimeManager()
            end
        end
    )
end

function GB:UpdateTimeTicker()
    self.timeAreaUpdateTimer:Cancel()
    self.timeAreaUpdateTimer =
        C_Timer_NewTicker(
        self.db.time.interval,
        function()
            GB:UpdateTime()
        end
    )
end

function GB:UpdateTimeFormat()
    local normalColor = {r = 1, g = 1, b = 1}
    local hoverColor = {r = 1, g = 1, b = 1}

    if self.db.normalColor == "CUSTOM" then
        normalColor = self.db.customNormalColor
    elseif self.db.normalColor == "CLASS" then
        normalColor = E:ClassColor(E.myclass, true)
    elseif self.db.normalColor == "VALUE" then
        normalColor = {
            r = E.media.rgbvaluecolor[1],
            g = E.media.rgbvaluecolor[2],
            b = E.media.rgbvaluecolor[3]
        }
    end

    if self.db.hoverColor == "CUSTOM" then
        hoverColor = self.db.customHoverColor
    elseif self.db.hoverColor == "CLASS" then
        hoverColor = E:ClassColor(E.myclass, true)
    elseif self.db.hoverColor == "VALUE" then
        hoverColor = {
            r = E.media.rgbvaluecolor[1],
            g = E.media.rgbvaluecolor[2],
            b = E.media.rgbvaluecolor[3]
        }
    end

    self.bar.middlePanel.hour.format = F.CreateColorString("%s", normalColor)
    self.bar.middlePanel.hourHover.format = F.CreateColorString("%s", hoverColor)
    self.bar.middlePanel.minutes.format = F.CreateColorString("%s", normalColor)
    self.bar.middlePanel.minutesHover.format = F.CreateColorString("%s", hoverColor)
    self.bar.middlePanel.colon:SetText(F.CreateColorString(":", hoverColor))
end

function GB:UpdateTime()
    local panel = self.bar.middlePanel

    local hour, min

    if self.db and self.db.time then
        if self.db.time.localTime then
            hour = self.db.time.twentyFour and date("%H") or date("%I")
            min = date("%M")
        else
            hour, min = GetGameTime()
            hour = self.db.time.twentyFour and hour or mod(hour, 12)
            hour = format("%02d", hour)
            min = format("%02d", min)
        end
    end

    panel.hour:SetFormattedText(panel.hour.format, hour)
    panel.hourHover:SetFormattedText(panel.hourHover.format, hour)
    panel.minutes:SetFormattedText(panel.minutes.format, min)
    panel.minutesHover:SetFormattedText(panel.minutesHover.format, min)

    panel.colon:ClearAllPoints()
    local offset = (panel.hour:GetStringWidth() - panel.minutes:GetStringWidth()) / 2
    panel.colon:Point("CENTER", offset, -1)
end

function GB:UpdateTimeArea()
    local panel = self.bar.middlePanel

    F.SetFontWithDB(panel.hour, self.db.time.font)
    F.SetFontWithDB(panel.hourHover, self.db.time.font)
    F.SetFontWithDB(panel.minutes, self.db.time.font)
    F.SetFontWithDB(panel.minutesHover, self.db.time.font)
    F.SetFontWithDB(panel.colon, self.db.time.font)
    F.SetFontWithDB(panel.text, self.db.additionalText.font)

    if self.db.time.flash then
        E:Flash(panel.colon, 1, true)
    else
        E:StopFlash(panel.colon)
    end

    self:UpdateTime()
end

function GB:ButtonOnEnter(button)
    E:UIFrameFadeIn(button.hoverTex, self.db.fadeTime, button.hoverTex:GetAlpha(), 1)
    if button.tooltips then
        DT.tooltip:SetOwner(button, "ANCHOR_BOTTOM", 0, -10)
        if type(button.tooltips) == "table" then
            DT.tooltip:ClearLines()
            for index, line in ipairs(button.tooltips) do
                if index == 1 then
                    DT.tooltip:SetText(line)
                else
                    DT.tooltip:AddLine(line, 1, 1, 1)
                end
            end
            DT.tooltip:Show()
        elseif type(button.tooltips) == "string" then
            local DTModule = DT.RegisteredDataTexts[button.tooltips]

            if DTModule and DTModule.onEnter then
                DTModule.onEnter()
            end

            -- 如果 ElvUI 数据文字鼠标提示没有进行显示的话, 显示一个简单的说明
            if not DT.tooltip:IsShown() then
                DT.tooltip:ClearLines()
                DT.tooltip:SetText(button.name)
                DT.tooltip:Show()
            end
        elseif type(button.tooltips) == "function" then
            button.tooltips(button)
        end
    end
end

function GB:ButtonOnLeave(button)
    E:UIFrameFadeOut(button.hoverTex, self.db.fadeTime, button.hoverTex:GetAlpha(), 0)
    DT.tooltip:Hide()
    if button.tooltipsLeave then
        button.tooltipsLeave(button)
    end
end

function GB:ConstructButton()
    if not self.bar then
        return
    end

    local button = CreateFrame("Button", nil, self.bar, "SecureActionButtonTemplate")
    button:Size(self.db.buttonSize)
    button:RegisterForClicks("AnyUp")

    local normalTex = button:CreateTexture(nil, "ARTWORK")
    normalTex:Point("CENTER")
    normalTex:Size(self.db.buttonSize)
    button.normalTex = normalTex

    local hoverTex = button:CreateTexture(nil, "ARTWORK")
    hoverTex:Point("CENTER")
    hoverTex:Size(self.db.buttonSize)
    hoverTex:SetAlpha(0)
    button.hoverTex = hoverTex

    local additionalText = button:CreateFontString(nil, "OVERLAY")
    additionalText:Point(self.db.additionalText.anchor, self.db.additionalText.x, self.db.additionalText.y)
    F.SetFontWithDB(additionalText, self.db.additionalText.font)
    additionalText:SetJustifyH("CENTER")
    additionalText:SetJustifyV("CENTER")
    button.additionalText = additionalText

    self:HookScript(button, "OnEnter", "ButtonOnEnter")
    self:HookScript(button, "OnLeave", "ButtonOnLeave")

    tinsert(self.buttons, button)
end

function GB:UpdateButton(button, config)
    if InCombatLockdown() then
        return
    end

    button:Size(self.db.buttonSize)
    button.name = config.name
    button.tooltips = config.tooltips
    button.tooltipsLeave = config.tooltipsLeave

    -- 按下动作
    if config.click then
        function button:Click(mouseButton)
            local func = mouseButton and config.click[mouseButton] or config.click.LeftButton
            func(GB.bar.middlePanel)
        end
        button:SetAttribute("type*", "click")
        button:SetAttribute("clickbutton", button)
    elseif config.item then
        button:SetAttribute("type*", "item")
        button:SetAttribute("item1", config.item.item1 or "")
        button:SetAttribute("item2", config.item.item2 or "")
    end

    -- 普通状态
    local r, g, b = 1, 1, 1
    if self.db.normalColor == "CUSTOM" then
        r = self.db.customNormalColor.r
        g = self.db.customNormalColor.g
        b = self.db.customNormalColor.b
    elseif self.db.normalColor == "CLASS" then
        local classColor = E:ClassColor(E.myclass, true)
        r = classColor.r
        g = classColor.g
        b = classColor.b
    elseif self.db.normalColor == "VALUE" then
        r, g, b = unpack(E.media.rgbvaluecolor)
    end

    button.normalTex:SetTexture(config.icon)
    button.normalTex:Size(self.db.buttonSize)
    button.normalTex:SetVertexColor(r, g, b)

    -- 鼠标滑过状态
    r, g, b = 1, 1, 1
    if self.db.hoverColor == "CUSTOM" then
        r = self.db.customHoverColor.r
        g = self.db.customHoverColor.g
        b = self.db.customHoverColor.b
    elseif self.db.hoverColor == "CLASS" then
        local classColor = E:ClassColor(E.myclass, true)
        r = classColor.r
        g = classColor.g
        b = classColor.b
    elseif self.db.hoverColor == "VALUE" then
        r, g, b = unpack(E.media.rgbvaluecolor)
    end

    button.hoverTex:SetTexture(config.icon)
    button.hoverTex:Size(self.db.buttonSize)
    button.hoverTex:SetVertexColor(r, g, b)

    -- 设定额外文字
    if button.additionalTextTimer and not button.additionalTextTimer:IsCancelled() then
        button.additionalTextTimer:Cancel()
    end

    button.additionalTextFormat = F.CreateColorString("%s", {r = r, g = g, b = b})

    if config.additionalText and self.db.additionalText.enable then
        button.additionalText:SetFormattedText(
            button.additionalTextFormat,
            config.additionalText and config.additionalText() or ""
        )

        button.additionalTextTimer =
            C_Timer_NewTicker(
            self.db.additionalText.slowMode and 10 or 1,
            function()
                button.additionalText:SetFormattedText(
                    button.additionalTextFormat,
                    config.additionalText and config.additionalText() or ""
                )
            end
        )
        button.additionalText:ClearAllPoints()
        button.additionalText:Point(self.db.additionalText.anchor, self.db.additionalText.x, self.db.additionalText.y)
        F.SetFontWithDB(button.additionalText, self.db.additionalText.font)
        button.additionalText:Show()
    else
        button.additionalText:Hide()
    end
end

function GB:ConstructButtons()
    if self.buttons then
        return
    end

    self.buttons = {}
    for i = 1, NUM_PANEL_BUTTONS * 2 do
        self:ConstructButton()
    end
end

function GB:UpdateButtons()
    for i = 1, NUM_PANEL_BUTTONS do
        self:UpdateButton(self.buttons[i], ButtonTypes[self.db.left[i]])
        self:UpdateButton(self.buttons[i + NUM_PANEL_BUTTONS], ButtonTypes[self.db.right[i]])
    end
end

function GB:UpdateLayout()
    if self.db.backdrop then
        self.bar.leftPanel.backdrop:Show()
        self.bar.middlePanel.backdrop:Show()
        self.bar.rightPanel.backdrop:Show()
    else
        self.bar.leftPanel.backdrop:Hide()
        self.bar.middlePanel.backdrop:Hide()
        self.bar.rightPanel.backdrop:Hide()
    end

    local numLeftButtons, numRightButtons = 0, 0

    -- 左面板
    local lastButton = nil
    for i = 1, NUM_PANEL_BUTTONS do
        local button = self.buttons[i]
        if button.name ~= L["None"] then
            button:Show()
            button:ClearAllPoints()
            if not lastButton then
                button:Point("LEFT", self.bar.leftPanel, "LEFT", self.db.backdropSpacing, 0)
            else
                button:Point("LEFT", lastButton, "RIGHT", self.db.spacing, 0)
            end
            lastButton = button
            numLeftButtons = numLeftButtons + 1
        else
            button:Hide()
        end
    end

    if numLeftButtons == 0 then
        self.bar.leftPanel:Hide()
    else
        self.bar.leftPanel:Show()
        local panelWidth =
            self.db.backdropSpacing * 2 + (numLeftButtons - 1) * self.db.spacing + numLeftButtons * self.db.buttonSize
        local panelHeight = self.db.backdropSpacing * 2 + self.db.buttonSize
        self.bar.leftPanel:Size(panelWidth, panelHeight)
    end

    -- 右面板
    lastButton = nil
    for i = 1, NUM_PANEL_BUTTONS do
        local button = self.buttons[i + NUM_PANEL_BUTTONS]
        if button.name ~= L["None"] then
            button:Show()
            button:ClearAllPoints()
            if not lastButton then
                button:Point("LEFT", self.bar.rightPanel, "LEFT", self.db.backdropSpacing, 0)
            else
                button:Point("LEFT", lastButton, "RIGHT", self.db.spacing, 0)
            end
            lastButton = button
            numRightButtons = numRightButtons + 1
        else
            button:Hide()
        end
    end

    if numRightButtons == 0 then
        self.bar.rightPanel:Hide()
    else
        self.bar.rightPanel:Show()
        local panelWidth =
            self.db.backdropSpacing * 2 + (numRightButtons - 1) * self.db.spacing + numRightButtons * self.db.buttonSize
        local panelHeight = self.db.backdropSpacing * 2 + self.db.buttonSize
        self.bar.rightPanel:Size(panelWidth, panelHeight)
    end

    -- 时间区域
    self.bar.middlePanel:Size(self.db.timeAreaWidth, self.db.timeAreaHeight)

    -- 更新移动区域尺寸
    local areaWidth = 20 + self.bar.middlePanel:GetWidth()
    areaWidth = areaWidth + 2 * max(self.bar.leftPanel:GetWidth(), self.bar.rightPanel:GetWidth())
    local areaHeight = max(self.bar.leftPanel:GetHeight(), self.bar.rightPanel:GetHeight())
    areaHeight = max(areaHeight, self.bar.middlePanel:GetHeight())

    self.bar:Size(areaWidth, areaHeight)
end

function GB:PLAYER_REGEN_ENABLED()
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    self:ProfileUpdate()
end

function GB:PLAYER_ENTERING_WORLD()
    C_Timer_After(
        1,
        function()
            self:UpdateHearthStoneTable()
            if InCombatLockdown() then
                self:RegisterEvent("PLAYER_REGEN_ENABLED")
            else
                self:ProfileUpdate()
            end
        end
    )
end

function GB:Initialize()
    self.db = E.db.WT.misc.gameBar
    if not self.db or not self.db.enable then
        return
    end

    if InCombatLockdown() then
        self:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end

    self:UpdateHearthStoneTable()
    self:ConstructBar()
    self:ConstructTimeArea()
    self:ConstructButtons()
    self:UpdateTimeArea()
    self:UpdateButtons()
    self:UpdateLayout()
    self:RegisterEvent("PLAYER_ENTERING_WORLD")

    self.Initialized = true
end

function GB:ProfileUpdate()
    self.db = E.db.WT.misc.gameBar
    if not self.db then
        return
    end

    if self.db.enable then
        if self.Initialized then
            self.bar:Show()
            self:UpdateHomeButton()
            self:UpdateTimeFormat()
            self:UpdateTimeArea()
            self:UpdateTime()
            self:UpdateButtons()
            self:UpdateLayout()
        else
            if InCombatLockdown() then
                self:RegisterEvent("PLAYER_REGEN_ENABLED")
                return
            else
                self:Initialize()
            end
        end
    else
        if self.Initialized then
            self.bar:Hide()
        end
    end
end

function GB:UpdateHomeButton()
    ButtonTypes.HOME.item = {
        item1 = C_Item_GetItemNameByID(self.db.home.left),
        item2 = C_Item_GetItemNameByID(self.db.home.right)
    }
end

function GB:UpdateHearthStoneTable()
    HeartstonesTable = {}

    for _, id in pairs(Heartstones) do
        HeartstonesTable[tostring(id)] = C_Item_GetItemNameByID(id)
    end
end

function GB:GetHearthStoneTable()
    if not HeartstonesTable then
        self:UpdateHearthStoneTable()
    end

    return HeartstonesTable
end

function GB:GetAvailableButtons()
    local buttons = {}

    for key, data in pairs(ButtonTypes) do
        buttons[key] = data.name
    end

    return buttons
end

W:RegisterModule(GB:GetName())