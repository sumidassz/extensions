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

local function loadAFS(premium)
	if premium == false then
		game.Players.LocalPlayer.PlayerGui.MainGui.SendMessage:Fire("sTempestHUB opening in 3 seconds!", true)
		local Library = loadstring(game:HttpGet('https://pastebin.com/raw/qYTfV8u7'))()
		
		local Window = Library:CreateWindow({
		    Title = 'sTempestHub | [UPDATE 37] Anime Fighters Simulator',
		    Center = true, 
		    AutoShow = true,
		})
		
		local Tabs = {
		    Main = Window:AddTab('Main'),
		    TDR = Window:AddTab('Auto Trial/Dungeon/Raid')
		}
		
		local autoFarmGroupBox = Tabs.Main:AddLeftGroupbox('Auto Farm')
		local miscGroupBox = Tabs.Main:AddLeftGroupbox('Misc')
		local autoEggGroupBox = Tabs.Main:AddRightGroupbox('Auto Eggs')
		local autoTrialGroupBox = Tabs.TDR:AddLeftGroupbox('Auto Dungeon')
		local autoRaidGroupBox = Tabs.TDR:AddRightGroupbox('Auto Raid')
		
		-- MAIN
		
		local mobArrayTable = {}
		local teamsListArray = {}
		local raidListArray = {}
		
		local function mobDropdown(dropdown)
			table.clear(mobArrayTable)
			for i, k in pairs(workspace.Worlds[tostring(game.Players.LocalPlayer.World.Value)].Enemies:GetChildren()) do
				if k:FindFirstChild("DisplayName") then
					if not table.find(mobArrayTable, k.DisplayName.Value) then
						table.insert(mobArrayTable, k.DisplayName.Value)
						dropdown:SetValues(mobArrayTable)
					end
				end
			end
		end
		local function teamsDropdown(dropdown)
			table.clear(teamsListArray)
			for _, v in pairs(game.Players.LocalPlayer.PlayerGui.MainGui.Pets.TeamsList.Main.Scroll:GetChildren()) do
				if v.Name == "TeamTemplate" and v:FindFirstChild("TeamName") then
					if not table.find(teamsListArray, v.TeamName.Name) then
						table.insert(teamsListArray, v.TeamName.Text)
						dropdown:SetValues(teamsListArray)
					end
				end
			end
		end
		local function raidDropdown(dropdown)
			table.clear(raidListArray)
			for _, v in pairs(workspace.Worlds:GetChildren()) do
				if v:FindFirstChild("RaidBeacon") then
					if not table.find(raidListArray, v.Name) then
						table.insert(raidListArray, v.Name)
						dropdown:SetValues(raidListArray)
					end
				end
			end
		end
		
		autoFarmGroupBox:AddToggle('AutoFarmToggle', {
		    Text = 'Auto Farm',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto farm',
		})
		
		autoFarmGroupBox:AddToggle('withTPToggle', {
		    Text = 'with TP',
		    Default = false,
		    Tooltip = 'Enable/Disabled tp in auto farm',
		})
		
		autoFarmGroupBox:AddDropdown('autoFarmDropdown', {
		
		    Values = mobArrayTable,
		    Default = 1, 
		    Multi = true,
		
		    Text = 'Choose the enemy',
		    Tooltip = 'You can choose multiples enemys',
		})
		
		autoFarmGroupBox:AddButton('Refresh the enemies', function()
		    mobDropdown(Options.autoFarmDropdown)
		end)
		
		autoFarmGroupBox:AddToggle('AttackEverythingToggle', {
		    Text = 'Attack Everything',
		    Default = false,
		    Tooltip = 'Enable/Disabled attack everything',
		})
		
		autoTrialGroupBox:AddToggle('AutoDungeonToggle', {
		    Text = 'Auto Dungeon',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto dungeon',
		})
		
		autoTrialGroupBox:AddToggle('IgnoreChestsToggle', {
		    Text = 'Ignore Chests',
		    Default = false,
		    Tooltip = 'Enable/Disabled ignore chests in auto dungeon!',
		})
		
		autoTrialGroupBox:AddDropdown('equipTeamDungeonDropdown', {
		
		    Values = teamsListArray,
		    Default = 1, 
		    Multi = false,
		
		    Text = 'Choose the team to "kill" chests',
		    Tooltip = 'Choose the team to kill the chests',
		})
		
		autoTrialGroupBox:AddButton('Refresh the teams', function()
		    teamsDropdown(Options.equipTeamDungeonDropdown)
		end)
		
		autoRaidGroupBox:AddToggle('AutoRaidToggle', {
		    Text = 'Auto Raid',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto raid!',
		})
		
		autoRaidGroupBox:AddDropdown('raidsToDoDropdown', {
		
		    Values = raidListArray,
		    Default = 1, 
		    Multi = true,
		
		    Text = 'Choose the worlds to do raid',
		    Tooltip = 'Choose the worlds to do raid',
		})
		local worldSaved = "DemonSlayer2"
		autoRaidGroupBox:AddButton('Save Position and World', function()
		    worldSaved = tostring(game.Players.LocalPlayer.World.Value)
		    print(tostring(worldSaved))
		end)
		
		raidDropdown(Options.raidsToDoDropdown)
		
		miscGroupBox:AddToggle('AutoQuestToggle', {
		    Text = 'Auto Quest',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto quest',
		})
		
		miscGroupBox:AddToggle('AutoClickToggle', {
		    Text = 'Auto Click',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto click',
		})
		
		miscGroupBox:AddToggle('AutoCollectToggle', {
		    Text = 'Auto Collect',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto collect',
		})
		
		autoEggGroupBox:AddToggle('autoEggOpenToggle', {
		    Text = 'Auto Egg',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto collect',
		})
		
		autoEggGroupBox:AddToggle('autoMaxOpenToggle', {
		    Text = 'Auto Max Open',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto collect',
		})
		
		mobDropdown(Options.autoFarmDropdown)
		teamsDropdown(Options.equipTeamDungeonDropdown)
		local function getNearestForFarm(world, array)
		    local dist, thing = math.huge
		    for i, v in next, workspace.Worlds[tostring(world)].Enemies:GetChildren() do
		        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Health") and tonumber(v.Health.Value) > 0 and v:FindFirstChild("DisplayName") and table.find(array, v.DisplayName.Value) then
		            local mag =
		                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function autoMobFunc(plr, array, tpb)
			if plr.Character:FindFirstChild("HumanoidRootPart") then
				for i, v in pairs(workspace.Worlds[tostring(plr.World.Value)].Enemies:GetChildren()) do
					if v:IsA("Model") and v:FindFirstChild("Health") and v.Health.Value > 0 and v:FindFirstChild("DisplayName") and table.find(array, v.DisplayName.Value) then
						for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
							if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
								game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForFarm(plr.World.Value, array), false);
							end
						end	
						if tpb == true and (plr.Character.HumanoidRootPart.Position-getNearestForFarm(plr.World.Value, array).HumanoidRootPart.Position).magnitude > 15 then plr.Character.HumanoidRootPart.CFrame = getNearestForFarm(plr.World.Value, array).HumanoidRootPart.CFrame end
					end
				end
			end
		end
		local function getNearestForQuest(world, mob)
		    local dist, thing = math.huge
		    for i, v in next, workspace.Worlds[tostring(world)].Enemies:GetChildren() do
		        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Health") and tonumber(v.Health.Value) > 0 and v.Name == mob then
		            local mag =
		                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function questFunc(plr)
			for i, v in pairs(workspace.Worlds[tostring(plr.World.Value)].Enemies:GetChildren()) do
				if v:FindFirstChild("DisplayName") and plr.PlayerGui.MainGui.Quest.Objectives:FindFirstChild("QuestText") then
					local a = string.match(string.sub(plr.PlayerGui.MainGui.Quest.Objectives.QuestText.Text, 2,3), "%d+")
					local b = string.match(string.sub(plr.PlayerGui.MainGui.Quest.Objectives.QuestText.Text, 4,6), "%d+")
					if tonumber(a) == tonumber(b) then
						game.ReplicatedStorage.Remote.FinishQuest:FireServer(workspace.Worlds[game.Players.LocalPlayer.World.Value][game.Players.LocalPlayer.World.Value])
						game.ReplicatedStorage.Remote.StartQuest:FireServer(workspace.Worlds[game.Players.LocalPlayer.World.Value][game.Players.LocalPlayer.World.Value])
						game.ReplicatedStorage.Remote.FinishQuestline:FireServer(workspace.Worlds[game.Players.LocalPlayer.World.Value][game.Players.LocalPlayer.World.Value])
					end
					if "["..tostring(a).."/"..tostring(b).."] "..tostring(v.DisplayName.Value) == tostring(game.Players.LocalPlayer.PlayerGui.MainGui.Quest.Objectives.QuestText.Text) then
						--if string.sub(plr.PlayerGui.MainGui.Quest.Objectives.QuestText.Text, 2,2) == string.sub(plr.PlayerGui.MainGui.Quest.Objectives.QuestText.Text, 4,4) then end
						if v:IsA("Model") and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForQuest(plr.World.Value, v.Name) then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForQuest(plr.World.Value, v.Name).HumanoidRootPart.CFrame
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
									game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForQuest(plr.World.Value, v.Name), false);
								end
							end	
							game:GetService("ReplicatedStorage").Remote.ClickerDamage:FireServer()
						end
					end
				end
			end
		end
		local function getNearestForAttackEverything(world)
		    local dist, thing = math.huge
		    for i, v in next, workspace.Worlds[tostring(world)].Enemies:GetChildren() do
		        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Health") and tonumber(v.Health.Value) > 0 and v:FindFirstChild("DisplayName") then
		            local mag =
		                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function attackEverythingFunc(plr, wantChest, tpb)
			if plr.Character:FindFirstChild("HumanoidRootPart") then
				for i, v in pairs(workspace.Worlds[tostring(plr.World.Value)].Enemies:GetChildren()) do
					if wantChest == false then
						if v:IsA("Model") and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForAttackEverything(plr.World.Value) then
							if tpb == true then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForAttackEverything(plr.World.Value).HumanoidRootPart.CFrame end
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:IsA("Model") and k:FindFirstChild("Data") then
									if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
										game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForAttackEverything(plr.World.Value), false);
									end
								end
							end	
						end
					elseif wantChest == true then
						if v:IsA("Model") and v.Name ~= "Chest" and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForAttackEverything(plr.World.Value) then
							if tpb == true then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForAttackEverything(plr.World.Value).HumanoidRootPart.CFrame end
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:IsA("Model") and k:FindFirstChild("Data") then
									if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
										game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForAttackEverything(plr.World.Value), false);
									end
								end
							end	
						end
					end
				end
			end
		end
		local function collectAllFunc()
			for i, v in pairs(workspace.Effects:GetChildren()) do
				if v:FindFirstChild("Base") then
					v.PrimaryPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				end
			end
		end
		local function getNearestForDungeon()
		    local dist, thing = math.huge
		    for i, v in next, workspace.Worlds.Dungeon.Enemies:GetChildren() do
		        if v:FindFirstChild("Health") and tonumber(v.Health.Value) > 0 and v:FindFirstChild("DisplayName") then
		            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:GetPivot().Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function autoEquipTeamFunc(equipName)
		    for _,v in pairs(game.Players.LocalPlayer.PlayerGui.MainGui.Pets.TeamsList.Main.Scroll:GetChildren()) do
		        if v:IsA("Frame") and v:FindFirstChild("TeamName") and v.TeamName.Text == tostring(equipName) then
		            for t,q in pairs(getconnections(v.Button.Activated)) do q.Function() end
		        end
		    end
		end
		local function getNearestForPPDungeon()
		    local dist, thing = math.huge
		    for i, v in pairs(game.Workspace.Worlds.Dungeon.Map:GetDescendants()) do
			if v:IsA("Part") and v:FindFirstChild("ProximityPrompt") then
		            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function autoDungeonFunc(plr, wantChest, equipName)
		    for i, l in pairs(game.Workspace.Worlds.Dungeon.Map:GetChildren()) do
		        for _, u in pairs(game.Workspace.Worlds.Dungeon.Map:GetChildren()) do
		            for p, v in pairs(l:GetChildren()) do
		                for n, k in pairs(u:GetChildren()) do
		                    if #workspace.Worlds.Dungeon.Enemies:GetChildren() == 0 then
		                        if v:FindFirstChild("ConfirmPart") and v.ConfirmPart:FindFirstChild("ProximityPrompt") and v.ConfirmPart == getNearestForPPDungeon() then
		                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.ConfirmPart.CFrame*CFrame.new(0,2,0)
		                            wait(0.05)
		                            fireproximityprompt(v.ConfirmPart.ProximityPrompt)
		                        end
		                    end
		                    if v:FindFirstChild("Door") and k:FindFirstChild("Door") and v.Door:IsA("Part") and k.Door:IsA("Part") then
		                        if v.Door:FindFirstChild("DungeonRoomDoorRemotePrompt") and k.Door:FindFirstChild("DungeonRoomDoorRemotePrompt") then
		                            if v.Door.Color == Color3.new(206, 46, 31) and game.Players.LocalPlayer.PlayerGui.MainGui.DungeonMinimap.Key.Image == "rbxassetid://10021319916" then
		                                return
		                            elseif v.Door.Color == Color3.new(206, 46, 31) and game.Players.LocalPlayer.PlayerGui.MainGui.DungeonMinimap.Key.Image ~= "rbxassetid://10021319916" and k.Door ~= v.Door then
		                                return
		                            elseif v.Door.Color == Color3.new(206, 46, 31) and game.Players.LocalPlayer.PlayerGui.MainGui.DungeonMinimap.Key.Image ~= "rbxassetid://10021319916" and k.Door == v.Door then
		                                    fireproximityprompt(v.Door.DungeonRoomDoorRemotePrompt)
		                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Door.CFrame*CFrame.new(0,2,0)
		                            elseif v.Door.Color ~= Color3.new(206, 46, 31) then
		                                    fireproximityprompt(v.Door.DungeonRoomDoorRemotePrompt)
		                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Door.CFrame*CFrame.new(0,2,0)
		                            end
		                        end
		                    end
		                end
		            end
		        end
		    end
		    if plr.Character:FindFirstChild("HumanoidRootPart") then
				for i, v in pairs(workspace.Worlds["Dungeon"].Enemies:GetChildren()) do
					if wantChest == false then
						if v:IsA("Model") and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForDungeon() then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForDungeon():GetPivot()
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
									game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForDungeon(), false);
								end
							end	
						end
		                if v:IsA("Model") and v.Name == "Chest" and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForDungeon() then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForDungeon():GetPivot()
		                    autoEquipTeamFunc(equipName)
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
									game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForDungeon(), false);
								end
							end	
						end
					elseif wantChest == true then
						if v:IsA("Model") and v.Name ~= "Chest" and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForDungeon() then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForDungeon():GetPivot()
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
									game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForDungeon(), false);
								end
							end	
						end
					end
				end
			end
		end
		local function getNearestForRaid(max)
		    local dist, thing = math.huge
		    for i, v in next, workspace.Worlds["Raid"].Enemies:GetChildren() do
		        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Health") and v:FindFirstChild("MaxHealth") and tonumber(v.Health.Value) > 0 and tonumber(v.MaxHealth.Value) ~= max then
		            local mag =
		                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function autoRaidFunc(array, world)
		    local bossMaxHealth = workspace.Worlds.Raid.RaidData.BossMaxHealth
		    local currentWorld = workspace.Worlds.Raid.RaidData.CurrentWorld
		    local timeLeft = workspace.Worlds.Raid.RaidData.TimeLeft
		    local forcefield = workspace.Worlds.Raid.RaidData.Forcefield
		    if timeLeft.Value > 0 and timeLeft.Value < 30 and table.find(array, currentWorld.Value) then
		        if game.Players.LocalPlayer.World.Value ~= "Raid" then
		            game.ReplicatedStorage.Bindable.AttemptTravel:Fire("Raid")
		            for b,y in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.MainGui.RaidTransport.Main.Yes.Activated)) do y.Function() end
		        end
		    end
		    for i, enemie in pairs(workspace.Worlds.Raid.Enemies:GetChildren()) do
		        if #workspace.Worlds.Raid.Enemies:GetChildren() >= 2 then
		            for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
		                if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
		            	    if enemie:FindFirstChild("MaxHealth") and bossMaxHealth.Value ~= enemie.MaxHealth.Value and workspace.Worlds.Raid.Enemies:FindFirstChild(tostring(getNearestForRaid(bossMaxHealth.Value))) then
		                        game.Players.LocalPlayer.Character:PivotTo(getNearestForRaid(bossMaxHealth.Value):GetPivot())
		                        game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForRaid(bossMaxHealth.Value), false);
		                    end
		                end
		            end
		        elseif #workspace.Worlds.Raid.Enemies:GetChildren() == 1 then
		            if enemie:FindFirstChild("MaxHealth") and bossMaxHealth.Value == enemie.MaxHealth.Value and workspace.Worlds.Raid.Enemies:FindFirstChild(tostring(getNearestForRaid(1))) then
		                game.Players.LocalPlayer.Character:PivotTo(getNearestForRaid(1):GetPivot())
		                for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
		                    if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
		                        game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForRaid(1), false);
		                    end
		                end	
		            end
		            if forcefield.Value == true then
		                game.ReplicatedStorage.Bindable.WithdrawPets:Fire(enemie);
		            end
		        end
		    end
		    if #workspace.Worlds.Raid.Enemies:GetChildren() < 1 then
		        if game.Players.LocalPlayer.PlayerGui.RaidGui.RaidResults.Visible == true then
		            game.ReplicatedStorage.Bindable.AttemptTravel:Fire(tostring(world))
		            wait(0.1)
		            for t,q in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.RaidGui.RaidResults.Confirm.Activated)) do q.Function() end
		        end
		    end
		end
		local function getEgg(world)
			if world == "DemonSlayer" then return "DemonEgg" end
			if world == "BlackClover" then return "BCEgg" end
			if world == "TokyoGhoul" then return "GhoulEgg" end
			if world == "DBZ" then return "GokuEgg" end
			if world == "Tower" or world == "Titan" or world == "TimeChamber" or world == "MLP" or world == "Raid" then return nil end
			return tostring(world).."Egg"
		end
		local function getManyEggs()
		    for i, v in pairs(game.Players.LocalPlayer.PlayerGui.MainGui.Multipliers.List:GetChildren()) do
		        if v.Name == "MultTemplate" and v:FindFirstChild("Value") and v:FindFirstChild("Title") and v.Title.Text == "Opens:" then
		            return v.Value.Text
		        end
		    end
		end
		local function autoEggFunc() if getEgg(game.Players.LocalPlayer.World.Value) ~= nil then game.ReplicatedStorage.Remote.OpenEgg:InvokeServer(workspace.Worlds:FindFirstChild(tostring(game.Players.LocalPlayer.World.Value))[getEgg(game.Players.LocalPlayer.World.Value)], tonumber(getManyEggs())) end end
		local function autoMaxOpenFunc() game.ReplicatedStorage.Remote.AttemptMultiOpen:FireServer(getEgg(game.Players.LocalPlayer.World.Value)) end
		
		local mobsArraySelected = {}
		table.clear(mobsArraySelected)
		Options.autoFarmDropdown:OnChanged(function()
			table.clear(mobsArraySelected)
		    for key, value in next, Options.autoFarmDropdown.Value do
		        if not table.find(mobsArraySelected, key) then
		        	table.insert(mobsArraySelected, key)
		        end
		    end
		end)
		
		local rworldArraySelected = {}
		table.clear(rworldArraySelected)
		Options.raidsToDoDropdown:OnChanged(function()
		    table.clear(rworldArraySelected)
		    for key, value in next, Options.raidsToDoDropdown.Value do
		        if not table.find(rworldArraySelected, key) then
		        	table.insert(rworldArraySelected, key)
		        end
		    end
		end)
		
		local c1 = coroutine.create(function() while true do if Toggles.AutoFarmToggle.Value == true then autoMobFunc(game.Players.LocalPlayer, mobsArraySelected, Toggles.withTPToggle.Value) end wait() end end) coroutine.resume(c1)
		local c2 = coroutine.create(function() while true do if Toggles.AutoClickToggle.Value == true then game:GetService("ReplicatedStorage").Remote.ClickerDamage:FireServer() end wait() end end) coroutine.resume(c2)
		local c3 = coroutine.create(function() while true do if Toggles.AutoCollectToggle.Value == true then collectAllFunc() end wait(0.1) end end) coroutine.resume(c3)
		local c4 = coroutine.create(function() while true do if Toggles.autoEggOpenToggle.Value == true then autoEggFunc() end wait(0.1) end end) coroutine.resume(c4)
		local c5 = coroutine.create(function() while true do if Toggles.autoMaxOpenToggle.Value == true then autoMaxOpenFunc() end wait(0.1) end end) coroutine.resume(c5)
		local c6 = coroutine.create(function() while true do if Toggles.AttackEverythingToggle.Value == true then attackEverythingFunc(game.Players.LocalPlayer, Toggles.IgnoreChestsToggle.Value, Toggles.withTPToggle.Value) end wait() end end) coroutine.resume(c6)
		local c7 = coroutine.create(function() while true do if Toggles.AutoQuestToggle.Value == true then questFunc(game.Players.LocalPlayer) end wait() end end) coroutine.resume(c7)
		local c8 = coroutine.create(function() while true do if Toggles.AutoDungeonToggle.Value == true then autoDungeonFunc(game.Players.LocalPlayer, Toggles.IgnoreChestsToggle.Value, Options.equipTeamDungeonDropdown.Value) end wait() end end) coroutine.resume(c8)
		local c9 = coroutine.create(function() while true do if Toggles.AutoRaidToggle.Value == true then autoRaidFunc(rworldArraySelected, worldSaved) end wait() end end) coroutine.resume(c9)
	end
	if premium == true then 
		game.Players.LocalPlayer.PlayerGui.MainGui.SendMessage:Fire("sTempestHUB opening in 3 seconds!", true)
		local Library = loadstring(game:HttpGet('https://pastebin.com/raw/qYTfV8u7'))()
		
		local Window = Library:CreateWindow({
		    Title = 'sTempestHub | [UPDATE 37] Anime Fighters Simulator',
		    Center = true, 
		    AutoShow = true,
		})
		
		local Tabs = {
		    Main = Window:AddTab('Main'),
		    TDR = Window:AddTab('Auto Trial/Dungeon/Raid'),
		    PremiumTab = Window:AddTab('Premium')
		}
		
		local autoFarmGroupBox = Tabs.Main:AddLeftGroupbox('Auto Farm')
		local miscGroupBox = Tabs.Main:AddLeftGroupbox('Misc')
		local autoEggGroupBox = Tabs.Main:AddRightGroupbox('Auto Eggs')
		local autoTrialGroupBox = Tabs.TDR:AddLeftGroupbox('Auto Dungeon')
		local autoRaidGroupBox = Tabs.TDR:AddRightGroupbox('Auto Raid')
		local premiumGroupBox = Tabs.PremiumTab:AddLeftGroupbox('Premium')
		
		-- MAIN
		
		local mobArrayTable = {}
		local teamsListArray = {}
		local raidListArray = {}
		
		local function mobDropdown(dropdown)
			table.clear(mobArrayTable)
			for i, k in pairs(workspace.Worlds[tostring(game.Players.LocalPlayer.World.Value)].Enemies:GetChildren()) do
				if k:FindFirstChild("DisplayName") then
					if not table.find(mobArrayTable, k.DisplayName.Value) then
						table.insert(mobArrayTable, k.DisplayName.Value)
						dropdown:SetValues(mobArrayTable)
					end
				end
			end
		end
		local function teamsDropdown(dropdown)
			table.clear(teamsListArray)
			for _, v in pairs(game.Players.LocalPlayer.PlayerGui.MainGui.Pets.TeamsList.Main.Scroll:GetChildren()) do
				if v.Name == "TeamTemplate" and v:FindFirstChild("TeamName") then
					if not table.find(teamsListArray, v.TeamName.Name) then
						table.insert(teamsListArray, v.TeamName.Text)
						dropdown:SetValues(teamsListArray)
					end
				end
			end
		end
		local function raidDropdown(dropdown)
			table.clear(raidListArray)
			for _, v in pairs(workspace.Worlds:GetChildren()) do
				if v:FindFirstChild("RaidBeacon") then
					if not table.find(raidListArray, v.Name) then
						table.insert(raidListArray, v.Name)
						dropdown:SetValues(raidListArray)
					end
				end
			end
		end
		
		autoFarmGroupBox:AddToggle('AutoFarmToggle', {
		    Text = 'Auto Farm',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto farm',
		})
		
		autoFarmGroupBox:AddToggle('withTPToggle', {
		    Text = 'with TP',
		    Default = false,
		    Tooltip = 'Enable/Disabled tp in auto farm',
		})
		
		autoFarmGroupBox:AddDropdown('autoFarmDropdown', {
		
		    Values = mobArrayTable,
		    Default = 1, 
		    Multi = true,
		
		    Text = 'Choose the enemy',
		    Tooltip = 'You can choose multiples enemys',
		})
		
		autoFarmGroupBox:AddButton('Refresh the enemies', function()
		    mobDropdown(Options.autoFarmDropdown)
		end)
		
		autoFarmGroupBox:AddToggle('AttackEverythingToggle', {
		    Text = 'Attack Everything',
		    Default = false,
		    Tooltip = 'Enable/Disabled attack everything',
		})
		
		autoTrialGroupBox:AddToggle('AutoDungeonToggle', {
		    Text = 'Auto Dungeon',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto dungeon',
		})
		
		autoTrialGroupBox:AddToggle('IgnoreChestsToggle', {
		    Text = 'Ignore Chests',
		    Default = false,
		    Tooltip = 'Enable/Disabled ignore chests in auto dungeon!',
		})
		
		autoTrialGroupBox:AddDropdown('equipTeamDungeonDropdown', {
		
		    Values = teamsListArray,
		    Default = 1, 
		    Multi = false,
		
		    Text = 'Choose the team to "kill" chests',
		    Tooltip = 'Choose the team to kill the chests',
		})
		
		autoTrialGroupBox:AddButton('Refresh the teams', function()
		    teamsDropdown(Options.equipTeamDungeonDropdown)
		end)
		
		autoRaidGroupBox:AddToggle('AutoRaidToggle', {
		    Text = 'Auto Raid',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto raid!',
		})
		
		autoRaidGroupBox:AddDropdown('raidsToDoDropdown', {
		
		    Values = raidListArray,
		    Default = 1, 
		    Multi = true,
		
		    Text = 'Choose the worlds to do raid',
		    Tooltip = 'Choose the worlds to do raid',
		})
		local worldSaved = "DemonSlayer2"
		autoRaidGroupBox:AddButton('Save Position and World', function()
		    worldSaved = tostring(game.Players.LocalPlayer.World.Value)
		    print(tostring(worldSaved))
		end)
		
		raidDropdown(Options.raidsToDoDropdown)
		
		miscGroupBox:AddToggle('AutoQuestToggle', {
		    Text = 'Auto Quest',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto quest',
		})
		
		miscGroupBox:AddToggle('AutoClickToggle', {
		    Text = 'Auto Click',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto click',
		})
		
		miscGroupBox:AddToggle('AutoCollectToggle', {
		    Text = 'Auto Collect',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto collect',
		})
		
		autoEggGroupBox:AddToggle('autoEggOpenToggle', {
		    Text = 'Auto Egg',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto collect',
		})
		
		autoEggGroupBox:AddToggle('autoMaxOpenToggle', {
		    Text = 'Auto Max Open',
		    Default = false,
		    Tooltip = 'Enable/Disabled auto collect',
		})
		
		local function getUID()
		    for i, v in pairs(workspace.Pets:GetChildren()) do
		        if v:FindFirstChild("Data") and v.Data:FindFirstChild("Owner") and v.Data:FindFirstChild("UID") and v.Data.Owner.Value == game.Players.LocalPlayer then
		            return tostring(v.Data.UID.Value)
		        end
		    end
		end
		local function putInIncubator()
		    local uid = getUID()
		    game.ReplicatedStorage.Bindable.AttemptTravel:Fire("DemonSlayer")
		    wait(2)
		    game.ReplicatedStorage.Remote.AttemptIncubate:FireServer(tonumber(uid), "A")
		    wait(5)
		    game.ReplicatedStorage.Bindable.AttemptTravel:Fire("OPM")
		    wait(2)
		    game.ReplicatedStorage.Remote.AttemptIncubate:FireServer(tonumber(uid), "B")
		    wait(5)
		    game.ReplicatedStorage.Bindable.AttemptTravel:Fire("FireForce")
		    wait(2)
		    game.ReplicatedStorage.Remote.AttemptIncubate:FireServer(tonumber(uid), "C")
		    wait(4)
		    game.ReplicatedStorage.Bindable.AttemptTravel:Fire("Boruto")
		    wait(3)
		    game.ReplicatedStorage.Remote.AttemptIncubate:FireServer(tonumber(uid), "D")
		    wait(5)
		    game.ReplicatedStorage.Bindable.AttemptTravel:Fire("HellsParadise")
		    wait(2)
		    game.ReplicatedStorage.Remote.AttemptIncubate:FireServer(tonumber(uid), "E")
		    wait(1)
		    game.ReplicatedStorage.Bindable.AttemptTravel:Fire("TimeChamber")
		end
		
		premiumGroupBox:AddButton('Only Equip 1 Fighter ⤵️', function()
		
		end)
		
		local premiumIncubator = premiumGroupBox:AddButton('Put the fighter in 5 incubator', function()
		    putInIncubator()
		end)
		
		premiumIncubator:AddTooltip('Only equip 1 fighter to do this')
		
		premiumGroupBox:AddButton('Data Rollback!', function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/diepedyt/bui/main/2.lua'))()
		end)
		
		mobDropdown(Options.autoFarmDropdown)
		teamsDropdown(Options.equipTeamDungeonDropdown)
		local function getNearestForFarm(world, array)
		    local dist, thing = math.huge
		    for i, v in next, workspace.Worlds[tostring(world)].Enemies:GetChildren() do
		        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Health") and tonumber(v.Health.Value) > 0 and v:FindFirstChild("DisplayName") and table.find(array, v.DisplayName.Value) then
		            local mag =
		                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function autoMobFunc(plr, array, tpb)
			if plr.Character:FindFirstChild("HumanoidRootPart") then
				for i, v in pairs(workspace.Worlds[tostring(plr.World.Value)].Enemies:GetChildren()) do
					if v:IsA("Model") and v:FindFirstChild("Health") and v.Health.Value > 0 and v:FindFirstChild("DisplayName") and table.find(array, v.DisplayName.Value) then
						for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
							if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
								game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForFarm(plr.World.Value, array), false);
							end
						end	
						if tpb == true and (plr.Character.HumanoidRootPart.Position-getNearestForFarm(plr.World.Value, array).HumanoidRootPart.Position).magnitude > 15 then plr.Character.HumanoidRootPart.CFrame = getNearestForFarm(plr.World.Value, array).HumanoidRootPart.CFrame end
					end
				end
			end
		end
		local function getNearestForQuest(world, mob)
		    local dist, thing = math.huge
		    for i, v in next, workspace.Worlds[tostring(world)].Enemies:GetChildren() do
		        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Health") and tonumber(v.Health.Value) > 0 and v.Name == mob then
		            local mag =
		                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function questFunc(plr)
			for i, v in pairs(workspace.Worlds[tostring(plr.World.Value)].Enemies:GetChildren()) do
				if v:FindFirstChild("DisplayName") and plr.PlayerGui.MainGui.Quest.Objectives:FindFirstChild("QuestText") then
					local a = string.match(string.sub(plr.PlayerGui.MainGui.Quest.Objectives.QuestText.Text, 2,3), "%d+")
					local b = string.match(string.sub(plr.PlayerGui.MainGui.Quest.Objectives.QuestText.Text, 4,6), "%d+")
					if tonumber(a) == tonumber(b) then
						game.ReplicatedStorage.Remote.FinishQuest:FireServer(workspace.Worlds[game.Players.LocalPlayer.World.Value][game.Players.LocalPlayer.World.Value])
						game.ReplicatedStorage.Remote.StartQuest:FireServer(workspace.Worlds[game.Players.LocalPlayer.World.Value][game.Players.LocalPlayer.World.Value])
						game.ReplicatedStorage.Remote.FinishQuestline:FireServer(workspace.Worlds[game.Players.LocalPlayer.World.Value][game.Players.LocalPlayer.World.Value])
					end
					if "["..tostring(a).."/"..tostring(b).."] "..tostring(v.DisplayName.Value) == tostring(game.Players.LocalPlayer.PlayerGui.MainGui.Quest.Objectives.QuestText.Text) then
						--if string.sub(plr.PlayerGui.MainGui.Quest.Objectives.QuestText.Text, 2,2) == string.sub(plr.PlayerGui.MainGui.Quest.Objectives.QuestText.Text, 4,4) then end
						if v:IsA("Model") and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForQuest(plr.World.Value, v.Name) then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForQuest(plr.World.Value, v.Name).HumanoidRootPart.CFrame
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
									game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForQuest(plr.World.Value, v.Name), false);
								end
							end	
							game:GetService("ReplicatedStorage").Remote.ClickerDamage:FireServer()
						end
					end
				end
			end
		end
		local function getNearestForAttackEverything(world)
		    local dist, thing = math.huge
		    for i, v in next, workspace.Worlds[tostring(world)].Enemies:GetChildren() do
		        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Health") and tonumber(v.Health.Value) > 0 and v:FindFirstChild("DisplayName") then
		            local mag =
		                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function attackEverythingFunc(plr, wantChest, tpb)
			if plr.Character:FindFirstChild("HumanoidRootPart") then
				for i, v in pairs(workspace.Worlds[tostring(plr.World.Value)].Enemies:GetChildren()) do
					if wantChest == false then
						if v:IsA("Model") and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForAttackEverything(plr.World.Value) then
							if tpb == true then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForAttackEverything(plr.World.Value).HumanoidRootPart.CFrame end
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:IsA("Model") and k:FindFirstChild("Data") then
									if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
										game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForAttackEverything(plr.World.Value), false);
									end
								end
							end	
						end
					elseif wantChest == true then
						if v:IsA("Model") and v.Name ~= "Chest" and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForAttackEverything(plr.World.Value) then
							if tpb == true then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForAttackEverything(plr.World.Value).HumanoidRootPart.CFrame end
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:IsA("Model") and k:FindFirstChild("Data") then
									if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
										game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForAttackEverything(plr.World.Value), false);
									end
								end
							end	
						end
					end
				end
			end
		end
		local function collectAllFunc()
			for i, v in pairs(workspace.Effects:GetChildren()) do
				if v:FindFirstChild("Base") then
					v.PrimaryPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
				end
			end
		end
		local function getNearestForDungeon()
		    local dist, thing = math.huge
		    for i, v in next, workspace.Worlds.Dungeon.Enemies:GetChildren() do
		        if v:FindFirstChild("Health") and tonumber(v.Health.Value) > 0 and v:FindFirstChild("DisplayName") then
		            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:GetPivot().Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function autoEquipTeamFunc(equipName)
		    for _,v in pairs(game.Players.LocalPlayer.PlayerGui.MainGui.Pets.TeamsList.Main.Scroll:GetChildren()) do
		        if v:IsA("Frame") and v:FindFirstChild("TeamName") and v.TeamName.Text == tostring(equipName) then
		            for t,q in pairs(getconnections(v.Button.Activated)) do q.Function() end
		        end
		    end
		end
		local function getNearestForPPDungeon()
		    local dist, thing = math.huge
		    for i, v in pairs(game.Workspace.Worlds.Dungeon.Map:GetDescendants()) do
			if v:IsA("Part") and v:FindFirstChild("ProximityPrompt") then
		            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function autoDungeonFunc(plr, wantChest, equipName)
		    for i, l in pairs(game.Workspace.Worlds.Dungeon.Map:GetChildren()) do
		        for _, u in pairs(game.Workspace.Worlds.Dungeon.Map:GetChildren()) do
		            for p, v in pairs(l:GetChildren()) do
		                for n, k in pairs(u:GetChildren()) do
		                    if #workspace.Worlds.Dungeon.Enemies:GetChildren() == 0 then
		                        if v:FindFirstChild("ConfirmPart") and v.ConfirmPart:FindFirstChild("ProximityPrompt") and v.ConfirmPart == getNearestForPPDungeon() then
		                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.ConfirmPart.CFrame*CFrame.new(0,2,0)
		                            wait(0.05)
		                            fireproximityprompt(v.ConfirmPart.ProximityPrompt)
		                        end
		                    end
		                    if v:FindFirstChild("Door") and k:FindFirstChild("Door") and v.Door:IsA("Part") and k.Door:IsA("Part") then
		                        if v.Door:FindFirstChild("DungeonRoomDoorRemotePrompt") and k.Door:FindFirstChild("DungeonRoomDoorRemotePrompt") then
		                            if v.Door.Color == Color3.new(206, 46, 31) and game.Players.LocalPlayer.PlayerGui.MainGui.DungeonMinimap.Key.Image == "rbxassetid://10021319916" then
		                                return
		                            elseif v.Door.Color == Color3.new(206, 46, 31) and game.Players.LocalPlayer.PlayerGui.MainGui.DungeonMinimap.Key.Image ~= "rbxassetid://10021319916" and k.Door ~= v.Door then
		                                return
		                            elseif v.Door.Color == Color3.new(206, 46, 31) and game.Players.LocalPlayer.PlayerGui.MainGui.DungeonMinimap.Key.Image ~= "rbxassetid://10021319916" and k.Door == v.Door then
		                                    fireproximityprompt(v.Door.DungeonRoomDoorRemotePrompt)
		                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Door.CFrame*CFrame.new(0,2,0)
		                            elseif v.Door.Color ~= Color3.new(206, 46, 31) then
		                                    fireproximityprompt(v.Door.DungeonRoomDoorRemotePrompt)
		                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Door.CFrame*CFrame.new(0,2,0)
		                            end
		                        end
		                    end
		                end
		            end
		        end
		    end
		    if plr.Character:FindFirstChild("HumanoidRootPart") then
				for i, v in pairs(workspace.Worlds["Dungeon"].Enemies:GetChildren()) do
					if wantChest == false then
						if v:IsA("Model") and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForDungeon() then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForDungeon():GetPivot()
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
									game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForDungeon(), false);
								end
							end	
						end
		                if v:IsA("Model") and v.Name == "Chest" and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForDungeon() then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForDungeon():GetPivot()
		                    autoEquipTeamFunc(equipName)
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
									game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForDungeon(), false);
								end
							end	
						end
					elseif wantChest == true then
						if v:IsA("Model") and v.Name ~= "Chest" and v:FindFirstChild("Health") and v.Health.Value > 0 and v == getNearestForDungeon() then
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestForDungeon():GetPivot()
							for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
								if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data:FindFirstChild("Attacking") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
									game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForDungeon(), false);
								end
							end	
						end
					end
				end
			end
		end
		local function getNearestForRaid(max)
		    local dist, thing = math.huge
		    for i, v in next, workspace.Worlds["Raid"].Enemies:GetChildren() do
		        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Health") and v:FindFirstChild("MaxHealth") and tonumber(v.Health.Value) > 0 and tonumber(v.MaxHealth.Value) ~= max then
		            local mag =
		                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
		            if mag < dist then
		                dist = mag
		                thing = v
		            end
		        end
		    end
		    return thing
		end
		local function autoRaidFunc(array, world)
		    local bossMaxHealth = workspace.Worlds.Raid.RaidData.BossMaxHealth
		    local currentWorld = workspace.Worlds.Raid.RaidData.CurrentWorld
		    local timeLeft = workspace.Worlds.Raid.RaidData.TimeLeft
		    local forcefield = workspace.Worlds.Raid.RaidData.Forcefield
		    if timeLeft.Value > 0 and timeLeft.Value < 30 and table.find(array, currentWorld.Value) then
		        if game.Players.LocalPlayer.World.Value ~= "Raid" then
		            game.ReplicatedStorage.Bindable.AttemptTravel:Fire("Raid")
		            for b,y in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.MainGui.RaidTransport.Main.Yes.Activated)) do y.Function() end
		        end
		    end
		    for i, enemie in pairs(workspace.Worlds.Raid.Enemies:GetChildren()) do
		        if #workspace.Worlds.Raid.Enemies:GetChildren() >= 2 then
		            for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
		                if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
		            	    if enemie:FindFirstChild("MaxHealth") and bossMaxHealth.Value ~= enemie.MaxHealth.Value and workspace.Worlds.Raid.Enemies:FindFirstChild(tostring(getNearestForRaid(bossMaxHealth.Value))) then
		                        game.Players.LocalPlayer.Character:PivotTo(getNearestForRaid(bossMaxHealth.Value):GetPivot())
		                        game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForRaid(bossMaxHealth.Value), false);
		                    end
		                end
		            end
		        elseif #workspace.Worlds.Raid.Enemies:GetChildren() == 1 then
		            if enemie:FindFirstChild("MaxHealth") and bossMaxHealth.Value == enemie.MaxHealth.Value and workspace.Worlds.Raid.Enemies:FindFirstChild(tostring(getNearestForRaid(1))) then
		                game.Players.LocalPlayer.Character:PivotTo(getNearestForRaid(1):GetPivot())
		                for _,k in pairs(game:GetService("Workspace").Pets:GetChildren()) do
		                    if k:FindFirstChild("Data") and k.Data:FindFirstChild("Owner") and k.Data.Owner.Value == game.Players.LocalPlayer and not k.Data.Attacking.Value then
		                        game.ReplicatedStorage.Bindable.SendPet:Fire(getNearestForRaid(1), false);
		                    end
		                end	
		            end
		            if forcefield.Value == true then
		                game.ReplicatedStorage.Bindable.WithdrawPets:Fire(enemie);
		            end
		        end
		    end
		    if #workspace.Worlds.Raid.Enemies:GetChildren() < 1 then
		        if game.Players.LocalPlayer.PlayerGui.RaidGui.RaidResults.Visible == true then
		            game.ReplicatedStorage.Bindable.AttemptTravel:Fire(tostring(world))
		            wait(0.1)
		            for t,q in pairs(getconnections(game.Players.LocalPlayer.PlayerGui.RaidGui.RaidResults.Confirm.Activated)) do q.Function() end
		        end
		    end
		end
		local function getEgg(world)
			if world == "DemonSlayer" then return "DemonEgg" end
			if world == "BlackClover" then return "BCEgg" end
			if world == "TokyoGhoul" then return "GhoulEgg" end
			if world == "DBZ" then return "GokuEgg" end
			if world == "Tower" or world == "Titan" or world == "TimeChamber" or world == "MLP" or world == "Raid" then return nil end
			return tostring(world).."Egg"
		end
		local function getManyEggs()
		    for i, v in pairs(game.Players.LocalPlayer.PlayerGui.MainGui.Multipliers.List:GetChildren()) do
		        if v.Name == "MultTemplate" and v:FindFirstChild("Value") and v:FindFirstChild("Title") and v.Title.Text == "Opens:" then
		            return v.Value.Text
		        end
		    end
		end
		local function autoEggFunc() if getEgg(game.Players.LocalPlayer.World.Value) ~= nil then game.ReplicatedStorage.Remote.OpenEgg:InvokeServer(workspace.Worlds:FindFirstChild(tostring(game.Players.LocalPlayer.World.Value))[getEgg(game.Players.LocalPlayer.World.Value)], tonumber(getManyEggs())) end end
		local function autoMaxOpenFunc() game.ReplicatedStorage.Remote.AttemptMultiOpen:FireServer(getEgg(game.Players.LocalPlayer.World.Value)) end
		
		local mobsArraySelected = {}
		table.clear(mobsArraySelected)
		Options.autoFarmDropdown:OnChanged(function()
			table.clear(mobsArraySelected)
		    for key, value in next, Options.autoFarmDropdown.Value do
		        if not table.find(mobsArraySelected, key) then
		        	table.insert(mobsArraySelected, key)
		        end
		    end
		end)
		
		local rworldArraySelected = {}
		table.clear(rworldArraySelected)
		Options.raidsToDoDropdown:OnChanged(function()
		    table.clear(rworldArraySelected)
		    for key, value in next, Options.raidsToDoDropdown.Value do
		        if not table.find(rworldArraySelected, key) then
		        	table.insert(rworldArraySelected, key)
		        end
		    end
		end)
		
		local c1 = coroutine.create(function() while true do if Toggles.AutoFarmToggle.Value == true then autoMobFunc(game.Players.LocalPlayer, mobsArraySelected, Toggles.withTPToggle.Value) end wait() end end) coroutine.resume(c1)
		local c2 = coroutine.create(function() while true do if Toggles.AutoClickToggle.Value == true then game:GetService("ReplicatedStorage").Remote.ClickerDamage:FireServer() end wait() end end) coroutine.resume(c2)
		local c3 = coroutine.create(function() while true do if Toggles.AutoCollectToggle.Value == true then collectAllFunc() end wait(0.1) end end) coroutine.resume(c3)
		local c4 = coroutine.create(function() while true do if Toggles.autoEggOpenToggle.Value == true then autoEggFunc() end wait(0.1) end end) coroutine.resume(c4)
		local c5 = coroutine.create(function() while true do if Toggles.autoMaxOpenToggle.Value == true then autoMaxOpenFunc() end wait(0.1) end end) coroutine.resume(c5)
		local c6 = coroutine.create(function() while true do if Toggles.AttackEverythingToggle.Value == true then attackEverythingFunc(game.Players.LocalPlayer, Toggles.IgnoreChestsToggle.Value, Toggles.withTPToggle.Value) end wait() end end) coroutine.resume(c6)
		local c7 = coroutine.create(function() while true do if Toggles.AutoQuestToggle.Value == true then questFunc(game.Players.LocalPlayer) end wait() end end) coroutine.resume(c7)
		local c8 = coroutine.create(function() while true do if Toggles.AutoDungeonToggle.Value == true then autoDungeonFunc(game.Players.LocalPlayer, Toggles.IgnoreChestsToggle.Value, Options.equipTeamDungeonDropdown.Value) end wait() end end) coroutine.resume(c8)
		local c9 = coroutine.create(function() while true do if Toggles.AutoRaidToggle.Value == true then autoRaidFunc(rworldArraySelected, worldSaved) end wait() end end) coroutine.resume(c9)
	end
