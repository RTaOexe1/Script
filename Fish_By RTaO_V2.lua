-------------------------------------------
----- =======[ Load WindUI ]
-------------------------------------------

local Version = "1.6.4"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. Version .. "/main.lua"))()

-------------------------------------------
----- =======[ GLOBAL FUNCTION ]
-------------------------------------------

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local net = ReplicatedStorage:WaitForChild("Packages")
	:WaitForChild("_Index")
	:WaitForChild("sleitnick_net@0.2.0")
	:WaitForChild("net")

local rodRemote = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/ChargeFishingRod"]
local miniGameRemote = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/RequestFishingMinigameStarted"]
local finishRemote = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/FishingCompleted"]

local Player = Players.LocalPlayer
local XPBar = Player:WaitForChild("PlayerGui"):WaitForChild("XP")

LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

task.spawn(function()
    if XPBar then
        XPBar.Enabled = true
    end
end)

local TeleportService = game:GetService("TeleportService")
local PlaceId = game.PlaceId

local function AutoReconnect()
    while task.wait(5) do
        if not Players.LocalPlayer or not Players.LocalPlayer:IsDescendantOf(game) then
            TeleportService:Teleport(PlaceId)
        end
    end
end

Players.LocalPlayer.OnTeleport:Connect(function(state)
    if state == Enum.TeleportState.Failed then
        TeleportService:Teleport(PlaceId)
    end
end)

task.spawn(AutoReconnect)

local ijump = false

local RodIdle = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Animations"):WaitForChild("FishingRodReelIdle")

local RodReel = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Animations"):WaitForChild("EasyFishReelStart")

local RodShake = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Animations"):WaitForChild("CastFromFullChargePosition1Hand")

local character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")


local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)

local RodShake = animator:LoadAnimation(RodShake)
local RodIdle = animator:LoadAnimation(RodIdle)
local RodReel = animator:LoadAnimation(RodReel)

local blockNotif = false

-------------------------------------------
----- =======[ NOTIFY FUNCTION ]
-------------------------------------------

local function NotifySuccess(title, message, duration)
    WindUI:Notify({
        Title = title,
        Content = message,
        Duration = duration,
        Icon = "circle-check"
    })
end

local function NotifyError(title, message, duration)
    WindUI:Notify({
        Title = title,
        Content = message,
        Duration = duration,
        Icon = "ban"
    })
end

local function NotifyInfo(title, message, duration)
    WindUI:Notify({
        Title = title,
        Content = message,
        Duration = duration,
        Icon = "info"
    })
end

local function NotifyWarning(title, message, duration)
    WindUI:Notify({
        Title = title,
        Content = message,
        Duration = duration,
        Icon = "triangle-alert"
    })
end


------------------------------------------
----- =======[ CHECK DATA ]
------------------------------------------

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local pasteURL = "https://paste.monster/mzKzfIKy3U3O/raw/" 
local interval = 30

local notified = false
local kicked = false
 
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
 local interval = 30

local kicked = false
local notified = false
  
local confirmed = true
WindUI:Popup({
    Title = "Important!",
    Icon = "rbxassetid://129260712070622",
    Content = [[
Thank you for using Premium script!.
By RTaO Dev!
]],
    Buttons = {
        { Title = "Close", Variant = "Secondary", Callback = function() end },
        { Title = "Next", Variant = "Primary", Callback = function() confirmed = true end },
    }
})

repeat task.wait() until confirmed


-------------------------------------------
----- =======[ LOAD WINDOW ]
-------------------------------------------

WindUI.TransparencyValue = 0.3

local Window = WindUI:CreateWindow({
    Title = "Fish It ",
    Icon = "hop",
    Author = "By RTaO Dev",
    Folder = "QuietXHub",
    Size = UDim2.fromOffset(600, 400),
    Transparent = true,
    Theme = "Dark",
    KeySystem = false,
    ScrollBarEnabled = true,
    HideSearchBar = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
        end,
    }
})

Window:EditOpenButton({
    Title = "RTaO Dev",
    Icon = "hop",
    CornerRadius = UDim.new(0,19),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("9600FF"), 
        Color3.fromHex("AEBAF8")
    ),
    Draggable = true,
})

Window:Tag({
    Title = "RTaO",
    Color = Color3.fromHex("#30ff6a")
})



local ConfigManager = Window.ConfigManager
local myConfig = ConfigManager:CreateConfig("QuietXConfig")

WindUI:SetNotificationLower(true)

-------------------------------------------
----- =======[ ALL TAB ]
-------------------------------------------


local DevTab = Window:Tab({
    Title = "Feature Guide!",
    Icon = "airplay"
})

local AutoFish = Window:Tab({ 
	Title = "Auto Fish", 
	Icon = "fish"
})

local AutoFarmTab = Window:Tab({
	Title = "Auto Farm",
	Icon = "leaf"
})

local Trade = Window:Tab({
	Title = "Auto Trade",
	Icon = "handshake"
})

local Player = Window:Tab({
    Title = "Player",
    Icon = "users-round"
})

local Utils = Window:Tab({
    Title = "Utility",
    Icon = "earth"
})

local TpTab = Window:Tab({  
    Title = "Teleport To Island",  
    Icon = "map-pin"
})

local BuyRodTab = Window:Tab({  
    Title = "Shop",  
    Icon = "shopping-cart"
})

local SettingsTab = Window:Tab({ 
	Title = "Settings", 
	Icon = "cog" 
})

-------------------------------------------
----- =======[ DEVELOPER TAB ]
-------------------------------------------

DevTab:Paragraph({
    Title = "Developer",
    Desc = "This is Developer Contact",
    Color = "Orange",
    Buttons = {
    	{
    		Title = "Discord Server",
    		Callback = function()
    			setclipboard("https://discord.gg/EH23mXVqce")
    		end
			}
		}
})

DevTab:Paragraph({
	Title = "Feature Guide",
	Color = "Orange",
	Desc = [[
====| Credit|====
RTaO Dev Version 1.1.
]]
})

-------------------------------------------
----- =======[ AUTO FISH TAB ]
-------------------------------------------

-- Toggle Fishing Radar
AutoFish:Toggle({
    Title = "Fishing Radar",
    Desc = "Bypass Fishing Radar",
    Default = false,
    Callback = function(state)
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Lighting = game:GetService("Lighting")

        local Replion = require(ReplicatedStorage.Packages.Replion)
        local Net = require(ReplicatedStorage.Packages.Net)
        local SPR = require(ReplicatedStorage.Packages.spr)
        local Soundbook = require(ReplicatedStorage.Shared.Soundbook)
        local ClientTime = require(ReplicatedStorage.Controllers.ClientTimeController)
        local TextNotification = require(ReplicatedStorage.Controllers.TextNotificationController)

        local UpdateFishingRadar = Net:RemoteFunction("UpdateFishingRadar")

        local function SetRadar(enable)
            local clientData = Replion.Client:GetReplion("Data")
            if not clientData then return end

            if clientData:Get("RegionsVisible") ~= enable then
                if UpdateFishingRadar:InvokeServer(enable) then
                    Soundbook.Sounds.RadarToggle:Play().PlaybackSpeed = 1 + math.random() * 0.3

                    -- Adjust lighting when enabling
                    if enable then
                        local ccEffect = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")
                        if ccEffect then
                            SPR.stop(ccEffect)
                            local lightingProfile = ClientTime:_getLightingProfile()
                            local targetSettings = (lightingProfile and lightingProfile.ColorCorrection) or {}
                            targetSettings.Brightness = targetSettings.Brightness or 0.04
                            targetSettings.TintColor = targetSettings.TintColor or Color3.fromRGB(255, 255, 255)

                            ccEffect.TintColor = Color3.fromRGB(42, 226, 118)
                            ccEffect.Brightness = 0.4
                            SPR.target(ccEffect, 1, 1, targetSettings)
                        end

                        SPR.stop(Lighting)
                        Lighting.ExposureCompensation = 1
                        SPR.target(Lighting, 1, 2, {ExposureCompensation = 0})
                    end

                    -- Notification
                    TextNotification:DeliverNotification({
                        Type = "Text",
                        Text = "Radar: "..(enable and "Enabled" or "Disabled"),
                        TextColor = enable and {R = 9, G = 255, B = 0} or {R = 255, G = 0, B = 0}
                    })
                end
            end
        end

        -- Toggle ON/OFF
        if state then
            SetRadar(true)
        else
            SetRadar(false)
        end
    end
})


local autofish = false
local autofish2 = false
local perfectCast = true
local customDelay = 1.2

function StartAutoFish()
    autofish = true
    task.spawn(function()
        while autofish do
            pcall(function()
             local equipRemote = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/EquipToolFromHotbar"]
                equipRemote:FireServer(1)
                task.wait(0.3)
              local timestamp = tick()
                rodRemote:InvokeServer(timestamp)
                RodShake:Play()
                task.wait(0.5)
               local x, y = 0, 1
                miniGameRemote:InvokeServer(x, y)
                RodIdle:Play()
                task.wait(2.5)
                finishRemote:FireServer()
                RodReel:Play()
                RodIdle:Stop()
            end)
            task.wait(customDelay or 2)
        end
    end)
end

function StopAutoFish()
    autofish = false
end




local EquipEvent = net:WaitForChild("RE/EquipItem")
local SellRemote = net:WaitForChild("RF/SellItem")

local AutoSellEnabled = false
local AutoSellDelay = 1

local function AutoSell(uuid)
    local success, result = pcall(function()
        return SellRemote:InvokeServer(uuid)
    end)
end


