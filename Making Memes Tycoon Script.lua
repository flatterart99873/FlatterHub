--[[			VARIABLES			]]--

local player = game:GetService("Players").LocalPlayer
local char = player.Character
local ShowTPs = false
local ShowGuis = true


--[[			FUNCTIONS			]]--

local function firepp(object, amount, skip)
	if object.ClassName == "ProximityPrompt" then

		amount = amount or 1

		local PromptTime = object.HoldDuration

		if skip then
			PromptTime = 0
		end
		
		for i = 1, amount do
			object:InputHoldBegin()
			if not skip then
				wait(object.HoldDuration)
			end
			object:InputHoldEnd()
		end

		object.HoldDuration = PromptTime

	else
		error("Specified instance isn't a ProximityPrompt!")
	end
end

--[[			TYCOON OWNER FINDER			]]--

local TycoonOwner
local TycoonName
local TycoonTP
local plrname = game.Players.LocalPlayer.Name

for i, v in pairs(game.Workspace:WaitForChild("Tycoons"):GetChildren()) do
	local success, errormsg = pcall(function()
		TycoonOwner = v:FindFirstChild("TycoonOwner").Value
	end)

	if success and TycoonOwner == game.Players.LocalPlayer.Name then
		print("You are the owner of:", v.Name)
		TycoonOwner = v:FindFirstChild("TycoonOwner").Value
		TycoonName = v.Name
		print(TycoonOwner)
		print(TycoonName)
	elseif not success then
		warn("No owner of:", v.Name)
	end
end


--[[			CREATE GUIS / MAIN PART			]]--

local UploadMemes = Instance.new("ScreenGui", player.PlayerGui)
UploadMemes.Name = "Flatter Hub"

local IntroGui = Instance.new("TextLabel", UploadMemes)
IntroGui.AnchorPoint = Vector2.new(0.5, 0.5)
IntroGui.Position = UDim2.new(0.5, 0, 2, 0)
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

IntroGui:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true)
wait(1)

for i = 0, 360, 30 do
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

local InstantUploadButton = Instance.new("TextButton", UploadMemes)
InstantUploadButton.Position = UDim2.new(0.1, 0, 0.75, 0)
InstantUploadButton.Size = UDim2.new(0, 250, 0, 75)
InstantUploadButton.TextScaled = true
InstantUploadButton.Text = "Instant Upload all memes"
InstantUploadButton.BackgroundColor = BrickColor.Blue()
InstantUploadButton.TextColor3 = Color3.new(255, 255, 255)
InstantUploadButton.TextStrokeColor3 = Color3.new(0, 0, 0)
InstantUploadButton.TextStrokeTransparency = 0
InstantUploadButton.ZIndex = 10
InstantUploadButton.Name = "InstantUploadButton"

local CloseGuiLabel = Instance.new("TextLabel", InstantUploadButton)
CloseGuiLabel.Position = UDim2.new(0, 0, 1, 0)
CloseGuiLabel.Size = UDim2.new(0, 250, 0, 75)
CloseGuiLabel.TextScaled = true
CloseGuiLabel.Text = "Close Gui (K to delete | P to enable / disable)"
CloseGuiLabel.BackgroundTransparency = 1
CloseGuiLabel.TextColor3 = Color3.new(255, 255, 255)
CloseGuiLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
CloseGuiLabel.TextStrokeTransparency = 0
CloseGuiLabel.ZIndex = 10
CloseGuiLabel.Name = "CloseGui"

local CollectMemes = Instance.new("TextButton", InstantUploadButton)
CollectMemes.Position = UDim2.new(0, 0, -1, 0)
CollectMemes.Size = UDim2.new(0, 250, 0, 75)
CollectMemes.TextScaled = true
CollectMemes.Text = "Collect all memes"
CollectMemes.BackgroundColor = BrickColor.new("Bright green")
CollectMemes.TextColor3 = Color3.new(255, 255, 255)
CollectMemes.TextStrokeColor3 = Color3.new(0, 0, 0)
CollectMemes.TextStrokeTransparency = 0
CollectMemes.ZIndex = 10
CollectMemes.Name = "CollectMemes"

