-- SCRIPT MENU WOKINGLOG 👹 + MẬT KHẨU: "I LOVE VN"

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local UIS = game:GetService("UserInputService")

-- Tạo GUI Mật khẩu
local passwordGui = Instance.new("ScreenGui", game.CoreGui)
passwordGui.Name = "PasswordGUI"

local passFrame = Instance.new("Frame", passwordGui)
passFrame.Size = UDim2.new(0, 300, 0, 150)
passFrame.Position = UDim2.new(0.35, 0, 0.35, 0)
passFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
passFrame.BorderSizePixel = 0
passFrame.Active = true
passFrame.Draggable = true

local title = Instance.new("TextLabel", passFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "🔒 NHẬP MẬT KHẨU ĐỂ MỞ TOOL"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local textBox = Instance.new("TextBox", passFrame)
textBox.Size = UDim2.new(0.9, 0, 0, 35)
textBox.Position = UDim2.new(0.05, 0, 0, 50)
textBox.PlaceholderText = "Nhập mật khẩu..."
textBox.Text = ""
textBox.Font = Enum.Font.Gotham
textBox.TextColor3 = Color3.fromRGB(255,255,255)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.TextSize = 14

local confirm = Instance.new("TextButton", passFrame)
confirm.Size = UDim2.new(0.5, 0, 0, 30)
confirm.Position = UDim2.new(0.25, 0, 0, 100)
confirm.Text = "[ Xác nhận ]"
confirm.Font = Enum.Font.GothamBold
confirm.TextColor3 = Color3.fromRGB(255,255,255)
confirm.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
confirm.TextSize = 14

-- Mật khẩu đúng
local correctPassword = "I LOVE VN"

-- Tạo Menu Chính (ẩn trước)
local function createMainMenu()
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    ScreenGui.Name = "WokingMenu"

    local Frame = Instance.new("Frame", ScreenGui)
    Frame.Size = UDim2.new(0, 300, 0, 200)
    Frame.Position = UDim2.new(0.4, 0, 0.3, 0)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Text = "SCRIPT BY WOKINGLOG 👹"
    Title.TextColor3 = Color3.fromRGB(255, 70, 70)
    Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 15

    local function createButton(name, posY)
        local btn = Instance.new("TextButton", Frame)
        btn.Size = UDim2.new(0.9, 0, 0, 30)
        btn.Position = UDim2.new(0.05, 0, 0, posY)
        btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.Text = name .. " [TẮT]"
        return btn
    end

    local hitboxEnabled = false
    local fastAttackEnabled = false

    local hitboxBtn = createButton("HITBOX", 50)
    hitboxBtn.MouseButton1Click:Connect(function()
        hitboxEnabled = not hitboxEnabled
        hitboxBtn.Text = "HITBOX [" .. (hitboxEnabled and "BẬT" or "TẮT") .. "]"

        if hitboxEnabled then
            task.spawn(function()
                while hitboxEnabled do
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local root = player.Character.HumanoidRootPart
                            pcall(function()
                                root.Size = Vector3.new(17, 17, 17)
                                root.Transparency = 0.8
                                root.BrickColor = BrickColor.new("Bright red")
                                root.Material = Enum.Material.ForceField
                                root.CanCollide = false
                                root.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                                root.Anchored = false
                            end)
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    end)

    local fastBtn = createButton("ĐÁNH NHANH", 90)
    fastBtn.MouseButton1Click:Connect(function()
        fastAttackEnabled = not fastAttackEnabled
        fastBtn.Text = "ĐÁNH NHANH [" .. (fastAttackEnabled and "BẬT" or "TẮT") .. "]"

        if fastAttackEnabled then
            task.spawn(function()
                while fastAttackEnabled do
                    local char = LocalPlayer.Character
                    if char then
                        local tool = char:FindFirstChildOfClass("Tool")
                        if tool and char:FindFirstChild("HumanoidRootPart") then
                            local speed = char.HumanoidRootPart.Velocity.Magnitude
                            if speed > 1 then
                                pcall(function()
                                    tool:Activate()
                                    wait(0.05)
                                    tool:Deactivate()
                                end)
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end)
end

-- Xử lý xác nhận mật khẩu
confirm.MouseButton1Click:Connect(function()
    if textBox.Text == correctPassword then
        passwordGui:Destroy()
        createMainMenu()
    else
        confirm.Text = "❌ SAI MẬT KHẨU"
        wait(1.5)
        confirm.Text = "[ Xác nhận ]"
    end
end)