if not HookedAutoSell then
    HookedAutoSell = true

    local OldNamecall
    OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local args = { ... }
        local method = getnamecallmethod()

        if self == EquipEvent and method == "FireServer" and AutoSellEnabled then
            local uuid = args[1]
            local itemType = args[2]

            print("[AutoSell] Item Equipped:")
            print("  • UUID  :", uuid)
            print("  • Type  :", itemType)

            task.delay(AutoSellDelay, function()
                AutoSell(uuid)
            end)
        end

        return OldNamecall(self, unpack(args))
    end)
end

--[[local DelayFish = AutoFish:Input({
    Title = "Custom Delay (Auto Fish)",
    Desc = "Enter a custom delay in seconds for Auto Fish",
    Value = nil,
    Type = "Input",
    Placeholder = "Example: 1.2",
    Callback = function(text) 
        local value = tonumber(text)
        if value and value > 0 then
			customDelay = value
			NotifySuccess("Custom Delay", "delay is set to " .. customDelay .. " seconds.")
		else
			NotifyWarning("Input Invalid", "Enter a number greater than 0.")
		end
    end
})
]]
--myConfig:Register("DelayAFish", DelayFish)

--[[AutoFish:Toggle({
    Title = "Auto Fish",
    Callback = function(value)
        if value then
            StartAutoFish()
        else
            StopAutoFish()
        end
    end
})
]]
-------------------------------------------
----- =======[ AUTO FISH V2 TAB ]
-------------------------------------------

local delayTime = 3 -- default delay
local minSafeDelay = 1.5 -- minimum safe delay to prevent Auto Fish errors
local delayInputValue = tostring(delayTime)

AutoFish:Toggle({
    Title = "Auto Fish V2",
    Desc = "Automatically fish and instant fishing",
    Value = false,
    Callback = function(state)
        autoFishEnabled = state

        if state then
            WindUI:Notify({
                Title = "Auto Fish",
                Content = "Enabled",
                Duration = 3
            })

            task.spawn(function()
                while autoFishEnabled do
                    local success, err = pcall(function()
                        local ReplicatedStorage = game:GetService("ReplicatedStorage")
                        local EquipRod = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/EquipToolFromHotbar"]
                        local StartMinigame = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/RequestFishingMinigameStarted"]
                        local ChargeRod = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/ChargeFishingRod"]

                        -- Auto equip rod
                        EquipRod:FireServer(1)
                        task.wait(0.2)

                        -- Start mini game
                        StartMinigame:InvokeServer(-0.7499996423721313, 1)
                        task.wait(0.2)

                        -- Charge rod
                        ChargeRod:InvokeServer(workspace:GetServerTimeNow())
                        task.wait(0.2)

                        -- Request mini game again to ensure
                        StartMinigame:InvokeServer(-0.7499996423721313, 1)
                    end)

                    if not success then
                        warn("Auto Fish error:", err)
                    end

                    -- ensure minimal safe delay
                    local appliedDelay = math.max(delayTime, minSafeDelay)
                    task.wait(appliedDelay)
                end
            end)
        else
            WindUI:Notify({
                Title = "Auto Fish",
                Content = "Disabled",
                Duration = 3
            })
        end
    end
})

local PerfectCast = AutoFish:Toggle({
    Title = "Auto Perfect Cast",
    Value = true,
    Callback = function(value)
        perfectCast = value
    end
})
myConfig:Register("Prefect", PerfectCast)


-- ===== Auto Instant Fish Toggle =====
local autoInstantFishEnabled = false
AutoFish:Toggle({
    Title = "Auto Instant Fish",
    Desc = "Automatically completes fishing instantly",
    Value = false,
    Callback = function(state)
        autoInstantFishEnabled = state

        if state then
            WindUI:Notify({
                Title = "Auto Instant Fish",
                Content = "Enabled",
                Duration = 3
            })

            task.spawn(function()
                while autoInstantFishEnabled do
                    local success, err = pcall(function()
                        local ReplicatedStorage = game:GetService("ReplicatedStorage")
                        local REFishingCompleted = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RE/FishingCompleted"]
                        REFishingCompleted:FireServer()
                    end)
                    if not success then
                        warn("Auto Instant Fish error:", err)
                    end
                    task.wait(0.1)
                end
            end)
        else
            WindUI:Notify({
                Title = "Auto Instant Fish",
                Content = "Disabled",
                Duration = 3
            })
        end
    end
})
-- ===== Delay TextBox + Button =====
AutoFish:Input({
    Title = "Auto Fish Delay",
    Placeholder = "Enter delay (0.1–4 seconds)",
    Callback = function(text)
        delayInputValue = text
    end
})

AutoFish:Button({
    Title = "Apply Delay",
    Desc = "Apply the entered delay value",
    Callback = function()
        local value = tonumber(delayInputValue)
        if value and value >= 0.1 and value <= 4 then
            delayTime = value
            WindUI:Notify({
                Title = "Auto Fish Delay",
                Content = "Delay set to "..string.format("%.1f s", delayTime).." (min safe: "..minSafeDelay.." s)",
                Duration = 2
            })
        else
            WindUI:Notify({
                Title = "Auto Fish Delay",
                Content = "Invalid input! Must be between 0.1–4 seconds",
                Duration = 2
            })
        end
    end
})

-- Anti Kick
local antiKickToggle = AutoFish:Toggle({
    Title = "Anti Kick",
    Desc = "Every 10 seconds, the player will jump to prevent AFK kick.",
    Value = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer

        if state then
            -- Ambil karakter & HumanoidRootPart
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            local initialPos = hrp.Position
            local initialCFrame = hrp.CFrame -- simpan orientasi awal

            -- Anti-AFK VirtualUser
            _G.AntiKickConnection = player.Idled:Connect(function()
                local vu = game:GetService("VirtualUser")
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)

            -- Auto Jump + pergerakan horizontal random
            _G.AutoJumpEnabled = true
            spawn(function()
                while _G.AutoJumpEnabled do
                    task.wait(5) -- interval 5 detik
                    local char = player.Character
                    if not char then break end
                    local humanoid = char:FindFirstChild("Humanoid")
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if humanoid and humanoid.Health > 0 then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                    if hrp then
                        -- Pergerakan horizontal acak
                        local offsetX = math.random(-2,2)/10 -- ±0.2 studs
                        local offsetZ = math.random(-2,2)/10
                        local newPos = hrp.Position + Vector3.new(offsetX, 0, offsetZ)
                        hrp.CFrame = CFrame.lookAt(newPos, newPos + initialCFrame.LookVector)

                        task.wait(0.1)

                        -- Kembali ke posisi awal tetap menghadap depan
                        local currentY = hrp.Position.Y
                        hrp.CFrame = CFrame.lookAt(initialPos + Vector3.new(0, currentY - initialPos.Y, 0), 
                                                   initialPos + Vector3.new(0, currentY - initialPos.Y, 0) + initialCFrame.LookVector)
                    end
                end
            end)

            WindUI:Notify({
                Title = "Anti-Kick + Auto Jump",
                Content = "Enabled: Anti-Kick active with random horizontal movements",
                Duration = 3
            })
        else
            -- Matikan loop & disconnect Idled
            if _G.AntiKickConnection then
                _G.AntiKickConnection:Disconnect()
                _G.AntiKickConnection = nil
            end
            _G.AutoJumpEnabled = false

            WindUI:Notify({
                Title = "Anti-Kick + Auto Jump",
                Content = "Disabled",
                Duration = 3
            })
        end
    end
})


function sellAllFishes()
	local charFolder = workspace:FindFirstChild("Characters")
	local char = charFolder and charFolder:FindFirstChild(LocalPlayer.Name)
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then
		NotifyError("Character Not Found", "HRP tidak ditemukan.")
		return
	end

	local originalPos = hrp.CFrame
	local sellRemote = net:WaitForChild("RF/SellAllItems")

	task.spawn(function()
		NotifyInfo("Selling...", "I'm going to sell all the fish, please wait...", 3)

		task.wait(1)
		local success, err = pcall(function()
			sellRemote:InvokeServer()
		end)

		if success then
			NotifySuccess("Sold!", "All the fish were sold successfully.", 3)
		else
			NotifyError("Sell Failed", tostring(err, 3))
		end

	end)
end

AutoFish:Button({
    Title = "Sell All Fishes",
    Locked = false,
    Callback = function()
        sellAllFishes()
    end
})

AutoFish:Button({
    Title = "Auto Enchant Rod",
    Callback = function()
        local ENCHANT_POSITION = Vector3.new(3231, -1303, 1402)
		local char = workspace:WaitForChild("Characters"):FindFirstChild(LocalPlayer.Name)
		local hrp = char and char:FindFirstChild("HumanoidRootPart")

		if not hrp then
			NotifyError("Auto Enchant Rod", "Failed to get character HRP.")
			return
		end

		NotifyInfo("Preparing Enchant...", "Please manually place Enchant Stone into slot 5 before we begin...", 5)

		task.wait(3)

		local Player = game:GetService("Players").LocalPlayer
		local slot5 = Player.PlayerGui.Backpack.Display:GetChildren()[10]

		local itemName = slot5 and slot5:FindFirstChild("Inner") and slot5.Inner:FindFirstChild("Tags") and slot5.Inner.Tags:FindFirstChild("ItemName")

		if not itemName or not itemName.Text:lower():find("enchant") then
			NotifyError("Auto Enchant Rod", "Slot 5 does not contain an Enchant Stone.")
			return
		end

		NotifyInfo("Enchanting...", "It is in the process of Enchanting, please wait until the Enchantment is complete", 7)

		local originalPosition = hrp.Position
		task.wait(1)
		hrp.CFrame = CFrame.new(ENCHANT_POSITION + Vector3.new(0, 5, 0))
		task.wait(1.2)

		local equipRod = net:WaitForChild("RE/EquipToolFromHotbar")
		local activateEnchant = net:WaitForChild("RE/ActivateEnchantingAltar")

		pcall(function()
			equipRod:FireServer(5)
			task.wait(0.5)
			activateEnchant:FireServer()
			task.wait(7)
			NotifySuccess("Enchant", "Successfully Enchanted!", 3)
		end)

		task.wait(0.9)
		hrp.CFrame = CFrame.new(originalPosition + Vector3.new(0, 3, 0))
    end
})


