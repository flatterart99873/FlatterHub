local player = game:GetService("Players").LocalPlayer
local char = player.Character

coroutine.wrap(function()
	while wait(2) do
		if not player then
			player:Kick("Security Kick by Flatter Hub! Your account may be in danger by AntiCheat! Flatter Hub will prevent your account being banned from the game with this kick.")
		end
	end
end)()

local oldhmmnc = nil

oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
	if self == player and tostring(getnamecallmethod():lower()) == "kick" then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Flatter Hub",
			Text = "You almost got kicked! Successfully prevented.",
			Icon = "rbxassetid://6238540373",
			Duration = 3,
		})

		return nil
	end

	return oldhmmnc(self, ...)
end)


local IntroScreenGui = Instance.new("ScreenGui", player.PlayerGui)
IntroScreenGui.Name = "IntroScreenGui"
IntroScreenGui.ResetOnSpawn = false

wait(1)

local IntroGui = Instance.new("TextLabel", IntroScreenGui)
IntroGui.Font = Enum.Font.Code
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

game:GetService("TweenService"):Create(IntroGui, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Rotation = 360}):Play()

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

--[[			VARIABLES			]]--

local StandsTable = {
	"Star Platinum",
	"The World",
	"Sticky Fingers",
	"Crazy Diamond",
	"Whitesnake",
	"Star Platinum: The World",
	"Silver Chariot",
	"Magicians Red",
	"The Hand",
	"King Crimson",
	"Gold Experience"
}

local SFDrawings = {
	"Penis",
	"Nazi Cross"
}

_G.ArrowsUsed = 0

--[[			LIBRARY FUNCTIONS
	
	-- Kavo / GUI Config
	
	Kavo.CreateLib(kavName, themeList)
	Kavo:DraggingEnabled(frame, parent)
	Kavo:ToggleUI()
	Kavo:ChangeColor(prope,color)
	
	
	-- Utility
	
	Utility:TweenObject(obj, properties, duration, ...)
	
	-- Create
	
	Elements:NewTextBox(tname, tTip, callback)
	Elements:NewToggle(tname, nTip, callback)
	Elements:NewSlider(slidInf, slidTip, maxvalue, minvalue, callback)
	Elements:NewDropdown(dropname, dropinf, list, callback)
	Elements:NewKeybind(keytext, keyinf, first, callback)
	Elements:NewColorPicker(colText, colInf, defcolor, callback)
	Elements:NewLabel(title)
	Sections:NewSection(secName, hidden)
	Tabs:NewTab(tabName)
	
	
	-- Update / Refresh
	
	ButtonFunction:UpdateButton(newTitle)
	TogFunction:UpdateToggle(newText, isTogOn)
	DropFunction:Refresh(newList)
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

local function get_player_nolp(name)
    name = name:lower()

    for _, player in ipairs(game.Players:GetPlayers()) do
        if name == player.Name:lower():sub(1, #name) and player.Name:lower():sub(1, #name) ~= game.Players.LocalPlayer.Name:lower():sub(1, #name) then
            return player
        end
    end
end

local function GetArrow(val, char, backpack)
	if val == true then
		if backpack:FindFirstChild("Stand Arrow") == nil and char:FindFirstChild("Stand Arrow") == nil then
			game:GetService("ReplicatedStorage").ItemGiver.GiveArrow:FireServer()
			wait(0.2)
		end

		if char:FindFirstChild("Stand Arrow") == nil then
			char.Humanoid:EquipTool(backpack:FindFirstChild("Stand Arrow"))
		end
	end
end

local function GEAutoHeal()
	local char = player.Character

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

local function VTWAutoHeal()
	local char = player.Character

	if char.Humanoid.Health <= 60 then
		for i = 0, 100, 1 do
			game:GetService("ReplicatedStorage").SpecialMoves.VampireHeal:FireServer()
		end
	end
end

local function KarsAutoHeal()
	local char = player.Character

	if char.Humanoid.Health <= 60 then
		for i = 0, 100, 1 do
			game:GetService("ReplicatedStorage").SpecialMoves.KarsHeal:FireServer()
		end
	end
end

local function CDAutoHeal()
	local char = player.Character

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

local function Draw(shape)
	if shape == "pp" then
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Right Arm").ZipperTrail,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		wait(0.1)

		local char = game.Players.LocalPlayer.Character
		local charpos = char.HumanoidRootPart.Position
		local lookpos = char.HumanoidRootPart.CFrame.LookVector

		char:MoveTo(charpos + Vector3.new(5, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(0, 0, 5))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(5, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(0, 0, 5))



		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(5, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(0, 0, 5))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(5, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(0, 0, 5))



		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(5, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(0, 0, 10))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(5, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(0, 0, 10))

		wait(0.1)

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Right Arm").ZipperTrail,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
	elseif shape == "cross" then
		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Right Arm").ZipperTrail,
			[2] = true
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))

		wait(0.1)

		local char = game.Players.LocalPlayer.Character
		local charpos = char.HumanoidRootPart.Position
		local lookpos = char.HumanoidRootPart.CFrame.LookVector

		char:MoveTo(charpos - Vector3.new(0, 0, 20))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(0, 0, 10))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(10, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(20, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(0, 0, 10))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(0, 0, 10))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(20, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(0, 0, 10))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(0, 0, 10))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(10, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(0, 0, 10))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(10, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(10, 0, 0))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos - Vector3.new(0, 0, 20))

		wait()

		local charpos = char.HumanoidRootPart.Position
		char:MoveTo(charpos + Vector3.new(10, 0, 0))

		wait(0.1)

		local args = {
			[1] = game:GetService("Players").LocalPlayer.Character.Stand:FindFirstChild("Stand Right Arm").ZipperTrail,
			[2] = false
		}

		game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
	end
