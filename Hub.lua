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
local function loadAW()
	local Library = loadstring(game:HttpGet('https://pastebin.com/raw/qYTfV8u7'))()
	
	local Window = Library:CreateWindow({
	    Title = 'sTempestHub | [DUNGEON] Anime World',
	    Center = true, 
	    AutoShow = true,
	})
	
	local Tabs = {
	    Main = Window:AddTab('Main'), 
	    LB = Window:AddTab('Leaderboards'), 
	}
	
	local autoFarmGroupBox = Tabs.Main:AddLeftGroupbox('Auto Farm')
	local miscGroupBox = Tabs.Main:AddLeftGroupbox('Misc')
	local autoBossGroupBox = Tabs.Main:AddRightGroupbox('Auto Boss Raid')
	local autoDungeonGroupBox = Tabs.Main:AddRightGroupbox('Auto Dungeon')
	
	local totalEnergyBox = Tabs.LB:AddLeftGroupbox('Total Energy')
	local petsHatchedBox = Tabs.LB:AddLeftGroupbox('Pets Hatched')
	local totalGemsBox = Tabs.LB:AddRightGroupbox('Total Gems')
	local timePlayedBox = Tabs.LB:AddRightGroupbox('Time Played')
	
	-- MAIN
	
	local mobArrayTable = {}
	local artefactsArray = {}
	
	local function mobDropdown(dropdown)
		table.clear(mobArrayTable)
		for i, k in pairs(workspace.Client.Mobs:GetChildren()) do
			if k:FindFirstChild("HumanoidRootPart") and k:FindFirstChild("HumanoidRootPart"):FindFirstChild("DefaultHud") and k:FindFirstChild("HumanoidRootPart"):FindFirstChild("DefaultHud"):FindFirstChild("Username") then
				if not table.find(mobArrayTable, k.HumanoidRootPart.DefaultHud.Username.Text) then
					table.insert(mobArrayTable, k.HumanoidRootPart.DefaultHud.Username.Text)
					dropdown:SetValues(mobArrayTable)
				end
			end
		end
	end
	
	local function artefactsDropdown(dropdown)
		table.clear(artefactsArray)
		for i, v in pairs(game.Players.LocalPlayer.PlayerGui.UI.OffSet.Frames.Artefacts.Frame.Gradient.List:GetChildren()) do
			if v:IsA("ImageLabel") and not table.find(artefactsArray, v.Name) then
				table.insert(artefactsArray, v.Name)
				dropdown:SetValues(artefactsArray)
			end
		end
	end
	
	autoFarmGroupBox:AddToggle('AutoOFarmToggle', {
	    Text = 'only Farm',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto farm',
	})
	
	autoFarmGroupBox:AddToggle('AutoFarmToggle', {
	    Text = 'Auto Farm',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto farm',
	})
	
	autoFarmGroupBox:AddToggle('AutoSkillToggle', {
	    Text = 'Auto Skill',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto skill',
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
	
	miscGroupBox:AddToggle('AutoCollectToggle', {
	    Text = 'Auto Collect',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto collect',
	})
	
	autoDungeonGroupBox:AddToggle('AutoDungeonToggle', {
	    Text = 'Auto Dungeon',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto dungeon',
	})
	
	autoBossGroupBox:AddToggle('AutoBossToggle', {
	    Text = 'Auto Boss',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto boss',
	})
	
	autoBossGroupBox:AddDropdown('whichRaidDropdown', {
	
	    Values = {"Piece Boss", "Dragon Boss", "Ninja Boss", "Bizarre Boss", "Slayer Boss", "Academy Boss", "Jujutsu Boss"},
	    Default = 1, 
	    Multi = true,
	
	    Text = 'Choose the worlds to do raid',
	    Tooltip = 'Choose the world to do the boss raid',
	})
	
	autoBossGroupBox:AddDropdown('afterWorldDropdown', {
	
	    Values = {"Piece World", "Dragon World", "Ninja World", "Bizarre World", "Slayer World", "Academy World", "Jujutsu World"},
	    Default = 1, 
	    Multi = false,
	
	    Text = 'Choose a world',
	    Tooltip = 'Choose the world to TP after boss raid',
	})
	
	autoDungeonGroupBox:AddDropdown('afterWorldDungeonDropdown', {
	
	    Values = {"Piece World", "Dragon World", "Ninja World", "Bizarre World", "Slayer World", "Academy World", "Jujutsu World"},
	    Default = 1, 
	    Multi = false,
	
	    Text = 'Choose a world',
	    Tooltip = 'Choose the world to TP after dungeon',
	})
	
	autoDungeonGroupBox:AddDropdown('artefactEnterDropdown', {
	
	    Values = artefactsArray,
	    Default = 1, 
	    Multi = false,
	
	    Text = 'Choose artefact to equp when enter',
	    Tooltip = 'Choose the artefact to equip when enter the dungeon',
	})
	
	autoDungeonGroupBox:AddDropdown('artefactExitDropdown', {
	
	    Values = artefactsArray,
	    Default = 1, 
	    Multi = false,
	
	    Text = 'Choose artefact to equp when exit',
	    Tooltip = 'Choose the artefact to equip when exit the dungeon',
	})
	
	autoDungeonGroupBox:AddButton('Refresh the artefacts', function()
	    artefactsDropdown(Options.artefactEnterDropdown)
	    artefactsDropdown(Options.artefactExitDropdown)
	end)
	
	artefactsDropdown(Options.artefactEnterDropdown)
	artefactsDropdown(Options.artefactExitDropdown)
	mobDropdown(Options.autoFarmDropdown)
	local function getNearestAll(array)
	    local dist, thing = math.huge
	    for i, v in next, workspace.Client.Mobs:GetChildren() do
	        if v.HumanoidRootPart.DefaultHud.Enabled == true and table.find(array, v.HumanoidRootPart.DefaultHud.Username.Text) then
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
	local function getNearestAlla()
	    local dist, thing = math.huge
	    for i, v in next, workspace.Client.Mobs:GetChildren() do
	        if v.HumanoidRootPart.DefaultHud.Enabled == true then
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
	local function autoMobFunc(array)
		for l, world in pairs(workspace.Server.Mobs:GetChildren()) do
			for i, v in pairs(workspace.Server.Mobs[tostring(world)]:GetChildren()) do
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					for _, k in pairs(workspace.Client.Mobs:GetChildren()) do
						if table.find(array, k.HumanoidRootPart.DefaultHud.Username.Text) and v.Name == k.Name and k == getNearestAll(array) and workspace.Client.Mobs:FindFirstChild(tostring(getNearestAll(array))) then
							game.ReplicatedStorage.Remotes.Server:FireServer({"RunQuest"})
							game.ReplicatedStorage.Remotes.Server:FireServer({"MobHit", world:FindFirstChild(tostring(getNearestAll(array))), "WeaponAttack"})
							if Toggles.AutoSkillToggle.Value == true then game.ReplicatedStorage.Remotes.Server:FireServer({"Skill", "Use", world:FindFirstChild(tostring(getNearestAll(array)))}) end
							if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X ~= getNearestAll(array).HumanoidRootPart.CFrame.X*0.1 and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z ~= getNearestAll(array).HumanoidRootPart.Position.Z then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(getNearestAll(array).HumanoidRootPart.Position.X, getNearestAll(array).HumanoidRootPart.Position.Y, getNearestAll(array).HumanoidRootPart.Position.Z)*CFrame.new(.1,0,0)
							end
						end
					end
				end
			end
		end
	end
	local function autoBossFunc(afterWorld, array)
		if array ~= nil then
			for _, world in pairs(workspace.Server.Mobs:GetChildren()) do
				if table.find(array, world.Name) then 
					if #world:GetChildren() == 1 then
						for p, mobServer in pairs(world:GetChildren()) do
							for i, mobClient in pairs(workspace.Client.Mobs:GetChildren()) do
								if #workspace.Client.Mobs:GetChildren() > 1 then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mobServer.CFrame*CFrame.new(0.1,0,0)
								elseif #workspace.Client.Mobs:GetChildren() == 1 then
									game.ReplicatedStorage.Remotes.Server:FireServer({"MobHit", mobServer, "WeaponAttack"})
									if Toggles.AutoSkillToggle.Value == true then game.ReplicatedStorage.Remotes.Server:FireServer({"Skill", "Use", mobServer}) end
									if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X ~= mobClient.HumanoidRootPart.CFrame.X*0.1 and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z ~= mobClient.HumanoidRootPart.Position.Z then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mobClient.HumanoidRootPart.Position.X, mobClient.HumanoidRootPart.Position.Y, mobClient.HumanoidRootPart.Position.Z)*CFrame.new(.1,0,0)
									end
								end
							end
						end
					end
				end
				if world.Name ~= "Dungeon" and #workspace.Client.Mobs:GetChildren() == 0 and #world:GetChildren() == 0 and afterWorld ~= "" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Server.Zones[tostring(afterWorld)].CFrame
				end
			end
		end
	end
	local function autoDungeonFunc(afterWorld, artefactEnter, artefactExit)
		game.ReplicatedStorage.Remotes.Server:FireServer({"Dungeon", "Enter"})
		local world = workspace.Server.Mobs.Dungeon
		local clientFolder = workspace.Client.Mobs
		--for p, k in pairs(world:GetChildren()) do
			for i, v in pairs(clientFolder:GetChildren()) do
				if #world:GetChildren() >= 1 and world:FindFirstChild(tostring(getNearestAlla())) then
					if table.find(artefactsArray, artefactEnter) then game.ReplicatedStorage.Remotes.Server:FireServer({"ArtefactStatus", "Equip", tostring(artefactEnter)}) end
					game.ReplicatedStorage.Remotes.Server:FireServer({"MobHit", world[getNearestAlla().Name], "WeaponAttack"})
					if Toggles.AutoSkillToggle.Value == true then game.ReplicatedStorage.Remotes.Server:FireServer({"Skill", "Use", world[getNearestAlla().Name]}) end
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestAlla().HumanoidRootPart.CFrame*CFrame.new(0.1,0,0)
				end
			end
		--end
		if game.Players.LocalPlayer.PlayerGui.UI.OffSet.Waves.Left.Shadow.Text == "60:58" and afterWorld ~= "" then 
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Server.Zones[tostring(afterWorld)].CFrame
			if table.find(artefactsArray, artefactExit) then game.ReplicatedStorage.Remotes.Server:FireServer({"ArtefactStatus", "Equip", tostring(artefactExit)}) end
			wait(0.5)
			game.Players.LocalPlayer.PlayerGui.UI.OffSet.Waves.Left.Shadow.Text = "60:57"
			game.ReplicatedStorage.Remotes.Server:FireServer({"Dungeon", "Exit"})
		end
	end
	
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
	
	local arrayWorldToRaid = {}
	table.clear(arrayWorldToRaid)
	Options.whichRaidDropdown:OnChanged(function()
		table.clear(arrayWorldToRaid)
	    for key, value in next, Options.whichRaidDropdown.Value do
	        if not table.find(arrayWorldToRaid, key) then
	        	table.insert(arrayWorldToRaid, key)
	        end
	    end
	end)
	
	-- LEADERBOARDS
	
	local arrayPets, arrayEnergy, arrayGems, arrayTime = {}, {}, {}, {}
	
	local function seeTopRefresh(array, dropdown, whatyouwant, gamepasses)
		if gamepasses == "F2P" or gamepasses == "P2W" then
			table.clear(array)
			for i, v in pairs(workspace.Server.Leaderboards[tostring(whatyouwant)].Frame.UI[tostring(gamepasses)]:GetChildren()) do
				if v:IsA("Frame") and v:FindFirstChild("UID") then
					table.insert(array, v.UID.Text)
					dropdown:SetValues(array)
				end
			end
		end
	end
	
	totalEnergyBox:AddDropdown('gamepassesDropdown', {
	
	    Values = {"F2P", "P2W"},
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'Select F2P or P2W',
	})
	
	totalEnergyBox:AddDropdown('totalEnergyDropdown', {
	
	    Values = arrayEnergy,
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'See the top',
	})
	
	totalEnergyBox:AddButton('Refresh the top', function()
	    seeTopRefresh(arrayEnergy, Options.totalEnergyDropdown, "TotalEnergy", Options.gamepassesDropdown.Value)
	end)
	
	petsHatchedBox:AddDropdown('gamepassesDropdown2', {
	
	    Values = {"F2P", "P2W"},
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'Select F2P or P2W',
	})
	
	petsHatchedBox:AddDropdown('petsHatchedDropdown', {
	
	    Values = arrayPets,
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'See the top',
	})
	
	petsHatchedBox:AddButton('Refresh the top', function()
	    seeTopRefresh(arrayPets, Options.petsHatchedDropdown, "PetsHatched", Options.gamepassesDropdown2.Value)
	end)
	
	totalGemsBox:AddDropdown('gamepassesDropdown3', {
	
	    Values = {"F2P", "P2W"},
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'Select F2P or P2W',
	})
	
	totalGemsBox:AddDropdown('totalGemsDropdown', {
	
	    Values = arrayGems,
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'See the top',
	})
	
	totalGemsBox:AddButton('Refresh the top', function()
	    seeTopRefresh(arrayGems, Options.totalGemsDropdown, "TotalGems", Options.gamepassesDropdown3.Value)
	end)
	
	timePlayedBox:AddDropdown('timePlayedDropdown', {
	
	    Values = arrayTime,
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'See the top',
	})
	
	timePlayedBox:AddButton('Refresh the top', function()
	    seeTopRefresh(arrayTime, Options.timePlayedDropdown, "TimePlayed", "P2W")
	end)
	
	local c1 = coroutine.create(function() while true do if Toggles.AutoFarmToggle.Value == true then autoMobFunc(mobsArraySelected) end wait() end end) coroutine.resume(c1)
	local c2 = coroutine.create(function() while true do if Toggles.AutoOFarmToggle.Value == true then if Toggles.AutoDungeonToggle.Value == true and #workspace.Server.Mobs.Dungeon:GetChildren() == 0 then game.ReplicatedStorage.Remotes.Server:FireServer({"MobHit", m, "WeaponAttack"}) elseif Toggles.AutoDungeonToggle.Value == false then game.ReplicatedStorage.Remotes.Server:FireServer({"MobHit", m, "WeaponAttack"}) end end wait() end end) coroutine.resume(c2)
	local c3 = coroutine.create(function() while true do if Toggles.AutoCollectToggle.Value == true then for i, v in pairs(workspace.Debris:GetChildren()) do if v:FindFirstChild("UID") then v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end end end wait(0.1) end end) coroutine.resume(c3)
	local c4 = coroutine.create(function() while true do if Toggles.AutoBossToggle.Value == true then autoBossFunc(Options.afterWorldDropdown.Value, arrayWorldToRaid, Toggles.AutoDungeonToggle.Value) end wait(0.1) end end) coroutine.resume(c4)
	local c5 = coroutine.create(function() while true do if Toggles.AutoDungeonToggle.Value == true then autoDungeonFunc(Options.afterWorldDungeonDropdown.Value, Options.artefactEnterDropdown.Value, Options.artefactExitDropdown.Value) end wait() end end) coroutine.resume(c5)
end
local function loadASwords()
	local Library = loadstring(game:HttpGet('https://pastebin.com/raw/qYTfV8u7'))()
	
	local Window = Library:CreateWindow({
	    Title = 'sTempestHub | Anime Sword Simulator',
	    Center = true, 
	    AutoShow = true,
	})
	
	local Tabs = {
	    Main = Window:AddTab('Main'), 
	    LB = Window:AddTab('Leaderboards'), 
	}
	
	local autoFarmGroupBox = Tabs.Main:AddLeftGroupbox('Auto Farm')
	local autoEnergyGroupBox = Tabs.Main:AddLeftGroupbox('Auto Energy')
	local miscGroupBox = Tabs.Main:AddLeftGroupbox('Misc')
	local autoBossGroupBox = Tabs.Main:AddRightGroupbox('Auto Boss Raid')
	local autoDungeonGroupBox = Tabs.Main:AddRightGroupbox('Auto Dungeon')
	
	local totalEnergyBox = Tabs.LB:AddLeftGroupbox('Total Energy')
	local petsHatchedBox = Tabs.LB:AddLeftGroupbox('Pets Hatched')
	local totalGemsBox = Tabs.LB:AddRightGroupbox('Total Gems')
	local timePlayedBox = Tabs.LB:AddRightGroupbox('Time Played')
	
	-- MAIN
	
	local mobArrayTable = {}
	local artefactsArray = {}
	local grimoiresArrayTable = {}
	
	local function mobDropdown(dropdown)
		table.clear(mobArrayTable)
		for l, world in pairs(workspace.Client.Maps:GetChildren()) do
			for i, k in pairs(workspace.Client.Maps[tostring(world)].Mobs:GetChildren()) do
				if k:FindFirstChild("HumanoidRootPart") and k:FindFirstChild("HumanoidRootPart"):FindFirstChild("DefaultHud") and k:FindFirstChild("HumanoidRootPart"):FindFirstChild("DefaultHud"):FindFirstChild("Username") then
					if not table.find(mobArrayTable, k.HumanoidRootPart.DefaultHud.Username.Text) then
						table.insert(mobArrayTable, k.HumanoidRootPart.DefaultHud.Username.Text)
						dropdown:SetValues(mobArrayTable)
					end
				end
			end
		end
	end
	
	local function seeGrimoiresDropdown(dropdown)
		table.clear(grimoiresArrayTable)
		for _, v in pairs(game.Players.LocalPlayer.PlayerGui.UI.OffSet.Frames.TierGrimoires.Main:GetChildren()) do
			if v:IsA("Frame") then
				if not table.find(grimoiresArrayTable, tostring(v.Name).." ("..tostring(v.GrimoireRarity.Text)..")")then
					table.insert(grimoiresArrayTable, tostring(v.Name).." ("..tostring(v.GrimoireRarity.Text)..")")
					dropdown:SetValues(grimoiresArrayTable)
				end
			end
		end
	end
	
	autoEnergyGroupBox:AddToggle('AutoOFarmToggle', {
	    Text = 'only farm Energy',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto farm',
	})
	
	autoEnergyGroupBox:AddDropdown('areaMultiplierDropdown', {
	
	    Values = {"None", "x2", "x4"},
	    Default = 1, 
	    Multi = false,
	
	    Text = 'Choose the multiplier area',
	    Tooltip = 'Choose the area that can multiply your energy',
	})
	
	autoEnergyGroupBox:AddToggle('AutoSkillToggle', {
	    Text = 'Auto Boost (x3 Energy)',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto boost',
	})
	
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
	
	autoFarmGroupBox:AddToggle('withQuestToggle', {
	    Text = 'with complete quest',
	    Default = false,
	    Tooltip = 'Enable/Disabled complete quest in auto farm',
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
	
	miscGroupBox:AddToggle('AutoCollectToggle', {
	    Text = 'Auto Collect',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto collect',
	})
	
	miscGroupBox:AddToggle('AutoRankUpToggle', {
	    Text = 'Auto RankUp',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto rankup',
	})
	
	miscGroupBox:AddToggle('AutoEasyFusionToggle', {
	    Text = 'Auto Easy Fusion',
	    Default = false,
	    Tooltip = 'Shiny use only 4 swords and Divine use only 2!',
	})
	
	miscGroupBox:AddToggle('AutoBuyGrimoireToggle', {
	    Text = 'Auto Buy Grimoire',
	    Default = false,
	    Tooltip = 'Enable/Disable auto buy grimoire',
	})
	
	miscGroupBox:AddDropdown('AutoBuyGrimoireDropdown', {
	
	    Values = grimoiresArrayTable,
	    Default = 1, 
	    Multi = false,
	
	    Text = 'Just to see the grimoires in the moment',
	    Tooltip = 'Just to see the grimoires in the moment',
	})
	
	miscGroupBox:AddButton('Refresh the grimoires', function()
	    seeGrimoiresDropdown(Options.AutoBuyGrimoireDropdown)
	end)
	
	autoDungeonGroupBox:AddToggle('AutoDungeonToggle', {
	    Text = 'Auto Dungeon',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto dungeon',
	})
	
	autoBossGroupBox:AddToggle('AutoBossToggle', {
	    Text = 'Auto Boss',
	    Default = false,
	    Tooltip = 'Enable/Disabled auto boss',
	})
	
	autoBossGroupBox:AddDropdown('whichRaidDropdown', {
	
	    Values = {"Piece Boss", "Dragon Boss", "Ninja Boss", "Bizarre Boss", "Slayer Boss", "Academy Boss", "Jujutsu Boss"},
	    Default = 1, 
	    Multi = true,
	
	    Text = 'Choose the worlds to do raid',
	    Tooltip = 'Choose the world to do the boss raid',
	})
	
	autoBossGroupBox:AddDropdown('afterWorldDropdown', {
	
	    Values = {"Piece World", "Dragon World", "Ninja World", "Bizarre World", "Slayer World", "Academy World", "Jujutsu World"},
	    Default = 1, 
	    Multi = false,
	
	    Text = 'Choose a world',
	    Tooltip = 'Choose the world to TP after boss raid',
	})
	
	autoDungeonGroupBox:AddDropdown('afterWorldDungeonDropdown', {
	
	    Values = {"Piece World", "Dragon World", "Ninja World", "Bizarre World", "Slayer World", "Academy World", "Jujutsu World"},
	    Default = 1, 
	    Multi = false,
	
	    Text = 'Choose a world',
	    Tooltip = 'Choose the world to TP after dungeon',
	})
	
	mobDropdown(Options.autoFarmDropdown)
	seeGrimoiresDropdown(Options.AutoBuyGrimoireDropdown)
	
	local function getNearestAll(array, world)
	    local dist, thing = math.huge
	    for i, v in next, workspace.Client.Maps[tostring(world)].Mobs:GetChildren() do
	        if v.HumanoidRootPart.DefaultHud.Enabled == true and table.find(array, v.HumanoidRootPart.DefaultHud.Username.Text) then
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
	local function getNearestAlla()
	    local dist, thing = math.huge
	    for i, v in next, workspace.Client.Mobs:GetChildren() do
	        if v.HumanoidRootPart.DefaultHud.Enabled == true then
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
	local function autoMobFunc(array, tpBool, questBool)
		for l, world in pairs(workspace.Client.Maps:GetChildren()) do
			for i, v in pairs(workspace.Server.Mobs[tostring(world)]:GetChildren()) do
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					for _, k in pairs(workspace.Client.Maps[tostring(world)].Mobs:GetChildren()) do
						if table.find(array, k.HumanoidRootPart.DefaultHud.Username.Text) and v.Name == k.Name and k == getNearestAll(array, world) and workspace.Client.Maps[tostring(world)].Mobs:FindFirstChild(tostring(getNearestAll(array, world))) then
							if questBool == true then
								game.ReplicatedStorage.Remotes.Server:FireServer({"RunQuest"})
								game.Players.LocalPlayer.PlayerGui.UI.OffSet["Right_Main"].Quest.Visible = true
							end
							game.ReplicatedStorage.Remotes.Server:FireServer({"MobHit", workspace.Server.Mobs[tostring(world)]:FindFirstChild(tostring(getNearestAll(array, world))), "WeaponAttack"})
							if tpBool == true then
								if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X ~= getNearestAll(array, world).HumanoidRootPart.CFrame.X*0.1 and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z ~= getNearestAll(array, world).HumanoidRootPart.Position.Z then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(getNearestAll(array, world).HumanoidRootPart.Position.X, getNearestAll(array, world).HumanoidRootPart.Position.Y, getNearestAll(array, world).HumanoidRootPart.Position.Z)*CFrame.new(.1,0,0)
								end
							end
						end
					end
				end
			end
		end
	end
	local function autoSukunaBoostFunc()
		game.ReplicatedStorage.Remotes.Server:FireServer({"ClickerBoost", "Completed", 4})
	end
	local function easyFusionFunc()
		for _, weapon in pairs(game.Players.LocalPlayer.PlayerGui.UI.OffSet.Frames.Weapons.WeaponList:GetChildren()) do
			if weapon:IsA("ImageLabel") then
				if weapon.Frame.Shiny.Visible == false and weapon.Frame.Divine.Visible == false then game.ReplicatedStorage.Remotes.Server:FireServer({"WeaponStatus", "Shiny", tostring(weapon)}) end
				if weapon.Frame.Shiny.Visible == true and weapon.Frame.Divine.Visible == false then game.ReplicatedStorage.Remotes.Server:FireServer({"WeaponStatus", "Divine", tostring(weapon)}) end
				--game.ReplicatedStorage.Remotes.Server:FireServer({"WeaponStatus", "Best", ""})
			end
		end
	end
	local function onlyEnergyFunc(areaChoosed)
		if areaChoosed == "None" then return end
		if areaChoosed == "x2" then 
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-workspace.Server.AreaMultiplier["Hollow Dimension"].Part.Position).magnitude > 40 then
				game.ReplicatedStorage.Remotes.Server:FireServer({"TeleportZone", "Hollow Dimension"})
				wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Server.AreaMultiplier["Hollow Dimension"].Part.CFrame 
			elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-workspace.Server.AreaMultiplier["Hollow Dimension"].Part.Position).magnitude <= 40 then
				return
			end
		end
		if areaChoosed == "x4" then 
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-workspace.Server.AreaMultiplier["Leaf Village"].Part.Position).magnitude > 40 then
				game.ReplicatedStorage.Remotes.Server:FireServer({"TeleportZone", "Leaf Village"})
				wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Server.AreaMultiplier["Leaf Village"].Part.CFrame 
			elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-workspace.Server.AreaMultiplier["Leaf Village"].Part.Position).magnitude <= 40 then
				return
			end
		end
	end
	local function autoBossFunc(afterWorld, array)
		if array ~= nil then
			for l, world in pairs(workspace.Client.Maps:GetChildren()) do
				if table.find(array, world.Name) then 
					if #world:GetChildren() == 1 then
						for p, mobServer in pairs(world:GetChildren()) do
							for i, mobClient in pairs(workspace.Client.Mobs:GetChildren()) do
								if #workspace.Client.Mobs:GetChildren() > 1 then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mobServer.CFrame*CFrame.new(0.1,0,0)
								elseif #workspace.Client.Mobs:GetChildren() == 1 then
									game.ReplicatedStorage.Remotes.Server:FireServer({"MobHit", mobServer, "WeaponAttack"})
									if Toggles.AutoSkillToggle.Value == true then game.ReplicatedStorage.Remotes.Server:FireServer({"Skill", "Use", mobServer}) end
									if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X ~= mobClient.HumanoidRootPart.CFrame.X*0.1 and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z ~= mobClient.HumanoidRootPart.Position.Z then
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mobClient.HumanoidRootPart.Position.X, mobClient.HumanoidRootPart.Position.Y, mobClient.HumanoidRootPart.Position.Z)*CFrame.new(.1,0,0)
									end
								end
							end
						end
					end
				end
				if world.Name ~= "Dungeon" and #workspace.Client.Mobs:GetChildren() == 0 and #world:GetChildren() == 0 and afterWorld ~= "" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Server.Zones[tostring(afterWorld)].CFrame
				end
			end
		end
	end
	local orgnwwfw = false
	local function autoDungeonFunc(afterWorld)
		if orgnwwfw == false then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(427.73, 4.55746, -55.313) orgnwwfw = true end
		for p, k in pairs(world:GetChildren()) do
			for i, v in pairs(clientFolder:GetChildren()) do
				if #world:GetChildren() >= 1 and world:FindFirstChild(tostring(getNearestAlla())) then
					if table.find(artefactsArray, artefactEnter) then game.ReplicatedStorage.Remotes.Server:FireServer({"ArtefactStatus", "Equip", tostring(artefactEnter)}) end
					game.ReplicatedStorage.Remotes.Server:FireServer({"MobHit", world[getNearestAlla().Name], "WeaponAttack"})
					if Toggles.AutoSkillToggle.Value == true then game.ReplicatedStorage.Remotes.Server:FireServer({"Skill", "Use", world[getNearestAlla().Name]}) end
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getNearestAlla().HumanoidRootPart.CFrame*CFrame.new(0.1,0,0)
				end
			end
		end
		if game.Players.LocalPlayer.PlayerGui.UI.OffSet.Waves.Left.Shadow.Text == "60:58" and afterWorld ~= "" then 
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Server.Zones[tostring(afterWorld)].CFrame
			if table.find(artefactsArray, artefactExit) then game.ReplicatedStorage.Remotes.Server:FireServer({"ArtefactStatus", "Equip", tostring(artefactExit)}) end
			wait(0.5)
			game.Players.LocalPlayer.PlayerGui.UI.OffSet.Waves.Left.Shadow.Text = "60:57"
			game.ReplicatedStorage.Remotes.Server:FireServer({"Dungeon", "Exit"})
		end
	end
	
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
	
	local arrayWorldToRaid = {}
	table.clear(arrayWorldToRaid)
	Options.whichRaidDropdown:OnChanged(function()
		table.clear(arrayWorldToRaid)
	    for key, value in next, Options.whichRaidDropdown.Value do
	        if not table.find(arrayWorldToRaid, key) then
	        	table.insert(arrayWorldToRaid, key)
	        end
	    end
	end)
	
	-- LEADERBOARDS
	
	local arrayPets, arrayEnergy, arrayGems, arrayTime = {}, {}, {}, {}
	
	local function seeTopRefresh(array, dropdown, whatyouwant, gamepasses)
		if gamepasses == "F2P" or gamepasses == "P2W" then
			table.clear(array)
			for i, v in pairs(workspace.Server.Leaderboards[tostring(whatyouwant)].Frame.UI[tostring(gamepasses)]:GetChildren()) do
				if v:IsA("Frame") and v:FindFirstChild("UID") then
					table.insert(array, v.UID.Text)
					dropdown:SetValues(array)
				end
			end
		end
	end
	
	totalEnergyBox:AddDropdown('gamepassesDropdown', {
	
	    Values = {"F2P", "P2W"},
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'Select F2P or P2W',
	})
	
	totalEnergyBox:AddDropdown('totalEnergyDropdown', {
	
	    Values = arrayEnergy,
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'See the top',
	})
	
	totalEnergyBox:AddButton('Refresh the top', function()
	    seeTopRefresh(arrayEnergy, Options.totalEnergyDropdown, "TotalEnergy", Options.gamepassesDropdown.Value)
	end)
	
	petsHatchedBox:AddDropdown('gamepassesDropdown2', {
	
	    Values = {"F2P", "P2W"},
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'Select F2P or P2W',
	})
	
	petsHatchedBox:AddDropdown('petsHatchedDropdown', {
	
	    Values = arrayPets,
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'See the top',
	})
	
	petsHatchedBox:AddButton('Refresh the top', function()
	    seeTopRefresh(arrayPets, Options.petsHatchedDropdown, "PetsHatched", Options.gamepassesDropdown2.Value)
	end)
	
	totalGemsBox:AddDropdown('gamepassesDropdown3', {
	
	    Values = {"F2P", "P2W"},
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'Select F2P or P2W',
	})
	
	totalGemsBox:AddDropdown('totalGemsDropdown', {
	
	    Values = arrayGems,
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'See the top',
	})
	
	totalGemsBox:AddButton('Refresh the top', function()
	    seeTopRefresh(arrayGems, Options.totalGemsDropdown, "TotalGems", Options.gamepassesDropdown3.Value)
	end)
	
	timePlayedBox:AddDropdown('timePlayedDropdown', {
	
	    Values = arrayTime,
	    Default = 1, 
	    Multi = false,
	
	    Text = '',
	    Tooltip = 'See the top',
	})
	
	timePlayedBox:AddButton('Refresh the top', function()
	    seeTopRefresh(arrayTime, Options.timePlayedDropdown, "TimePlayed", "P2W")
	end)
	
	if game.Players.LocalPlayer.PlayerGui.UI.OffSet:FindFirstChild("RMain") then game.Players.LocalPlayer.PlayerGui.UI.OffSet.RMain:Destroy() end
	local a = game.Players.LocalPlayer.PlayerGui.UI.OffSet.Frames.Rank.Main:Clone()
	a.Parent = game.Players.LocalPlayer.PlayerGui.UI.OffSet
	a.Name = "RMain"
	a.RankButton:Destroy()
	a.RobuxButton:Destroy()
	a.Visual:Destroy()
	a.Visual:Destroy()
	a.NextMultiplier:Destroy()
	a.Size = UDim2.new(0.25, 0, 0.25, 0)
	a.Position = UDim2.new(0.125, 0, 0.925, 0)
	
	local function refreshRankUP()
		a.ProgressEnergy.Text = game.Players.LocalPlayer.PlayerGui.UI.OffSet.Frames.Rank.Main.ProgressEnergy.Text
		a.ProgressBar.Insider.Size = game.Players.LocalPlayer.PlayerGui.UI.OffSet.Frames.Rank.Main.ProgressBar.Insider.Size
		a.CurrentRank.Text = game.Players.LocalPlayer.PlayerGui.UI.OffSet.Frames.Rank.Main.CurrentRank.Text
		a.NextRank.Text= game.Players.LocalPlayer.PlayerGui.UI.OffSet.Frames.Rank.Main.NextRank.Text
	end
	
	local c1 = coroutine.create(function() while true do if Toggles.AutoFarmToggle.Value == true then autoMobFunc(mobsArraySelected, Toggles.withTPToggle.Value, Toggles.withQuestToggle.Value) end wait() end end) coroutine.resume(c1)
	local c2 = coroutine.create(function() while true do if Toggles.AutoOFarmToggle.Value == true then game.ReplicatedStorage.Remotes.Server:FireServer({"MobHit", m, "WeaponAttack"}) onlyEnergyFunc(Options.areaMultiplierDropdown.Value) end wait() end end) coroutine.resume(c2)
	local c3 = coroutine.create(function() while true do if Toggles.AutoCollectToggle.Value == true then for i, v in pairs(workspace.Debris:GetChildren()) do if v:FindFirstChild("UID") then v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end end end wait(0.1) end end) coroutine.resume(c3)
	local c4 = coroutine.create(function() while true do if Toggles.AutoSkillToggle.Value == true then autoSukunaBoostFunc() end wait(0.1) end end) coroutine.resume(c4)
	local c5 = coroutine.create(function() while true do if Toggles.AutoRankUpToggle.Value == true then game.ReplicatedStorage.Remotes.Server:FireServer({"RankUp"}) a.Visible = true refreshRankUP() elseif Toggles.AutoRankUpToggle.Value == false then a.Visible = false end wait(0.5) end end) coroutine.resume(c5)
	local c6 = coroutine.create(function() while true do if Toggles.AutoEasyFusionToggle.Value == true then easyFusionFunc() end wait(0.5) end end) coroutine.resume(c6)
	local c7 = coroutine.create(function() while true do if Toggles.AutoBuyGrimoireToggle.Value == true then game.ReplicatedStorage.Remotes.Server:FireServer({"BuyGrimoire"}) end wait(0.5) end end) coroutine.resume(c7)