-------------------------------------------
----- =======[ AUTO FARM TAB ]
-------------------------------------------


local floatPlatform = nil

local function floatingPlat(enabled)
	if enabled then
			local charFolder = workspace:WaitForChild("Characters", 5)
			local char = charFolder:FindFirstChild(LocalPlayer.Name)
			if not char then return end

			local hrp = char:FindFirstChild("HumanoidRootPart")
			if not hrp then return end

			floatPlatform = Instance.new("Part")
			floatPlatform.Anchored = true
			floatPlatform.Size = Vector3.new(10, 1, 10)
			floatPlatform.Transparency = 1
			floatPlatform.CanCollide = true
			floatPlatform.Name = "FloatPlatform"
			floatPlatform.Parent = workspace

			task.spawn(function()
				while floatPlatform and floatPlatform.Parent do
					pcall(function()
						floatPlatform.Position = hrp.Position - Vector3.new(0, 3.5, 0)
					end)
					task.wait(0.1)
				end
			end)

			NotifySuccess("Float Enabled", "This feature has been successfully activated!")
		else
			if floatPlatform then
				floatPlatform:Destroy()
				floatPlatform = nil
			end
			NotifyWarning("Float Disabled", "Feature disabled")
		end
end

  
local LocalPlayer = Players.LocalPlayer  
local workspace = game:GetService("Workspace")  
  
local knownEvents = {}

-- Mapping kode → nama event
local eventCodes = {
	["1"] = "Ghost Shark Hunt",
	["2"] = "Shark Hunt",
	["3"] = "Worm Hunt"
}

local function teleportTo(position)
	local char = workspace:FindFirstChild("Characters"):FindFirstChild(LocalPlayer.Name)
	if char then
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if hrp then
			hrp.CFrame = CFrame.new(position + Vector3.new(0, 10, 0))
		end
	end
end

local function updateKnownEvents()
	knownEvents = {}

	local props = workspace:FindFirstChild("Props")
	if props then
		for _, child in ipairs(props:GetChildren()) do
			if child:IsA("Model") and child.PrimaryPart then
				knownEvents[child.Name:lower()] = child
			end
		end
	end
end

local function monitorEvents()
	local props = workspace:FindFirstChild("Props")
	if not props then
		workspace.ChildAdded:Connect(function(child)
			if child.Name == "Props" then
				task.wait(0.3)
				monitorEvents()
			end
		end)
		return
	end

	props.ChildAdded:Connect(function()
		task.wait(0.3)
		updateKnownEvents()
	end)

	props.ChildRemoved:Connect(function()
		task.wait(0.3)
		updateKnownEvents()
	end)

	updateKnownEvents()
end

monitorEvents()

local autoTPEvent = false
local savedCFrame = nil
local monitoringTP = false
local alreadyTeleported = false
local teleportTime = nil -- waktu saat teleport

local function saveOriginalPosition()
	local char = workspace:FindFirstChild("Characters"):FindFirstChild(LocalPlayer.Name)
	if char and char:FindFirstChild("HumanoidRootPart") then
		savedCFrame = char.HumanoidRootPart.CFrame
	end
end

local function returnToOriginalPosition()
	if savedCFrame then
		local char = workspace:FindFirstChild("Characters"):FindFirstChild(LocalPlayer.Name)
		if char and char:FindFirstChild("HumanoidRootPart") then
			char.HumanoidRootPart.CFrame = savedCFrame
		end
	end
end

local function monitorAutoTP()
	if monitoringTP then return end
	monitoringTP = true

	while true do
		if autoTPEvent then
			if next(knownEvents) ~= nil then
				for _, eventModel in pairs(knownEvents) do
					if not alreadyTeleported then
						saveOriginalPosition()
						teleportTo(eventModel:GetPivot().Position)
						if typeof(floatingPlat) == "function" then
							floatingPlat(true)
						end
						alreadyTeleported = true
						teleportTime = tick()
						NotifyError("Event Farm", "Teleported to: " .. eventModel.Name)
					end
					break
				end
			else
				-- Event hilang sebelum 15 menit
				if alreadyTeleported then
					returnToOriginalPosition()
					if typeof(floatingPlat) == "function" then
						floatingPlat(false)
					end
					alreadyTeleported = false
					teleportTime = nil
					NotifyInfo("Event Ended", "Returned to start position.")
				end
			end

			if alreadyTeleported and teleportTime and (tick() - teleportTime >= 900) then
				returnToOriginalPosition()
				if typeof(floatingPlat) == "function" then
					floatingPlat(false)
				end
				alreadyTeleported = false
				teleportTime = nil
				NotifyInfo("Event Timeout", "Returned after 15 minutes.")
			end
		else
			-- Jika toggle dimatikan, pastikan balik
			if alreadyTeleported then
				returnToOriginalPosition()
				if typeof(floatingPlat) == "function" then
					floatingPlat(false)
				end
				alreadyTeleported = false
				teleportTime = nil
			end
		end

		task.wait(1)
	end
end

task.spawn(monitorAutoTP)

local selectedIsland = "01"
local isAutoFarmRunning = false

local islandCodes = {
    ["01"] = "Crater Islands",
    ["02"] = "Tropical Grove",
    ["03"] = "Vulcano",
    ["04"] = "Coral Reefs",
    ["05"] = "Winter",
    ["06"] = "Machine",
    ["07"] = "Treasure Room",
    ["08"] = "Sisyphus Statue"
}

local farmLocations = {
    ["Crater Islands"] = {
    	CFrame.new(1066.1864, 57.2025681, 5045.5542, -0.682534158, 1.00865822e-08, 0.730853677, -5.8900711e-09, 1, -1.93017531e-08, -0.730853677, -1.74788859e-08, -0.682534158),
    	CFrame.new(1057.28992, 33.0884132, 5133.79883, 0.833871782, 5.44149223e-08, 0.551958203, -6.58184218e-09, 1, -8.86416984e-08, -0.551958203, 7.02829084e-08, 0.833871782),
    	CFrame.new(988.954712, 42.8254471, 5088.71289, -0.849417388, -9.89310394e-08, 0.527721584, -5.96115086e-08, 1, 9.15179328e-08, -0.527721584, 4.62786431e-08, -0.849417388),
    	CFrame.new(1006.70685, 17.2302666, 5092.14844, -0.989664078, 5.6538525e-09, -0.143405005, 9.14879283e-09, 1, -2.3711717e-08, 0.143405005, -2.47786183e-08, -0.989664078),
    	CFrame.new(1025.02356, 2.77259707, 5011.47021, -0.974474192, -6.87871804e-08, 0.224499553, -4.47472104e-08, 1, 1.12170284e-07, -0.224499553, 9.92613209e-08, -0.974474192),
    	CFrame.new(1071.14551, 3.528404, 5038.00293, -0.532300115, 3.38677708e-08, 0.84655571, 6.69992914e-08, 1, 2.12149165e-09, -0.84655571, 5.7847906e-08, -0.532300115),
    	CFrame.new(1022.55457, 16.6277809, 5066.28223, 0.721996129, 0, -0.691897094, 0, 1, 0, 0.691897094, 0, 0.721996129),
    },
    ["Tropical Grove"] = {
    	CFrame.new(-2165.05469, 2.77070165, 3639.87451, -0.589090407, -3.61497356e-08, -0.808067143, -3.20645626e-08, 1, -2.13606164e-08, 0.808067143, 1.3326984e-08, -0.589090407)
    },
    ["Vulcano"] = {
    	CFrame.new(-701.447937, 48.1446075, 93.1546631, -0.0770962164, 1.34335654e-08, -0.997023642, 9.84464776e-09, 1, 1.27124169e-08, 0.997023642, -8.83526763e-09, -0.0770962164),
    	CFrame.new(-654.994934, 57.2567711, 75.098526, -0.540957272, 2.58946509e-09, -0.841050088, -7.58775585e-08, 1, 5.18827363e-08, 0.841050088, 9.1883166e-08, -0.540957272),
    },
    ["Coral Reefs"] = {
    	CFrame.new(-3118.39624, 2.42531538, 2135.26392, 0.92336154, -1.0069185e-07, -0.383931547, 8.0607947e-08, 1, -6.84016968e-08, 0.383931547, 3.22115596e-08, 0.92336154),
    },
    ["Winter"] = {
    	CFrame.new(2036.15308, 6.54998732, 3381.88916, 0.943401575, 4.71338666e-08, -0.331652641, -3.28136842e-08, 1, 4.87781051e-08, 0.331652641, -3.51345975e-08, 0.943401575),
    },
    ["Machine"] = {
    	CFrame.new(-1459.3772, 14.7103214, 1831.5188, 0.777951121, 2.52131862e-08, -0.628324807, -5.24126378e-08, 1, -2.47663063e-08, 0.628324807, 5.21991339e-08, 0.777951121)
    },
    ["Treasure Room"] = {
    	CFrame.new(-3625.0708, -279.074219, -1594.57605, 0.918176472, -3.97606392e-09, -0.396171629, -1.12946204e-08, 1, -3.62128851e-08, 0.396171629, 3.77244298e-08, 0.918176472),
    	CFrame.new(-3600.72632, -276.06427, -1640.79663, -0.696130812, -6.0491181e-09, 0.717914939, -1.09490363e-08, 1, -2.19084972e-09, -0.717914939, -9.38559541e-09, -0.696130812),
    	CFrame.new(-3548.52222, -269.309845, -1659.26685, 0.0472991578, -4.08685423e-08, 0.998880744, -7.68598838e-08, 1, 4.45538149e-08, -0.998880744, -7.88812216e-08, 0.0472991578),
    	CFrame.new(-3581.84155, -279.09021, -1696.15637, -0.999634147, -0.000535600528, -0.0270430837, -0.000448358158, 0.999994695, -0.00323198596, 0.0270446707, -0.00321867829, -0.99962908),
    	CFrame.new(-3601.34302, -282.790955, -1629.37036, -0.526346684, 0.00143659476, 0.850268841, -0.000266355521, 0.999998271, -0.00185445137, -0.850269973, -0.00120255165, -0.526345372)
    },
    ["Sisyphus Statue"] = {
    	CFrame.new(-3722.92139, -101.130035, -955.649902, 0.777723014, -1.41385739e-08, 0.628607094, -2.57670365e-08, 1, 5.43713092e-08, -0.628607094, -5.84831632e-08, 0.777723014),
    	CFrame.new(-3708.47119, -97.2460022, -954.105835, 0.123319283, -4.95575279e-08, -0.992367029, 1.97065848e-08, 1, -4.7489813e-08, 0.992367029, -1.36997551e-08, 0.123319283),
    	CFrame.new(-3731.65234, -98.469101, -944.594482, -0.694187641, 2.44169023e-08, 0.719794095, -6.91526525e-09, 1, -4.05913241e-08, -0.719794095, -3.31555619e-08, -0.694187641)
    }
}