local BeltTP1Gui = Instance.new("TextButton", CollectMemes)
BeltTP1Gui.Position = UDim2.new(1, 0, -1, 0)
BeltTP1Gui.Size = UDim2.new(0, 250, 0, 50)
BeltTP1Gui.TextScaled = true
BeltTP1Gui.Text = "Collect TP 1"
BeltTP1Gui.BackgroundColor = BrickColor.Green()
BeltTP1Gui.TextColor3 = Color3.new(255, 255, 255)
BeltTP1Gui.TextStrokeColor3 = Color3.new(0, 0, 0)
BeltTP1Gui.TextStrokeTransparency = 0
BeltTP1Gui.ZIndex = 10
BeltTP1Gui.Visible = false
BeltTP1Gui.Name = "BeltTP1Gui"

local BeltTP2Gui = Instance.new("TextButton", BeltTP1Gui)
BeltTP2Gui.Position = UDim2.new(0, 0, 1, 0)
BeltTP2Gui.Size = UDim2.new(0, 250, 0, 50)
BeltTP2Gui.TextScaled = true
BeltTP2Gui.Text = "Collect TP 2"
BeltTP2Gui.BackgroundColor = BrickColor.Green()
BeltTP2Gui.TextColor3 = Color3.new(255, 255, 255)
BeltTP2Gui.TextStrokeColor3 = Color3.new(0, 0, 0)
BeltTP2Gui.TextStrokeTransparency = 0
BeltTP2Gui.ZIndex = 10
BeltTP2Gui.Visible = false
BeltTP2Gui.Name = "BeltTP2Gui"

local BeltTP3Gui = Instance.new("TextButton", BeltTP2Gui)
BeltTP3Gui.Position = UDim2.new(0, 0, 1, 0)
BeltTP3Gui.Size = UDim2.new(0, 250, 0, 50)
BeltTP3Gui.TextScaled = true
BeltTP3Gui.Text = "Collect TP 3"
BeltTP3Gui.BackgroundColor = BrickColor.Green()
BeltTP3Gui.TextColor3 = Color3.new(255, 255, 255)
BeltTP3Gui.TextStrokeColor3 = Color3.new(0, 0, 0)
BeltTP3Gui.TextStrokeTransparency = 0
BeltTP3Gui.ZIndex = 10
BeltTP3Gui.Visible = false
BeltTP3Gui.Name = "BeltTP3Gui"

local SelfDropTPGui = Instance.new("TextButton", BeltTP3Gui)
SelfDropTPGui.Position = UDim2.new(0, 0, 1, 0)
SelfDropTPGui.Size = UDim2.new(0, 250, 0, 50)
SelfDropTPGui.TextScaled = true
SelfDropTPGui.Text = "Collect SelfDrop TP"
SelfDropTPGui.BackgroundColor = BrickColor.Green()
SelfDropTPGui.TextColor3 = Color3.new(255, 255, 255)
SelfDropTPGui.TextStrokeColor3 = Color3.new(0, 0, 0)
SelfDropTPGui.TextStrokeTransparency = 0
SelfDropTPGui.ZIndex = 10
SelfDropTPGui.Visible = false
SelfDropTPGui.Name = "SelfDropTPGui"

local SmackAllFriends = Instance.new("TextButton", CollectMemes)
SmackAllFriends.Position = UDim2.new(0, 0, -1, 0)
SmackAllFriends.Size = UDim2.new(0, 250, 0, 75)
SmackAllFriends.TextScaled = true
SmackAllFriends.Text = "Smack All Friends"
SmackAllFriends.BackgroundColor = BrickColor.Yellow()
SmackAllFriends.TextColor3 = Color3.new(255, 255, 255)
SmackAllFriends.TextStrokeColor3 = Color3.new(0, 0, 0)
SmackAllFriends.TextStrokeTransparency = 0
SmackAllFriends.ZIndex = 10
SmackAllFriends.Name = "SmackAllFriends"

local TPHome = Instance.new("TextButton", SmackAllFriends)
TPHome.Position = UDim2.new(0, 0, -1, 0)
TPHome.Size = UDim2.new(0, 250, 0, 75)
TPHome.TextScaled = true
TPHome.Text = "TP Home"
TPHome.BackgroundColor = BrickColor.new("Sand red")
TPHome.TextColor3 = Color3.new(255, 255, 255)
TPHome.TextStrokeColor3 = Color3.new(0, 0, 0)
TPHome.TextStrokeTransparency = 0
TPHome.ZIndex = 10
TPHome.Name = "TPHome"


