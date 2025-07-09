
-- 🔥 FRAM BOSS FULL COMBO MENU - By ChatGPT x Vinh WOKINGLOG 👹

local __dJudSGgiPfGP = game:GetService("__dJudSGgiPfGP")
local __jRZIfh0AkdCG = game:GetService("__jRZIfh0AkdCG")
local __29G4Doisv1zf = game:GetService("__29G4Doisv1zf")
local __E4M3AwXs9TUh = __dJudSGgiPfGP.LocalPlayer

local __ITe9m9DKSOiv = false
local __l1mAsYdQaL4y

-- 👁 GUI
local __nZH4ZBJIFeL0 = Instance.new("ScreenGui", __E4M3AwXs9TUh:WaitForChild("PlayerGui"))
__nZH4ZBJIFeL0.Name = "FramBossUI"

local __KvXMeHKRRLLS = Instance.new("TextButton", __nZH4ZBJIFeL0)
__KvXMeHKRRLLS.Size = UDim2.new(0, 160, 0, 40)
__KvXMeHKRRLLS.Position = UDim2.new(1, -170, 0, 20)
__KvXMeHKRRLLS.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
__KvXMeHKRRLLS.TextColor3 = Color3.fromRGB(255, 255, 255)
__KvXMeHKRRLLS.Font = Enum.Font.GothamBold
__KvXMeHKRRLLS.TextSize = 20
__KvXMeHKRRLLS.Text = "BẬT FRAM BOSS 👹"
__KvXMeHKRRLLS.TextStrokeTransparency = 0.2
__KvXMeHKRRLLS.BorderSizePixel = 0
__KvXMeHKRRLLS.BackgroundTransparency = 0.2

local __KMI6Ogs0JhKF = Instance.new("TextLabel", __nZH4ZBJIFeL0)
__KMI6Ogs0JhKF.Size = UDim2.new(0, 250, 0, 35)
__KMI6Ogs0JhKF.Position = UDim2.new(0, 15, 0, 15)
__KMI6Ogs0JhKF.BackgroundTransparency = 0.3
__KMI6Ogs0JhKF.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
__KMI6Ogs0JhKF.TextColor3 = Color3.fromRGB(255, 80, 80)
__KMI6Ogs0JhKF.Font = Enum.Font.GothamBold
__KMI6Ogs0JhKF.TextSize = 22
__KMI6Ogs0JhKF.TextStrokeTransparency = 0.2
__KMI6Ogs0JhKF.Visible = false

-- 📌 Tìm Boss gần nhất
local function __z5zPtzOWsvGg()
	local __VPOuxWCeJ4py = __E4M3AwXs9TUh.Character and __E4M3AwXs9TUh.Character:FindFirstChild("HumanoidRootPart")
	if not __VPOuxWCeJ4py then return end

	local nearest, dist = nil, math.huge
	for _, model in pairs(workspace:GetDescendants()) do
		if model:IsA("Model") and (model.Name:lower():find("npc") or model.Name:lower():find("enemy") or model.Name:lower():find("boss") or model.Name:lower():find("human")) then
			local __aUzfXCgYQ6Iy = model:FindFirstChild("HumanoidRootPart")
			local __mglNFovolqbr = model:FindFirstChildWhichIsA("Humanoid")
			if __aUzfXCgYQ6Iy and __mglNFovolqbr then
				local d = (__VPOuxWCeJ4py.Position - __aUzfXCgYQ6Iy.Position).Magnitude
				if d < dist then
					dist = d
					nearest = model
				end
			end
		end
	end
	return nearest
end

-- 🌀 Chức năng chính
local function __eTqkIsG8zk0u()
	local __4hK67daikQZs = __E4M3AwXs9TUh.Character or __E4M3AwXs9TUh.CharacterAdded:Wait()
	local __VPOuxWCeJ4py = __4hK67daikQZs:WaitForChild("HumanoidRootPart")

	local __AV0T1eemvSXj = 0
	local __4nE8N3S932Xd = 12
	local __8frFAOnv8e8D = 2
	local __czR55UcBah6A, __Q1ojVSsrP7Mv = 0, 0

	__l1mAsYdQaL4y = __jRZIfh0AkdCG.RenderStepped:Connect(function()
		local __5eE0OhFZeC4H = __z5zPtzOWsvGg()
		if not __5eE0OhFZeC4H then
			__KMI6Ogs0JhKF.Visible = false
			return
		end

		local __aUzfXCgYQ6Iy = __5eE0OhFZeC4H:FindFirstChild("HumanoidRootPart")
		local __mglNFovolqbr = __5eE0OhFZeC4H:FindFirstChildWhichIsA("Humanoid")
		if not __aUzfXCgYQ6Iy or not __mglNFovolqbr then
			__KMI6Ogs0JhKF.Visible = false
			return
		end

		-- 🌀 Fly quanh Boss
		__AV0T1eemvSXj += __8frFAOnv8e8D * 10
		local x = math.cos(__AV0T1eemvSXj) * __4nE8N3S932Xd
		local z = math.sin(__AV0T1eemvSXj) * __4nE8N3S932Xd
		local __aZvkBnUigyNx = __aUzfXCgYQ6Iy.Position + Vector3.new(x, 4, z)
		__VPOuxWCeJ4py.CFrame = CFrame.new(__aZvkBnUigyNx, __aUzfXCgYQ6Iy.Position)

		-- 🎯 GIM camera vào Boss
		workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, __aUzfXCgYQ6Iy.Position)

		-- 🔒 Anti AFK
		__czR55UcBah6A += 1
		if __czR55UcBah6A % 600 == 0 then
			__VPOuxWCeJ4py.CFrame = __VPOuxWCeJ4py.CFrame * CFrame.new(0, 0.1, 0)
		end

		-- 🗡️ Auto đánh khi cầm tool
		__Q1ojVSsrP7Mv += 1
		if __E4M3AwXs9TUh.Character:FindFirstChildOfClass("Tool") and __Q1ojVSsrP7Mv % 5 == 0 then
			__29G4Doisv1zf:SendMouseButtonEvent(0, 0, 0, true, game, 0)
			wait()
			__29G4Doisv1zf:SendMouseButtonEvent(0, 0, 0, false, game, 0)
		end

		-- ❤️ Hiển thị máu Boss
		__KMI6Ogs0JhKF.Visible = true
		__KMI6Ogs0JhKF.Text = "❤️ Boss: " .. math.floor(__mglNFovolqbr.Health) .. " / " .. math.floor(__mglNFovolqbr.MaxHealth)
	end)
end

-- ❌ Tắt Fram Boss
local function __mqBwoYPKx8mK()
	if __l1mAsYdQaL4y then
		__l1mAsYdQaL4y:Disconnect()
		__l1mAsYdQaL4y = nil
	end
	__KMI6Ogs0JhKF.Visible = false
end

-- 🧩 Nút bật/tắt
__KvXMeHKRRLLS.MouseButton1Click:Connect(function()
	__ITe9m9DKSOiv = not __ITe9m9DKSOiv
	if __ITe9m9DKSOiv then
		__eTqkIsG8zk0u()
		__KvXMeHKRRLLS.Text = "ĐÃ BẬT FRAM BOSS ✅"
		__KvXMeHKRRLLS.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
	else
		__mqBwoYPKx8mK()
		__KvXMeHKRRLLS.Text = "ĐÃ TẮT FRAM BOSS ❌"
		__KvXMeHKRRLLS.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
	end
end)