local function parseNumberWithDot(str)
    if typeof(str) ~= "string" or str == "" then return nil end
    local clean = str:gsub("%.", "")
    if clean == "" then return nil end
    return tonumber(clean)
end
      
local obtainedFishUUIDs = {}
local obtainedLimit = 30

local Remote = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_net@0.2.0"].net["RE/ObtainedNewFishNotification"]
Remote.OnClientEvent:Connect(function(_, _, data)
    if data and data.InventoryItem and data.InventoryItem.UUID then
        table.insert(obtainedFishUUIDs, data.InventoryItem.UUID)
    end
end)

local function sellItems()
    if #obtainedFishUUIDs > 0 then
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index")
            :WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/SellAllItems"):InvokeServer()
    end

    obtainedFishUUIDs = {}
end

local function startAutoFarmLoop()
    NotifySuccess("Auto Farm Enabled", "Fishing started on island: " .. selectedIsland)

    while isAutoFarmRunning do
        local islandSpots = farmLocations[selectedIsland]
        if type(islandSpots) == "table" and #islandSpots > 0 then
            location = islandSpots[math.random(1, #islandSpots)]
        else
            location = islandSpots
        end

        if not location then
            NotifyError("Invalid Island", "Selected island name not found.")
            return
        end

        local char = workspace:FindFirstChild("Characters"):FindFirstChild(LocalPlayer.Name)
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then
            NotifyError("Teleport Failed", "HumanoidRootPart not found.")
            return
        end

        hrp.CFrame = location
        task.wait(1.5)

        StartAutoFish()

        repeat
            if not isAutoFarmRunning then break end
            task.wait(0.3)
        until #obtainedFishUUIDs >= obtainedLimit

        if not isAutoFarmRunning then
            StopAutoFish()
            NotifyWarning("Auto Farm Stopped", "Auto Farm manually disabled. Auto Fish stopped.")
            break
        end

        StopAutoFish()
        NotifyInfo("Fish Threshold Reached", "Selling all fishes...")
        task.wait(1.5)

        local npcSellLocation = CFrame.new(-32, 5, 2885)
        if npcSellLocation then
            hrp.CFrame = npcSellLocation
            task.wait(1.25)
        end

        sellItems()
        task.wait(1.5)
    end
end      


local islandCodes = {
    ["01"] = "Crater Islands",
    ["02"] = "Tropical Grove",
    ["03"] = "Vulcano",
    ["04"] = "Coral Reefs",
    ["05"] = "Winter",
    ["06"] = "Machine",
    ["07"] = "Treasure Room",
    ["08"] = "Sisyphus Statue"
}

local nameList = {}
local islandNamesToCode = {}

for code, name in pairs(islandCodes) do
    table.insert(nameList, name)
    islandNamesToCode[name] = code
end

table.sort(nameList)

local CodeIsland = AutoFarmTab:Dropdown({
    Title = "Farm Island",
    Values = nameList,
    Value = nameList[1],
    Callback = function(selectedName)
        local code = islandNamesToCode[selectedName]
        local islandName = islandCodes[code]
        if islandName and farmLocations[islandName] then
            selectedIsland = islandName
            NotifySuccess("Island Selected", "Farming location set to " .. islandName)
        else
            NotifyError("Invalid Selection", "The island name is not recognized.")
        end
    end
})

myConfig:Register("IslCode", CodeIsland)

local FishThres = AutoFarmTab:Input({
	Title = "Fish Threshold",
	Placeholder = "Example: 1500",
	Value = nil,
	Callback = function(value)
		local number = tonumber(value)
		if number then
		  obtainedLimit = number
			NotifySuccess("Threshold Set", "Fish threshold set to " .. number)
		else
		  NotifyError("Invalid Input", "Failed to convert input to number.")
		end
	end,
})


myConfig:Register("FishThreshold", FishThres)

local AutoFarm = AutoFarmTab:Toggle({
	Title = "Start Auto Farm",
	Callback = function(state)
		isAutoFarmRunning = state
		if state then
			startAutoFarmLoop()
		else
			StopAutoFish()
		end
	end
})

myConfig:Register("AutoFarmStart", AutoFarm)

AutoFarmTab:Toggle({
	Title = "Auto Farm Event",
	Desc = "!! DO WITH YOUR OWN RISK !!",
	Value = false,
	Callback = function(state)
		autoTPEvent = state
		if autoTPEvent then
			monitorAutoTP()
		else
			if alreadyTeleported then
				returnToOriginalPosition()
				if typeof(floatingPlat) == "function" then
					floatingPlat(false)
				end
				alreadyTeleported = false
			end
		end
	end
})

-------------------------------------------
----- =======[ TRADE TAB ]
-------------------------------------------


local targetUserId = nil
local tradeActive = false

Trade:Input({
   Title = "Trade",
   Desc = "Trade With Someone Here",
   Placeholder = "Enter Display Name",
   Callback = function(displayName)
      for _, player in ipairs(Players:GetPlayers()) do
         if player.DisplayName == displayName or player.Name == displayName then
            targetUserId = player.UserId
            NotifySuccess("Trade Target", "Trade target found: " .. player.Name)
            return
         end
      end
      NotifyError("Trade Target", "Player not found", 3)
   end,
})

Trade:Toggle({
   Title = "Enable Trade",
   Value = false,
   Callback = function(val)
      tradeActive = val
      if val then
         NotifySuccess("Trade Mode", "Trade Mode is active. Click an item to send a trade..")
      else
         NotifySuccess("Trade Mode", "Trade Mode Disabled.")
      end
   end,
})

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
   local args = {...}
   local method = getnamecallmethod()

   if tradeActive and tostring(self) == "RE/EquipItem" and method == "FireServer" then
      local uuid = args[1]
      if uuid and targetUserId then
         local initiateTrade = net:WaitForChild("RF/InitiateTrade")
         initiateTrade:InvokeServer(targetUserId, uuid)
         NotifySuccess("Trade Sent", "Trade sent to " .. targetUserId)
      else
         NotifyError("Failed to Send Trade", "Make sure Display Name is filled in and the item is valid.")
      end
      return nil
   end

   return oldNamecall(self, unpack(args))
end)

setreadonly(mt, true)

local RFAwaitTradeResponse = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/AwaitTradeResponse"]

local autoAcceptTrade = false

RFAwaitTradeResponse.OnClientInvoke = function(fromPlayer, timeNow)
    if autoAcceptTrade then
        return true
    else
        return nil
    end
end

Trade:Toggle({
    Title = "Auto Accept Trade",
    Desc = "Skip Time Trade",
    Default = false,
    Callback = function(state)
        autoAcceptTrade = state
        if autoAcceptTrade then
            NotifySuccess("Trade", "Auto Accept Trade Enabled")
        else
            NotifyWarning("Trade", "Auto Accept Trade Disabled")
        end
    end
})


-------------------------------------------
----- =======[ PLAYER TAB ]
-------------------------------------------


local LocalPlayer = Players.LocalPlayer

local currentDropdown = nil

-- Fungsi untuk ambil daftar player
local function getPlayerList()
local list = {}
for _, p in ipairs(Players:GetPlayers()) do
if p ~= LocalPlayer then
table.insert(list, p.DisplayName)
end
end
return list
end

local function teleportToPlayerExact(target)
local characters = workspace:FindFirstChild("Characters")
if not characters then return end

local targetChar = characters:FindFirstChild(target)  
local myChar = characters:FindFirstChild(LocalPlayer.Name)  

if targetChar and myChar then  
	local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")  
	local myHRP = myChar:FindFirstChild("HumanoidRootPart")  
	if targetHRP and myHRP then  
		myHRP.CFrame = targetHRP.CFrame + Vector3.new(2, 0, 0)  
	end  
end

end

local function updateDropdown()
if currentDropdown and currentDropdown.Destroy then
currentDropdown:Destroy()
end


currentDropdown = Player:Dropdown({  
	Title = "Teleport to Player",  
	Desc = "Select player to teleport",  
	Values = getPlayerList(),  
	Callback = function(selectedDisplayName)  
		for _, p in pairs(Players:GetPlayers()) do  
			if p.DisplayName == selectedDisplayName then  
				teleportToPlayerExact(p.Name)  
				NotifySuccess("Teleport Successfully", "Successfully Teleported to " .. p.DisplayName .. "!", 3)  
				break  
			end  
		end  
	end  
})

end

Players.PlayerAdded:Connect(function()
task.delay(0.1, updateDropdown)
end)

Players.PlayerRemoving:Connect(function()
task.delay(0.1, updateDropdown)
end)

updateDropdown()


local defaultMinZoom = LocalPlayer.CameraMinZoomDistance
local defaultMaxZoom = LocalPlayer.CameraMaxZoomDistance

Player:Toggle({
    Title = "Unlimited Zoom",
    Desc = "Unlimited Camera Zoom for take a Picture",
    Value = false,
    Callback = function(state)
        if state then
            LocalPlayer.CameraMinZoomDistance = 0.5
            LocalPlayer.CameraMaxZoomDistance = 9999
        else
            LocalPlayer.CameraMinZoomDistance = defaultMinZoom
            LocalPlayer.CameraMaxZoomDistance = defaultMaxZoom
        end
    end
})


local function accessAllBoats()
    local vehicles = workspace:FindFirstChild("Vehicles")
    if not vehicles then
        NotifyError("Not Found", "Vehicles container not found.")
        return
    end

    local count = 0

    for _, boat in ipairs(vehicles:GetChildren()) do
        if boat:IsA("Model") and boat:GetAttribute("OwnerId") then
            local currentOwner = boat:GetAttribute("OwnerId")
            if currentOwner ~= LocalPlayer.UserId then
                boat:SetAttribute("OwnerId", LocalPlayer.UserId)
                count += 1
            end
        end
    end

    NotifySuccess("Access Granted", "You now own " .. count .. " boat(s).", 3)
end

Player:Button({
    Title = "Access All Boats",
    Callback = accessAllBoats
})

Player:Toggle({
	Title = "Infinity Jump",
	Callback = function(val)
		ijump = val
	end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
	if ijump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
	end
end)

local EnableFloat = Player:Toggle({
	Title = "Enable Float",
	Value = nil,
	Callback = function(enabled)
			floatingPlat(enabled)
	end,
})

myConfig:Register("ActiveFloat", EnableFloat)

local universalNoclip = false
local originalCollisionState = {}


local NoClip = Player:Toggle({
	Title = "Universal No Clip",
	Value = nil,
	Callback = function(val)
		universalNoclip = val

		if val then
			NotifySuccess("Universal Noclip Active", "You & your vehicle can penetrate all objects.", 3)
		else

			for part, state in pairs(originalCollisionState) do
				if part and part:IsA("BasePart") then
					part.CanCollide = state
				end
			end
			originalCollisionState = {}
			NotifyWarning("Universal Noclip Disabled", "All collisions are returned to their original state.", 3)
		end
	end,
})

game:GetService("RunService").Stepped:Connect(function()
	if not universalNoclip then return end

	local char = LocalPlayer.Character
	if char then
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide == true then
				originalCollisionState[part] = true
				part.CanCollide = false
			end
		end
	end

	for _, model in ipairs(workspace:GetChildren()) do
		if model:IsA("Model") and model:FindFirstChildWhichIsA("VehicleSeat", true) then
			for _, part in ipairs(model:GetDescendants()) do
				if part:IsA("BasePart") and part.CanCollide == true then
					originalCollisionState[part] = true
					part.CanCollide = false
				end
			end
		end
	end
end)

myConfig:Register("NoClip", NoClip)

local AntiDrown_Enabled = false
local rawmt = getrawmetatable(game)
setreadonly(rawmt, false)
local oldNamecall = rawmt.__namecall

rawmt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if tostring(self) == "URE/UpdateOxygen" and method == "FireServer" and AntiDrown_Enabled then
        return nil
    end

    return oldNamecall(self, ...)
end)


local ADrown = Player:Toggle({
	Title = "Anti Drown (Oxygen Bypass)",
	Callback = function(state)
		AntiDrown_Enabled = state
		if state then
			NotifySuccess("Anti Drown Active", "Oxygen loss has been blocked.", 3)
		else
			NotifyWarning("Anti Drown Disabled", "You're vulnerable to drowning again.", 3)
		end
	end,
})

myConfig:Register("AntiDrown", ADrown)

local Speed = Player:Slider({
	Title = "WalkSpeed",
	Value = {
	    Min = 16,
	    Max = 200,
	    Default = 20
	},
	Step = 1,
	Callback = function(val)
		local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if hum then hum.WalkSpeed = val end
	end,
})

myConfig:Register("PlayerSpeed", Speed)

local Jp = Player:Slider({
	Title = "Jump Power",
	Value = {
	    Min = 50, 
	    Max = 500,
	    Default = 35
	},
	Step = 10,
	Callback = function(val)
		local char = LocalPlayer.Character
		if char then
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then
				hum.UseJumpPower = true
				hum.JumpPower = val
			end
		end
	end,
})

myConfig:Register("JumpPower", Jp)

-----------[ ESP PLAYERS ] ----------------

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

-- Folder untuk ESP
local ESPFolder = Instance.new("Folder")
ESPFolder.Name = "PlayerESP"
ESPFolder.Parent = CoreGui

local playerESPEnabled = false 

-- Fungsi membuat ESP (hanya dipanggil saat toggle ON)
local function CreatePlayerESP(player)
    if player == LocalPlayer or ESPFolder:FindFirstChild(player.Name) then return end
    local character = player.Character
    if not character then return end
    local head = character:FindFirstChild("Head")
    if not head then return end

    local container = Instance.new("Folder")
    container.Name = player.Name
    container.Parent = ESPFolder

    -- Highlight biru
    local highlight = Instance.new("Highlight")
    highlight.Adornee = character
    highlight.FillTransparency = 1
    highlight.OutlineColor = Color3.fromRGB(0, 170, 255) -- BIRU
    highlight.OutlineTransparency = 0
    highlight.Parent = container

    -- NameTag
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "NameTag"
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 100, 0, 20)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = container

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1) -- Putih
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextScaled = true
    nameLabel.Parent = billboard