end
local function loadASouls()
	local Material = loadstring(game:HttpGet("https://pastebin.com/raw/mGx5KLfU"))()
	local Menu = Material.Load({ Title = "Tempest Hub - Anime Souls", Style = 2, SizeX = 355, SizeY = 405, Theme = "Aqua", ColorOverrides = { MainFrame = Color3.fromRGB(235,235,235) }})
	local MainTab = Menu.New({ Title = "Main" })
	
	local mobBoolean = false
	local autoChallenge = false
	local tpBool = false
	local mobSelected = ""
	local chooseTextFieldOne = {}
	local mobArrayTable = {}
	
	local function getNearest(mob, world)
	    local dist, thing = math.huge
	    for i, v in next, workspace["_ENEMIES"][tostring(world)]:GetChildren() do
	        if v.Name == tostring(mob) and v:FindFirstChild("_stats") and v["_stats"]["current_hp"].Value > 0 then
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
	local function autoMobFunc(mob)
		for l, world in pairs(workspace["_ENEMIES"]:GetChildren()) do
			for i, v in pairs(world:GetChildren()) do
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("_stats") and v["_stats"]:FindFirstChild("current_hp") then
						if v.Name == tostring(mob) and v == getNearest(mob, world) and v:FindFirstChild("_stats") then
							if v["_stats"]["current_hp"].Value <= 0 then
								game.ReplicatedStorage.Remotes.Server:FireServer({"Hit"})
							else
								game.ReplicatedStorage.Remotes.Server:FireServer({"Hit", getNearest(mob, world)})
								game.ReplicatedStorage.Remotes.Server:FireServer({"Quest"})
								if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X ~= v.HumanoidRootPart.CFrame.X*0.1 and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z ~= v.HumanoidRootPart.Position.Z then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z)*CFrame.new(.1,0,0)
								end
							end
						end
					end
				end
			end
		end
	end
	
	local function autoTrialFunc(trial)
		for p, fase in pairs(workspace["_TRIAL"][tostring(trial)].Enemies:GetChildren()) do
			for i, v in pairs(fase:GetChildren()) do
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("_stats") and v["_stats"]:FindFirstChild("current_hp") then
						if v:FindFirstChild("_stats") then
							if v["_stats"]["current_hp"].Value <= 0 then
								game.ReplicatedStorage.Remotes.Server:FireServer({"Hit"})
							else
								game.ReplicatedStorage.Remotes.Server:FireServer({"Hit", v})
								--game.ReplicatedStorage.Remotes.Server:FireServer({"Quest"})
								if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X ~= v.HumanoidRootPart.CFrame.X*0.1 and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z ~= v.HumanoidRootPart.Position.Z then
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y, v.HumanoidRootPart.Position.Z)*CFrame.new(.1,0,0)
								end
							end
						end
					end
				end
			end
		end
	end
	
	local function autoEquipBestFunc()
		game.ReplicatedStorage.Remotes.Server:FireServer({"Class"})
	end
	
	local function autoSukunaBoostFunc()
		game.ReplicatedStorage.Remotes.Server:FireServer({"ClickerBoost", "Completed", 4})
	end
	
	local function mobDropdown(dropdown)
		table.clear(mobArrayTable)
		for l, world in pairs(workspace["_ENEMIES"]:GetChildren()) do
			for i, v in pairs(world:GetChildren()) do
				if not table.find(mobArrayTable, v.Name) then
					table.insert(mobArrayTable, v.Name)
					dropdown:SetOptions(mobArrayTable)
				end
			end
		end
	end
	
	MainTab.DataTable({ Text = "Main", Callback = function(ChipSet) table.foreach(ChipSet, function(Option, Value) if Option == "Auto Attack" then mobBoolean = Value end if Option == "only Attack" then tpBool = Value end end) end, Options = { ["Auto Attack"] = false, ["only Attack"] = false }})
	
	local function eggOpen()
		for l, world in pairs(workspace.Client.Maps:GetChildren()) do
			game.ReplicatedStorage.Remotes.Server:FireServer({ "BuyTier", workspace.Client.Maps[tostring(world)].Tier["Basic Tier"], "E", {Alyce = true, Aysune = true, Eygeo = true, Kirity = true, Leafya = true} })
		end
	end
	
	local dropdownMob = MainTab.Dropdown({ Text = "Choose a enemy", Callback = function(v) mobSelected = tostring(v) end, Options = mobArrayTable })
	mobDropdown(dropdownMob)
	MainTab.TextField({
	    Text = "Browse for the enemy",
	    Callback = function(Value)
	        if table.find(mobArrayTable, Value) then chooseTextFieldOne = {tostring(Value)} dropdownMob:SetOptions(chooseTextFieldOne) end
	    end
	})
	local trialSelected = ""
	local autoTrial = false
	local autoCollect = false
	MainTab.Button({ Text = "Refresh the enemys", Callback = function(v) mobDropdown(dropdownMob) end })
	MainTab.DataTable({ Text = "Main", Callback = function(ChipSet) table.foreach(ChipSet, function(Option, Value) if Option == "Auto RankUP" then autoChallenge = Value end if Option == "See Quest Status" then autoCollect = Value end end) end, Options = { ["Auto RankUP"] = false, ["See Quest Status"] = false}})
	MainTab.DataTable({ Text = "Main", Callback = function(ChipSet) table.foreach(ChipSet, function(Option, Value) if Option == "Auto Trial" then autoTrial = Value end end) end, Options = { ["Auto Trial"] = false}})
	local dropdownTrial = MainTab.Dropdown({ Text = "Choose the trial", Callback = function(v) trialSelected = tostring(v) end, Options = {"Easy", "Medium", "Hard", "Extreme"} })
	
	local function seeQuest()
		if game.Players.LocalPlayer.PlayerGui.CenterUI:FindFirstChild("ev5y45") then 
			game.Players.LocalPlayer.PlayerGui.CenterUI:FindFirstChild("ev5y45"):Destroy()
		end
		local a = game.Players.LocalPlayer.PlayerGui["_QUEST"].Background:Clone()
		a.Parent = game.Players.LocalPlayer.PlayerGui.CenterUI
		a.Name = "ev5y45"
		a.Size = UDim2.new(1,0,1,0)
		a.Objectives.Size = UDim2.new(0.25,0,.25,0)
		a.Objectives.Position = UDim2.new(0.125,0,.932,0)
		a.Objectives.main.BackgroundTransparency = 0.25
		a.Title:Destroy()
	end
	
	local c1 = coroutine.create(function() while true do if mobBoolean == true then autoMobFunc(mobSelected) end wait() end end) coroutine.resume(c1)
	local c2 = coroutine.create(function() while true do if autoChallenge == true then autoEquipBestFunc() end wait(1) end end) coroutine.resume(c2)
	local c3 = coroutine.create(function() while true do if tpBool == true then game.ReplicatedStorage.Remotes.Server:FireServer({"Hit"})  end wait() end end) coroutine.resume(c3) -- game.ReplicatedStorage.Remotes.Server:FireServer({"BuyGrimoire"})
	local c4 = coroutine.create(function() while true do if autoCollect == true then seeQuest() end wait(1) end end) coroutine.resume(c4)
	local c5 = coroutine.create(function() while true do if autoTrial == true then autoTrialFunc(trialSelected) end wait() end end) coroutine.resume(c5)
end
local premiumKeys = {3307563813}
local function getPlace()
	if game.PlaceId == 6299805723 and not table.find(premiumKeys, game.Players.LocalPlayer.UserId) then loadAFS(false) end
	if game.PlaceId == 6299805723 and table.find(premiumKeys, game.Players.LocalPlayer.UserId) then loadAFS(true) end
	if game.PlaceId == 13724541959 then loadAW() end
	if game.PlaceId == 13379838093 then loadASwords() end
	if game.PlaceId == 11542692507 then loadASouls() end
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