end

local function customcd(name, button, cooldown)
	local args = {
		[1] = name,
		[2] = "(".. button:upper().. ")",
		[3] = cooldown
	}

	game:GetService("ReplicatedStorage").CoolDowns:FireServer(unpack(args))
end

--[[			MAIN PART			]]--

local InfoTab = Window:NewTab("Info (MUST READ!)")

local Section = InfoTab:NewSection("-- Script Owners --")
local Label = Section:NewLabel("Script Owner: flatterart99873")
local Label = Section:NewLabel("Script / Asset helper: yba_jojo7")
local Label = Section:NewLabel("Gui Template: KavoUI")

local DisclaimerSection = InfoTab:NewSection("-- Disclaimers --")

DisclaimerSection:NewLabel("Enter the players name, not nickname in textboxes!")
DisclaimerSection:NewLabel("Some toggle features may disable at any time!")
DisclaimerSection:NewLabel("Fake cooldowns doesn't do anything, it's just there.")
DisclaimerSection:NewLabel('"Something" means a player or dummy.')
DisclaimerSection:NewLabel("If you use this GUI often, you can maybe get a ban!")
DisclaimerSection:NewLabel('"See other exploiters" wont affect their invisibility.')
DisclaimerSection:NewLabel("Flatter Hub has a low protection for AntiCheat bans!")
DisclaimerSection:NewLabel("If you get banned then Flatter Hub may protect you.")
DisclaimerSection:NewLabel("Server Side means everyone can see it!")
DisclaimerSection:NewLabel("Client Side means only you can see it!")
DisclaimerSection:NewLabel("Flatter Hub has an Client Side AntiKick System.")
DisclaimerSection:NewLabel("Using Anti TimeStop while timestop will freeze you!")

local RulesSection = InfoTab:NewSection("-- Rules --")

RulesSection:NewLabel("Please don't spam things to keep it working!")
RulesSection:NewLabel("Use this GUI wisely.")
RulesSection:NewLabel("Do not abuse this GUI often!")
RulesSection:NewLabel("Do not give any info about this GUI to developers!")
RulesSection:NewLabel("Have fun!")


local ItemsTab = Window:NewTab("Items")
local ItemsSection = ItemsTab:NewSection("Get arrow")

