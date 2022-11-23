local player = game:GetService("Players").LocalPlayer
local char = player.Character

local IntroScreenGui = Instance.new("ScreenGui", player.PlayerGui)
IntroScreenGui.Name = "IntroScreenGui"

wait(1)

local IntroGui = Instance.new("TextLabel", IntroScreenGui)
IntroGui.AnchorPoint = Vector2.new(0.5, 0.5)
IntroGui.Position = UDim2.new(0.5, 0, -1, 0)
IntroGui.Size = UDim2.new(0.25, 0, 0.4, 0)
IntroGui.TextScaled = true
IntroGui.Text = "Flatter Hub"
IntroGui.BackgroundTransparency = 1
IntroGui.TextColor3 = Color3.fromRGB(196, 40, 28)
IntroGui.TextStrokeColor3 = Color3.new(0, 0, 0)
IntroGui.TextStrokeTransparency = 0
IntroGui.ZIndex = 10
IntroGui.Name = "IntroGui"

wait(0.2)

IntroGui:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.5, true)
wait(1)

for i = 0, 360, 20 do
	wait()
	IntroGui.Rotation = i
end

wait(0.3)

IntroGui:TweenSize(UDim2.new(0.5, 0, 0.7, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, true)
wait(0.2)
IntroGui:TweenSize(UDim2.new(0.25, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.3, true)
wait(0.2)
IntroGui:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true)
wait(0.5)
IntroGui:Destroy()
IntroScreenGui:Destroy()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("In Another Time GUI", "GrapeTheme")

--[[			LIBRARY FUNCTIONS
	
	-- Kavo
	
	Kavo.CreateLib(kavName, themeList)
	Kavo:DraggingEnabled(frame, parent)
	Kavo:ToggleUI()
	Kavo:ChangeColor(prope,color)
	
	
	-- Utility
	
	Utility:TweenObject(obj, properties, duration, ...)
	
	-- Elements
	
	Elements:NewTextBox(tname, tTip, callback)
	Elements:NewToggle(tname, nTip, callback)
	Elements:NewSlider(slidInf, slidTip, maxvalue, minvalue, callback)
	Elements:NewDropdown(dropname, dropinf, list, callback)
	Elements:NewKeybind(keytext, keyinf, first, callback)
	Elements:NewColorPicker(colText, colInf, defcolor, callback)
	Elements:NewLabel(title)
	
	
	-- Tabs
	
	Tabs:NewTab(tabName)
	
	
	-- ButtonFunction
	
	ButtonFunction:UpdateButton(newTitle)
	
	
	-- Sections
	
	Sections:NewSection(secName, hidden)
	
	
	-- TogFunction
	
	TogFunction:UpdateToggle(newText, isTogOn)
	
	
	-- DropFunction
	
	DropFunction:Refresh(newList)
	
		
	-- LabelFunctions
	
	labelFunctions:UpdateLabel(newText)
	
]]--


--[[			FUNCTIONS			]]--

local function get_player(name)
    name = name:lower()

    for _, player in ipairs(game.Players:GetPlayers()) do
        if name == player.Name:lower():sub(1, #name) then
            return player
        end
    end
end

local function get_entity(name)
	name = name:lower()

	for _, entity in ipairs(game.Workspace:GetChildren()) do
		if name == entity.Name:lower():sub(1, #name) then
			return entity
		end
	end
end

local function TWOHAutoHeal()
	local char = player.Character

	if char.Humanoid.Health <= 60 then
		local args = {
			[1] = false,
			[2] = char.Humanoid,
			[3] = math.huge,
			[4] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
			[7] = 1,
			[8] = "rbxassetid://1202656211",
			[9] = 2.5
		}

		game:GetService("ReplicatedStorage").Attacks.Heal.OverHeavenHeal:FireServer(unpack(args))
	end
end


--[[			MAIN PART			]]--

local CreditsTab = Window:NewTab("Credits")
local Section = CreditsTab:NewSection("-- Script Owners --")
local Section = CreditsTab:NewSection("Script Owner: flatterart99873")
local Section = CreditsTab:NewSection("Script / Asset helper: yba_jojo7")
local Section = CreditsTab:NewSection("Gui Owner: KavoUI")

local ItemsTab = Window:NewTab("Items")
local ItemsSection = ItemsTab:NewSection("Get arrow")

ItemsSection:NewButton("Get Arrow", "Gives you a normal arrow from the shop", function()
	local GiveArrow = game:GetService("ReplicatedStorage").ItemGiver.GiveArrow
	GiveArrow:FireServer()
end)

ItemsSection:NewButton("Get infinite arrows (Buggy)", "Lets you get more arrows than one!", function()
	local char = player.Character
	local GiveArrow = game:GetService("ReplicatedStorage").ItemGiver.GiveArrow
	for i, item in pairs(player.Backpack:GetChildren()) do
		if item.ClassName == "Tool" then
			item.Parent = char
		end
	end
	wait()
	GiveArrow:FireServer()
end)

local ItemTPsSection = ItemsTab:NewSection("Pick up all tools")

ItemTPsSection:NewButton("Pick up all spawned tools", "Pick up: Requiem arrow or Dio's diary or Dio's Bone", function()
	local char = player.Character
	for i, tool in pairs(game.Workspace:GetChildren()) do
		if tool.ClassName == "Tool" then
			local ToolPart = tool:FindFirstChildOfClass("Part") or tool:FindFirstChildOfClass("MeshPart")
			char:MoveTo(ToolPart.Position)
			wait(0.5)
		end
	end
end)


local SpawnsTab = Window:NewTab("NPC Spawns")

for i, v in pairs(game.Workspace.Values:GetChildren()) do
	if v.ClassName ~= "NumberValue" then
		print("Instance:", v.Name.. ", ClassName:", v.ClassName.. ", Value:", v.Value)
	end

	if v.Name == "PucciSpawned" then
		PucciSpawned = v.Value

		v.Changed:Connect(function(value)
			PucciSpawned = v.Value
		end)
	end

	if v.Name == "ZeppeliSpawned" then
		ZeppeliSpawned = v.Value

		v.Changed:Connect(function(value)
			ZeppeliSpawned = v.Value
		end)
	end

	if v.Name == "KarsSpawned" then
		KarsSpawned = v.Value

		v.Changed:Connect(function(value)
			KarsSpawned = v.Value
		end)
	end
end

local NPCSpawnsSection = SpawnsTab:NewSection("NPC Spawns")

local PucciSpawnedLabel = NPCSpawnsSection:NewLabel("Pucci spawned:")
local KarsSpawnedLabel = NPCSpawnsSection:NewLabel("Kars spawned:")
local ZeppeliSpawnedLabel = NPCSpawnsSection:NewLabel("Zeppeli spawned:")

PucciSpawnedLabel:UpdateLabel("Pucci spawned: ".. PucciSpawned)
KarsSpawnedLabel:UpdateLabel("Kars spawned: ".. KarsSpawned)
ZeppeliSpawnedLabel:UpdateLabel("Zeppeli spawned: ".. ZeppeliSpawned)

local TeleportsTab = Window:NewTab("Teleports")

local TPsSection = TeleportsTab:NewSection("NPC / Player teleports")

TPsSection:NewTextBox("Teleport to something", "Teleports to a specified player / dummy!", function(text)
	local char = player.Character

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	char:MoveTo(targetpos)
end)

TPsSection:NewButton("Teleport to Pucci spawns", "Teleports thru all the Pucci NPC spawns!", function()
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	for i, npcspawn in pairs(game.Workspace:WaitForChild("NpcSpawnPoints").Pucci:GetChildren()) do
		char:MoveTo(npcspawn.Position)
		wait(1.5)
	end

	char:MoveTo(charpos)
end)

local MapTPsSection = TeleportsTab:NewSection("Map Teleports")

MapTPsSection:NewButton("Middle Map", "Teleport to the map's middle", function()
	local char = player.Character
    char:MoveTo(Vector3.new(-755, -3, 1605))
end)
MapTPsSection:NewButton("Dummy test", "Teleport to the test dummies", function()
	local char = player.Character
	char:MoveTo(Vector3.new(-810, -5, 1620))
end)
MapTPsSection:NewButton("1v1 Arena", "Teleport to the 1v1 arena", function()
    local char = player.Character
	char:MoveTo(Vector3.new(-551, 1, 1275))
end)

MapTPsSection:NewButton("Highest Peak", "Teleport to the highest peak", function()
    local char = player.Character
    char:MoveTo(Vector3.new(-582, 227, 1286))
end)

MapTPsSection:NewButton("Kars Cave", "Teleport to the kars cave", function()
    local char = player.Character
    char:MoveTo(Vector3.new(-489, 52, 1493))
end)

MapTPsSection:NewButton("Brown Rocks", "Teleport to the brown rocks", function()
    local char = player.Character
    char:MoveTo(Vector3.new(-482, -4, 1662))
end)

MapTPsSection:NewButton("Forest Campfire", "Teleport to the forest campfire", function()
    local char = player.Character
    char:MoveTo(Vector3.new(-837, -4, 1779))
end)

MapTPsSection:NewButton("Zeppeli Campfire", "Teleport to the zeppeli campfire", function()
    local char = player.Character
    char:MoveTo(Vector3.new(-676, 51, 1462))
end)

MapTPsSection:NewButton("Amogus", "Teleport to the sus easter egg", function()
    local char = player.Character
    char:MoveTo(Vector3.new(1, -1, 1400))
end)

MapTPsSection:NewButton("Brazil", "Teleport to brazil easter egg", function()
	local char = player.Character
	char:MoveTo(Vector3.new(1400, 12, -466))
end)


local ToggleGuiTab = Window:NewTab("Toggle GUI")
local ToggleGuiSection = ToggleGuiTab:NewSection("On/Off")
ToggleGuiSection:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.LeftControl, function()
	Library:ToggleUI()
end)

local PlayerTab = Window:NewTab("Player")
local MovementSection = PlayerTab:NewSection("Movement (Walkspeed, JumpPower)")

MovementSection:NewSlider("WalkSpeed", "Changes walk speed", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    local char = player.Character
	char.Humanoid.WalkSpeed = s
end)

MovementSection:NewSlider("JumpPower", "Changes jump power", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    local char = player.Character
	char.Humanoid.JumpPower = s
end)

local CharacterSection = PlayerTab:NewSection("Character")

CharacterSection:NewButton("Reset", "Reset your character instantly", function()
    local char = player.Character
	char.Humanoid.Health = 0
end)

CharacterSection:NewButton("Fling yourself", "Flings you to your look direction!", function()
	local char = player.Character
	
	local args = {
		[1] = game:GetService("Players").LocalPlayer.Character.Humanoid,
		[2] = 0,
		[3] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
		[4] = char.HumanoidRootPart.CFrame.LookVector * Vector3.new(1000, 1000, 1000),
		[5] = 0.25,
		[6] = 1,
		[7] = "rbxassetid://10094837675",
		[8] = 7.5
	}

	game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args))
end)

