--// BY WOKING ☠️ SCRIPT FULL AIM + HITBOX + GUI //--

local P,LP,G = game.Players,game.Players.LocalPlayer,game
local H,C = LP.Character or LP.CharacterAdded:Wait(),workspace.CurrentCamera
local UIS,MIS,RS,TS = G:GetService("UserInputService"),G:GetService("MarketplaceService"),G:GetService("RunService"),G:GetService("TweenService")

local gui = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
gui.Name = "WOKING_UI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 150, 0, 220)
frame.Position = UDim2.new(0, 20, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0

local UIListLayout = Instance.new("UIListLayout", frame)
UIListLayout.Padding = UDim.new(0, 6)

local toggles = {
    Aim = false,
    Hitbox = false,
    AutoAttack = false,
    HPBar = false
}

local function createToggle(txt, key)
    local b = Instance.new("TextButton", frame)
    b.Size = UDim2.new(1, -10, 0, 30)
    b.Text = txt..": OFF"
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.MouseButton1Click:Connect(function()
        toggles[key] = not toggles[key]
        b.Text = txt..": "..(toggles[key] and "ON" or "OFF")
    end)
end

createToggle("🎯 Aim Lock", "Aim")
createToggle("🟦 Hitbox", "Hitbox")
createToggle("⚔️ Auto Attack", "AutoAttack")
createToggle("❤️ HP Bar", "HPBar")

-- Auto Attack
RS.Heartbeat:Connect(function()
    if toggles.AutoAttack and LP.Character and LP.Character:FindFirstChildOfClass("Tool") then
        local tool = LP.Character:FindFirstChildOfClass("Tool")
        local click = tool:FindFirstChildWhichIsA("RemoteEvent") or tool:FindFirstChildWhichIsA("RemoteFunction")
        if click then pcall(function() click:FireServer() end) end
    end
end)

-- HP Display
function attachHPBar(char)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    local billboard = Instance.new("BillboardGui", char)
    billboard.Name = "HP_BAR"
    billboard.Size = UDim2.new(5,0,0.5,0)
    billboard.Adornee = char:FindFirstChild("Head")
    billboard.AlwaysOnTop = true
    local txt = Instance.new("TextLabel", billboard)
    txt.Size = UDim2.new(1,0,1,0)
    txt.BackgroundTransparency = 1
    txt.TextColor3 = Color3.new(1,0,0)
    txt.TextScaled = true
    RS.RenderStepped:Connect(function()
        if toggles.HPBar and hum and hum.Health > 0 then
            txt.Text = math.floor(hum.Health).."/"..math.floor(hum.MaxHealth)
        else
            txt.Text = ""
        end
    end)
end

for _,p in pairs(P:GetPlayers()) do
    if p ~= LP then
        p.CharacterAdded:Connect(attachHPBar)
        if p.Character then attachHPBar(p.Character) end
    end
end

-- Aim Lock
local target = nil
function getClosestEnemy()
    local dist,closest = math.huge,nil
    for _,p in pairs(P:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Team ~= LP.Team then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            local pos, onScreen = C:WorldToViewportPoint(hrp.Position)
            local mPos = UIS:GetMouseLocation()
            local mag = (Vector2.new(pos.X,pos.Y) - mPos).Magnitude
            if mag < dist and onScreen then dist = mag closest = p.Character end
        end
    end
    return closest
end

-- Hitbox
local function squareHitbox()
    local box = Instance.new("Part", workspace)
    box.Anchored = true
    box.CanCollide = false
    box.Size = Vector3.new(6,6,6)
    box.Color = Color3.fromRGB(0,255,255)
    box.Material = Enum.Material.Neon
    box.Transparency = 0.4
    box.Shape = Enum.PartType.Block
    return box
end

local box = squareHitbox()

RS.RenderStepped:Connect(function()
    if toggles.Aim then
        target = getClosestEnemy()
        if target and target:FindFirstChild("HumanoidRootPart") then
            C.CFrame = CFrame.new(C.CFrame.Position, target.HumanoidRootPart.Position)
        end
    end

    if toggles.Hitbox and H and H:FindFirstChild("HumanoidRootPart") then
        local pos = H.HumanoidRootPart.Position
        box.CFrame = CFrame.new(pos) * CFrame.Angles(0, tick()*3, 0)
    else
        box.Transparency = 1
    end
end)