ItemsSection:NewButton("Get Arrow", "Gives you a normal arrow from the shop!", function()
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
	local charpos = char.HumanoidRootPart.Position
	local ISS = game.Workspace:WaitForChild("ItemSpawnPoints")

	for i, tool in pairs(ISS:WaitForChild("Money"):GetDescendants()) do
		if tool:IsA("Tool") then
			local ToolPart = tool:FindFirstChildOfClass("Part") or tool:FindFirstChildOfClass("MeshPart")
			char:MoveTo(ToolPart.Position)
			wait(0.5)
		end
	end

	for i, tool in pairs(ISS:WaitForChild("Rare Items"):GetDescendants()) do
		if tool:IsA("Tool") then
			local ToolPart = tool:FindFirstChildOfClass("Part") or tool:FindFirstChildOfClass("MeshPart")
			char:MoveTo(ToolPart.Position)
			wait(0.5)
		end
	end

	for i, tool in pairs(game.Workspace:GetChildren()) do
		if tool:IsA("Tool") then
			local ToolPart = tool:FindFirstChildOfClass("Part") or tool:FindFirstChildOfClass("MeshPart")
			char:MoveTo(ToolPart.Position)
			wait(0.5)
		end
	end

	char:MoveTo(charpos)
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

	if game.Workspace.Map:FindFirstChild("Jotaro") then
		JotaroSpawned = true
	else
		JotaroSpawned = false
	end
end

local NPCSpawnsSection = SpawnsTab:NewSection("NPC Spawns")

local PucciSpawnedLabel = NPCSpawnsSection:NewLabel("Pucci spawned:")

NPCSpawnsSection:NewButton("Teleport to Pucci", "Teleports you to Pucci!", function()
	local char = player.Character
	char:MoveTo(game.Workspace.Map:FindFirstChild("Pucci").HumanoidRootPart.Position)
end)

local KarsSpawnedLabel = NPCSpawnsSection:NewLabel("Kars spawned:")

NPCSpawnsSection:NewButton("Teleport to Kars", "Teleports you to Kars!", function()
	local char = player.Character
	char:MoveTo(game.Workspace.Map:FindFirstChild("Kars").HumanoidRootPart.Position)
end)

local ZeppeliSpawnedLabel = NPCSpawnsSection:NewLabel("Zeppeli spawned:")

NPCSpawnsSection:NewButton("Teleport to Zeppeli", "Teleports you to Zeppeli!", function()
	local char = player.Character
	char:MoveTo(game.Workspace.Map:FindFirstChild("Anthonio Zeppeli").HumanoidRootPart.Position)
end)

local JotaroSpawnedLabel = NPCSpawnsSection:NewLabel("Jotaro spawned:")

NPCSpawnsSection:NewButton("Teleport to Jotaro", "Teleports you to Jotaro!", function()
	local char = player.Character
	char:MoveTo(game.Workspace.Map:FindFirstChild("Jotaro").HumanoidRootPart.Position)
end)

game:GetService("RunService").Heartbeat:Connect(function()
	PucciSpawnedLabel:UpdateLabel("Pucci spawned: ".. tostring(PucciSpawned))
	KarsSpawnedLabel:UpdateLabel("Kars spawned: ".. tostring(KarsSpawned))
	ZeppeliSpawnedLabel:UpdateLabel("Zeppeli spawned: ".. tostring(ZeppeliSpawned))
	JotaroSpawnedLabel:UpdateLabel("Jotaro spawned: ".. tostring(JotaroSpawned))
end)

local TeleportsTab = Window:NewTab("Teleports")

local TPsSection = TeleportsTab:NewSection("NPC / Player teleports")

TPsSection:NewTextBox("Teleport to something", "Teleports to a specified player / dummy!", function(text)
	local char = player.Character

	local subtext = get_player_nolp(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targetpos = target.HumanoidRootPart.Position
	local targethum = target.Humanoid

	char:MoveTo(targetpos)
end)

TPsSection:NewButton("Teleport to Pucci spawns", "Teleports thru all the Pucci NPC spawns!", function()
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	wait()

	for i, npcspawn in pairs(game.Workspace:WaitForChild("NpcSpawnPoints").Pucci:GetChildren()) do
		char:MoveTo(npcspawn.Position)
		wait(1.5)
	end

	char:MoveTo(charpos)
end)

TPsSection:NewButton("Teleport to Jotaro spawns", "Teleports thru all the Jotaro NPC spawns!", function()
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	wait()

	for i, npcspawn in pairs(game.Workspace:WaitForChild("NpcSpawnPoints").Jotaro:GetChildren()) do
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


local OthersTab = Window:NewTab("Others")
local ToggleGuiSection = OthersTab:NewSection("Toggle GUI: On/Off")

ToggleGuiSection:NewKeybind("KeybindText", "KeybindInfo", Enum.KeyCode.LeftControl, function()
	Library:ToggleUI()
end)

local ChatSection = OthersTab:NewSection("Chat")

ChatSection:NewTextBox("Player / Dummy", "Insert a player or dummy name here", function(text)
	_G.ChatName = text
end)

ChatSection:NewTextBox("Text", "Insert the text here", function(text)
	_G.ChatText = text
end)

ChatSection:NewTextBox("Chat type (0-3)", "Insert a number here from 0 to 3", function(text)
	_G.ChatType = tonumber(text)
end)

ChatSection:NewButton("Chat", "Makes the player / dummy chat! (Wont appear in real chat.)", function()
	local chatentity = get_player(_G.ChatName) or get_entity(_G.ChatName)
	local chatentityinstance

	pcall(function()
		if chatentity:IsA("Player") then
			chatentityinstance = chatentity.Character
		elseif chatentity:IsA("Model") then
			chatentityinstance = chatentity:FindFirstChild("Head")
		end
	end)

	game:GetService("Chat"):Chat(chatentityinstance, _G.ChatText, _G.ChatType)
end)

local GUISection = OthersTab:NewSection("GUIs")

GUISection:NewButton("Stand Storage", "Access the Stand Storage GUI from anywhere!", function()
	player.PlayerGui:FindFirstChild("StandStorageGui"):FindFirstChild("StandStorage").Visible = true
end)

local CooldownSection = OthersTab:NewSection("Custom Cooldowns")

CooldownSection:NewTextBox("Cooldown Name", "Enter the cooldowns name here", function(text)
	_G.CooldownName = text
end)

CooldownSection:NewTextBox("Cooldown Key", "Enter the cooldowns key here", function(text)
	_G.CooldownKey = text
end)

CooldownSection:NewTextBox("Cooldown Time", "Enter the cooldowns duration here", function(text)
	_G.CooldownTime = tonumber(text)
end)

CooldownSection:NewButton("Cooldown", "Use Custom Cooldown!", function()
	customcd(_G.CooldownName, _G.CooldownKey, _G.CooldownTime)
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
		[4] = char.HumanoidRootPart.CFrame.LookVector * 1000,
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
			task.wait()
			for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Part") or v:IsA("MeshPart") then
					if v.Name ~= "HumanoidRootPart" then
						local args = {
							[1] = v,
							[2] = i
						}

						game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
					end
				end

				if v:IsA("Accessory") then
					local args = {
						[1] = v:FindFirstChild("Handle"),
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
			task.wait()
			for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Part") or v:IsA("MeshPart") then
					if v.Name ~= "HumanoidRootPart" then
						local args = {
							[1] = v,
							[2] = i
						}

						game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
					end
				end

				if v:IsA("Accessory") then
					local args = {
						[1] = v:FindFirstChild("Handle"),
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
			task.wait()
			for _, v in pairs(game.Players.LocalPlayer.Character.Stand:GetDescendants()) do
				if v:IsA("MeshPart") then
					if v.Name ~= "Stand HumanoidRootPart" then
						local args = {
							[1] = v,
							[2] = i
						}

						game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
					end
				end

				if v:FindFirstChild("Stand Aura") then
					local args = {
						[1] = v:FindFirstChild("Stand Aura"),
						[2] = false
					}

					game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
				end

				if v:IsA("Accessory") then
					local args = {
						[1] = v:FindFirstChild("Handle"),
						[2] = i
					}

					game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
				end

				local args = {
					[1] = v:FindFirstChild("face"),
					[2] = i
				}

				game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
			end
		end
	else
		for i = 1, 0, -0.1 do
			task.wait()
			for _, v in pairs(game.Players.LocalPlayer.Character.Stand:GetDescendants()) do
				if v:IsA("MeshPart") then
					if v.Name ~= "Stand HumanoidRootPart" then
						local args = {
							[1] = v,
							[2] = i
						}

						game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
					end
				end

				if v:FindFirstChild("Stand Aura") then
					local args = {
						[1] = v:FindFirstChild("Stand Aura"),
						[2] = true
					}

					game:GetService("ReplicatedStorage").Basic.Enabled:FireServer(unpack(args))
				end

				if v:IsA("Accessory") then
					local args = {
						[1] = v:FindFirstChild("Handle"),
						[2] = i
					}

					game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
				end

				local args = {
					[1] = v:FindFirstChild("face"),
					[2] = i
				}

				game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
			end
		end
	end
end)

CharacterSection:NewToggle("See other invisible players", "Toggles to see other invisible exploiters!", function(toggle)
	if toggle then
		for i, v in pairs(game.Players:GetPlayers()) do
			if v.Character:WaitForChild("Head"):WaitForChild("face").Transparency == 1 then
				for i, v in pairs(v.Character:GetChildren()) do
					if v:IsA("Part") or v:IsA("MeshPart") then
						if v.Name ~= "HumanoidRootPart" then
							v.Transparency = 0.5
						end
					end

					if v:FindFirstChild("face") then
						v:FindFirstChild("face").Transparency = 0.5
					end
				end
			end
		end
	else
		for i, v in pairs(game.Players:GetPlayers()) do
			if v.Character:WaitForChild("Head"):WaitForChild("face").Transparency == 0.5 then
				for i, v in pairs(v.Character:GetChildren()) do
					if v:IsA("Part") or v:IsA("MeshPart") then
						if v.Name ~= "HumanoidRootPart" then
							v.Transparency = 1
						end
					end

					if v:FindFirstChild("face") then
						v:FindFirstChild("face").Transparency = 1
					end
				end
			end
		end
	end
end)

local AdminSection = PlayerTab:NewSection("Admin GUI")

AdminSection:NewButton("Infinite yield (Nearly admin script)", "Infinite yield", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)


local StandFarmTab = Window:NewTab("Stand Farm")

local StandFarmSection = StandFarmTab:NewSection("Stand Farm")

StandFarmSection:NewDropdown("Stand to farm", "Select the stand you want to get!", StandsTable, function(option)
	_G.StandToFarm = option
end)

local CurrentStandLabel = StandFarmSection:NewLabel("Current Stand: ".. player:WaitForChild("Data"):WaitForChild("AbilityName").Value)

local ArrowsUsedLabel = StandFarmSection:NewLabel("Arrows used by Auto Farm: ".. _G.ArrowsUsed)

StandFarmSection:NewButton("Reset Arrows used counter", "Resets the Arrows used counter to 0!", function()
	_G.ArrowsUsed = 0
	ArrowsUsedLabel:UpdateLabel("Arrows used by Auto Farm: ".. _G.ArrowsUsed)
end)

player:WaitForChild("Data"):WaitForChild("AbilityName").Changed:Connect(function()
	CurrentStandLabel:UpdateLabel("Current Stand: ".. player:WaitForChild("Data"):WaitForChild("AbilityName").Value)
end)

local StandFarmToggler = StandFarmSection:NewToggle("Farm Stand", "Farms the selected stand!", function(toggle)
	local char = player.Character
	local backpack = player.Backpack
	local charpos = char.HumanoidRootPart.Position
	
	shared.FarmStand = toggle
	
	if shared.FarmStand then
		if player.Data.AbilityName.Value == _G.StandToFarm then
			StandFarmToggler:UpdateToggle("Stand already acquired!", state)
			shared.FarmStand = not shared.FarmStand
			task.wait(2)
			toggle = not toggle
			state = not state
			StandFarmToggler:UpdateToggle("Farm Stand")
		end

		if player.Data.AbilityName.Value ~= _G.StandToFarm then
			if game.Workspace:FindFirstChild("FarmPart") == nil then
				FarmPart = Instance.new("Part", game.Workspace)
				FarmPart.Size = Vector3.new(100, 1, 100)
				FarmPart.Position = Vector3.new(-10000, 5000, -10000)
				FarmPart.Transparency = 0.5
				FarmPart.Anchored = true
				FarmPart.Name = "FarmPart"
			else
				FarmPart:Destroy()
			end

			char:MoveTo(FarmPart.Position)

			repeat
				local char = player.Character
				local backpack = player.Backpack
				GetArrow(true, char, backpack)

				char:MoveTo(FarmPart.Position)

				wait(0.2)

				if char:FindFirstChild("Stand Arrow") then
					if player.PlayerGui.ToolGui.Arrow.Visible == true then
						for i, v in ipairs(player.PlayerGui.ToolGui.Arrow:GetChildren()) do
							if v.Name == "Yes" then
								v.Parent = player.PlayerGui.ToolGui

								if player.PlayerGui.ToolGui:FindFirstChild("Yes") then
									v.Position = UDim2.new(0, 0, 0, 0)
									v.TextTransparency = 1
								end
							end
						end

						wait(0.2)

						if player.PlayerGui.ToolGui:FindFirstChild("Yes") then
							game:GetService("VirtualUser"):ClickButton1(Vector2.new(player.PlayerGui.ToolGui:FindFirstChild("Yes").Position))
							ArrowsUsedLabel:UpdateLabel("Arrows used by Auto Farm: ".. _G.ArrowsUsed)
							_G.ArrowsUsed = _G.ArrowsUsed + 1
							ArrowsUsedLabel:UpdateLabel("Arrows used by Auto Farm: ".. _G.ArrowsUsed)
						end
					end
				end

				wait(6)
			until player.Data.AbilityName.Value == _G.StandToFarm or not shared.FarmStand
		end

		if player.Data.AbilityName.Value == _G.StandToFarm then
			StandFarmToggler:UpdateToggle(_G.StandToFarm.. "acquired!", state)
			shared.FarmStand = not shared.FarmStand
			task.wait(2)
			state = not state
			toggle = not toggle
			StandFarmToggler:UpdateToggle("Farm Stand")
		end
	else
		local char = player.Character
		char:MoveTo(charpos)
		FarmPart:Destroy()
	end
end)

StandFarmSection:NewToggle("Kick if got selected stand", "Kicks you if you got the selected stand!", function(toggle)
	if toggle then
		if player:WaitForChild("Data"):WaitForChild("AbilityName").Value == _G.StandToFarm and shared.FarmStand then
			wait(1)
			player:Kick("You have gotten the selected stand!")
		end
	else
		return
	end
end)

StandFarmSection:NewButton("Get Arrow", "Gives you a normal arrow from the shop!", function()
	local GiveArrow = game:GetService("ReplicatedStorage").ItemGiver.GiveArrow
	GiveArrow:FireServer()
end)


local CombatTab = Window:NewTab("Combat")
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

CombatSection:NewToggle("Kill Aura", "Toggles Kill Aura!!", function(toggle)
	while toggle do
		wait()
		for i, plr in pairs(game:GetService("Players"):GetPlayers()) do
			wait()
			if plr ~= player then
				local args1 = {
    				[1] = plr.Character.Humanoid,
    				[2] = 100,
    				[3] = CFrame.new(plr.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0)),
    				[4] = Vector3.new(0, 0, 0),
    				[5] = 0.1,
    				[6] = 1,
    				[7] = "rbxassetid://260430079",
    				[8] = 0.6
				}

				local args2 = {
					[1] = plr.Character
				}

				for i = 0, 5, 1 do
					game:GetService("ReplicatedStorage").SpecialMoves.BlockBreak:FireServer(unpack(args2))
					game:GetService("ReplicatedStorage").Attacks.DamageBlunt:FireServer(unpack(args1))
				end
			end
		end
	end
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
	while toggle do
		local args = {
			[1] = true
		}

		game:GetService("ReplicatedStorage").Basic.Block:FireServer(unpack(args))
	end
end)

CombatSection:NewButton("UnStuck / UnFreeze", "Use this if you get stuck", function()
	player.Character:Destroy()
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

StunSection:NewTextBox("Stun someone [NAME]", "Enter the player name here!", function(text)
	_G.StunName = text
end)

StunSection:NewTextBox("Stun someone [TIME]", "Etner the duration of the stun here", function()
	_G.StunDuration = tonumber(text)
end)

StunSection:NewButton("Stun Player for Time", "Stuns a specified player for specified time!", function()
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(_G.StunName)
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
		[5] = _G.StunDuration,
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
	local char = player.Character
	
	local args = {
    	[1] = true,
    	[2] = char.HumanoidRootPart.Position
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
		repeat
			wait()
			GEAutoHeal()
		until toggle == false or char.Humanoid.Health <= 0
	else
		char.Humanoid.Health = 0
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

SPModSection:NewButton("No cooldown 3 sec Time Stop", "Uses a 7 sec Time Stop without cooldown!", function()
	local args = {
		[1] = 3,
		[2] = "Jotaro"
	}

	game:GetService("ReplicatedStorage").SpecialMoves.Timestop:FireServer(unpack(args))
end)

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
		for i, v in pairs(player.Character:FindFirstChild("Road Roller"):GetChildren()) do
			local args = {
				[1] = v,
				[2] = 0
			}

			game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
		end
	else
		for i, v in pairs(player.Character:FindFirstChild("Road Roller"):GetChildren()) do
			local args = {
				[1] = v,
				[2] = 1
			}

			game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
		end
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
		repeat
			wait()
			VTWAutoHeal()
		until toggle == false or char.Humanoid.Health <= 0
	else
		char.Humanoid.Health = 0
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
		repeat
			wait()
			CDAutoHeal()
		until toggle == false or char.Humanoid.Health <= 0
	else
		char.Humanoid.Health = 0
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

TWOHModSection:NewButton("Overwrite everyone", "Uses the overwrite type damage on everyone!", function()
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

MRModSection:NewTextBox("Set something on fire", "Sets a player / dummy on fire!", function(text)
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
		repeat
			wait()
			GEAutoHeal()
		until toggle == false or char.Humanoid.Health <= 0
	else
		char.Humanoid.Health = 0
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

WSModSection:NewTextBox("Take someone's stand", "Takes a specified player's stand! (They can't use moves.)", function(text)
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

WSModSection:NewButton("Take everyone's memory", "Takes everyone's memory! (Slows players down.)", function()
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

SFModSection:NewButton("Remove Limb lag", "Fixes some lag if you spam limbs (Only for you.)", function()
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name == "Left Arm" or v.Name == "Right Arm" or
		v.Name == "Left Leg" or v.Name == "Right Leg" then
			v:Destroy()
		end
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

SFModSection:NewDropdown("Glide effect drawings", "Draw things with the Glide effect!", SFDrawings, function(option)
	if option == "Penis" then
		_G.SelectedSFDrawing = "pp"
	elseif option == "Nazi Cross" then
		_G.SelectedSFDrawing = "cross"
	end
end)

SFModSection:NewButton("Draw selected drawing", "Draws the selected drawing!", function()
	Draw(_G.SelectedSFDrawing)
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
		repeat
			wait()
			VTWAutoHeal()
		until toggle == false or char.Humanoid.Health <= 0
	else
		char.Humanoid.Health = 0
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


local TWModSection = StandModTab:NewSection("The World")

TWModSection:NewButton("No cooldown 6 sec Time Stop", "Uses 6 sec Time Stop without cooldowns!", function()
	local args = {
		[1] = 6,
		[2] = "DIO"
	}

	game:GetService("ReplicatedStorage").SpecialMoves.Timestop:FireServer(unpack(args))
end)

TWModSection:NewButton("Bleed everyone 10x", "Bleeds everyone 10 times!", function()
	for i = 0, 10, 1 do
		for i, plr in pairs(game.Players:GetPlayers()) do
			if plr ~= player then
				local args = {
					[1] = "Bleed",
					[2] = plr.Character
				}

				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("The World").TWLocalisedRemote:FireServer(unpack(args))
			end
		end
	end
end)

TWModSection:NewTextBox("Bleed something 10x", "Bleeds a player / dummy 10 times!", function(text)
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(text) or get_entity(text)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	for i = 0, 10, 1 do
		local args = {
			[1] = "Bleed",
			[2] = target
		}

		game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("The World").TWLocalisedRemote:FireServer(unpack(args))
	end
end)

TWModSection:NewButton("Pull everyone for 0.5 secs", "Pulls everyone to you for 0.5 secs!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = "Hold",
				[2] = plr.Character,
				[3] = 0.5
			}

			game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("The World").TWLocalisedRemote:FireServer(unpack(args))
		end
	end
end)

TWModSection:NewTextBox("Pull everyone for given seconds!", "Pulls everyone for given seconds!", function(text)
	local stun = tonumber(text)
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = "Hold",
				[2] = plr.Character,
				[3] = stun
			}

			game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("The World").TWLocalisedRemote:FireServer(unpack(args))
		end
	end
end)

TWModSection:NewTextBox("Pull someone", "Type the player name here", function(text)
	_G.PullPlayer = text
end)

TWModSection:NewTextBox("Pull time", "Type the duration amount here", function(text)
	_G.PullDuration = tonumber(text)
end)

TWModSection:NewButton("Pull Player", "Pulls the specified player for specified seconds!", function()
	local char = player.Character
    local charpos = char.HumanoidRootPart.Position

    local subtext = get_player(_G.PullPlayer)
    local targetplrstring = tostring(subtext)

    local target = game.Workspace:FindFirstChild(targetplrstring)
    local targetpos = target.HumanoidRootPart.Position
    local targethum = target.Humanoid

	local args = {
		[1] = "Hold",
		[2] = target,
		[3] = _G.PullDuration
	}

	game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("The World").TWLocalisedRemote:FireServer(unpack(args))
end)

TWModSection:NewButton("No cooldown knife throw", "Throws knives without cooldown!", function()
	local args = {
		[1] = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))
	}

	game:GetService("ReplicatedStorage").Attacks.DioKnifeThrow:FireServer(unpack(args))
end)

TWModSection:NewTextBox("Throw given amount of knives", "Throws a given amount of knives without cooldowns!", function(amount)
	local howmuchknives = tonumber(amount)
	for i = 0, howmuchknives, 1 do
		local args = {
			[1] = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0))
		}

		game:GetService("ReplicatedStorage").Attacks.DioKnifeThrow:FireServer(unpack(args))
	end
end)

TWModSection:NewTextBox("Donut something (has cooldown)", "Donuts a dummy / player! (Has cooldowns.)", function(text)
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

TWModSection:NewButton("Bullet Kick everyone", "Bullet Kicks everyone! (Stuns everyone I guess.)", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= game.Players.LocalPlayer then
			local args = {
				[1] = plr.Character
			}

			game:GetService("ReplicatedStorage").SpecialMoves.BulletKick:FireServer(unpack(args))
		end
	end
end)

TWModSection:NewTextBox("Bullet Kick something", "Bullet Kicks a dummy / player! (More usable)", function(text)
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

TWModSection:NewToggle("Toggle Sign (No damage)", "Toggles Sign! (Doesn't do any damage.)", function(toggle)
	local char = player.Character
	if toggle == true then
		for i, part in pairs(char:WaitForChild("SignArm").Sign:GetChildren()) do
			local args = {
				[1] = part,
				[2] = 0
			}

			game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))

		end
	else
		for i, part in pairs(char:WaitForChild("SignArm").Sign:GetChildren()) do
			local args = {
				[1] = part,
				[2] = 1
			}

			game:GetService("ReplicatedStorage").Basic.Transparency:FireServer(unpack(args))
		end
	end
end)


local THModSection = StandModTab:NewSection("The Hand")

THModSection:NewButton("Pull closest players", "Pulls closest players!", function()
	local args = {
		[1] = "Pull",
		[2] = 50
	}

	game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("The Hand").THLocalisedRemote:FireServer(unpack(args))
end)

THModSection:NewButton("No cooldown Beatdown everyone", "Beatdowns everyone without cooldown!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = plr.Character
			}

			game:GetService("ReplicatedStorage").SpecialMoves.TheHandBeatdown:FireServer(unpack(args))
		end
	end
end)

THModSection:NewTextBox("No cooldown Beatdown something", "Beatdowns a player / dummy without cooldown!", function(text)
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

	game:GetService("ReplicatedStorage").SpecialMoves.TheHandBeatdown:FireServer(unpack(args))
end)


local KCModSection = StandModTab:NewSection("King Crimson")

KCModSection:NewButton("Bleed everyone 10x", "Makes everyone bleeding 10x!", function()
	for i = 0, 10, 1 do
		for i, plr in pairs(game.Players:GetPlayers()) do
			if plr ~= player then
				local args = {
					[1] = "Bleed",
					[2] = plr.Character
				}

				game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("King Crimson").KCLocalisedRemote:FireServer(unpack(args))
			end
		end
	end
end)

KCModSection:NewTextBox("Bleed something 10x", "Makes bleeding a player / dummy 10x!", function(text)
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

		game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("King Crimson").KCLocalisedRemote:FireServer(unpack(args))
	end
end)

KCModSection:NewButton("Blood Throw everyone (Removes HP)", "Uses Blood Throw on everyone! (Removes HP.)", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = "BloodThrow",
				[2] = plr.Character.HumanoidRootPart.Position
			}

			game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("King Crimson").KCLocalisedRemote:FireServer(unpack(args))
		end
	end
end)

KCModSection:NewTextBox("Blood Throw something (Removes HP)", "Uses Blood Throw on a player / dummy! (Removes HP.)", function()
	for i = 0, 10, 1 do
		local char = player.Character
		local charpos = char.HumanoidRootPart.Position

		local subtext = get_player(text) or get_entity(text)
		local targetplrstring = tostring(subtext)

		local target = game.Workspace:FindFirstChild(targetplrstring)
		local targethum = target.Humanoid

		local args = {
			[1] = "BloodThrow",
			[2] = targetpos
		}

		game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("King Crimson").KCLocalisedRemote:FireServer(unpack(args))
	end
end)

KCModSection:NewButton("Donut everyone", "Donuts everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = "Donut",
				[2] = plr.Character
			}

			game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("King Crimson").KCLocalisedRemote:FireServer(unpack(args))
		end
	end
end)

KCModSection:NewTextBox("Donut something", "Donuts a player / dummy!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text) or get_entity(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targethum = target.Humanoid

	local args = {
		[1] = "Donut",
		[2] = target
	}

	game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("King Crimson").KCLocalisedRemote:FireServer(unpack(args))
end)

KCModSection:NewToggle("Toggle INF Epitaph", "Toggles a no cooldown infinite Epitaph!", function(toggle)
	if toggle then
		local args = {
			[1] = "Epitaph",
		}

		game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("King Crimson").KCLocalisedRemote:FireServer(unpack(args))
	else
		local args = {
			[1] = "UnEpitaph",
		}

		game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("King Crimson").KCLocalisedRemote:FireServer(unpack(args))
	end
end)

local KarsModSection = StandModTab:NewSection("Kars")

KarsModSection:NewButton("Bleed everyone 10x", "Makes everyone bleeding 10x!", function()
	for i = 0, 10, 1 do
		for i, plr in pairs(game.Players:GetPlayers()) do
			if plr ~= player then
				local args = {
    				[1] = "Bleed",
					[2] = plr.Character
				}

				game:GetService("Players").LocalPlayer.Backpack.Kars.KARSLocalisedRemote:FireServer(unpack(args))
			end
		end
	end
end)

KarsModSection:NewTextBox("Bleed something 10x", "Makes bleeding a player / dummy 10x!", function(text)
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

		game:GetService("Players").LocalPlayer.Backpack.Kars.KARSLocalisedRemote:FireServer(unpack(args))
	end
end)

KarsModSection:NewButton("Pull everyone", "Brings / Pulls everyone to you!", function()
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

KarsModSection:NewTextBox("Pull / Bring something", "Pulls / Brings a dummy / player to you!", function(text)
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

KarsModSection:NewButton("Kars Shine Mode", "Uses Kars's Shine Mode!", function()
	game:GetService("ReplicatedStorage").SpecialMoves.KarsShineMode:FireServer()
end)

KarsModSection:NewButton("Heal yourself", "Heals yourself with a vampire heal! (Faster heal.)", function()
	for i = 0, 100, 1 do
		game:GetService("ReplicatedStorage").SpecialMoves.KarsHeal:FireServer()
	end
end)

KarsModSection:NewToggle("Auto heal if Low HP", "Automatically heals you to MAX HP when about to die!", function(toggle)
	local char = player.Character

	if toggle == true then
		repeat
			wait()
			KarsAutoHeal()
		until toggle == false or char.Humanoid.Health <= 0
	else
		char.Humanoid.Health = 0
	end
end)