CharacterSection:NewToggle("Toggle server side CHARACTER INVISIBILITY", "Toggles a server sided CHARACTER INVISIBILITY!!", function(toggle)
	if toggle == true then
		for i = 0, 1, 0.1 do
			wait()
			for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Part") and v.Name ~= "HumanoidRootPart" then
					local args = {
						[1] = v,
						[2] = i
					}

					game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
				end
			end

			local args = {
				[1] = game.Players.LocalPlayer.Character.Head.face,
				[2] = i
			}

			game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
		end
	else
		for i = 1, 0, -0.1 do
			wait()
			for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Part") and v.Name ~= "HumanoidRootPart" then
					local args = {
						[1] = v,
						[2] = i
					}

					game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
				end
			end

			local args = {
				[1] = game.Players.LocalPlayer.Character.Head.face,
				[2] = i
			}

			game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
		end
	end
end)

CharacterSection:NewToggle("Toggle server side STAND INVISIBILITY", "Toggles a server sided STAND INVISIBILITY!!", function(toggle)
	if toggle == true then
		for i = 0, 1, 0.1 do
			wait()
			for _, v in pairs(game.Players.LocalPlayer.Character.Stand:GetChildren()) do
				if v:IsA("Part") or "MeshPart" and v.Name ~= "Stand HumanoidRootPart" then
					local args = {
						[1] = v,
						[2] = i
					}

					game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
				end

				if v:FindFirstChild("Stand Aura") then
					local args = {
						[1] = v:FindFirstChild("Stand Aura"),
						[2] = false
					}

					game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
				end
			end

			local args = {
				[1] = v:FindFirstChild("face"),
				[2] = i
			}

			game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
		end
	else
		for i = 1, 0, -0.1 do
			wait()
			for _, v in pairs(game.Players.LocalPlayer.Character.Stand:GetChildren()) do
				if v:IsA("Part") or "MeshPart" and v.Name ~= "Stand HumanoidRootPart" then
					local args = {
						[1] = v,
						[2] = i
					}

					game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
				end

				if v:FindFirstChild("Stand Aura") then
					v:FindFirstChild("Stand Aura")

					local args = {
						[1] = v:FindFirstChild("Stand Aura"),
						[2] = true
					}

					game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
				end
			end

			local args = {
				[1] = v:FindFirstChild("face"),
				[2] = i
			}

			game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
		end
	end
end)

local AdminSection = PlayerTab:NewSection("Admin GUI")

AdminSection:NewButton("Infinite yield (Nearly admin script)", "Infinite yield", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)


local CombatTab = Window:NewTab("Combat")
local Disclaimer = CombatTab:NewSection("DISCLAIMER: Enter the name not the nickname!")
local CombatSection = CombatTab:NewSection("Combat Mod")