end

-- Hapus semua ESP
local function ClearESP()
    ESPFolder:ClearAllChildren()
end

-- Mulai ESP loop
local connection
local function StartESP()
    if connection then return end
    connection = RunService.Heartbeat:Connect(function()
        if playerESPEnabled then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    if not ESPFolder:FindFirstChild(player.Name) then
                        CreatePlayerESP(player)
                    end
                end
            end
        else
            ClearESP()
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end)
end

Player:Toggle({
	Title = "Player ESP",
    Desc = "Show ESP for Other Players with Blue Outline and White NameTag",
    Value = false,
    Callback = function(state)
        playerESPEnabled = state
        if state then
            StartESP()
        else
            ClearESP()
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end
})

-- Hapus ESP saat pemain keluar
Players.PlayerRemoving:Connect(function(player)
    local esp = ESPFolder:FindFirstChild(player.Name)
    if esp then esp:Destroy() end
end) 

-------------------------------------------
----- =======[ UTILITY TAB ]
-------------------------------------------

local RodItemsPath = game:GetService("ReplicatedStorage"):WaitForChild("Items")

local BaitsPath = ReplicatedStorage:WaitForChild("Baits")

local lastModifiedRod = nil
local originalRodData = {}

local lastModifiedBait = nil
local originalBaitData = {}

local function deepCopyTable(tbl)
	local copy = {}
	for k, v in pairs(tbl) do
		copy[k] = typeof(v) == "table" and deepCopyTable(v) or v
	end
	return copy
end

local function resetPreviousRod()
	if lastModifiedRod and originalRodData[lastModifiedRod] then
		local rodModule = RodItemsPath:FindFirstChild(lastModifiedRod)
		if rodModule and rodModule:IsA("ModuleScript") then
			local rodData = require(rodModule)
			local originalData = originalRodData[lastModifiedRod]

			for key, value in pairs(originalData) do
				rodData[key] = value
			end
			NotifyWarning("Rod Reset", "Rod '" .. lastModifiedRod .. "' has been reset.", 3)
		end
	end
end

local function modifyRodData(rodNameInput)
	local targetModule = RodItemsPath:FindFirstChild(rodNameInput)
	if not targetModule then
		NotifyError("Rod Not Found", "No rod matched: " .. rodNameInput, 3)
		return
	end

	resetPreviousRod()

	local rodData = require(targetModule)
	if rodData.Data and rodData.Data.Type == "Fishing Rods" then
		originalRodData[rodNameInput] = deepCopyTable(rodData)
		lastModifiedRod = rodNameInput

		if rodData.RollData and rodData.RollData.BaseLuck then
			rodData.RollData.BaseLuck *= 1.35
		end
		if rodData.ClickPower then
			rodData.ClickPower *= 1.25
		end
		if rodData.Resilience then
			rodData.Resilience *= 1.25
		end
		if typeof(rodData.Windup) == "NumberRange" then
			local newMin = rodData.Windup.Min * 0.50
			local newMax = rodData.Windup.Max * 0.50
			rodData.Windup = NumberRange.new(newMin, newMax)
		end
		if rodData.MaxWeight then
			rodData.MaxWeight *= 1.25
		end

		NotifySuccess("Rod Modified", "Rod '" .. rodData.Data.Name .. "' successfully boosted.", 3)
	else
		NotifyError("Invalid Rod", "The selected module is not a valid rod.", 3)
	end
