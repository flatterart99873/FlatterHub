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


local ItemsTab = Window:NewTab("Items")
local ItemsSection = ItemsTab:NewSection("Give Arrow")

ItemsSection:NewButton("Get Arrow", "Gives you a normal arrow from the shop", function()
	local GiveArrow = game:GetService("ReplicatedStorage").ItemGiver.GiveArrow
	GiveArrow:FireServer()
end)

ItemsSection:NewButton("Get infinite arrows (BUGGY)", "Lets you get more arrows than one!", function()
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

ItemsSection:NewButton("Pick up all spawned tools", "Pick up: Requiem arrow or Dio's diary or Dio's Bone", function()
	local char = player.Character
	for i, tool in pairs(game.Workspace:GetChildren()) do
		if tool.ClassName == "Tool" then
			local ToolPart = tool:FindFirstChildOfClass("Part") or tool:FindFirstChildOfClass("MeshPart")
			char:MoveTo(ToolPart.Position)
			wait(0.5)
		end
	end
end)

local CreditsTab = Window:NewTab("Credits")
local Section = CreditsTab:NewSection("Scripts Owners")
local Section = CreditsTab:NewSection("Script Owner: flatterart99873")
local Section = CreditsTab:NewSection("Gui Owner: KavoUI")

local TeleportsTab = Window:NewTab("Teleports")
local TPsSection = TeleportsTab:NewSection("Pick up all tools")

TPsSection:NewButton("Middle Map", "Teleport to the map's middle", function()
	local char = player.Character
    char:MoveTo(Vector3.new(-755, -3, 1605))
end)
TPsSection:NewButton("Dummy test", "Teleport to the test dummies", function()
	local char = player.Character
	char:MoveTo(Vector3.new(-810, -5, 1620))
end)
TPsSection:NewButton("1v1 Arena", "Teleport to the 1v1 arena", function()
    local char = player.Character
	char:MoveTo(Vector3.new(-551, 1, 1275))
end)

TPsSection:NewTextBox("Teleport to something", "Teleports to a specified player / dummy!", function(text)
	local char = player.Character

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	char:MoveTo(targetpos)
end)

TPsSection:NewButton("Highest Peak", "Teleport to the highest peak", function()
    local char = player.Character
    char:MoveTo(Vector3.new(-582, 227, 1286))
end)

TPsSection:NewButton("Kars Cave", "Teleport to the kars cave", function()
    local char = player.Character
    char:MoveTo(Vector3.new(-489, 52, 1493))
end)

TPsSection:NewButton("Brown Rocks", "Teleport to the brown rocks", function()
    local char = player.Character
    char:MoveTo(Vector3.new(-482, -4, 1662))
end)

TPsSection:NewButton("Forest Campfire", "Teleport to the forest campfire", function()
    local char = player.Character
    char:MoveTo(Vector3.new(-837, -4, 1779))
end)

TPsSection:NewButton("Zeppeli Campfire", "Teleport to the zeppeli campfire", function()
    local char = player.Character
    char:MoveTo(Vector3.new(-676, 51, 1462))
end)

TPsSection:NewButton("Amogus", "Teleport to the sus easter egg", function()
    local char = player.Character
    char:MoveTo(Vector3.new(1, -1, 1400))
end)


local ToggleGuiTab = Window:NewTab("Toggle GUI")
local ToggleGuiSection = ToggleGuiTab:NewSection("On/Off")
ToggleGuiSection:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.LeftControl, function()
	Library:ToggleUI()
end)