CombatSection:NewButton("Kill all players", "Kills all players!", function()
	local char = player.Character
	local charpos = char:WaitForChild("HumanoidRootPart").Position

	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			char:MoveTo(plr.Character.HumanoidRootPart.Position)

			local args1 = {
    			[1] = plr.Character.Humanoid,
    			[2] = 100,
    			[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
    			[4] = Vector3.new(0, 0, 0),
				[5] = 0.25,
				[6] = 2,
				[7] = "rbxassetid://541909913",
				[8] = 2
			}

			local args2 = {
				[1] = plr.Character
			}

			wait(0.2)

			for i = 0, 5, 1 do
				game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
				wait()
				game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
			end
		end
	end

	wait(0.2)
	char:MoveTo(charpos)
end)

CombatSection:NewTextBox("Kill something", "Kills a specified player / dummy!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	char:MoveTo(targetpos)

	local args1 = {
    	[1] = targethum,
		[2] = 100,
		[3] = CFrame.new(target.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
		[4] = Vector3.new(0, 0, 0),
		[5] = 0.25,
		[6] = 2,
		[7] = "rbxassetid://541909913",
		[8] = 2
	}

	local args2 = {
    	[1] = target
	}

	wait(0.2)

	for i = 0, 10, 1 do
		game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
		game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
	end

	wait(0.2)

	char:MoveTo(charpos)
end)

CombatSection:NewButton("Multiply Stand", "Multiplies your stand, USE IT WITHOUT STAND.", function()
	local GiveStand = game:GetService("ReplicatedStorage").GiveStand
	GiveStand:FireServer()
end)

CombatSection:NewToggle("Toggle GOD MODE", "Toggles GOD MODE!! (Some moves still can hit.)", function(toggle)
	if toggle == true then
		local char = player.Character

		if not game:GetService("ReplicatedStorage").Basic:FindFirstChild("Anchor") then
			return
		else
			local Anchor = game:GetService("ReplicatedStorage").Basic.Anchor
			Anchor:Destroy()
			char.Humanoid.Health = 0
		end
	end

	if toggle == false then
		local char = player.Character
		if game:GetService("ReplicatedStorage").Basic:FindFirstChild("Anchor") then
			return
		else
			char.Humanoid.Health = 0
			local Anchor = Instance.new("RemoteEvent", game.ReplicatedStorage.Basic)
			Anchor.Name = "Anchor"
		end
	end
end)

CombatSection:NewButton("Anti TimeStop", "You can move freely in timestops!", function()
	local Anchor = game:GetService("ReplicatedStorage").Basic.Anchor
	Anchor:Destroy()

	local Anchor = Instance.new("RemoteEvent", game.ReplicatedStorage.Basic)
	Anchor.Name = "Anchor"

	Anchor:FireServer()
end)

CombatSection:NewToggle("AutoBlock", "Automatically blocks all incoming attacks.", function(toggled)
	if toggled == true then
		while wait() do
			if toggled == false then
				break
			end

			local args = {
    			[1] = true
			}

			game:GetService("ReplicatedStorage").Basic.Block:FireServer(unpack(args))
		end
	end
end)

--[[game.Workspace.ChildAdded:Connect(function(child)
	if child.ClassName == "Tool" then
		local ItemEspGui = Instance.new("BillboardGui", child)
		local ItemEsp = Instance.new("TextLabel", ItemEspGui)
		ItemEsp.Text = child.Name
		ItemEsp.BackgroundTransparency = 1
		ItemEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
		ItemEsp.TextStrokeTransparency = 0
		ItemEsp.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	end
end)]]--



local TrollingTab = Window:NewTab("Trolling")
local StunSection = TrollingTab:NewSection("Stun players")

StunSection:NewTextBox("Stun everyone for given seconds", "Stuns all players for the amount entered in seconds!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			char:MoveTo(plr.Character.HumanoidRootPart.Position)
			stun = tonumber(text)
			local args1 = {
				[1] = plr.Character.Humanoid,
				[2] = 0,
				[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
				[4] = Vector3.new(0, 0, 0),
				[5] = stun,
				[6] = 2,
				[7] = "rbxassetid://541909913",
				[8] = 2
			}

			local args2 = {
    			[1] = plr.Character
			}

			wait(0.2)

			game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
			game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
		end
	end
	wait(0.2)
	char:MoveTo(charpos)
end)

StunSection:NewTextBox("Stun someone for 10 seconds", "Stuns a specified player for 10 seconds!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	char:MoveTo(targetpos)

	local args1 = {
		[1] = targethum,
		[2] = 0,
		[3] = CFrame.new(target.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
		[4] = Vector3.new(0, 0, 0),
		[5] = 10,
		[6] = 2,
		[7] = "rbxassetid://541909913",
		[8] = 2
	}

	local args2 = {
    	[1] = target
	}

	

	wait(0.2)

	game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
	game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))

	wait(0.2)

	char:MoveTo(charpos)
end)

local SpaceSection = TrollingTab:NewSection("Send players to space")

SpaceSection:NewButton("Send everyone to space", "Sends everyone high up flying!", function()
	local char = player.Character
	local charpos = char:WaitForChild("HumanoidRootPart").Position
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			char:MoveTo(plr.Character.HumanoidRootPart.Position)
			local args1 = {
				[1] = plr.Character.Humanoid,
				[2] = 0,
				[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
				[4] = Vector3.new(0, 100, 0),
				[5] = 10,
				[6] = 1,
				[7] = "rbxassetid://10094837675",
				[8] = 7.5
			}

			local args2 = {
				[1] = plr.Character
			}

			wait(0.2)

			game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
			game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
		end
	end
	wait(0.2)
	char:MoveTo(charpos)
end)

SpaceSection:NewTextBox("Send something to space", "Sends a player / dummy high up flying!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	char:MoveTo(targetpos)

	local args1 = {
		[1] = targethum,
		[2] = 0,
		[3] = CFrame.new(target.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
		[4] = Vector3.new(0, 100, 0),
		[5] = 10,
		[6] = 1,
		[7] = "rbxassetid://10094837675",
		[8] = 7.5
	}

	local args2 = {
		[1] = target
	}

	wait(0.2)

	game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
	game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))

	wait(0.2)

	char:MoveTo(charpos)
end)

SpaceSection:NewButton("Send everyone to the map's corner", "Sends everyone to the map's corner!", function()
	local char = player.Character
	local charpos = char:WaitForChild("HumanoidRootPart").Position
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			char:MoveTo(plr.Character.HumanoidRootPart.Position)
			local args1 = {
				[1] = plr.Character.Humanoid,
				[2] = 0,
				[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
				[4] = Vector3.new(100, 100, 100),
				[5] = 10,
				[6] = 1,
				[7] = "rbxassetid://10094837675",
				[8] = 7.5
			}

			local args2 = {
				[1] = plr.Character
			}

			wait(0.2)

			game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
			game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
		end
	end
	wait(0.2)
	char:MoveTo(charpos)
end)

SpaceSection:NewTextBox("Send something to the map's corner", "Sends a player / dummy to the map's corner!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	char:MoveTo(targetpos)

	local args1 = {
		[1] = targethum,
		[2] = 0,
		[3] = CFrame.new(target.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
		[4] = Vector3.new(100, 100, 100),
		[5] = 10,
		[6] = 1,
		[7] = "rbxassetid://10094837675",
		[8] = 7.5
	}

	local args2 = {
		[1] = target
	}

	wait(0.2)

	game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
	game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))

	wait(0.2)

	char:MoveTo(charpos)
end)

local TrampolineSection = TrollingTab:NewSection("Trampoline players")

TrampolineSection:NewButton("Trampoline everyone 10x", "Trampolines everyone 10 times!", function()
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	for i = 0, 10, 1 do
		for i, plr in pairs(game.Players:GetPlayers()) do
			if plr ~= player then
				char:MoveTo(plr.Character.HumanoidRootPart.Position)

				local args1 = {
					[1] = plr.Character.Humanoid,
					[2] = 0,
					[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
					[4] = Vector3.new(0, 75, 0),
					[5] = 0.25,
					[6] = 2,
					[7] = "rbxassetid://10094838150",
					[8] = 3
				}

				local args2 = {
					[1] = plr.Character
				}

				wait(0.2)

				game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
				game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
			end
		end
	end

	wait(0.2)

	char:MoveTo(charpos)
end)

TrampolineSection:NewTextBox("Trampoline someone 10x", "Trampolines someone 10 times!", function(text)
	for i = 0, 10, 1 do
		local char = player.Character
		local charpos = char.HumanoidRootPart.Position

		local subtext = get_player(text) or get_entity(text)
		local targetplrstring = tostring(subtext)

		local target = game.Workspace:FindFirstChild(targetplrstring)
		local targetpos = target.HumanoidRootPart.Position
		local targethum = target.Humanoid

		char:MoveTo(targetpos)

		local args1 = {
			[1] = targethum,
			[2] = 0,
			[3] = CFrame.new(target.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
			[4] = Vector3.new(0, 75, 0),
			[5] = 0.25,
			[6] = 2,
			[7] = "rbxassetid://10094838150",
			[8] = 3
		}

		local args2 = {
			[1] = target
		}

		wait(0.2)

		game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
		game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
		wait(1)
	end

	wait(0.2)

	char:MoveTo(charpos)
end)

local FlingSection = TrollingTab:NewSection("Fling players")

FlingSection:NewButton("Fling everyone", "Flings everyone to their look direction!", function()
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			char:MoveTo(plr.Character.HumanoidRootPart.Position)
				
			local args1 = {
				[1] = plr.Character.Humanoid,
				[2] = 0,
				[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
				[4] = plr.Character.HumanoidRootPart.CFrame.LookVector * Vector3.new(10000, 10000, 10000),
				[5] = 0.25,
				[6] = 1,
				[7] = "rbxassetid://10094837675",
				[8] = 7.5
			}

			local args2 = {
				[1] = plr.Character
			}

			wait(0.2)

			game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
			game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
		end
	end

	wait(0.2)

	char:MoveTo(charpos)
end)

FlingSection:NewButton("Fling everyone 10x", "Flings everyone 10x to their look direction!", function()
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	for i = 0, 10, 1 do
		for i, plr in pairs(game.Players:GetPlayers()) do
			if plr ~= player then
				char:MoveTo(plr.Character.HumanoidRootPart.Position)
					
				local args1 = {
					[1] = plr.Character.Humanoid,
					[2] = 0,
					[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
					[4] = plr.Character.HumanoidRootPart.CFrame.LookVector * Vector3.new(10000, 10000, 10000),
					[5] = 0.25,
					[6] = 1,
					[7] = "rbxassetid://10094837675",
					[8] = 7.5
				}

				local args2 = {
					[1] = plr.Character
				}

				wait(0.2)

				game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
				game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
			end
		end
	end

	wait(0.2)

	char:MoveTo(charpos)
end)

FlingSection:NewTextBox("Fling something", "Flings a player / dummy!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	char:MoveTo(targetpos)

	local args1 = {
		[1] = targethum,
		[2] = 0,
		[3] = CFrame.new(targetpos, Vector3.new(0, 0, 0)),
		[4] = target.HumanoidRootPart.CFrame.LookVector * Vector3.new(10000, 10000, 10000),
		[5] = 0.25,
		[6] = 1,
		[7] = "rbxassetid://10094837675",
		[8] = 7.5
	}

	local args2 = {
		[1] = target
	}

	wait(0.2)

	game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
	game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))

	wait(0.2)

	char:MoveTo(charpos)
end)

FlingSection:NewTextBox("Fling something 10x", "Flings a player / dummy 10x!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	for i = 0, 10, 1 do
		local subtext = get_player(text) or get_entity(text)
		local targetplrstring = tostring(subtext)

		local target = game.Workspace:FindFirstChild(targetplrstring)
		local targetpos = target.HumanoidRootPart.Position
		local targethum = target.Humanoid

		char:MoveTo(targetpos)

		local args1 = {
			[1] = targethum,
			[2] = 0,
			[3] = CFrame.new(targetpos, Vector3.new(0, 0, 0)),
			[4] = target.HumanoidRootPart.CFrame.LookVector * Vector3.new(10000, 10000, 10000),
			[5] = 0.25,
			[6] = 1,
			[7] = "rbxassetid://10094837675",
			[8] = 7.5
		}

		local args2 = {
			[1] = target
		}

		wait(0.2)

		game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
		game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
	end

	wait(0.2)

	char:MoveTo(charpos)
end)

local RagdollSection = TrollingTab:NewSection("Ragdoll")

RagdollSection:NewButton("Ragdoll everyone 10x", "Ragdolls everyone!", function()
	for i = 0, 10, 1 do
		for i, plr in pairs(game.Players:GetPlayers()) do
			if plr ~= player then
				local args = {
					[1] = plr.Character.Humanoid
				}

				game:GetService("ReplicatedStorage").Basic.Ragdoll:FireServer(unpack(args))
			end
		end
	end
end)

RagdollSection:NewTextBox("Ragdoll someone 10x", "Ragdolls someone!", function(text)
	for i = 0, 10, 1 do
		local char = player.Character
		local charpos = char.HumanoidRootPart.Position

		local subtext = get_player(text) or get_entity(text)
		local targetplrstring = tostring(subtext)

		local target = game.Workspace:FindFirstChild(targetplrstring)
		local targethum = target.Humanoid

		local args = {
			[1] = targethum
		}

		game:GetService("ReplicatedStorage").Basic.Ragdoll:FireServer(unpack(args))
	end
end)

local BlockBreakSection = TrollingTab:NewSection("Block Break")

BlockBreakSection:NewButton("Block Break everyone", "Block Breaks everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
    			[1] = plr.Character
			}

			game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args))
		end
	end
end)

BlockBreakSection:NewTextBox("Block Break something", "Block Breaks a dummy / player!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targethum = target.Humanoid

	local args = {
    	[1] = target
	}

	game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args))
