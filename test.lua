if game.CoreGui:FindFirstChild("MiojoHub") then return end
if not game.CoreGui:FindFirstChild("9as98a78n8g7adfhmahuiuyh9asd") and not table.find({1743843923, 2807722675}, game.Players.LocalPlayer.UserId) then game.Players.LocalPlayer:Kick("Stop trying to bypass!") return end
repeat wait() until game:IsLoaded()
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
if tostring(game:HttpGet('https://raw.githubusercontent.com/sumidassz/miojoHub/main/aa')):find("VARVEW4TWDSVSDHD") == nil then return end
local HttpService = game:GetService("HttpService")
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
if (not isfolder("MiojoHub")) then makefolder("MiojoHub") end

-- TABLE FUNCTIONS

local mobArrayTable = {}
function refreshMobDropdown(dropdown)
    table.clear(mobArrayTable)
    local worldGetChildren = workspace.Client.Maps:GetChildren()[1].Mobs
    if worldGetChildren == nil then return end
    for i, v in pairs(worldGetChildren:GetChildren()) do
        local mobName = v.Head.DefaultHud.MobName.UID
        if mobName ~= nil and not table.find(mobArrayTable, mobName.Text) then
            table.insert(mobArrayTable, mobName.Text)
        end
    end
    wait(0.5)
    dropdown:SetValues(mobArrayTable)
end

-- FUNCTIONS

function getNearestEnemy(array)
    local worldGetChildren = workspace.Client.Maps:GetChildren()[1].Mobs
    if worldGetChildren == nil then return end
    local dist, thing = math.huge
    for i, v in pairs(worldGetChildren:GetChildren()) do
        local mobName = v.Head.DefaultHud.MobName.UID
        if mobName ~= nil and table.find(array, mobName.Text) then
            local mag =  (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).magnitude
            if mag < dist then
                dist = mag
                thing = v
            end
        end
    end
    return workspace.Server.Mobs:GetChildren()[1][tostring(thing)]
end

function attackMob(array)
    if getNearestEnemy(array) == nil then print("Mob nil") return end
    game:GetService("ReplicatedStorage").Remotes.Server:FireServer({"Mob", getNearestEnemy(array)})
end

-- UI

local Window = Fluent:CreateWindow({
    Title = "Miojo Hub | Anime Max Simulator",
    SubTitle = "by Sumidassz",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})
local Tabs = {
    Farm = Window:AddTab({ Title = "Farm", Icon = "sword" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "settings" })
}
Window:SelectTab(1)
Fluent:ToggleTransparency(false)
Fluent.GUI.Name = "MiojoHub"
local Options = Fluent.Options
do
    Tabs.Farm:AddToggle("autoEnergy", {Title = "Auto Energy", Default = false })
    Tabs.Farm:AddToggle("autoMob", {Title = "Auto Mob", Default = false })
    local mobDropdown = Tabs.Farm:AddDropdown("autoMobDropdown", {
        Title = "Select the mob",
        Description = "You can select multiples mobs!",
        Values = mobArrayTable,
        Multi = true,
        Default = {mobArrayTable[1]},
    })
    refreshMobDropdown(mobDropdown)
end

local mobsArrayAA = {}
table.clear(mobsArrayAA)
Options.autoMobDropdown:OnChanged(function()
    table.clear(mobsArrayAA)
    for key, value in next, Options.autoMobDropdown.Value do
        if not table.find(mobsArrayAA, key) then
            table.insert(mobsArrayAA, key)
        end
    end
end)

coroutine.resume(coroutine.create(function() while not Fluent.Unloaded do if Options.autoEnergy.Value then game:GetService("ReplicatedStorage").Remotes.Server:FireServer({"Click"}) end wait() end end))
coroutine.resume(coroutine.create(function() while not Fluent.Unloaded do if Options.autoMob.Value then attackMob(mobsArrayAA) end wait() end end))
