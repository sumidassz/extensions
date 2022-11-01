game:GetService("StarterGui"):SetCore("SendNotification", { Title = "sTempest Executed!", Text = "Get key in official discord! (copied)", Icon = "rbxassetid://11425411459", Duration = 10 })
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
			loadstring(game:HttpGet("https://raw.githubusercontent.com/iSumidassz/dth/main/"..tostring(game.PlaceId)))()
			game:GetService("StarterGui"):SetCore("SendNotification", { Title = "sTempest Opened!", Text = "Correct Key!", Icon = "rbxassetid://11425411459", Duration = 10 })
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