end)



local StandModTab = Window:NewTab("STAND MOD")

local GEModSection = StandModTab:NewSection("Golden Experience")

GEModSection:NewButton("No cooldown Beetle Bullet", "No cooldown Beetle Bullet move!", function()
	local args = {
    	[1] = true,
    	[2] = plr.Character.HumanoidRootPart.Position
	}

	game:GetService("ReplicatedStorage").Attacks.GE.BeetleBulletToss:FireServer(unpack(args))
end)

GEModSection:NewButton("Beetle Bullet Toss everyone", "Sends a Beetle Bullet to everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			wait(0.2)
			local args = {
    			[1] = false,
    			[2] = plr.Character.HumanoidRootPart.Position
			}

			game:GetService("ReplicatedStorage").Attacks.GE.BeetleBulletToss:FireServer(unpack(args))
		end
	end
end)

GEModSection:NewTextBox("Beetle Bullet something", "Sends a Beetle Bullet to a dummy / player!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	local args = {
    	[1] = false,
    	[2] = targetpos
	}

	game:GetService("ReplicatedStorage").Attacks.GE.BeetleBulletToss:FireServer(unpack(args))
end)

GEModSection:NewButton("Beatdown everyone (more like bring)", "Beatdowns everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			wait(0.2)
			local args = {
    			[1] = "Beatdown",
    			[2] = plr.Character
			}

			game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gold Experience").GELocalisedRemote:FireServer(unpack(args))
		end
	end
end)

GEModSection:NewTextBox("Beatdown something", "Beatdowns a dummy / player!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	local args = {
    	[1] = "Beatdown",
    	[2] = target
	}

	game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gold Experience").GELocalisedRemote:FireServer(unpack(args))
end)

GEModSection:NewButton("Max HP heal yourself", "Heals you to max HP!", function()
	local char = player.Character
	
	local args = {
		[1] = true,
		[2] = char.Humanoid,
		[3] = math.huge,
		[4] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
		[7] = 10,
		[8] = "rbxassetid://4567255304",
		[9] = 10
	}

	game:GetService("ReplicatedStorage").Attacks.Heal.GEHeal:FireServer(unpack(args))
end)

GEModSection:NewToggle("Auto heal if Low HP", "Automatically heals you to MAX HP when about to die!", function(toggle)
	local char = player.Character
	if toggle == true then
		while wait() do
			if toggle == false then
				break
			end

			if char.Humanoid.Health <= 60 then
				local args = {
					[1] = false,
					[2] = char.Humanoid,
					[3] = math.huge,
					[4] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
					[7] = 10,
					[8] = "rbxassetid://4567255304",
					[9] = 10
				}

				game:GetService("ReplicatedStorage").Attacks.Heal.GEHeal:FireServer(unpack(args))
			end
		end
	end
end)

GEModSection:NewButton("Max HP heal everyone", "Heals everyone to MAX HP!", function()
	local char = player.Character

	for i, plr in pairs(game.Players:GetPlayers()) do
		local args = {
			[1] = false,
			[2] = plr.Character.Humanoid,
			[3] = math.huge,
			[4] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
			[6] = 0,
			[7] = 10,
			[8] = "rbxassetid://4567255304",
			[9] = 10
		}

		game:GetService("ReplicatedStorage").Attacks.Heal.GEHeal:FireServer(unpack(args))
	end
end)

GEModSection:NewTextBox("MAX HP heal something", "Heal a player / dummy to MAX HP!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	local args = {
		[1] = false,
		[2] = targethum,
		[3] = math.huge,
		[4] = CFrame.new(targetpos, Vector3.new(0, 0, 0)),
		[6] = 0,
		[7] = 10,
		[8] = "rbxassetid://4567255304",
		[9] = 10
	}

	game:GetService("ReplicatedStorage").Attacks.Heal.GEHeal:FireServer(unpack(args))
end)


local SPModSection = StandModTab:NewSection("Star Platinum")

