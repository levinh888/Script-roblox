--// FULL MENU GUI BY WOKING 👹 //--

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.ResetOnSpawn = false

--// 👹 ICON MỞ GUI
local openButton = Instance.new("TextButton")
openButton.Text = "👹"
openButton.Size = UDim2.new(0, 50, 0, 50)
openButton.Position = UDim2.new(0, 10, 0.5, -25)
openButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
openButton.TextScaled = true
openButton.Parent = ScreenGui

--// GUI CHÍNH
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 550, 0, 400)
Main.Position = UDim2.new(0.5, -275, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Main)
UICorner.CornerRadius = UDim.new(0, 12)

openButton.MouseButton1Click:Connect(function()
	Main.Visible = true
	openButton.Visible = false
end)

--// ĐÓNG MENU
local close = Instance.new("TextButton", Main)
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -45, 0, 5)
close.Text = "❌"
close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)

close.MouseButton1Click:Connect(function()
	Main.Visible = false
	openButton.Visible = true
end)

--// TABs
local Tabs = {}
local TabNames = {"PvP", "Troll", "FPS", "FarmBoss"}

for i, name in ipairs(TabNames) do
	local tab = Instance.new("TextButton")
	tab.Size = UDim2.new(0, 80, 0, 30)
	tab.Position = UDim2.new(0, 10 + (i - 1) * 90, 0, 10)
	tab.Text = name
	tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	tab.Parent = Main
	Tabs[name] = tab
end

--// NỘI DUNG
local ContentFrame = Instance.new("Frame", Main)
ContentFrame.Size = UDim2.new(1, -20, 1, -60)
ContentFrame.Position = UDim2.new(0, 10, 0, 50)
ContentFrame.BackgroundTransparency = 1

local function ClearContent()
	for _, child in ipairs(ContentFrame:GetChildren()) do
		child:Destroy()
	end
end

--// TAB PVP
local function PvPTab()
	ClearContent()

	local nameBox = Instance.new("TextBox", ContentFrame)
	nameBox.PlaceholderText = "Nhập @name người chơi"
	nameBox.Size = UDim2.new(0, 200, 0, 30)
	nameBox.Position = UDim2.new(0, 10, 0, 10)

	local confirm = Instance.new("TextButton", ContentFrame)
	confirm.Text = "Xác nhận (dịch chuyển)"
	confirm.Size = UDim2.new(0, 200, 0, 30)
	confirm.Position = UDim2.new(0, 10, 0, 50)
	confirm.MouseButton1Click:Connect(function()
		local target = Players:FindFirstChild(nameBox.Text)
		if target and target.Character then
			LocalPlayer.Character:MoveTo(target.Character:GetPivot().Position + Vector3.new(0,2,0))
		end
	end)

	local autoAttack = Instance.new("TextButton", ContentFrame)
	autoAttack.Text = "TỰ ĐÁNH 🔪"
	autoAttack.Size = UDim2.new(0, 200, 0, 30)
	autoAttack.Position = UDim2.new(0, 10, 0, 90)

	local attacking = false
	autoAttack.MouseButton1Click:Connect(function()
		attacking = not attacking
		autoAttack.Text = attacking and "ĐANG TỰ ĐÁNH ✅" or "TỰ ĐÁNH 🔪"
	end)

	RunService.RenderStepped:Connect(function()
		if attacking and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool") then
			local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
			pcall(function() tool:Activate() end)
		end
	end)

	local jump = Instance.new("TextButton", ContentFrame)
	jump.Text = "AUTO NHẢY"
	jump.Size = UDim2.new(0, 200, 0, 30)
	jump.Position = UDim2.new(0, 10, 0, 130)

	jump.MouseButton1Click:Connect(function()
		while jump.Text == "ĐANG NHẢY ⬆️" do
			wait(0.2)
			LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)

	local pc = Instance.new("TextButton", ContentFrame)
	pc.Text = "MÀN HÌNH PC 🖥️"
	pc.Size = UDim2.new(0, 200, 0, 30)
	pc.Position = UDim2.new(0, 10, 0, 170)
	pc.MouseButton1Click:Connect(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Hiệu ứng",
			Text = "Đã bật giao diện nhìn như PC!",
			Duration = 5
		})
	end)

	local hitbox = Instance.new("TextButton", ContentFrame)
	hitbox.Text = "HITBOX TOOL"
	hitbox.Size = UDim2.new(0, 200, 0, 30)
	hitbox.Position = UDim2.new(0, 10, 0, 210)
	hitbox.MouseButton1Click:Connect(function()
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= LocalPlayer and player.Character then
				for _, v in ipairs(player.Character:GetDescendants()) do
					if v:IsA("BasePart") and player.Character:FindFirstChildOfClass("Tool") then
						v.Size = Vector3.new(9,9,9)
						v.Transparency = 0.5
						v.Color = Color3.fromRGB(255, 0, 0)
					end
				end
			end
		end
	end)

	local hpShow = Instance.new("TextButton", ContentFrame)
	hpShow.Text = "MÁU KẺ ĐỊCH 💉"
	hpShow.Size = UDim2.new(0, 200, 0, 30)
	hpShow.Position = UDim2.new(0, 10, 0, 250)
	hpShow.MouseButton1Click:Connect(function()
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Humanoid") then
				local tag = Instance.new("BillboardGui", plr.Character)
				tag.Size = UDim2.new(0,100,0,40)
				tag.AlwaysOnTop = true
				local text = Instance.new("TextLabel", tag)
				text.Size = UDim2.new(1,0,1,0)
				text.BackgroundTransparency = 1
				text.Text = "❤️ "..math.floor(plr.Character.Humanoid.Health)
				text.TextColor3 = Color3.fromRGB(255,0,0)
			end
		end
	end)