local PlayerTab = Window:NewTab("Player")
local PlayerSection = PlayerTab:NewSection("WalkSpeed")
PlayerSection:NewSlider("WalkSpeed", "Changes walk speed", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    local char = player.Character
	char.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("JumpPower", "Changes jump power", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    local char = player.Character
	char.Humanoid.JumpPower = s
end)

PlayerSection:NewButton("Reset", "Reset your character instantly", function()
    local char = player.Character
	char.Humanoid.Health = 0
end)

PlayerSection:NewButton("Infinite yield (Nearly admin script)", "Infinite yield", function()
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
				game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
			end
		end
	end

	wait(0.2)
	char:MoveTo(charpos)
end)

CombatSection:NewTextBox("Kills specified living", "Kills a specified player / dummy!", function(text)
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

CombatSection:NewButton("Enable GOD MODE", "No damage, but some projectiles can hit.", function()
	local char = player.Character
	if not game:GetService("ReplicatedStorage").Basic:FindFirstChild("Anchor") then
		return
	else
		local Anchor = game:GetService("ReplicatedStorage").Basic.Anchor
		Anchor:Destroy()
		char.Humanoid.Health = 0
	end
end)

CombatSection:NewButton("Disable GOD MODE", "Disable god mode.", function()
	if game:GetService("ReplicatedStorage").Basic:FindFirstChild("Anchor") then
		return
	else
		local Anchor = Instance.new("RemoteEvent", game.ReplicatedStorage.Basic)
		Anchor.Name = "Anchor"
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
	firedenable = 0
	if toggled == true then
		repeat
			wait()
			firedenable = firedenable + 1
			local args = {
    			[1] = true
			}

			game:GetService("ReplicatedStorage").Basic.Block:FireServer(unpack(args))
		until
		firedenable == 10000
	end

	fireddisable = 0
	if toggled == false then
		repeat
			wait()
			fireddisable = fireddisable + 1
			local args = {
    			[1] = false
			}

			game:GetService("ReplicatedStorage").Basic.Block:FireServer(unpack(args))
		until
		fireddisable == 200
	end

	if firedenable == 10000 then
		wait(1)
		firedenable = 0
	end

	if fireddisable == 200 then
		wait(1)
		fireddisable = 0
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
local TrollingSection = TrollingTab:NewSection("Trolling")

TrollingSection:NewTextBox("Stun everyone for given seconds", "Stuns all players for the amount entered in seconds!", function(text)
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

TrollingSection:NewTextBox("Stun someone for 10 seconds", "Stuns a specified player for 10 seconds!", function(text)
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

TrollingSection:NewButton("Send everyone to space", "Sends everyone high up flying!", function()
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
			game:GetService("ReplicatedStorage").Attacks.DamageBeserk:FireServer(unpack(args1))
		end
	end
	wait(0.2)
	char:MoveTo(charpos)
end)

TrollingSection:NewTextBox("Send something to space", "Sends a player / dummy high up flying!", function(text)
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
	game:GetService("ReplicatedStorage").Attacks.DamageBeserk:FireServer(unpack(args1))

	wait(0.2)

	char:MoveTo(charpos)
end)

TrollingSection:NewButton("Send everyone to the map's corner", "Sends everyone to the map's corner!", function()
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
			game:GetService("ReplicatedStorage").Attacks.DamageBeserk:FireServer(unpack(args1))
		end
	end
	wait(0.2)
	char:MoveTo(charpos)
end)

TrollingSection:NewTextBox("Send a living to the map's corner", "Sends a player / dummy to the map's corner!", function(text)
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
	game:GetService("ReplicatedStorage").Attacks.DamageBeserk:FireServer(unpack(args1))

	wait(0.2)

	char:MoveTo(charpos)
end)

TrollingSection:NewButton("Trampoline everyone 10x", "Trampolines everyone 10 times!", function()
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
				game:GetService("ReplicatedStorage").Attacks.DamageBeserk:FireServer(unpack(args1))
			end
		end
	end

	wait(0.2)

	char:MoveTo(charpos)
end)

TrollingSection:NewTextBox("Trampoline someone 10x", "Trampolines someone 10 times!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	for i = 0, 10, 1 do
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
		game:GetService("ReplicatedStorage").Attacks.DamageBeserk:FireServer(unpack(args1))
	end

	wait(0.2)

	char:MoveTo(charpos)
end)