SPModSection:NewButton("Bring everyone", "Brings everyone to you!", function()
    for i, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player then
            local args = {
                [1] = plr.Character,
                [2] = 1.2
            }

            game:GetService("ReplicatedStorage").SpecialMoves.Hold:FireServer(unpack(args))
        end
    end 
end)

SPModSection:NewTextBox("Bring something", "Brings a player / dummy!", function(text)
    local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

    local args = {
        [1] = target,
        [2] = 1.2
    }

    game:GetService("ReplicatedStorage").SpecialMoves.Hold:FireServer(unpack(args))
end)

SPModSection:NewButton("No cooldown rock throw", "Throw rocks without cooldown!", function()
    game:GetService("ReplicatedStorage").Attacks.RockThrow:FireServer()
end)


local VTWModSection = StandModTab:NewSection("Vampire The World")

VTWModSection:NewButton("No cooldown knives", "Throws knives without cooldowns!", function()
	local char = player.Character
	local args = {
		[1] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0))
	}

	game:GetService("ReplicatedStorage").Attacks.DioKnifeThrow:FireServer(unpack(args))
end)

VTWModSection:NewTextBox("No cooldown knives", "Throws a given amount of knives without cooldowns!", function(text)
	local howmuchknives = tonumber(text)

	for i = 0, howmuchknives, 1 do
		local char = player.Character
		
		local args = {
			[1] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0))
		}

		game:GetService("ReplicatedStorage").Attacks.DioKnifeThrow:FireServer(unpack(args))
	end
end)

VTWModSection:NewButton("No cooldown 21 sec TimeStop", "Stops time for 21 seconds without cooldown!", function()
	local args = {
		[1] = 21,
		[2] = "DIO"
	}

	game:GetService("ReplicatedStorage").SpecialMoves.Timestop:FireServer(unpack(args))
end)

VTWModSection:NewToggle("Toggle road roller", "Shows a bit of road roller! (No damage, but funny.)", function(toggle)
	if toggle == true then
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Road Roller"):FindFirstChild("Roller Bits"),
			[2] = 0
		}

		game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Road Roller").Center,
			[2] = 0
		}

		game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
	end

	if toggle == false then
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Road Roller"):FindFirstChild("Roller Bits"),
			[2] = 1
		}

		game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Road Roller").Center,
			[2] = 1
		}

		game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
	end
end)

VTWModSection:NewButton("Bullet Kick everyone", "Bullet Kicks everyone! (Stuns everyone I guess.)", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= game.Players.LocalPlayer then
			local args = {
				[1] = plr.Character
			}

			game:GetService("ReplicatedStorage").SpecialMoves.BulletKick:FireServer(unpack(args))
		end
	end
end)

VTWModSection:NewTextBox("Bullet Kick something", "Bullet Kicks a dummy / player! (More usable)", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
		[1] = target
	}

	game:GetService("ReplicatedStorage").SpecialMoves.BulletKick:FireServer(unpack(args))
end)

VTWModSection:NewTextBox("Donut something (has cooldown)", "Donuts a dummy / player! (Has cooldowns.)", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid
	
	local args = {
    	[1] = target
	}

	game:GetService("ReplicatedStorage").SpecialMoves.Donut:FireServer(unpack(args))
end)

VTWModSection:NewButton("Space Ripper Stingy Eyes everyone", "Sends Space Ripper eyes to everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
    			[1] = plr.Character.HumanoidRootPart.Position
			}

			game:GetService("ReplicatedStorage").Attacks.SpaceRipper:FireServer(unpack(args))
		end
	end
end)

VTWModSection:NewTextBox("Space Ripper Stingy Eyes something", "Sends Space Ripper eyes to a dummy / player!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
    	[1] = targetpos
	}

	game:GetService("ReplicatedStorage").Attacks.SpaceRipper:FireServer(unpack(args))
end)

VTWModSection:NewButton("Ice Shatter everyone", "Uses Ice Shatter on everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
    			[1] = plr.Character
			}

			game:GetService("ReplicatedStorage").SpecialMoves.IceShatter:FireServer(unpack(args))
		end
	end
end)

VTWModSection:NewTextBox("Ice Shatter something", "Ice Shatters a dummy / player!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
    	[1] = target
	}

	game:GetService("ReplicatedStorage").SpecialMoves.IceShatter:FireServer(unpack(args))
end)

VTWModSection:NewButton("Pull everyone", "Brings / Pulls everyone to you!", function()
	local char = player.Character
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
    			[1] = plr.Character,
    			[2] = 1,
    			[3] = char.HumanoidRootPart.Position
			}

			game:GetService("ReplicatedStorage").SpecialMoves.Hold:FireServer(unpack(args))
		end
	end
end)

VTWModSection:NewTextBox("Pull / Bring something", "Pulls / Brings a dummy / player to you!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
    	[1] = target,
    	[2] = 1,
    	[3] = charpos
	}

	game:GetService("ReplicatedStorage").SpecialMoves.Hold:FireServer(unpack(args))
end)

VTWModSection:NewButton("Heal yourself", "Heals yourself with a vampire heal! (Faster heal.)", function()
	for i = 0, 100, 1 do
		game:GetService("ReplicatedStorage").SpecialMoves.VampireHeal:FireServer()
	end
end)

VTWModSection:NewToggle("Auto heal if Low HP", "Automatically heals you to MAX HP when about to die!", function(toggle)
	local char = player.Character

	if toggle == true then
		while wait() do
			if char.Humanoid.Health <= 60 then
				if toggle == false then
					break
				end
				
				for i = 0, 100, 1 do
					game:GetService("ReplicatedStorage").SpecialMoves.VampireHeal:FireServer()
				end
			end
		end
	end
end)


local CDModSection = StandModTab:NewSection("Crazy Diamond")

CDModSection:NewButton("No cooldown Bullet", "Shoots a bullet without cooldowns!", function()
	game:GetService("ReplicatedStorage").Attacks.CrazyDiamondBulletShoot:FireServer()
end)

CDModSection:NewToggle("Fake heal mode", "Toggles fake heal! (Can damage others)", function(toggle)
	if toggle == true then
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Left Arm").HealMode,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Left Leg").HealMode,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Right Arm").HealMode,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Right Leg").HealMode,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Torso").HealMode,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Head").HealMode,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
	end

	if toggle == false then
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Left Arm").HealMode,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Left Leg").HealMode,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Right Arm").HealMode,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Right Leg").HealMode,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Torso").HealMode,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Head").HealMode,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
	end
end)

CDModSection:NewButton("Bleed everyone 10x", "Makes everyone bleeding 10x!", function()
	for i = 0, 10, 1 do
		for i, plr in pairs(game.Players:GetPlayers()) do
			if plr ~= player then
				local args = {
					[1] = "Bleed",
					[2] = plr.Character
				}

				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Crazy Diamond").CDLocalisedRemote:FireServer(unpack(args))
			end
		end
	end
end)

CDModSection:NewTextBox("Bleed something 10x", "Makes bleeding a player / dummy 10x!", function(text)
	for i = 0, 10, 1 do
		local char = player.Character
		local charpos = char.HumanoidRootPart.Position

		local subtext = get_player(text) or get_entity(text)
		local targetplrstring = tostring(subtext)

		local target = game.Workspace:FindFirstChild(targetplrstring)
		local targethum = target.Humanoid

		local args = {
			[1] = "Bleed",
			[2] = target
		}

		game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Crazy Diamond").CDLocalisedRemote:FireServer(unpack(args))
	end
end)

CDModSection:NewButton("Push closest players", "Pushes closest players!", function()
	local args = {
    	[1] = "Push"
	}

	game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Crazy Diamond").CDLocalisedRemote:FireServer(unpack(args))
end)

CDModSection:NewButton("No cooldown Blood Throw", "Uses Blood Throw without cooldown! (Removes HP.)", function()
	local char = player.Character
	
	local args = {
    	[1] = "BloodCutter"
	}

	game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Crazy Diamond").CDLocalisedRemote:FireServer(unpack(args))

	local args = {
			[1] = char.Humanoid,
			[2] = 10,
			[3] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
			[4] = Vector3.new(0, 0, 0),
			[5] = 0,
			[6] = 1,
			[7] = "rbxassetid://2914074987",
			[8] = 2
		}

	game:GetService("ReplicatedStorage").Attacks.Heal.CDHeal:FireServer(unpack(args))
end)