end

local function resetPreviousBait()
	if lastModifiedBait and originalBaitData[lastModifiedBait] then
		local bait = BaitsPath:FindFirstChild(lastModifiedBait)
		if bait and bait:IsA("ModuleScript") then
			local baitData = require(bait)
			local originalData = originalBaitData[lastModifiedBait]

			for key, value in pairs(originalData) do
				baitData[key] = value
			end

			NotifyWarning("Bait Reset", "Bait '" .. lastModifiedBait .. "' has been reset.", 3)
		end
	end
end

local function modifyBaitData(baitName)
	local baitModule = BaitsPath:FindFirstChild(baitName)
	if not baitModule then
		NotifyError("Bait Not Found", "No bait matched: " .. baitName, 3)
		return
	end

	resetPreviousBait()

	local baitData = require(baitModule)
	originalBaitData[baitName] = deepCopyTable(baitData)
	lastModifiedBait = baitName

	if baitData.Modifiers and baitData.Modifiers.BaseLuck then
		baitData.Modifiers.BaseLuck *= 1.4
	end

	NotifySuccess("Bait Modified", "Bait '" .. baitName .. "' successfully boosted.", 3)
end

local rodOptions = {}
local rodNameMap = {}

for _, item in pairs(RodItemsPath:GetChildren()) do
	if item:IsA("ModuleScript") and item.Name:sub(1,3) == "!!!" then
		local displayName = item.Name:gsub("^!!!", "")
		table.insert(rodOptions, displayName)
		rodNameMap[displayName] = item.Name
	end
end

Utils:Dropdown({
	Title = "Rod Modifiers",
	Values = rodOptions,
	Multi = false,
	Callback = function(displayedRodName)
		local actualRodName = rodNameMap[displayedRodName]
		if actualRodName then
			modifyRodData(actualRodName)
		end
	end
})


local baitOptions = {}
for _, bait in pairs(BaitsPath:GetChildren()) do
	if bait:IsA("ModuleScript") then
		table.insert(baitOptions, bait.Name)
	end
end

Utils:Dropdown({
	Title = "Bait Modifier",
	Values = baitOptions,
	Multi = false,
	Callback = function(option)
		modifyBaitData(option)
	end
})

Utils:Button({
	Title = "Reset Last Modified Bait",
	Callback = function()
		if lastModifiedBait then
			resetPreviousBait()
			lastModifiedBait = nil
		else
			NotifyWarning("No Bait", "No bait has been modified yet.", 3)
		end
	end
})

Utils:Button({
	Title = "Reset Last Modified Rod",
	Callback = function()
		if lastModifiedRod then
			resetPreviousRod()
			lastModifiedRod = nil
		else
			NotifyWarning("No Rod", "No rod has been modified yet.", 3)
		end
	end
})

local islandCoords = {
	["01"] = { name = "Weather Machine", position = Vector3.new(-1471, -3, 1929) },
	["02"] = { name = "Esoteric Depths", position = Vector3.new(3157, -1303, 1439) },
	["03"] = { name = "Tropical Grove", position = Vector3.new(-2038, 3, 3650) },
	["04"] = { name = "Stingray Shores", position = Vector3.new(-32, 4, 2773) },
	["05"] = { name = "Kohana Volcano", position = Vector3.new(-519, 24, 189) },
	["06"] = { name = "Coral Reefs", position = Vector3.new(-3095, 1, 2177) },
	["07"] = { name = "Crater Island", position = Vector3.new(968, 1, 4854) },
	["08"] = { name = "Kohana", position = Vector3.new(-658, 3, 719) },
	["09"] = { name = "Winter Fest", position = Vector3.new(1611, 4, 3280) },
	["10"] = { name = "Isoteric Island", position = Vector3.new(1987, 4, 1400) },
	["11"] = { name = "Treasure Hall", position = Vector3.new(-3600, -267, -1558) },
	["12"] = { name = "Lost Shore", position = Vector3.new(-3663, 38, -989) },
	["13"] = { name = "Ice Island", Position = Vector3.new(1766.46, 19.16, 3086.23) },
	["14"] = { name = "Teleport To Enchant", Position = Vector3.new(3236.120, -1302.855, 1399.491)}
}

local islandNames = {}
for _, data in pairs(islandCoords) do
    table.insert(islandNames, data.name)
end

TpTab:Paragraph({
    Title = "Teleport",
    Desc = "Select a location from dropdown and press Teleport."
})

TpTab:Dropdown({
    Title = "Island Selector",
    Desc = "Select island to teleport",
    Values = islandNames,
    Value = islandNames[1],
    Callback = function(selectedName)
        for code, data in pairs(islandCoords) do
            if data.name == selectedName then
                local success, err = pcall(function()
                    local charFolder = workspace:WaitForChild("Characters", 5)
                    local char = charFolder:FindFirstChild(LocalPlayer.Name)
                    if not char then error("Character not found") end
                    local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 3)
                    if not hrp then error("HumanoidRootPart not found") end
                    hrp.CFrame = CFrame.new(data.position + Vector3.new(0, 5, 0))
                end)

                if success then
                    NotifySuccess("Teleported!", "You are now at " .. selectedName)
                else
                    NotifyError("Teleport Failed", tostring(err))
                end
                break
            end
        end
    end
})

local eventsList = { "Shark Hunt", "Ghost Shark Hunt", "Worm Hunt" }

TpTab:Dropdown({
    Title = "Teleport Event",
    Values = eventsList,
    Value = "Shark Hunt",
    Callback = function(option)
        local props = workspace:FindFirstChild("Props")
        if props and props:FindFirstChild(option) and props[option]:FindFirstChild("Fishing Boat") then
            local fishingBoat = props[option]["Fishing Boat"]
            local boatCFrame = fishingBoat:GetPivot()
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = boatCFrame + Vector3.new(0, 15, 0)
                WindUI:Notify({
                	Title = "Event Available!",
                	Content = "Teleported To " .. option,
                	Icon = "circle-check",
                	Duration = 3
                })
            end
        else
            WindUI:Notify({
                Title = "Event Not Found",
                Text = option .. " Not Found!",
                Icon = "ban",
                Duration = 3
            })
        end
    end
})

-- Toggle Diving Gear ON/OFF
TpTab:Toggle({
    Title = "Diving Gear",
    Desc = "Using diving gear without buying it",
    Default = false,
    Callback = function(state)
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Replion = require(ReplicatedStorage.Packages.Replion)
        local Net = require(ReplicatedStorage.Packages.Net)
        local ItemUtility = require(ReplicatedStorage.Shared.ItemUtility)
        local Soundbook = require(ReplicatedStorage.Shared.Soundbook)
        local NotificationController = require(ReplicatedStorage.Controllers.TextNotificationController)

        local DivingGear = ItemUtility:GetItemData("Diving Gear")
        if not DivingGear then return end

        local ReplionData = Replion.Client:GetReplion("Data")

        if state then
            -- ON
            if ReplionData:Get("EquippedOxygenTankId") ~= DivingGear.Data.Id then
                local EquipFunc = Net:RemoteFunction("EquipOxygenTank")
                local success = EquipFunc:InvokeServer(DivingGear.Data.Id)
                if success then
                    Soundbook.Sounds.DivingToggle:Play().PlaybackSpeed = 1 + math.random() * 0.3
                    NotificationController:DeliverNotification({
                        Type = "Text",
                        Text = "Diving Gear: On",
                        TextColor = {R = 9, G = 255, B = 0}
                    })
                end
            end
        else
            -- OFF
            if ReplionData:Get("EquippedOxygenTankId") == DivingGear.Data.Id then
                local UnequipFunc = Net:RemoteFunction("UnequipOxygenTank")
                local success = UnequipFunc:InvokeServer()
                if success then
                    Soundbook.Sounds.DivingToggle:Play().PlaybackSpeed = 1 + math.random() * 0.3
                    NotificationController:DeliverNotification({
                        Type = "Text",
                        Text = "Diving Gear: Off",
                        TextColor = {R = 255, G = 0, B = 0}
                    })
                end
            end
        end
    end
})

local Boats = {
    { Name = "Small Boat", Id = 1 },
    { Name = "Kayak", Id = 2 },
    { Name = "Jetsky", Id = 3 },
    { Name = "Highfield Boat", Id = 4 },
    { Name = "Speed Boat", Id = 5 },
    { Name = "Fishing Boat", Id = 6 },
    { Name = "Hyper Boat", Id = 7 },
    { Name = "Alpha Floaty", Id = 8 },
    { Name = "Devil Duck 9000", Id = 9 },
    { Name = "Festive Duck", Id = 10 },
    { Name = "Frozen Boat", Id = 11 },
    { Name = "Santa Sleigh", Id = 12 },
    { Name = "Cruiser Boat", Id = 13 },
    { Name = "Mini Yacth", Id = 14 },
}

local function despawnBoat()
	local success, err = pcall(function()
		net:WaitForChild("RF/DespawnBoat"):InvokeServer()
	end)
	if not success then
		NotifyError("Despawn Failed", tostring(err))
	end
end

local function spawnBoat(id, name)
	despawnBoat()
	task.wait(1.3)
	local success, err = pcall(function()
		net:WaitForChild("RF/SpawnBoat"):InvokeServer(id)
	end)

	if success then
		NotifySuccess("Boat Spawned", "Successfully spawned " .. name)
	else
		NotifyError("Spawn Failed", tostring(err))
	end
end