--[[			BUTTON EVENTS			]]--

InstantUploadButton.MouseButton1Up:Connect(function()
	game:GetService("ReplicatedStorage").Events.InstantUpload:FireServer()
end)

CollectMemes.MouseButton1Up:Connect(function()
	StaticItems = game.Workspace:WaitForChild("Tycoons"):FindFirstChild(TycoonName):WaitForChild("StaticItems")
	local success, errormsg = pcall(function()
		local SelfDropTP = StaticItems.SelfDrop.Collect.CollectPart.Position
		local Belt1TP = StaticItems.Belt1.Collect.CollectPart.Position
		local Belt2TP = StaticItems.Belt2.Collect.CollectPart.Position
		local Belt3TP = StaticItems.Belt3.Collect.CollectPart.Position
	end)

	if success then

		SelfDropTP = StaticItems.SelfDrop.Collect.CollectPart.Position
		SelfDropPP = StaticItems.SelfDrop.Collect.CollectPart:FindFirstChildOfClass("ProximityPrompt")

		Belt1TP = StaticItems.Belt1.Collect.CollectPart.Position
		Belt1PP = StaticItems.Belt1.Collect.CollectPart:FindFirstChildOfClass("ProximityPrompt")

		Belt2TP = StaticItems.Belt2.Collect.CollectPart.Position
		Belt2PP = StaticItems.Belt2.Collect.CollectPart:FindFirstChildOfClass("ProximityPrompt")

		Belt3TP = StaticItems.Belt3.Collect.CollectPart.Position
		Belt3PP = StaticItems.Belt3.Collect.CollectPart:FindFirstChildOfClass("ProximityPrompt")
	end
	
	if ShowTPs == false then
		ShowTPs = true
		BeltTP1Gui.Visible = true
		BeltTP2Gui.Visible = true
		BeltTP3Gui.Visible = true
		SelfDropTPGui.Visible = true
	elseif ShowTPs == true then
		ShowTPs = false
		BeltTP1Gui.Visible = false
		BeltTP2Gui.Visible = false
		BeltTP3Gui.Visible = false
		SelfDropTPGui.Visible = false
	end
end)

BeltTP1Gui.MouseButton1Up:Connect(function()
	char:MoveTo(Belt1TP)
	wait(0.1)
	firepp(Belt1PP, 1, true)
end)

BeltTP2Gui.MouseButton1Up:Connect(function()
	char:MoveTo(Belt2TP)
	wait(0.1)
	firepp(Belt2PP, 1, true)
end)

BeltTP3Gui.MouseButton1Up:Connect(function()
	char:MoveTo(Belt3TP)
	wait(0.1)
	firepp(Belt3PP, 1, true)
end)

SelfDropTPGui.MouseButton1Up:Connect(function()
	char:MoveTo(SelfDropTP)
	wait(0.1)
	firepp(SelfDropPP, 1, true)
end)

game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.P then
		for i, gui in pairs(UploadMemes:GetChildren()) do
			if ShowGuis == true then
				gui.Visible = false
				ShowGuis = false
			elseif ShowGuis == false then
				gui.Visible = true
				ShowGuis = true
			end
		end
	elseif input.KeyCode == Enum.KeyCode.K then
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("Flatter Hub"):Destroy()
	end
end)

--[[CloseGuiButton.MouseButton1Up:Connect(function()
	game.Players.LocalPlayer.PlayerGui["Flatter Hub"]:Destroy()
end)]]--

SmackAllFriends.MouseButton1Up:Connect(function()
	for i, Dropper in pairs(game.Workspace:WaitForChild("Tycoons"):FindFirstChild(TycoonName).Items:GetChildren()) do
		local DropperTP = Dropper:WaitForChild("Doodle").Position
		char:MoveTo(DropperTP)
		wait(0.1)
		local ProxPrompt = Dropper:WaitForChild("Noob").Torso:FindFirstChildOfClass("ProximityPrompt")
		firepp(ProxPrompt, 1, true)
		wait(0.1)
	end
end)

TPHome.MouseButton1Up:Connect(function()
	char:MoveTo(game.Workspace:WaitForChild("Tycoons"):WaitForChild(TycoonName):WaitForChild("TP").Position)
end)