CDModSection:NewButton("Rock everyone", "Puts everyone in Crazy Diamond's Rock!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
    			[1] = "Rock",
    			[2] = plr.Character
			}

			game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Crazy Diamond").CDLocalisedRemote:FireServer(unpack(args))
		end
	end
end)

CDModSection:NewTextBox("Rock something", "Puts a player / dummy into a Rock!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targethum = target.Humanoid

	local args = {
    	[1] = "Rock",
    	[2] = target
	}

	game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Crazy Diamond").CDLocalisedRemote:FireServer(unpack(args))
end)

CDModSection:NewButton("MAX HP heal yourself", "Heals yourself to MAX HP!", function()
	local char = player.Character

	local args = {
    	[1] = char.Humanoid,
    	[2] = math.huge,
    	[3] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
		[4] = Vector3.new(0, 0, 0),
    	[5] = 0,
		[6] = 1,
   		[7] = "rbxassetid://2914074987",
    	[8] = 2
	}

	game:GetService("ReplicatedStorage").Attacks.Heal.CDHeal:FireServer(unpack(args))
end)

CDModSection:NewToggle("Auto heal if Low HP", "Automatically heals you to MAX HP when about to die!", function(toggle)
	local char = player.Character

	if toggle == true then
		while wait() do
			if toggle == false then
				break
			end
			
			if char.Humanoid.Health <= 60 then
				local args = {
					[1] = char.Humanoid,
					[2] = math.huge,
					[3] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
					[4] = Vector3.new(0, 0, 0),
					[5] = 0,
					[6] = 1,
					[7] = "rbxassetid://2914074987",
					[8] = 2
				}

				game:GetService("ReplicatedStorage").Attacks.Heal.CDHeal:FireServer(unpack(args))
			end
		end
	end
end)

CDModSection:NewButton("MAX HP heal everyone", "Heals everyone to MAX HP!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		local args = {
			[1] = plr.Character.Humanoid,
			[2] = math.huge,
			[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
			[4] = Vector3.new(0, 0, 0),
			[5] = 0,
			[6] = 1,
			[7] = "rbxassetid://2914074987",
			[8] = 2
		}

		game:GetService("ReplicatedStorage").Attacks.Heal.CDHeal:FireServer(unpack(args))
	end
end)

CDModSection:NewTextBox("MAX HP heal something", "Heals a dummy / player to MAX HP!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targethum = target.Humanoid
	local targetpos = target.HumanoidRootPart.Position

	local args = {
    	[1] = targethum,
    	[2] = math.huge,
    	[3] = CFrame.new(targetpos, Vector3.new(0, 0, 0)),
		[4] = Vector3.new(0, 0, 0),
    	[5] = 0,
		[6] = 1,
   		[7] = "rbxassetid://2914074987",
    	[8] = 2
	}

	game:GetService("ReplicatedStorage").Attacks.Heal.CDHeal:FireServer(unpack(args))
end)

local TWOHModSection = StandModTab:NewSection("The World: Over Heaven")

TWOHModSection:NewButton("No Cooldown Time Stop", "You can use the Time Stop without cooldown!", function()
	local args = {
    	[1] = 12,
    	[2] = "DIO"
	}

	game:GetService("ReplicatedStorage").SpecialMoves.Timestop:FireServer(unpack(args))
end)

TWOHModSection:NewButton("Overwrite everyone (No dmg, stun)", "Uses the overwrite type damage on everyone!", function()
	local char = player.Character
	local charpos = char:WaitForChild("HumanoidRootPart").Position

	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			char:MoveTo(plr.Character.HumanoidRootPart.Position)

			local args1 = {
    			[1] = plr.Character.Humanoid,
    			[2] = 0,
    			[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
    			[4] = Vector3.new(0, 0, 0),
				[5] = 0.25,
				[6] = 2,
				[7] = "rbxassetid://1202656211",
				[8] = 2
			}

			local args2 = {
				[1] = plr.Character
			}

			wait(0.2)

			for i = 0, 5, 1 do
				game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
				game:GetService("ReplicatedStorage").Attacks.DamageOverwrite:FireServer(unpack(args1))
			end
		end
	end

	wait(0.2)
	char:MoveTo(charpos)
end)

TWOHModSection:NewTextBox("Overwrite something (No dmg, stun)", "Uses the overwrite type damage on a player / dummy!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	char:MoveTo(targetpos)

	local args1 = {
    	[1] = targethum,
    	[2] = 0,
    	[3] = CFrame.new(targetpos, Vector3.new(0, 0, 0)),
    	[4] = Vector3.new(0, 0, 0),
		[5] = 0.25,
		[6] = 2,
		[7] = "rbxassetid://1202656211",
		[8] = 2
	}

	local args2 = {
		[1] = target
	}

	wait(0.2)

	for i = 0, 5, 1 do
		game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
		game:GetService("ReplicatedStorage").Attacks.DamageOverwrite:FireServer(unpack(args1))
	end

	wait(0.2)
	char:MoveTo(charpos)
end)

TWOHModSection:NewTextBox("Donut something (has cooldown)", "Donuts a dummy / player! (Has cooldowns.)", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid
	
	local args = {
    	[1] = target
	}

	game:GetService("ReplicatedStorage").SpecialMoves.Donut:FireServer(unpack(args))
end)

TWOHModSection:NewButton("Bullet Kick everyone", "Bullet Kicks everyone! (Stuns everyone I guess.)", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= game.Players.LocalPlayer then
			local args = {
				[1] = plr.Character
			}

			game:GetService("ReplicatedStorage").SpecialMoves.BulletKick:FireServer(unpack(args))
		end
	end
end)

TWOHModSection:NewTextBox("Bullet Kick something", "Bullet Kicks a dummy / player! (More usable)", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
		[1] = target
	}

	game:GetService("ReplicatedStorage").SpecialMoves.BulletKick:FireServer(unpack(args))
end)

TWOHModSection:NewButton("No cooldown Lightning Strike", "Uses Lightning Strike without cooldown!", function()
	game:GetService("ReplicatedStorage").SpecialMoves.HeavenlyLightningStrike:FireServer()
end)

TWOHModSection:NewButton("No cooldown Knife Throw", "Throw knives without cooldown!", function()
	game:GetService("ReplicatedStorage").Attacks.OverHeavenKnifeThrow:FireServer()
end)

TWOHModSection:NewTextBox("No cooldown Knife Throw", "Throws a given amount of knives without cooldown!", function(text)
	local howmuchknives = tonumber(text)

	for i = 0, howmuchknives, 1 do
		game:GetService("ReplicatedStorage").Attacks.OverHeavenKnifeThrow:FireServer()
	end
end)

TWOHModSection:NewButton("Max HP heal yourself", "Heals you to max HP!", function()
	local char = player.Character
	
	local args = {
		[1] = false,
		[2] = char.Humanoid,
		[3] = math.huge,
		[4] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
		[7] = 1,
		[8] = "rbxassetid://1202656211",
		[9] = 2.5
	}

	game:GetService("ReplicatedStorage").Attacks.Heal.OverHeavenHeal:FireServer(unpack(args))
end)

TWOHModSection:NewButton("Max HP heal everyone", "Heals everyone to MAX HP!", function()
	local char = player.Character

	for i, plr in pairs(game.Players:GetPlayers()) do
		local args = {
			[1] = false,
			[2] = plr.Character.Humanoid,
			[3] = math.huge,
			[4] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
			[6] = 0,
			[7] = 1,
			[8] = "rbxassetid://1202656211",
			[9] = 2.5
		}

		game:GetService("ReplicatedStorage").Attacks.Heal.OverHeavenHeal:FireServer(unpack(args))
	end
end)

