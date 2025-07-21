--// FULL MENU GUI BY WOKING 👹 + Fram Boss + PvP + Troll + FPS
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local OpenButton = Instance.new("TextButton", ScreenGui)
OpenButton.Size = UDim2.new(0, 50, 0, 50)
OpenButton.Position = UDim2.new(0, 0, 0.5, -25)
OpenButton.Text = "👹"
OpenButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
OpenButton.TextScaled = true

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local Tabs = {}
local function CreateTab(name)
    local Button = Instance.new("TextButton", MainFrame)
    Button.Size = UDim2.new(0, 100, 0, 30)
    Button.Position = UDim2.new(#Tabs * 0.2, 0, 0, 0)
    Button.Text = name
    Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

    local Frame = Instance.new("Frame", MainFrame)
    Frame.Size = UDim2.new(1, 0, 1, -30)
    Frame.Position = UDim2.new(0, 0, 0, 30)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.Visible = false

    Button.MouseButton1Click:Connect(function()
        for _, tab in pairs(Tabs) do
            tab.Frame.Visible = false
        end
        Frame.Visible = true
    end)

    table.insert(Tabs, {Button = Button, Frame = Frame})
    return Frame
end

-- TAB: Fram Boss
local BossTab = CreateTab("Fram Boss")
local BossBtn = Instance.new("TextButton", BossTab)
BossBtn.Size = UDim2.new(0, 200, 0, 40)
BossBtn.Position = UDim2.new(0, 10, 0, 10)
BossBtn.Text = "Chạy Fram Boss"
BossBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/levinh888/Script-roblox/main/Script%20fram%20bosscucbq.lua"))()
end)

-- TAB: PvP
local PvPTab = CreateTab("PvP")

local TextBox = Instance.new("TextBox", PvPTab)
TextBox.Size = UDim2.new(0, 200, 0, 30)
TextBox.Position = UDim2.new(0, 10, 0, 10)
TextBox.PlaceholderText = "Nhập tên người chơi..."

local TeleportBtn = Instance.new("TextButton", PvPTab)
TeleportBtn.Size = UDim2.new(0, 200, 0, 30)
TeleportBtn.Position = UDim2.new(0, 10, 0, 50)
TeleportBtn.Text = "Dịch chuyển tới"
TeleportBtn.MouseButton1Click:Connect(function()
    local playerName = TextBox.Text
    local target = Players:FindFirstChild(playerName)
    if target and target.Character then
        LocalPlayer.Character:MoveTo(target.Character.HumanoidRootPart.Position)
    end
end)

local AutoAttack = Instance.new("TextButton", PvPTab)
AutoAttack.Size = UDim2.new(0, 200, 0, 30)
AutoAttack.Position = UDim2.new(0, 10, 0, 90)
AutoAttack.Text = "Auto Đánh"
AutoAttack.MouseButton1Click:Connect(function()
    _G.AutoPunch = not _G.AutoPunch
    while _G.AutoPunch do
        wait(0.5)
        local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then
            tool:Activate()
        end
    end
end)

-- TAB: Troll
local TrollTab = CreateTab("Troll")
local trollBtn = Instance.new("TextButton", TrollTab)
trollBtn.Size = UDim2.new(0, 200, 0, 40)
trollBtn.Position = UDim2.new(0, 10, 0, 10)
trollBtn.Text = "Troll: 100 Kiếm Quay"
trollBtn.MouseButton1Click:Connect(function()
    for i = 1, 100 do
        local sword = Instance.new("Part", workspace)
        sword.Size = Vector3.new(1, 4, 1)
        sword.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(i * 3.6), 0) * CFrame.new(0, 0, -5)
        sword.Anchored = true
        sword.BrickColor = BrickColor.Random()
    end
end)

-- TAB: FPS
local FPSTab = CreateTab("FPS Boost")

local btn1 = Instance.new("TextButton", FPSTab)
btn1.Size = UDim2.new(0, 200, 0, 40)
btn1.Position = UDim2.new(0, 10, 0, 10)
btn1.Text = "Giảm Hiệu Ứng 30%"
btn1.MouseButton1Click:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Enabled = false
        end
    end
end)

local btn2 = Instance.new("TextButton", FPSTab)
btn2.Size = UDim2.new(0, 200, 0, 40)
btn2.Position = UDim2.new(0, 10, 0, 60)
btn2.Text = "Ẩn Cây Cối 70%"
btn2.MouseButton1Click:Connect(function()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("MeshPart") or v:IsA("Part") or v:IsA("UnionOperation") then
            if v.Name:lower():find("tree") or v.Name:lower():find("leaf") then
                v.Transparency = 1
            end
        end
    end
end)

-- Toggle mở menu
OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)