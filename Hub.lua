local function notification(notificationText, time)
	local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	local notificationFrame = Instance.new("Frame", screenGui)
	local uiCorner1 = Instance.new("UICorner", notificationFrame)
	local notificationTextFrame = Instance.new("Frame", notificationFrame)
	local nothing = Instance.new("Frame", notificationTextFrame)
	local sliderFrame = Instance.new("Frame", notificationFrame)
	local uiCorner2 = Instance.new("UICorner", sliderFrame)
	local textLabel = Instance.new("TextLabel", notificationFrame)
	local NotificationTextLabelNothingMorePLS = Instance.new("TextLabel", notificationTextFrame)
	local NotificationTextLabelNothingMorePLSS = Instance.new("ImageButton", notificationTextFrame)
	local uiCorner3 = Instance.new("UICorner", notificationTextFrame)
	
	notificationFrame.BackgroundColor3 = Color3.new(255, 255, 255)
	notificationFrame.Size = UDim2.new(0.125, 0, 0.09, 0)
	notificationFrame.Position = UDim2.new(0.87115, 0, 0.9, 0)
	uiCorner1.CornerRadius = UDim.new(0.25, 0)
	
	sliderFrame.BackgroundColor3 = Color3.new(0.686275, 0.686275, 0.686275)
	sliderFrame.Size = UDim2.new(0.9, 0,0.05, 0)
	sliderFrame.Position = UDim2.new(0.05, 0, 0.85, 0)
	uiCorner2.CornerRadius = UDim.new(1, 0)
	
	textLabel.Text = tostring(notificationText)
	textLabel.TextScaled = true
	textLabel.TextColor3 = Color3.new(0.686275, 0.686275, 0.686275)
	textLabel.BackgroundTransparency = 1
	textLabel.Size = UDim2.new(0.9, 0, 0.55, 0)
	textLabel.Position = UDim2.new(0.05, 0, 0.25, 0)
	textLabel.Font = Enum.Font.FredokaOne
	
	notificationTextFrame.Size = UDim2.new(1, 0, 0.25, 0)
	notificationTextFrame.Position = UDim2.new(0,0,0,0)
	uiCorner3.CornerRadius = UDim.new(0.1, 0)
	
	nothing.Size = UDim2.new(1, 0, 0.25, 0)
	nothing.Position = UDim2.new(0,0,0.75,0)
	nothing.BorderSizePixel = 0
	
	NotificationTextLabelNothingMorePLS.ZIndex = 50
	NotificationTextLabelNothingMorePLS.Size = UDim2.new(0.975, 0, 0.75, 0)
	NotificationTextLabelNothingMorePLS.Position = UDim2.new(0.025, 0, 0.125, 0)
	NotificationTextLabelNothingMorePLS.BorderSizePixel = 0
	NotificationTextLabelNothingMorePLS.Text = "Notification"
	NotificationTextLabelNothingMorePLS.TextScaled = true
	NotificationTextLabelNothingMorePLS.TextColor3 = Color3.new(1, 1, 1)
	NotificationTextLabelNothingMorePLS.Font = Enum.Font.FredokaOne
	NotificationTextLabelNothingMorePLS.TextXAlignment = Enum.TextXAlignment.Left
	
	NotificationTextLabelNothingMorePLSS.ZIndex = 50
	NotificationTextLabelNothingMorePLSS.Size = UDim2.new(0.065, 0, 0.6, 0)
	NotificationTextLabelNothingMorePLSS.Position = UDim2.new(0.9175, 0, 0.2, 0)
	NotificationTextLabelNothingMorePLSS.BorderSizePixel = 0
	NotificationTextLabelNothingMorePLSS.Image = "rbxassetid://10200710743"
	NotificationTextLabelNothingMorePLSS.AutoButtonColor = false
	
	local tweenService = game.TweenService
	local infoTween = TweenInfo.new(tonumber(time), Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 1, false, 0)
	local tween = tweenService:Create(sliderFrame, infoTween, {Size = UDim2.new(0, 0, 0.05, 0)})
	tween:Play()
	
	NotificationTextLabelNothingMorePLSS.MouseButton1Click:Connect(function()
		tween:Destroy()
		screenGui:Destroy()
	end)
	
	wait(tonumber(time-0.35))
	screenGui:Destroy()
end
notification("Get key in official discord! (already coppied)", 5)
setclipboard("https://discord.gg/56Df2qKMt5")
local Material = loadstring(game:HttpGet("https://pastebin.com/raw/vtqFazmD"))()
local Menu = Material.Load({ Title = "sTempest Hub (KeySystem)", Style = 2, SizeX = 325, SizeY = 200, Theme = "Aqua", ColorOverrides = { MainFrame = Color3.fromRGB(235,235,235) }})
local MainTab = Menu.New({ Title = "Key" })
local mainKey = ""
MainTab.TextField({
	Text = "Put the Key",
	Callback = function(Value)
		mainKey = tostring(Value)
		if tostring(Value) == "r513uBZDZ5Oz9ijxoUuR" then 
			wait(0.5)
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Sumidasso/scripts/main/"..tostring(game.PlaceId)))()
			notification("Opening sTempest Hub! (Correct Key)", 5)
		end
	end,
	Menu = {
		["Get Key in discord"] = function(self)
			Menu.Banner({
				Text = "Coppied a discord link to Ctrl+V",
				setclipboard("https://discord.gg/56Df2qKMt5")
			})
		end
	}
})
MainTab.Button({
	Text = "Get Key",
	Callback = function(Value)
		setclipboard("https://discord.gg/56Df2qKMt5")
	end,
})