TWOHModSection:NewTextBox("MAX HP heal something", "Heal a player / dummy to MAX HP!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	local args = {
		[1] = false,
		[2] = targethum,
		[3] = math.huge,
		[4] = CFrame.new(targetpos, Vector3.new(0, 0, 0)),
		[6] = 0,
		[7] = 1,
		[8] = "rbxassetid://1202656211",
		[9] = 2.5
	}

	game:GetService("ReplicatedStorage").Attacks.Heal.OverHeavenHeal:FireServer(unpack(args))
end)

TWOHModSection:NewToggle("Auto heal if Low HP", "Automatically heals you to MAX HP when about to die!", function(toggle)
	local char = player.Character

	if toggle == true then
		repeat
			wait()
			TWOHAutoHeal()
		until toggle == false or char.Humanoid.Health <= 0
	else
		char.Humanoid.Health = 0
	end
end)


local SCModSection = StandModTab:NewSection("Silver Chariot")

SCModSection:NewButton("No cooldown Blade Shot", "Uses Blade Shot without cooldown!", function()
	game:GetService("ReplicatedStorage").Attacks.SCBladeShoot:FireServer()
end)

local MRModSection = StandModTab:NewSection("Magicians Red")

MRModSection:NewButton("Set everyone on fire", "Sets everyone on fire!", function()
	local char = player.Character
	local charpos = char:WaitForChild("HumanoidRootPart").Position

	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			char:MoveTo(plr.Character.HumanoidRootPart.Position)

			local args1 = {
				[1] = plr.Character.Humanoid,
				[2] = 0,
				[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
				[4] = Vector3.new(0, 0, 0),
				[5] = 0,
				[6] = 1.5,
				[7] = "rbxassetid://260430079",
				[8] = 3.6
			}

			local args2 = {
				[1] = plr.Character
			}

			wait(0.2)

			game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
			game:GetService("ReplicatedStorage").Attacks.DamageFire:FireServer(unpack(args1))
		end
	end

	wait(0.2)
	char:MoveTo(charpos)
end)

MRModSection:NewButton("Set something on fire", "Sets a player / dummy on fire!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	char:MoveTo(targetpos)

	local args1 = {
		[1] = targethum,
		[2] = 0,
		[3] = CFrame.new(targetpos, Vector3.new(0, 0, 0)),
		[4] = Vector3.new(0, 0, 0),
		[5] = 0,
		[6] = 1.5,
		[7] = "rbxassetid://260430079",
		[8] = 3.6
	}

	local args2 = {
		[1] = target
	}

	wait(0.2)

	game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
	game:GetService("ReplicatedStorage").Attacks.DamageFire:FireServer(unpack(args1))

	wait(0.2)

	char:MoveTo(charpos)
end)

MRModSection:NewButton("Fake Fire Shockwave", "Uses a fake Fire Shockwave move! (Only effects, no damage.)", function()
	local args = {
		[1] = BrickColor.new(1014)
	}

	game:GetService("ReplicatedStorage").SpecialMoves.CircleShockwave:FireServer(unpack(args))

	local args = {
		[1] = BrickColor.new(1014)
	}

	game:GetService("ReplicatedStorage").SpecialMoves.CircleShockwave:FireServer(unpack(args))

	local args = {
		[1] = BrickColor.new(1014)
	}

	game:GetService("ReplicatedStorage").SpecialMoves.CircleShockwave:FireServer(unpack(args))

	local args = {
		[1] = BrickColor.new(133)
	}

	game:GetService("ReplicatedStorage").SpecialMoves.CircleShockwave:FireServer(unpack(args))

	local args = {
		[1] = BrickColor.new(133)
	}

	game:GetService("ReplicatedStorage").SpecialMoves.CircleShockwave:FireServer(unpack(args))

	local args = {
		[1] = BrickColor.new(133)
	}

	game:GetService("ReplicatedStorage").SpecialMoves.CircleShockwave:FireServer(unpack(args))

	local args = {
		[1] = BrickColor.new(1009)
	}

	game:GetService("ReplicatedStorage").SpecialMoves.CircleShockwave:FireServer(unpack(args))

	local args = {
		[1] = BrickColor.new(1009)
	}

	game:GetService("ReplicatedStorage").SpecialMoves.CircleShockwave:FireServer(unpack(args))

	local args = {
		[1] = BrickColor.new(1009)
	}

	game:GetService("ReplicatedStorage").SpecialMoves.CircleShockwave:FireServer(unpack(args))
end)


local GERModSection = StandModTab:NewSection("Golden Experience Requiem")

GERModSection:NewButton("Max HP heal yourself", "Heals you to max HP!", function()
	local char = player.Character
	
	local args = {
		[1] = false,
		[2] = char.Humanoid,
		[3] = math.huge,
		[4] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
		[7] = 10,
		[8] = "rbxassetid://4567255304",
		[9] = 10
	}

	game:GetService("ReplicatedStorage").Attacks.Heal.GEHeal:FireServer(unpack(args))
end)

GERModSection:NewToggle("Auto heal if Low HP", "Automatically heals you to MAX HP when about to die!", function(toggle)
	local char = player.Character
	if toggle == true then
		while wait() do
			if toggle == false then
				break
			end

			if char.Humanoid.Health <= 60 then
				local args = {
					[1] = false,
					[2] = char.Humanoid,
					[3] = math.huge,
					[4] = CFrame.new(char.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
					[7] = 10,
					[8] = "rbxassetid://4567255304",
					[9] = 10
				}

				game:GetService("ReplicatedStorage").Attacks.Heal.GEHeal:FireServer(unpack(args))
			end
		end
	end
end)

GERModSection:NewButton("Max HP heal everyone", "Heals everyone to MAX HP!", function()
	local char = player.Character

	for i, plr in pairs(game.Players:GetPlayers()) do
		local args = {
			[1] = false,
			[2] = plr.Character.Humanoid,
			[3] = math.huge,
			[4] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
			[6] = 0,
			[7] = 10,
			[8] = "rbxassetid://4567255304",
			[9] = 10
		}

		game:GetService("ReplicatedStorage").Attacks.Heal.GEHeal:FireServer(unpack(args))
	end
end)

GERModSection:NewTextBox("MAX HP heal something", "Heal a player / dummy to MAX HP!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	local args = {
		[1] = false,
		[2] = targethum,
		[3] = math.huge,
		[4] = CFrame.new(targetpos, Vector3.new(0, 0, 0)),
		[6] = 0,
		[7] = 10,
		[8] = "rbxassetid://4567255304",
		[9] = 10
	}

	game:GetService("ReplicatedStorage").Attacks.Heal.GEHeal:FireServer(unpack(args))
end)


local WSModSection = StandModTab:NewSection("White Snake")

WSModSection:NewButton("Shoot Gun without cooldown", "Shoots the Gun without cooldown!", function()
	local args = {
		[1] = true
	}

	game:GetService("ReplicatedStorage").Attacks.BulletShoot:FireServer(unpack(args))
end)

WSModSection:NewButton("Take everyone's stand", "Takes everyone's stand!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = plr.Character
			}

			game:GetService("ReplicatedStorage").Attacks.Whitesnake.DiscRemoval:FireServer(unpack(args))
		end
	end
end)

WSModSection:NewTextBox("Take someone's stand", "Takes a specified player's stand!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
		[1] = target
	}

	game:GetService("ReplicatedStorage").Attacks.Whitesnake.DiscRemoval:FireServer(unpack(args))
end)

WSModSection:NewButton("Take everyone's memory (slow)", "Takes everyone's memory! (Slows players down.)", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = plr.Character
			}

			game:GetService("ReplicatedStorage").Attacks.Whitesnake.MemoryDisc:FireServer(unpack(args))
		end
	end
end)

WSModSection:NewTextBox("Take someone's memory (slow)", "Takes everyone's memory! (Slows player down.)", function()
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
		[1] = target
	}

	game:GetService("ReplicatedStorage").Attacks.Whitesnake.MemoryDisc:FireServer(unpack(args))