local boatNames = {}
for _, boat in ipairs(Boats) do
	table.insert(boatNames, boat.Name)
end

Utils:Dropdown({
    Title = "Spawn Boat",
    Desc = "Select a boat to spawn",
    Values = boatNames,
    Value = boatNames[1],
    Callback = function(selectedName)
        for _, boat in ipairs(Boats) do
            if boat.Name == selectedName then
                spawnBoat(boat.Id, boat.Name)
                break
            end
        end
    end
})

Utils:Toggle({
Title = "Super Speed Boats",
    Default = false,
    Callback = function(state)
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local BoatsModule = require(ReplicatedStorage.Shared.BoatsHandlingData)

        -- Simpan Speed asli untuk restore
        if not BoatsModule._OriginalSpeed then
            BoatsModule._OriginalSpeed = {}
            for boatName, boatData in pairs(BoatsModule) do
                BoatsModule._OriginalSpeed[boatName] = boatData.Speed
            end
        end

        if state then
            -- ON: Set semua boat Speed = 1000
            for _, boatData in pairs(BoatsModule) do
                boatData.Speed = 1000
            end
        else
            -- OFF: Restore Speed asli
            for boatName, boatData in pairs(BoatsModule) do
                if BoatsModule._OriginalSpeed[boatName] then
                    boatData.Speed = BoatsModule._OriginalSpeed[boatName]
                end
            end
        end
    end
})


local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local HRP = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local Camera = workspace.CurrentCamera

local Items = ReplicatedStorage:WaitForChild("Items")
local Baits = ReplicatedStorage:WaitForChild("Baits")
local net = ReplicatedStorage:WaitForChild("Packages")
	:WaitForChild("_Index")
	:WaitForChild("sleitnick_net@0.2.0")
	:WaitForChild("net")


local npcCFrame = CFrame.new(
	66.866745, 4.62500143, 2858.98535,
	-0.981261611, 5.77215005e-08, -0.192680314,
	6.94250204e-08, 1, -5.39889484e-08,
	0.192680314, -6.63541186e-08, -0.981261611
)


local function FadeScreen(duration)
	local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false

	local frame = Instance.new("Frame", gui)
	frame.BackgroundColor3 = Color3.new(0, 0, 0)
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 1

	local tweenIn = TweenService:Create(frame, TweenInfo.new(0.2), { BackgroundTransparency = 0.9 })
	tweenIn:Play()
	tweenIn.Completed:Wait()

	wait(duration)

	local tweenOut = TweenService:Create(frame, TweenInfo.new(0.3), { BackgroundTransparency = 1 })
	tweenOut:Play()
	tweenOut.Completed:Wait()
	gui:Destroy()
end

local function SafePurchase(callback)
	local originalCFrame = HRP.CFrame
	HRP.CFrame = npcCFrame
	FadeScreen(0.9)
	pcall(callback)
	wait(1)
	HRP.CFrame = originalCFrame
end

-- RODS DROPDOWN
local rodOptions = {}
local rodData = {}

for _, rod in ipairs(Items:GetChildren()) do
	if rod:IsA("ModuleScript") and rod.Name:find("!!!") then
		local success, module = pcall(require, rod)
		if success and module and module.Data then
			local id = module.Data.Id
			local name = module.Data.Name or rod.Name
			local price = module.Price or module.Data.Price

			if price then
				table.insert(rodOptions, name .. " | Price: " .. tostring(price))
				rodData[name] = id
			end
		end
	end
end

Utils:Dropdown({
	Title = "NPC",
	Desc = "Select NPC to Teleport",
	Values = npcList,
	Value = nil,
	Callback = function(selectedName)
		local npc = npcFolder:FindFirstChild(selectedName)
		if npc and npc:IsA("Model") then
			local hrp = npc:FindFirstChild("HumanoidRootPart") or npc.PrimaryPart
			if hrp then
				local charFolder = workspace:FindFirstChild("Characters", 5)
				local char = charFolder and charFolder:FindFirstChild(LocalPlayer.Name)
				if not char then return end
				local myHRP = char:FindFirstChild("HumanoidRootPart")
				if myHRP then
					myHRP.CFrame = hrp.CFrame + Vector3.new(0, 3, 0)
					NotifySuccess("Teleported!", "You are now near: " .. selectedName)
				end
			end
		end
	end
})


-------------------------------------------
----- =======[ SETTINGS TAB ]
-------------------------------------------


local AntiAFKEnabled = true
local AFKConnection = nil

SettingsTab:Toggle({
	Title = "Anti-AFK",
	Value = true,
	Callback = function(Value)
		if not blockNotif then
			blockNotif = true
			return
	  end
		AntiAFKEnabled = Value
		if AntiAFKEnabled then
			if AFKConnection then
				AFKConnection:Disconnect()
			end

			
			local LocalPlayer = Players.LocalPlayer
			local VirtualUser = game:GetService("VirtualUser")

			AFKConnection = LocalPlayer.Idled:Connect(function()
				pcall(function()
					VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
					task.wait(1)
					VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				end)
			end)

			if NotifySuccess then
				NotifySuccess("Anti-AFK Activated", "You will now avoid being kicked.")
			end

		else
			if AFKConnection then
				AFKConnection:Disconnect()
				AFKConnection = nil
			end

			if NotifySuccess then
				NotifySuccess("Anti-AFK Deactivated", "You can now go idle again.")
			end
		end
	end,
})

SettingsTab:Button({
	Title = "Boost FPS (Maximize Performance)",
	Callback = function()
		for _, v in pairs(game:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Material = Enum.Material.SmoothPlastic
				v.Reflectance = 0
			elseif v:IsA("Decal") or v:IsA("Texture") then
				v.Transparency = 1
			end
		end

		local Lighting = game:GetService("Lighting")
		for _, effect in pairs(Lighting:GetChildren()) do
			if effect:IsA("PostEffect") then
				effect.Enabled = false
			end
		end

		Lighting.GlobalShadows = false
		Lighting.FogEnd = 1e10

		settings().Rendering.QualityLevel = "Level01"
	end
})
--Theem
local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)

local themeDropdown = SettingsTab:Dropdown({
    Title = "Select Theme",
    Values = themes,
    Value = WindUI:GetCurrentTheme(),
    Callback = function(theme)
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "Theme Applied",
            Content = theme,
            Icon = "palette",
            Duration = 2
        })
        if Window.ConfigManager then
            local config = Window.ConfigManager:CreateConfig("transparent_autoload")
            config:Set("Theme", theme)
            config:Save()
        end
    end
})

SettingsTab:Button({
	Title = "HDR Shader",
	Callback = function()
		loadstring(game:HttpGet("https://paste.monster/IVE9Xt3YJWkp/raw/"))()
	end,
})

local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local function Rejoin()
	local player = Players.LocalPlayer
	if player then
		TeleportService:Teleport(game.PlaceId, player)
	end
end

