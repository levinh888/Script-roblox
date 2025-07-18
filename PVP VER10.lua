-- 📦 PvP GUI: Hitbox Siêu Rộng + Auto Attack Khi Cầm Vũ Khí (Fake Click)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer

-- 🧠 Cấu hình trạng thái
local hitboxOn = true
local autoAttackOn = true

-- 🖼️ Tạo GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "PvPGui"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 200, 0, 130)
frame.Position = UDim2.new(0, 50, 0, 200)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

Instance.new("UICorner", frame)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "⚔️ PvP Menu"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

-- 🔘 Nút bật/tắt Hitbox
local hitboxBtn = Instance.new("TextButton", frame)
hitboxBtn.Size = UDim2.new(1, -20, 0, 30)
hitboxBtn.Position = UDim2.new(0, 10, 0, 40)
hitboxBtn.Text = "✅ Hitbox: ON"
hitboxBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
hitboxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
hitboxBtn.Font = Enum.Font.Gotham
hitboxBtn.TextSize = 14

-- 🔘 Nút bật/tắt Auto Attack
local attackBtn = Instance.new("TextButton", frame)
attackBtn.Size = UDim2.new(1, -20, 0, 30)
attackBtn.Position = UDim2.new(0, 10, 0, 80)
attackBtn.Text = "✅ Auto Attack: ON"
attackBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
attackBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
attackBtn.Font = Enum.Font.Gotham
attackBtn.TextSize = 14

-- 💥 Hiển thị Hitbox Siêu Rộng (màu nhạt)
local function createHitbox(part)
	if part:FindFirstChild("HitboxGui") then return end
	local adorn = Instance.new("BoxHandleAdornment")
	adorn.Name = "HitboxGui"
	adorn.Adornee = part
	adorn.AlwaysOnTop = true
	adorn.ZIndex = 10
	adorn.Color3 = Color3.fromRGB(255, 150, 150)
	adorn.Transparency = 0.75
	adorn.Size = part.Size * 5.5
	adorn.CFrame = CFrame.new()
	adorn.Parent = part
end

-- Cập nhật hitbox
local function updateHitboxes()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			for _, partName in ipairs({"Head", "Torso", "UpperTorso", "LowerTorso", "HumanoidRootPart", "LeftArm", "RightArm", "LeftLeg", "RightLeg"}) do
				local part = player.Character:FindFirstChild(partName)
				if part then
					if hitboxOn and not part:FindFirstChild("HitboxGui") then
						createHitbox(part)
					elseif not hitboxOn and part:FindFirstChild("HitboxGui") then
						part:FindFirstChild("HitboxGui"):Destroy()
					end
				end
			end
		end
	end
end

-- 🔁 Luôn cập nhật hitbox
RunService.RenderStepped:Connect(function()
	pcall(updateHitboxes)
end)

-- ⚔️ Tự đánh khi cầm vũ khí (fake click chuột)
local function hasToolEquipped()
	local char = LocalPlayer.Character
	if not char then return false end
	for _, item in ipairs(char:GetChildren()) do
		if item:IsA("Tool") then
			return true
		end
	end
	return false
end

spawn(function()
	while true do
		if autoAttackOn and hasToolEquipped() then
			-- Giả lập click chuột trái
			VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
			wait(0.05)
			VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
		end
		wait(0.15)
	end
end)

-- 🔘 Toggle nút Hitbox
hitboxBtn.MouseButton1Click:Connect(function()
	hitboxOn = not hitboxOn
	hitboxBtn.Text = hitboxOn and "✅ Hitbox: ON" or "❌ Hitbox: OFF"
end)

-- 🔘 Toggle nút Auto Attack
attackBtn.MouseButton1Click:Connect(function()
	autoAttackOn = not autoAttackOn
	attackBtn.Text = autoAttackOn and "✅ Auto Attack: ON" or "❌ Auto Attack: OFF"
end)