end)

WSModSection:NewButton("Fake Sleep", "Performs a fake Sleep", function()
	local args = {
    	[1] = true,
    	[2] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Torso")
	}

	game:GetService("ReplicatedStorage").Attacks.Whitesnake.AcidSleep:FireServer(unpack(args))
end)


local SFModSection = StandModTab:NewSection("Sticky Fingers")

SFModSection:NewButton("Zipper everyone", "Zippers everyone!", function()
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			char:MoveTo(plr.Character.HumanoidRootPart.Position)

			local args = {
				[1] = plr.Character.Humanoid,
				[2] = 0,
				[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
				[4] = Vector3.new(0, 0, 0),
				[5] = 0,
				[6] = 1,
				[7] = "rbxassetid://7107200898",
				[8] = 1.8
			}

			wait(0.2)

			for i = 0, 10, 1 do
				game:GetService("ReplicatedStorage").Attacks.DamageStickyFingers:FireServer(unpack(args))
			end
		end
	end

	wait(0.2)

	char:MoveTo(charpos)
end)

SFModSection:NewTextBox("Zipper something", "Zippers a dummy / player!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	char:MoveTo(targetpos)

	local args = {
		[1] = targethum,
		[2] = 0,
		[3] = CFrame.new(targetpos, Vector3.new(0, 0, 0)),
		[4] = Vector3.new(0, 0, 0),
		[5] = 0,
		[6] = 1,
		[7] = "rbxassetid://7107200898",
		[8] = 1.8
	}

	for i = 0, 10, 1 do
		game:GetService("ReplicatedStorage").Attacks.DamageStickyFingers:FireServer(unpack(args))
	end
end)

SFModSection:NewButton("Beatdown everyone", "Beatdowns everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = plr.Character
			}

			game:GetService("ReplicatedStorage").SpecialMoves.StickyFingersBeatdown:FireServer(unpack(args))
		end
	end
end)

SFModSection:NewTextBox("Beatdown someone", "Beatdowns a player!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid
	
	local args = {
		[1] = target
	}

	game:GetService("ReplicatedStorage").SpecialMoves.StickyFingersBeatdown:FireServer(unpack(args))
end)

SFModSection:NewButton("Remove everyone's limbs", "Removes everyone's limbs!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = plr.Character
			}

			for i = 0, 10, 1 do
				game:GetService("ReplicatedStorage").SpecialMoves.LimbRemoval:FireServer(unpack(args))
			end
		end
	end
end)

SFModSection:NewTextBox("Remove something's limbs", "Removes a dummy's / player's limbs!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
		[1] = target
	}

	for i = 0, 10, 1 do
		game:GetService("ReplicatedStorage").SpecialMoves.LimbRemoval:FireServer(unpack(args))
	end
end)

SFModSection:NewToggle("Toggle glide effect", "Toggles Zipper Glide's effect!", function(toggle)
	if toggle == true then
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Right Arm").ZipperTrail,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
	else
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Right Arm").ZipperTrail,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
	end
end)


local VampModSection = StandModTab:NewSection("Vampire")

VampModSection:NewButton("Space Ripper Stingy Eyes everyone", "Sends Space Ripper eyes to everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
    			[1] = plr.Character.HumanoidRootPart.Position
			}

			game:GetService("ReplicatedStorage").Attacks.SpaceRipper:FireServer(unpack(args))
		end
	end
end)

VampModSection:NewTextBox("Space Ripper Stingy Eyes something", "Sends Space Ripper eyes to a dummy / player!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
    	[1] = targetpos
	}

	game:GetService("ReplicatedStorage").Attacks.SpaceRipper:FireServer(unpack(args))
end)

VampModSection:NewButton("Ice Shatter everyone", "Uses Ice Shatter on everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
    			[1] = plr.Character
			}

			game:GetService("ReplicatedStorage").SpecialMoves.IceShatter:FireServer(unpack(args))
		end
	end
end)

VampModSection:NewTextBox("Ice Shatter something", "Ice Shatters a dummy / player!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
    	[1] = target
	}

	game:GetService("ReplicatedStorage").SpecialMoves.IceShatter:FireServer(unpack(args))
end)

VampModSection:NewButton("Pull everyone", "Brings / Pulls everyone to you!", function()
	local char = player.Character
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
    			[1] = plr.Character,
    			[2] = 1,
    			[3] = char.HumanoidRootPart.Position
			}

			game:GetService("ReplicatedStorage").SpecialMoves.Hold:FireServer(unpack(args))
		end
	end
end)

VampModSection:NewTextBox("Pull / Bring something", "Pulls / Brings a dummy / player to you!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
    	[1] = target,
    	[2] = 1,
    	[3] = charpos
	}

	game:GetService("ReplicatedStorage").SpecialMoves.Hold:FireServer(unpack(args))
end)

VampModSection:NewButton("Heal yourself", "Heals yourself with a vampire heal! (Faster heal.)", function()
	for i = 0, 100, 1 do
		game:GetService("ReplicatedStorage").SpecialMoves.VampireHeal:FireServer()
	end
end)

VampModSection:NewToggle("Auto heal if Low HP", "Automatically heals you to MAX HP when about to die!", function(toggle)
	local char = player.Character

	if toggle == true then
		while wait() do
			if char.Humanoid.Health <= 60 then
				if toggle == false then
					break
				end
				
				for i = 0, 100, 1 do
					game:GetService("ReplicatedStorage").SpecialMoves.VampireHeal:FireServer()
				end
			end
		end
	end
end)


local HamonModSection = StandModTab:NewSection("Hamon")

HamonModSection:NewButton("No cooldown Sendo", "Uses Sendo Overdrive without cooldown!", function()
	local args = {
		[1] = "SendoRipple"
	}

	game:GetService("Players").LocalPlayer.Backpack.Hamon.HamonLocalisedRemote:FireServer(unpack(args))
end)

HamonModSection:NewButton("Set everyone on fire", "Sets everyone on fire!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = "Fire",
				[2] = plr.Character
			}

			game:GetService("Players").LocalPlayer.Backpack.Hamon.HamonLocalisedRemote:FireServer(unpack(args))
		end
	end
end)

HamonModSection:NewTextBox("Set something on fire", "Sets a player / dummy on fire!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
		[1] = "Fire",
		[2] = target
	}

	game:GetService("Players").LocalPlayer.Backpack.Hamon.HamonLocalisedRemote:FireServer(unpack(args))
end)

HamonModSection:NewToggle("Toggle fake Flame Fists", "Toggles fake Flame Fists", function(toggle)
	if toggle == true then
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand.RARM.Fire,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand.LARM.Fire,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
	else
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand.RARM.Fire,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand.LARM.Fire,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
	end
end)

HamonModSection:NewToggle("Toggle fake Pluck", "Toggles fake Pluck!", function(toggle)
	if toggle == true then
		local args = {
			[1] = "TogglePluck",
			[2] = true
		}

		game:GetService("Players").LocalPlayer.Backpack.Hamon.HamonLocalisedRemote:FireServer(unpack(args))
	else
		local args = {
			[1] = "TogglePluck",
			[2] = false
		}

		game:GetService("Players").LocalPlayer.Backpack.Hamon.HamonLocalisedRemote:FireServer(unpack(args))
	end
end)

HamonModSection:NewButton("Pluck Pierce everyone", "Pierces everyone with Pluck!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = "Pierce",
				[2] = plr.Character
			}

			game:GetService("Players").LocalPlayer.Backpack.Hamon.HamonLocalisedRemote:FireServer(unpack(args))
		end
	end
end)

HamonModSection:NewTextBox("Pluck Pierce something", "Pierces a player / dummy with Pluck!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
		[1] = "Pierce",
		[2] = target
	}

	game:GetService("Players").LocalPlayer.Backpack.Hamon.HamonLocalisedRemote:FireServer(unpack(args))
end)
