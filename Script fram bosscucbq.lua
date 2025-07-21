--// WOKING FULL FARM BOSS UI ☠️

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Chờ nhân vật xuất hiện
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- Tên Boss cần farm
local BossName = "NPC2" -- ✅ Đổi tên nếu cần

-- UI khởi tạo
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.ResetOnSpawn = false
ScreenGui.Name = "WOKING_UI"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 250, 0, 180)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.BackgroundTransparency = 0.2
Frame.BorderSizePixel = 0

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

local UIListLayout = Instance.new("UIListLayout", Frame)
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.FillDirection = Enum.FillDirection.Vertical
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Hàm tạo Toggle
function addToggle(text)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 230, 0, 30)
    button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    button.Text = "❌ " .. text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.AutoButtonColor = true
    button.Parent = Frame

    local state = false
    button.MouseButton1Click:Connect(function()
        state = not state
        button.Text = (state and "✅ " or "❌ ") .. text
    end)

    return function() return state end
end

-- Toggle chức năng
local isFarmEnabled = addToggle("Farm Boss")
local isAutoAttack = addToggle("Tự Đánh")
local isAutoPickup = addToggle("Nhặt Tool/Vật phẩm")
local isShowHP = addToggle("Hiển thị máu Boss")

-- Tìm NPC theo tên
local function findNPC(name)
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name == name and v:FindFirstChild("HumanoidRootPart") then
            return v
        end
    end
end

-- Hiển thị HP boss
local bossHPLabel = Instance.new("TextLabel", ScreenGui)
bossHPLabel.Size = UDim2.new(0, 200, 0, 30)
bossHPLabel.Position = UDim2.new(0.5, -100, 0.05, 0)
bossHPLabel.BackgroundTransparency = 1
bossHPLabel.TextColor3 = Color3.new(1, 0, 0)
bossHPLabel.TextStrokeTransparency = 0
bossHPLabel.TextSize = 20
bossHPLabel.Font = Enum.Font.GothamBold
bossHPLabel.Visible = false

-- Biến farm
local angle = 0
local radius = 19
local speed = 1.20

-- Luôn quay mặt về boss khi farm
RunService.RenderStepped:Connect(function(dt)
    local npc = findNPC(BossName)
    if npc and isFarmEnabled() then
        local npcHRP = npc:FindFirstChild("HumanoidRootPart")
        if npcHRP then
            angle += speed * dt
            local x = npcHRP.Position.X + math.cos(angle) * radius
            local z = npcHRP.Position.Z + math.sin(angle) * radius
            local y = npcHRP.Position.Y

            local newPosition = Vector3.new(x, y, z)
            hrp.CFrame = CFrame.new(newPosition, npcHRP.Position) -- ✅ Fix: luôn quay mặt về boss
        end
    end

    if npc and isShowHP() then
        local hp = npc:FindFirstChildOfClass("Humanoid")
        if hp then
            bossHPLabel.Visible = true
            bossHPLabel.Text = "❤️ Boss HP: " .. math.floor(hp.Health) .. " / " .. math.floor(hp.MaxHealth)
        end
    else
        bossHPLabel.Visible = false
    end
end)

-- Tự đánh (nếu có tool)
task.spawn(function()
    while task.wait(0.3) do
        if isAutoAttack() then
            local tool = player.Character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Handle") then
                for _, v in pairs(tool:GetDescendants()) do
                    if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                        pcall(function()
                            if v:IsA("RemoteEvent") then
                                v:FireServer()
                            elseif v:IsA("RemoteFunction") then
                                v:InvokeServer()
                            end
                        end)
                    end
                end
                tool:Activate()
            end
        end
    end
end)

-- Tự nhặt Tool/Vật phẩm gần
task.spawn(function()
    while task.wait(1) do
        if isAutoPickup() then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Tool") and v:FindFirstChild("Handle") and (v.Handle.Position - hrp.Position).Magnitude < 20 then
                    firetouchinterest(hrp, v.Handle, 0)
                    firetouchinterest(hrp, v.Handle, 1)
                end
            end
        end
    end
end)