end
local premiumKeys = {3307563813}
local function getPlace()
	if game.PlaceId == 6299805723 and not table.find(premiumKeys, game.Players.LocalPlayer.UserId) then loadAFS(false) end
	if game.PlaceId == 6299805723 and table.find(premiumKeys, game.Players.LocalPlayer.UserId) then loadAFS(true) end
end
if table.find(premiumKeys, game.Players.LocalPlayer.UserId) then
	getPlace()
	return
end
notification("Get key in official discord! (already coppied)", 2)
setclipboard("https://discord.gg/P72M8DRCwz");
local Material = loadstring(game:HttpGet("https://pastebin.com/raw/mGx5KLfU"))()
local Menu = Material.Load({ Title = "sTempest Hub (KeySystem)", Style = 2, SizeX = 325, SizeY = 200, Theme = "Aqua", ColorOverrides = { MainFrame = Color3.fromRGB(235,235,235) }})
local MainTab = Menu.New({ Title = "Key" })
local mainKey = ""
local a = MainTab.TextField({
	Text = "Put the Key",
	Callback = function(Value)
		mainKey = tostring(Value)
	end,
	Menu = {
		["Get Key in discord"] = function(self)
			Menu.Banner({
				Text = "Coppied a discord link to Ctrl+V",
				setclipboard("https://discord.gg/P72M8DRCwz")
			})
		end
	}
})
MainTab.Button({
	Text = "Confirm Key",
	Callback = function(Value)
		if tostring(mainKey) == "sTempest_hdufigh7huid8" then
			if game.CoreGui:FindFirstChild("sTempestHUB") then game.CoreGui.sTempestHUB:Destroy() end
			notification("Opening sTempest Hub! (Correct Key)", 1.9)
			wait(0.1)
			getPlace()
		end
	end,
})
MainTab.Button({
	Text = "Get Key",
	Callback = function(Value)
		setclipboard("https://discord.gg/P72M8DRCwz")
	end,
})

local VirtualUser=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)
--local peopleBanned = {"Barneizinho_OFC", "gabretop789"}
local peopleBanned = {}
if table.find(peopleBanned, game.Players.LocalPlayer.Name) then game.Players.LocalPlayer:Kick("You have been banned from sTempest! You can pay for an unban!") end
