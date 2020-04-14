local E = unpack(ElvUI)
local L = E.Libs.ACL:NewLocale("ElvUI", "enUS", true, true)

-- enUS
-- 设置主界面
L["WindTools"] = "|cff0287d0Wi|r|cff1297e0n|r|cff22a7f0dT|r|cff19b5feo|r|cff29c5ffo|r|cff39d5ffl|r|cff39d5ffs|r"
L["%s version: %s"] = true
L["%s is a collection of useful tools."] = true
L["Release / Update Link"] = true
L["You can use the following link to get more information (in Chinese)"] = true
L["Author"] = true
L["General"] = true
L["Scale"] = true
L["Reset"] = true
L["ElvUI WindTools has been updated and the data structure of the stored config has also been greatly changed. In order to make these changes take effect, you may have to reload your User Interface."] = true
L["|cffff0000If you click Accept, it will reset your Windtools."] = true
L["|cffff0000If you click Accept, it will reset this module."] = true
L["WindTools will reload your user interface to apply the change."] = true
-- 功能界面
L["Module Information"] = true
L["Author: %s, Edited by %s"] = true
L["Setting"] = true
L["Frame Setting"] = true
L["Other Setting"] = true
-- 分类
L["Interface"] = true
L["Trade"] = true
L["Chat"] = true
L["Quest"] = true
L["More Tools"] = true
L["Credit List"] = true
-- 任务通告
L["No Detail"] = true
L["Ignore supplies quest"] = true
-- 已学配方染色
L["Already Known"] = true
L["Change item color if learned before."] = true
L["Color"] = true
-- 增强世界地图
L["Enhanced World Map"] = true
L["Customize your world map."] = true
L["World Map Frame Size"] = true
L["Reveal"] = true
-- 自动任务物品按键
L["Auto Buttons"] = true
L["Add two bars to contain questitem buttons and inventoryitem buttons."] = true
L["Auto QuestItem Button"] = true
L["Auto InventoryItem Button"] = true
L["Keybind Text"] = true
L["Item Count"] = true
L["Font Size"] = true
L["Quset Button Number"] = true
L["Buttons Per Row"] = true
L["Size"] = true
L["Slot Button Number"] = true
L["Item-ID"] = true
L["Add ItemID"] = true
L["Delete ItemID"] = true
L["Must is itemID!"] = true
L["Whitelist"] = true
L["Blacklist"] = true
-- 进入战斗提示功能
L["Alert you after enter or leave combat."] = true
L["Enter Combat Alert"] = true
L["Style"] = true
L["Font"] = true
L["Font Outline"] = true
L["Use Backdrop"] = true
L["Stay Duration"] = true
L["Animation Duration (Fade In)"] = true
L["Custom Text"] = true
L["Custom Text (Enter)"] = true
L["Custom Text (Leave)"] = true
L["Default is 0.8"] = true
L["Enter Combat"] = true
L["Leave Combat"] = true
-- 右键菜单增强
L["Right-click Menu"] = true
L["Enhanced right-click menu"] = true
L["Features"] = true
L["Armory"] = true
L["Query Detail"] = true
L["Get Name"] = true
L["Guild Invite"] = true
L["Add Friend"] = true
L["Report MyStats"] = true
L["Invite"] = true
L["Friend Menu"] = true
L["Chat Roster Menu"] = true
L["Guild Menu"] = true
L["Fix REPORT"] = true
-- 增强好友菜单
L["Enhanced Friend List"] = true
L["Customize friend frame."] = true
L["Name color & Level"] = true
L["Enhanced Texuture"] = true
L["Name Font"] = true
L["The font that the RealID / Character Name / Level uses."] = true
L["Name Font Size"] = true
L["The font size that the RealID / Character Name / Level uses."] = true
L["Name Font Flag"] = true
L["The font flag that the RealID / Character Name / Level uses."] = true
L["Info Font"] = true
L["The font that the Zone / Server uses."] = true
L["Info Font Size"] = true
L["The font size that the Zone / Server uses."] = true
L["Info Font Outline"] = true
L["The font flag that the Zone / Server uses."] = true
L["Status Icon Pack"] = true
L["Different Status Icons."] = true
L["Default"] = true
L["Square"] = true
L["Diablo 3"] = true
L["Game Icons"] = true
L["Game Icon Preview"] = true
L["Status Icon Preview"] = true
L["Blizzard Chat"] = true
L["Flat Style"] = true
L["Glossy"] = true
L["Launcher"] = true
L["Overwatch"] = true
L["Starcraft"] = true
L["Starcraft 2"] = true
L["App"] = true
L["Mobile"] = true
L["Hearthstone"] = true
L["Destiny 2"] = true
L["Hero of the Storm"] = true
L["None"] = true
L["OUTLINE"] = true
L["MONOCHROME"] = true
L["MONOCROMEOUTLINE"] = true
L["THICKOUTLINE"] = true
-- CVar编辑器
L["CVarsTool"] = true
L["Setting CVars easily."] = true
L["Effect Control"] = true
L["Glow Effect"] = true
L["Death Effect"] = true
L["Nether Effect"] = true
L["Convenient Setting"] = true
L["Auto Compare"] = true
L["Tooltips quest info"] = true
L["Fix Problem"] = true
L["Raw Mouse"] = true
L["Raw Mouse Acceleration"] = true
-- 增强暴雪框体
L["Enhanced Blizzard Frame"] = true
L["Move frames and set scale of buttons."] = true
L["Move Frames"] = true
L["Move Blizzard Frame"] = true
L["Move ElvUI Bag"] = true
L["Remember Position"] = true
L["Error Frame"] = true
L["Vehicle Seat Scale"] = true
L["Move Blizzard frame is conflict with Shadow&Light, Please cancel the duplicate option."] = true
-- Tag 增强
L["Wan"] = true
L["Yi"]  = true
L["Enhanced Tags"] = true
L["Add some tags."] = true
L["Chinese W/Y"] = true
L["Example:"] = true
L["Health"] = true
L["Power"] = true
-- 小地图按钮
L["Minimap Button Bar"] = true
L["Add a bar to contain minimap buttons."] = true
L['Skin Style'] = true
L['Reversed'] = true
L['Layout Direction'] = true
L['Change settings for how the minimap buttons are skinned.'] = true
L['Normal is right to left or top to bottom, or select reversed to switch directions.'] = true
L['The frame is not shown unless you mouse over the frame.'] = true
L['The size of the minimap buttons.'] = true
L['No Anchor Bar'] = true
L['Horizontal Anchor Bar'] = true
L['Vertical Anchor Bar'] = true
L['Button Size'] = true
L["Backdrop"] = true
L['Mouse Over'] = true
L["Minimap Buttons"] = true
L['Buttons per row'] = true
L['The max number of buttons when a new row starts.'] = true
-- 关闭特写
L["Disable Talking Head"] = true
L["Disable TalkingHeadFrame."] = true
-- 屏幕景深
L["iShadow"] = true
L["Adding a shadowed border to the UI window."] = true
L["Shadow Level"] = true
L["Default is 50."] = true
-- 光速拾取
L["Fast Loot"] = true
L["Let auto-loot quickly."] = true
L["Fast Loot Speed"] = true
L["Default is 0.3, DO NOT change it unless Fast Loot is not worked."] = true
-- 鼠标提示增强
L["Enhanced Tooltip"] = true
L["Useful tooltip tweaks."] = true
L["Item icon"] = true
L["Progression"] = true
L["Add progression info to tooltip."] = true
L["Mythic"] = true 
L["Heroic"] = true 
L["Normal"] = true
L["LFR"] = true
L["Uldir"] = true
L["BattleOfDazaralor"] = true
L["CrucibleOfStorms"] = true
L["EternalPalace"] = true
L["Nyalotha"] = true
L["Dungeon"] = true
L["MythicDungeon"] = true
L["AtalDazar"] = true
L["FreeHold"] = true
L["KingsRest"] = true
L["ShrineOfTheStorm"] = true
L["SiegeOfBoralus"] = true
L["TempleOfSethrealiss"] = true
L["TheMOTHERLODE!!"] = true
L["TheUnderrot"] = true
L["TolDagor"] = true
L["WaycrestManor"] = true
L["Mechagon"] = true
L["Mythic+"] = true
L["Mythic+(LEG&BFA)"] = true
L["Health Info"] = true
L["Health Bar"] = true
-- 跳过艾泽里特特质选择界面的渲染动画
L["Skip Azerite Animations"] = true
L["Skips the reveal animation of a new azerite armor piece and the animation after you select a trait."] = true
-- 任务通告
L["Quest Announcment"] = true
L["Let you know quest is completed."] = true
-- 删除增强
L["Enhanced Delete"] = true
L["Provide a more convenient way to delete items."] = true
L["Use Delete key"] = true
L["You may also press the |cffffd200Delete|r key as confirmation."] = true
L["Use delete button"] = true
L["Click the button to confirm the deletion of good items."] = true
L["Click to confirm"] = true
L["Confirmed"] = true
L["Skip confirm"] = true
L["Just delete a good item as a junk."] = true
-- 目标进度
L["Objective Progress"] = true
L["Add quest/mythic+ dungeon progress to tooltip."] = true
-- 单位框体精英龙
L["Dragon Overlay"] = true
L["Provides an overlay on UnitFrames for Boss, Elite, Rare and RareElite"] = true
L['Class Icon'] = true
L['Flip Dragon'] = true
L['Class Icon Points'] = true
L['Dragon Points'] = true
L['Relative Point'] = true
L['X Offset'] = true
L['Y Offset'] = true
L["Dragon Texture"] = true
L['Elite'] = true
L['Rare'] = true
L['RareElite'] = true
L['World Boss'] = true
L["Azure"] = true
L["Chromatic"] = true
L["Crimson"] = true
L["Golden"] = true
L["Jade"] = true
L["Onyx"] = true
L["Heavenly Blue"] = true
L["Heavenly Crimson"] = true
L["Heavenly Golden"] = true
L["Heavenly Jade"] = true
L["Heavenly Onyx"] = true
L["Classic Elite"] = true
L["Classic Rare Elite"] = true
L["Classic Rare"] = true
L["Classic Boss"] = true
L['Frame Strata'] = true
L['Frame Level'] = true
L['Icon Size'] = true
L['Width'] = true
L['Height'] = true
-- Raid Marker Bar
L['Raid Marker Bar'] = true
L['Display a quick action bar for raid targets and world markers.'] = true
L['Modifier Key'] = true
L['Set the modifier key for placing world markers.'] = true
L['Shift Key'] = true
L['Ctrl Key'] = true
L['Alt Key'] = true
L["Raid Markers"] = true
L["Click to clear all marks."] = true
L["Left Click to mark the target with this mark."] = true
L["Right Click to clear the mark on the target."] = true
L["%s + Click to remove all worldmarkers."] = true
L["%s + Left Click to place this worldmarker."] = true
L["%s + Right Click to clear this worldmarker."] = true
L["Visibility"] = true
L['Use Default'] = true
L['Always Display'] = true
L["Button Spacing"] = true
L['Orientation'] = true
L['Horizontal'] = true
L['Vertical'] = true
-- 信息文字
L['Distance'] = true
L['Target Range'] = true
L["MicroMenu"] = true
-- 艾泽里特特质提示
L["Azerite Tooltip"] = true
L["Show azerite traits in the tooltip when you mouseover an azerite item."] = true
L["Icon Anchor"] = true
L["Replace Blizzard Azerite Text"] = true
L["Current Spec Only"] = true
L["Show traits for your current specialization only"] = true
L["Compact Mode"] = true
L["Only icons"] = true
L["Bag icon"] = true
L["Show selected traits in bags (works only with Blizzard Bags and Bagnon)"] = true
L["Character panel icon"] = true
L["Show selected traits in Character Frame"] = true
-- 通告系统
L["Announce System"] = true
L["A simply announce system."] = true
L["Utility spells"] = true
L["Combat spells"] = true
L["Taunt spells"] = true
L["Say thanks"] = true
L["Your name"] = true
L["Name of the player"] = true
L["Target name"] = true
L["Pet name"] = true
L["The spell link"] = true
L["Your spell link"] = true
L["Interrupted spell link"] = true
L["Interrupt"] = true
L["Success"] = true
L["Failed"] =true
L["Only instance / arena"] = true
L["Player"] = true
L["Pet"] = true
L["Player(Only you)"] = true
L["Other players"] = true
L["Other players\' pet"] = true
L["Text"] = true
L["Use default text"] = true
L["Text for the interrupt casted by you"] = true
L["Text for the interrupt casted by others"] = true
L["Example"] = true
L["Only I casted"] = true
L["Target is me"] = true
L["Only target is not tank"] = true
L["Feasts"] = true
L["Bots"] = true
L["Toys"] = true
L["Portals"] = true
L["Niuzao"] = true
L["Totem"] = true
L["Provoke all(Monk)"] = true
L["Sylvanas"] = true
L["Channel"] = true
L["Use raid warning"] = true
L["Use raid warning when you is raid leader or assistant."] = true
L["If you do not check this, the spell casted by other players will be announced."] = true
L["None"] = true
L["Whisper"] = true
L["Self(Chat Frame)"] = true
L["Emote"] = true
L["Yell"] = true
L["Say"] = true
L["Solo"] = true
L["Party"] = true
L["Instance"] = true
L["Raids"] = true
L["In party"] = true
L["In instance"] = true
L["In raid"] = true
L["Combat resurrection"] = true
L["Threat transfer"] = true
L["Resurrection"] = true
L["Goodbye"] = true
L["I interrupted %target%\'s %target_spell%!"] = true
L["%player% interrupted %target%\'s %target_spell%!"] = true
L["%player% is casting %spell%, please assist!"] = true
L["%player% is handing out cookies, go and get one!"] = true
L["%player% puts %spell%"] = true
L["%player% used %spell%"] = true
L["%player% casted %spell%, today's special is Anchovy Pie!"] = true
L["OMG, wealthy %player% puts %spell%!"] = true
L["%player% opened %spell%!"] = true
L["%player% casted %spell% -> %target%"] = true
L["I taunted %target% successfully!"] = true
L["I failed on taunting %target%!"] = true
L["My %pet_role% %pet% taunted %target% successfully!"] = true
L["My %pet_role% %pet% failed on taunting %target%!"]= true
L["%player% taunted %target% successfully!"] = true
L["%player% failed on taunting %target%!"] = true
L["%player%\'s %pet_role% %pet% taunted %target% successfully!"] = true
L["%player%\'s %pet_role% %pet% failed on taunting %target%!"] = true
L["I taunted all enemies in 10 yards!"] = true
L["%player% taunted all enemies in 10 yards!"] = true
L["%target%, thank you for using %spell% to revive me. :)"] = true
L["Thanks all!"] = true
L["Reset Instance"] = true
L["Use prefix"] = true
L["%s has been reset"] = true
L["Cannot reset %s (There are players still inside the instance.)"] = true
L["Cannot reset %s (There are players in your party attempting to zone into an instance.)"] = true
L["Cannot reset %s (There are players offline in your party.)"] = true
L["Delay (sec)"] = true
-- 任务列表
L["Objective Tracker"] = true
L["The new-look interface for objective tracker."] = true
L["Header"] = true
L["Title"] = true
L["Info text"] = true
L["Use class color"] = true
L["Custom title color"] = true
L["Custom highlight color"] = true
L["Auto Turn In"] = true
L["Auto Turn In Button"] = true
L["Switch button"] = true
L["Auto"] = true
L["Fade with Objective Tracker"] = true
L["Custom font"] = true
L["Custom text"] = true
L["Text when enabled"] = true
L["Text when disabled"] = true
-- 美化皮肤
L["Provide a new style for ElvUI."] = true
L["Game Tooltip"] = true
L["Auras"] = true
L["Action Bars"] = true
L["Altpower Bar"] = true
L["Class Bar"] = true
L["Cast Bar"] = true
L["Cast Bar Icon"] = true
L["Databars"] = true
L["Unit Frames"] = true
L["Top and Bottom panel"] = true
L["Left chat panel"] = true
L["Right chat panel"] = true
L["Weakauras2"] = true
L["Bigwigs"] = true
L["Immersion"] = true
L["IME"] = true
L["No backdrop"] = true
L["Label"] = true
L["Candidate"] = true
L["You can set width to display long text."] = true
L["CJK IME candidates"] = true
L["Edit box"] = true
L["Language indicator"] = true
L["Loss of control"] = true
L["Scenario stage background"] = true
-- 声望追踪
L["Track Reputation"] = true
L['Automatically change your watched faction on the reputation bar to the faction you got reputation points for.'] = true
-- 巅峰声望
L["Paragon Reputation"] = true
L['Better visualization of Paragon Factions on the Reputation Frame.'] = true
L["Toast"] = true
L["Paragon Reputation Toast"] = true
L["Fade time"] = true
L["Format"] = true
L["Sound"] = true
L["Reputation panel"] = true
L["Paragon"] = true
L["Exalted"] = true
-- 解锁过滤器
L["Unblock Filter"] = true
L["Unblock profanity filter setting for China server."] = true
-- 聊天框增强
L["Chat Frame"] = true
L["Provide more features for chat frame."] = true
L["Use Tab to switch channel"] = true
L["Whisper Cycle"] = true
L['Whisper history expiration time (min)'] = true
L["There is no more whisper targets"]  = true
L['This module will record whispers for switching.\n You can set the expiration time here for making a shortlist of recent targets.'] = true
L["Add information on link"] = true
L["Add Icon"] = true
L["Add Level"] = true
L["Add Armor Category"] = true
L["Add Weapon Category"] = true
L["Add Corruption Rank"] = true
L["Head_Abbr"] = "Head"
L["Neck_Abbr"] = "Neck"
L["Shoulders_Abbr"] = "Shoulders"
L["Back_Abbr"] = "Back"
L["Chest_Abbr"] = "Chest"
L["Wrist_Abbr"] = "Wrist"
L["Hands_Abbr"] = "Hands"
L["Waist_Abbr"] = "Waist"
L["Legs_Abbr"] = "Legs"
L["Feet_Abbr"] = "Feet"
L["Finger_Abbr"] = "Finger"
L["Trinket_Abbr"] = "Trinket"
L["Held In Off-hand_Abbr"] = "Off-hand"
L["Use Emote Panel"] = true
L["Parse emote expresstion from other players."] = true
L["Press { to active the emote select window."] = true
L["Input Correction"] = true
L["Designed for Asian player, it will help you to enter command without switching IME."] = true
-- 腐化等级
L["Corruption Rank"] = true
L["Show corruption rank in the tooltip when you mouseover an corruption item."] = true