local function ServerHop()
	local placeId = game.PlaceId
	local servers = {}
	local cursor = ""
	local found = false

	repeat
		local url = "https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100"
		if cursor ~= "" then
			url = url .. "&cursor=" .. cursor
		end

		local success, result = pcall(function()
			return HttpService:JSONDecode(game:HttpGet(url))
		end)

		if success and result and result.data then
			for _, server in pairs(result.data) do
				if server.playing < server.maxPlayers and server.id ~= game.JobId then
					table.insert(servers, server.id)
				end
			end
			cursor = result.nextPageCursor or ""
		else
			break
		end
	until not cursor or #servers > 0

	if #servers > 0 then
		local targetServer = servers[math.random(1, #servers)]
		TeleportService:TeleportToPlaceInstance(placeId, targetServer, LocalPlayer)
	else
		NotifyError("Server Hop Failed", "No servers available or all are full!")
	end
end

local Keybind = SettingsTab:Keybind({
    Title = "Keybind",
    Desc = "Keybind to open UI",
    Value = "G",
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
    end
})

myConfig:Register("Keybind", Keybind)

SettingsTab:Button({
	Title = "Rejoin Server",
	Callback = function()
		Rejoin()
	end,
})

SettingsTab:Button({
	Title = "Server Hop (New Server)",
	Callback = function()
		ServerHop()
	end,
})


SettingsTab:Button({
    Title = "Save",
    Desc = "Save Settings to config",
    Callback = function()
        myConfig:Save()
        NotifySuccess("Config Saved", "Config has been saved!")
    end
})

SettingsTab:Button({
    Title = "Load",
    Desc = "Loads Settings from config",
    Callback = function()
        myConfig:Load()
        NotifySuccess("Config Loaded", "Config has beed loaded!")
    end
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RFPurchaseFishingRod = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseFishingRod"]
local RFPurchaseBait = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseBait"]
local RFPurchaseWeatherEvent = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseWeatherEvent"]
local RFPurchaseBoat = ReplicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseBoat"]

-- ===== Rod Data =====
local rods = {
    ["Luck Rod"] = 79,
    ["Carbon Rod"] = 76,
    ["Grass Rod"] = 85,
    ["Demascus Rod"] = 77,
    ["Ice Rod"] = 78,
    ["Lucky Rod"] = 4,
    ["Midnight Rod"] = 80,
    ["Steampunk Rod"] = 6,
    ["Chrome Rod"] = 7,
    ["Astral Rod"] = 5,
    ["Ares Rod"] = 126,
    ["Angler Rod"] = 168
}

-- Dropdown display names (nama + harga)
local rodNames = {
    "Luck Rod ($350)", "Carbon Rod ($900)", "Grass Rod ($1.5k)", "Demascus Rod ($3k)",
    "Ice Rod ($5k)", "Lucky Rod ($15k)", "Midnight Rod ($50k)", "Steampunk Rod ($215k)",
    "Chrome Rod ($437k)", "Astral Rod ($1M)", "Ares Rod ($3M)", "Angler Rod ($8M)"
}

-- Mapping dari display name ke key asli
local rodKeyMap = {
    ["Luck Rod ($350)"]="Luck Rod",
    ["Carbon Rod ($900)"]="Carbon Rod",
    ["Grass Rod ($1.5k)"]="Grass Rod",
    ["Demascus Rod ($3k)"]="Demascus Rod",
    ["Ice Rod ($5k)"]="Ice Rod",
    ["Lucky Rod ($15k)"]="Lucky Rod",
    ["Midnight Rod ($50k)"]="Midnight Rod",
    ["Steampunk Rod ($215k)"]="Steampunk Rod",
    ["Chrome Rod ($437k)"]="Chrome Rod",
    ["Astral Rod ($1M)"]="Astral Rod",
    ["Ares Rod ($3M)"]="Ares Rod",
    ["Angler Rod ($8M)"]="Angler Rod"
}

local selectedRod = rodNames[1]

-- ===== Dropdown =====
BuyRodTab:Dropdown({
    Title = "Select Rod",
    Values = rodNames,
    Value = selectedRod,
    Callback = function(value)
        selectedRod = value
        WindUI:Notify({Title="Rod Selected", Content=value, Duration=3})
    end
})

-- ===== Tombol Buy Rod =====
BuyRodTab:Button({
    Title="Buy Rod",
    Callback=function()
        local key = rodKeyMap[selectedRod] -- ambil key asli
        if key and rods[key] then
            local success, err = pcall(function()
                RFPurchaseFishingRod:InvokeServer(rods[key])
            end)
            if success then
                WindUI:Notify({Title="Rod Purchase", Content="Purchased "..selectedRod, Duration=3})
            else
                WindUI:Notify({Title="Rod Purchase Error", Content=tostring(err), Duration=5})
            end
        end
    end
})

-- ===== Bait Data =====
local baits = {
    ["TopWater Bait"] = 10,
    ["Lucky Bait"] = 2,
    ["Midnight Bait"] = 3,
    ["Chroma Bait"] = 6,
    ["Dark Mater Bait"] = 8,
    ["Corrupt Bait"] = 15,
    ["Aether Bait"] = 16
}

-- Dropdown display names (nama + harga)
local baitNames = {
    "TopWater Bait ($100)",
    "Lucky Bait ($1k)",
    "Midnight Bait ($3k)",
    "Chroma Bait ($290k)",
    "Dark Mater Bait ($630k)",
    "Corrupt Bait ($1.15M)",
    "Aether Bait ($3.7M)"
}

-- Mapping display name -> key asli
local baitKeyMap = {
    ["TopWater Bait ($100)"] = "TopWater Bait",
    ["Lucky Bait ($1k)"] = "Lucky Bait",
    ["Midnight Bait ($3k)"] = "Midnight Bait",
    ["Chroma Bait ($290k)"] = "Chroma Bait",
    ["Dark Mater Bait ($630k)"] = "Dark Mater Bait",
    ["Corrupt Bait ($1.15M)"] = "Corrupt Bait",
    ["Aether Bait ($3.7M)"] = "Aether Bait"
}

local selectedBait = baitNames[1]

-- ===== Paragraph =====
BuyRodTab:Paragraph({
    Title = "Buy Bait",
    Desc = "Select a bait to purchase."
})

-- ===== Dropdown =====
BuyRodTab:Dropdown({
    Title="Select Bait",
    Values=baitNames,
    Value=selectedBait,
    Callback=function(value)
        selectedBait = value
        WindUI:Notify({
            Title="Bait Selected",
            Content=value,
            Duration=3
        })
    end
})

-- ===== Tombol Buy Bait =====
BuyRodTab:Button({
    Title="Buy Bait",
    Callback=function()
        local key = baitKeyMap[selectedBait] -- ambil key asli
        if key and baits[key] then
            local amount = baits[key]
            local success, err = pcall(function()
                RFPurchaseBait:InvokeServer(amount)
            end)
            if success then
                WindUI:Notify({
                    Title="Bait Purchase",
                    Content="Purchased "..selectedBait.." x"..amount,
                    Duration=3
                })
            else
                WindUI:Notify({
                    Title="Bait Purchase Error",
                    Content=tostring(err),
                    Duration=5
                })
            end
        end
    end
})

-- ===== Weather Data =====
local weathers = {
    ["Wind"] = 10000,
    ["Snow"] = 20000,
    ["Cloudy"] = 15000,
    ["Storm"] = 35000,
    ["Radiant"] = 50000,
    ["Shark Hunt"] = 300000
}

-- Dropdown display names (nama + harga)
local weatherNames = {
    "Wind ($10k)", "Snow ($20k)", "Cloudy ($15k)", "Storm ($35k)",
    "Radiant ($50k)", "Shark Hunt ($300k)"
}

-- Mapping display name -> key asli
local weatherKeyMap = {
    ["Wind ($10k)"] = "Wind",
    ["Snow ($20k)"] = "Snow",
    ["Cloudy ($15k)"] = "Cloudy",
    ["Storm ($35k)"] = "Storm",
    ["Radiant ($50k)"] = "Radiant",
    ["Shark Hunt ($300k)"] = "Shark Hunt"
}

local selectedWeather = weatherNames[1]

-- ===== Paragraph =====
BuyRodTab:Paragraph({
    Title="Buy Weather",
    Desc="Select a weather to purchase."
})

-- ===== Dropdown =====
BuyRodTab:Dropdown({
    Title="Select Weather",
    Values=weatherNames,
    Value=selectedWeather,
    Callback=function(value)
        selectedWeather = value
        local price = weathers[weatherKeyMap[value]]
        WindUI:Notify({
            Title="Weather Selected",
            Content=value,
            Duration=3
        })
    end
})

-- ===== Tombol Buy Weather =====
BuyRodTab:Button({
    Title="Buy Weather",
    Callback=function()
        local key = weatherKeyMap[selectedWeather] -- ambil key asli
        if key and weathers[key] then
            local price = weathers[key]
            local success, err = pcall(function()
                RFPurchaseWeatherEvent:InvokeServer(key)
            end)
            if success then
                WindUI:Notify({
                    Title="Weather Purchase",
                    Content="Purchased "..selectedWeather,
                    Duration=3
                })
            else
                WindUI:Notify({
                    Title="Weather Purchase Error",
                    Content=tostring(err),
                    Duration=5
                })
            end
        end
    end
})

-- ===== Paragraph =====
BuyRodTab:Paragraph({
    Title="Buy Boat",
    Desc="Select a Boat to purchase."
})

-- Urutan boat
local boatOrder = {
    "Small Boat",
    "Kayak",
    "Jetski",
    "Highfield",
    "Speed Boat",
    "Fishing Boat",
    "Mini Yacht",
    "Hyper Boat",
    "Frozen Boat",
    "Cruiser Boat"
}

-- Data boat
local boats = {
    ["Small Boat"] = {Id = 1, Price = 300},
    ["Kayak"] = {Id = 2, Price = 1100},
    ["Jetski"] = {Id = 3, Price = 7500},
    ["Highfield"] = {Id = 4, Price = 25000},
    ["Speed Boat"] = {Id = 5, Price = 70000},
    ["Fishing Boat"] = {Id = 6, Price = 180000},
    ["Mini Yacht"] = {Id = 14, Price = 1200000},
    ["Hyper Boat"] = {Id = 7, Price = 999000},
    ["Frozen Boat"] = {Id = 11, Price = 0},
    ["Cruiser Boat"] = {Id = 13, Price = 0}
}

-- Buat display names sesuai urutan
local boatNames = {}
for _, name in ipairs(boatOrder) do
    local data = boats[name]
    local priceStr
    if data.Price >= 1000000 then
        priceStr = string.format("$%.2fM", data.Price/1000000)
    elseif data.Price >= 1000 then
        priceStr = string.format("$%.0fk", data.Price/1000)
    else
        priceStr = "$"..data.Price
    end
    table.insert(boatNames, name.." ("..priceStr..")")
end

-- Buat keyMap sesuai urutan
local boatKeyMap = {}
for _, displayName in ipairs(boatNames) do
    local nameOnly = displayName:match("^(.-) %(") -- ambil nama sebelum tanda '('
    boatKeyMap[displayName] = nameOnly
end

-- Selected default
local selectedBoat = boatNames[1]

-- ===== Paragraph =====
BuyRodTab:Paragraph({
    Title="Buy Boat",
    Desc="Select a Boat to purchase."
})

-- ===== Dropdown =====
BuyRodTab:Dropdown({
    Title = "Select Boat",
    Values = boatNames,
    Value = selectedBoat,
    Callback = function(value)
        selectedBoat = value
        WindUI:Notify({
            Title = "Boat Selected",
            Content = value,
            Duration = 3
        })
    end
})

-- ===== Tombol Buy Boat =====
BuyRodTab:Button({
    Title = "Buy Boat",
    Callback = function()
        local key = boatKeyMap[selectedBoat]
        if key and boats[key] then
            local success, err = pcall(function()
                RFPurchaseBoat:InvokeServer(boats[key].Id)
            end)
            if success then
                WindUI:Notify({
                    Title = "Boat Purchase",
                    Content = "Purchased "..selectedBoat,
                    Duration = 3
                })
            else
                WindUI:Notify({
                    Title = "Boat Purchase Error",
                    Content = tostring(err),
                    Duration = 5
                })
            end
        end
    end
})


-- Select first tab on GUI open
Window:SelectTab(1)
