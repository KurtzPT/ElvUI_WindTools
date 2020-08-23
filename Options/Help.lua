local W, F, E, L, V, P, G = unpack(select(2, ...))
local options = W.options.information.args
local ACH = E.Libs.ACH

local type, format, pairs, tostring = type, format, pairs, tostring

local function AddColor(string)
    if type(string) ~= "string" then
        string = tostring(string)
    end
    return F.CreateColorString(string, {r = 0.204, g = 0.596, b = 0.859})
end

options.help = {
    order = 1,
    type = "group",
    name = L["Help"],
    args = {
        description = {
            order = 1,
            type = "description",
            fontSize = "medium",
            name = format(
                "%s\n\n%s\n\n%s\n\n%s\n\n\n",
                L["Thank you for using ElvUI_WindTools."],
                L[
                    "WindTools is a plugin for ElvUI that consists of my original plugins and several plugins developed by other players."
                ],
                L[
                    "In Shadowlands (9.0) pre-patch, ElvUI_WindTools has been rewritten, such that possibly there are bugs somewhere."
                ],
                L[
                    "You can use QQ Group, Discord, Github, or the thread in NGA.cn to send me your suggestions or bugs you met."
                ]
            )
        },
        contributors = {
            order = 2,
            name = L["Contributors (Github.com)"],
            type = "group",
            inline = true,
            args = {
                ["1"] = {
                    order = 1,
                    type = "description",
                    name = format(
                        "%s: %s",
                        "fang2hou",
                        F.CreateClassColorString("Tabimonk @ " .. L["Shadowmoon"] .. "(TW)", "MONK")
                    )
                },
                ["2"] = {
                    order = 2,
                    type = "description",
                    name = "someblu"
                },
                ["3"] = {
                    order = 3,
                    type = "description",
                    name = "mcc1"
                },
                ["4"] = {
                    order = 4,
                    type = "description",
                    name = "MouJiaoZi"
                },
                ["5"] = {
                    order = 4,
                    type = "description",
                    name = "404Polaris"
                },
                ["6"] = {
                    order = 4,
                    type = "description",
                    name = "LiangYuxuan"
                }
            }
        },
        version = {
            order = 3,
            name = L["Version"],
            type = "group",
            inline = true,
            args = {
                elvui = {
                    order = 1,
                    type = "description",
                    name = "ElvUI: " .. AddColor(E.version)
                },
                windtools = {
                    order = 2,
                    type = "description",
                    name = L["WindTools"] .. ": " .. AddColor(W.Version)
                },
                build = {
                    order = 3,
                    type = "description",
                    name = L["WoW Build"] .. ": " .. AddColor(GetBuildInfo())
                }
            }
        },
        contact = {
            order = 4,
            type = "group",
            inline = true,
            name = " ",
            args = {
                nga = {
                    order = 1,
                    type = "execute",
                    name = L["NGA.cn"],
                    image = W.Media.Icons.nga,
                    func = function()
                        E:StaticPopup_Show("ELVUI_EDITBOX", nil, nil, "https://bbs.nga.cn/read.php?tid=12142815")
                    end,
                    width = 0.7
                },
                discord = {
                    order = 2,
                    type = "execute",
                    name = L["Discord"],
                    image = W.Media.Icons.discord,
                    func = function()
                        E:StaticPopup_Show("ELVUI_EDITBOX", nil, nil, "https://discord.gg/JMz5Zsk")
                    end,
                    width = 0.7
                },
                qq = {
                    order = 3,
                    type = "execute",
                    name = L["QQ Group"],
                    image = W.Media.Icons.qq,
                    func = function()
                        E:StaticPopup_Show("ELVUI_EDITBOX", nil, nil, "306069019")
                    end,
                    width = 0.7
                },
                github = {
                    order = 4,
                    type = "execute",
                    name = L["Github"],
                    image = W.Media.Icons.github,
                    func = function()
                        E:StaticPopup_Show(
                            "ELVUI_EDITBOX",
                            nil,
                            nil,
                            "https://github.com/fang2hou/ElvUI_WindTools/issues"
                        )
                    end,
                    width = 0.7
                }
            }
        }
    }
}

options.credits = {
    order = 2,
    type = "group",
    name = L["Credits"],
    args = {
        medias = {
            order = 2,
            name = L["Medias"],
            type = "group",
            inline = true,
            args = {}
        }
    }
}

do
    local mediasCreditList = {
        ["Ferous Media (Ferous)"] = {
            "Media/Texture/Vignetting.tga"
        },
        ["Icon made by Freepik from www.flaticon.com"] = {
            "Media/Texture/Combat.tga",
            "Media/Texture/Shield.tga",
            "Media/Texture/Sword.tga",
            "Media/Icons/Announcement.tga"
        },
        ["Icon made by Pixel perfect from www.flaticon.com"] = {
            "Media/Icons/Calendar.tga"
        },
        ["ファイナルファンタジーXIV ファンキット"] = {
            "Media/Icons/FFXIV"
        },
        ["小华子COME @ www.iconfont.cn"] = {
            "Media/Icons/Misc.tga"
        },
        ["阿猫阿箫 @ www.iconfont.cn"] = {
            "Media/Icons/Tooltips.tga"
        },
        ["KERRY_ZJX @ www.iconfont.cn"] = {
            "Media/Icons/Combat.tga"
        },
        ["Jasmine_20863 @ www.iconfont.cn"] = {
            "Media/Icons/Item.tga"
        },
        ["canisminor-weibo @ www.iconfont.cn"] = {
            "Media/Icons/NGA.tga"
        },
        ["cg尐愳 @ www.iconfont.cn"] = {
            "Media/Icons/Map.tga"
        },
        ["张伟峰 @ www.iconfont.cn"] = {
            "Media/Icons/Help.tga"
        },
        ["Marina·麥 @ www.iconfont.cn"] = {
            "Media/Icons/Help.tga"
        },
        ["29ga @ www.iconfont.cn"] = {
            "Media/Icons/Chat.tga"
        },
        ["王乐城愚人云端 @ www.iconfont.cn"] = {
            "Media/Texture/WindToolsSmall.tga"
        },
        ["TinyChat (loudsoul)"] = {
            "Media/Emotes"
        },
        ["ProjectAzilroka (Azilroka)"] = {
            "Media/FriendList"
        }
    }

    local configOrder = 1

    for author, sourceTable in pairs(mediasCreditList) do
        options.credits.args.medias.args[tostring(configOrder)] = {
            order = configOrder,
            type = "description",
            name = AddColor(author)
        }
        configOrder = configOrder + 1

        for _, source in pairs(sourceTable) do
            options.credits.args.medias.args[tostring(configOrder)] = {
                order = configOrder,
                type = "description",
                name = "  - " .. source
            }
            configOrder = configOrder + 1
        end
    end
end
