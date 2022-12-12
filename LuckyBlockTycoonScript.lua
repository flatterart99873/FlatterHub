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
local Window = Library.CreateLib("Flee the Facility GUI", "GrapeTheme")

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


--[[			MAIN PART / CREATE GUIS			]]--

local InfoTab = Window:NewTab("Info (MUST READ!)")

local Section = InfoTab:NewSection("-- Script Owners --")
local Label = Section:NewLabel("Script Owner: flatterart99873")
local Label = Section:NewLabel("Gui Owner: KavoUI")

local DisclaimerSection = InfoTab:NewSection("-- Disclaimers --")

DisclaimerSection:NewLabel("Enter the players name, not nickname in textboxes!")

local RulesSection = InfoTab:NewSection("-- Rules --")

RulesSection:NewLabel("Please don't spam things to keep it working!")
RulesSection:NewLabel("Use this GUI wisely.")
RulesSection:NewLabel("Have fun!")


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

local AdminSection = PlayerTab:NewSection("Admin GUI")

AdminSection:NewButton("Infinite yield (Nearly admin script)", "Infinite yield", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)


local OthersTab = Window:NewTab("Others")

local OthersSection = OthersTab:NewSection("Others")

OthersSection:NewButton("Kill everyone", "Kills everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = plr.Character.Humanoid,
				[2] = plr.Character.Humanoid.MaxHealth
			}

			game.ReplicatedStorage.TakingDamage:FireServer(unpack(args))
		end
	end
end)

OthersSection:NewTextBox("Kill someone", "Kills someone!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targethum = target.Humanoid

	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = targethum,
				[2] = targethum.MaxHealth
			}

			game.ReplicatedStorage.TakingDamage:FireServer(unpack(args))
		end
	end
end)

OthersSection:NewButton("Heal everyone", "Heals everyone!", function()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = plr.Character.Humanoid,
				[2] = -(plr.Character.Humanoid.MaxHealth)
			}

			game.ReplicatedStorage.TakingDamage:FireServer(unpack(args))
		end
	end
end)

OthersSection:NewTextBox("Heal someone", "Heals someone!", function(text)
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position

	local subtext = get_player(text)
	local targetplrstring = tostring(subtext)

	local target = game.Workspace:FindFirstChild(targetplrstring)
	local targethum = target.Humanoid

	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr ~= player then
			local args = {
				[1] = targethum,
				[2] = -(targethum.MaxHealth)
			}

			game.ReplicatedStorage.TakingDamage:FireServer(unpack(args))
		end
	end
end)

OthersSection:NewTextBox("Heal yourself", "Heals you!", function(text)
	local char = player.Character

	local args = {
		[1] = char.Humanoid,
		[2] = -(char.Humanoid.MaxHealth)
	}

	game.ReplicatedStorage.TakingDamage:FireServer(unpack(args))
end)

OthersSection:NewToggle("Auto heal", "Always heals you to max hp!", function(toggle)
	while toggle do
		wait()

		local char = player.Character

		local args = {
			[1] = char.Humanoid,
			[2] = -(char.Humanoid.MaxHealth)
		}

		game.ReplicatedStorage.TakingDamage:FireServer(unpack(args))
	end
end)

OthersSection:NewButton("Collect all money drops", "Collects all of the money boxes!", function()
	local char = player.Character
	local charpos = char.HumanoidRootPart.Position
	
	for i, v in pairs(game.Workspace:WaitForChild("CrateParent"):GetChildren()) do
		char:MoveTo(v.Position)
		wait(0.2)
	end

	wait(0.2)

	char:MoveTo(charpos)
end)


local TycoonsTab = Window:NewTab("Tycoons")

local TycoonsSection = TycoonsTab:NewSection("Tycoons")

local YourTycoonLabel = TycoonsSection:NewLabel("Your tycoon: ")

game:GetService("RunService").Heartbeat:Connect(function()
	for i, v in pairs(game.Workspace:WaitForChild("Tycoons"):WaitForChild("Tycoons"):GetChildren()) do
		if v:FindFirstChild("Owner") then
			if v:FindFirstChild("Owner").Value == player.Name then
				YourTycoonLabel:UpdateLabel("Your tycoon: ".. v.Name)
				YourTycoonName = v.Name
				YourTycoon = v
			end
		end
	end
end)

TycoonsSection:NewButton("TP Home", "Teleports you to your tycoon!", function()
	local char = player.Character

	char:MoveTo(YourTycoon.Essentials.Giver.Position)
end)

TycoonsSection:NewToggle("Auto collect money", "Automatically collects all money!", function()
	while toggle do
		local char = player.Character
		firetouchinterest(YourTycoon.Essentials.Giver.TouchInterest, char:WaitForChild("HumanoidRootPart"), 1)
	end
end)