end

--// TAB TROLL
local function TrollTab()
	ClearContent()

	local swordCircle = Instance.new("TextButton", ContentFrame)
	swordCircle.Text = "💫 100 CÂY KIẾM QUAY QUANH"
	swordCircle.Size = UDim2.new(0, 300, 0, 30)
	swordCircle.Position = UDim2.new(0, 10, 0, 10)
	swordCircle.MouseButton1Click:Connect(function()
		for i = 1, 100 do
			local part = Instance.new("Part", workspace)
			part.Anchored = true
			part.Size = Vector3.new(0.5, 2, 0.5)
			part.Shape = Enum.PartType.Cylinder
			part.Color = Color3.fromRGB(255, 255 - i*2, i*2)
			RunService.RenderStepped:Connect(function()
				if LocalPlayer.Character then
					local pos = LocalPlayer.Character:GetPivot().Position
					local angle = math.rad(i * 360 / 100 + tick() * 100)
					part.Position = pos + Vector3.new(math.cos(angle)*5, 2, math.sin(angle)*5)
				end
			end)
		end
	end)

	local moveTrail = Instance.new("TextButton", ContentFrame)
	moveTrail.Text = "🌈 DI CHUYỂN HIỆU ỨNG"
	moveTrail.Size = UDim2.new(0, 300, 0, 30)
	moveTrail.Position = UDim2.new(0, 10, 0, 50)
	moveTrail.MouseButton1Click:Connect(function()
		local trail = Instance.new("Trail", LocalPlayer.Character.HumanoidRootPart)
		local att0 = Instance.new("Attachment", LocalPlayer.Character.HumanoidRootPart)
		local att1 = Instance.new("Attachment", LocalPlayer.Character.HumanoidRootPart)
		att1.Position = Vector3.new(0, -2, 0)
		trail.Attachment0 = att0
		trail.Attachment1 = att1
		trail.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(100,0,255))
		}
		trail.Lifetime = 1
	end)
end

--// TAB FPS
local function FPSTab()
	ClearContent()

	local fps1 = Instance.new("TextButton", ContentFrame)
	fps1.Text = "⚙️ GIẢM 30%"
	fps1.Size = UDim2.new(0, 200, 0, 30)
	fps1.Position = UDim2.new(0, 10, 0, 10)
	fps1.MouseButton1Click:Connect(function()
		for _, v in ipairs(workspace:GetDescendants()) do
			if v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Enabled = false
			end
		end
	end)

	local fps2 = Instance.new("TextButton", ContentFrame)
	fps2.Text = "🪵 GIẢM 70% CÂY"
	fps2.Size = UDim2.new(0, 200, 0, 30)
	fps2.Position = UDim2.new(0, 10, 0, 50)
	fps2.MouseButton1Click:Connect(function()
		for _, v in ipairs(workspace:GetDescendants()) do
			if v:IsA("MeshPart") and v.Name:lower():find("tree") then
				v.Transparency = 0.9
			end
		end
	end)

	local maxfps = Instance.new("TextButton", ContentFrame)
	maxfps.Text = "🚀 FPS CHUẨN"
	maxfps.Size = UDim2.new(0, 200, 0, 30)
	maxfps.Position = UDim2.new(0, 10, 0, 90)
	maxfps.MouseButton1Click:Connect(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
	end)
end

--// TAB FARM BOSS
local function FarmBossTab()
	ClearContent()

	local label = Instance.new("TextLabel", ContentFrame)
	label.Text = "👑 AUTO FARM BOSS"
	label.Size = UDim2.new(0, 300, 0, 30)
	label.Position = UDim2.new(0, 10, 0, 10)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(255,215,0)
	label.TextScaled = true

	local runBtn = Instance.new("TextButton", ContentFrame)
	runBtn.Text = "⚔️ CHẠY SCRIPT FARM BOSS"
	runBtn.Size = UDim2.new(0, 250, 0, 40)
	runBtn.Position = UDim2.new(0, 10, 0, 60)
	runBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	runBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	runBtn.TextScaled = true

	runBtn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/levinh888/Script-roblox/main/Script%20fram%20bosscucbq.lua"))()
	end)
end

--// KẾT NỐI CÁC TAB
Tabs["PvP"].MouseButton1Click:Connect(PvPTab)
Tabs["Troll"].MouseButton1Click:Connect(TrollTab)
Tabs["FPS"].MouseButton1Click:Connect(FPSTab)
Tabs["FarmBoss"].MouseButton1Click:Connect(FarmBossTab)

--// MỞ SẴN TAB PVP
PvPTab()