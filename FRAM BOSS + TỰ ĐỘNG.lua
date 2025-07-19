--// Obfuscated by WOKINGLOG 🕶️
local _𝒫 = game:GetService;local _𝒫𝒍 = _𝒫("Players").LocalPlayer;local _𝒓 = _𝒫("RunService");local _𝒖 = _𝒫("UserInputService");local _𝒕 = _𝒫("TweenService")
local _𝒄𝒉𝒂𝒓 = _𝒫𝒍.Character or _𝒫𝒍.CharacterAdded:Wait();local _𝒉𝒓𝒑 = _𝒄𝒉𝒂𝒓:WaitForChild("HumanoidRootPart")
local 𝒏𝒑𝒄_𝒏𝒂𝒎𝒆 = "NPC2";local _𝒆, _𝒂𝒕, _𝒉𝒑 = false, false, false;local _𝒓𝒂𝒅𝒊𝒖𝒔, _𝒔𝒑𝒅, _𝒓𝒂𝒏𝒈𝒆 = 16, 2, 15
local _𝒈 = Instance.new("ScreenGui", _𝒫𝒍:WaitForChild("PlayerGui"));_𝒈.Name = "😎"
local _𝒇 = Instance.new("Frame", _𝒈);_𝒇.Position = UDim2.new(0, 20, 0, 80);_𝒇.Size = UDim2.new(0, 200, 0, 180)
_𝒇.BackgroundColor3 = Color3.fromRGB(50, 50, 50);_𝒇.BackgroundTransparency = 0.3;_𝒇.BorderSizePixel = 0

local function 𝒎(_𝒕𝒙𝒕, i, c)
	local b = Instance.new("TextButton", _𝒇)
	b.Size = UDim2.new(1, -10, 0, 30);b.Position = UDim2.new(0, 5, 0, 10 + i * 35);b.Text = _𝒕𝒙𝒕
	b.BackgroundColor3 = Color3.fromRGB(100, 100, 100);b.TextColor3 = Color3.fromRGB(255, 255, 255)
	b.MouseButton1Click:Connect(c);return b
end

𝒎("⚙️ Spin", 0, function() _𝒆 = not _𝒆 end)
𝒎("💥 Attack", 1, function() _𝒂𝒕 = not _𝒂𝒕 end)
𝒎("❤️ HP", 2, function() _𝒉𝒑 = not _𝒉𝒑 end)

local function 𝒈𝒆𝒕𝑵𝑷𝑪()
	for _, 𝒗 in next, workspace:GetDescendants() do
		if 𝒗:IsA("Model") and 𝒗.Name == 𝒏𝒑𝒄_𝒏𝒂𝒎𝒆 and 𝒗:FindFirstChild("HumanoidRootPart") then
			return 𝒗
		end
	end
end

local θ = 0
_𝒓.RenderStepped:Connect(function(d𝒕)
	if not _𝒆 then return end
	local t𝒈𝒕 = 𝒈𝒆𝒕𝑵𝑷𝑪() if not t𝒈𝒕 then return end
	θ += d𝒕 * _𝒔𝒑𝒅
	local 𝒙, 𝒛 = math.cos(θ) * _𝒓𝒂𝒅𝒊𝒖𝒔, math.sin(θ) * _𝒓𝒂𝒅𝒊𝒖𝒔
	local 𝒐𝒇𝒇 = Vector3.new(𝒙, 5, 𝒛)
	_𝒉𝒓𝒑.CFrame = CFrame.new(t𝒈𝒕.HumanoidRootPart.Position + 𝒐𝒇𝒇, t𝒈𝒕.HumanoidRootPart.Position)
end)

task.spawn(function()
	while true do task.wait(0.33)
		if _𝒂𝒕 then
			local 𝒕 = _𝒄𝒉𝒂𝒓:FindFirstChildOfClass("Tool")
			local 𝒕𝒈 = 𝒈𝒆𝒕𝑵𝑷𝑪()
			if 𝒕 and 𝒕𝒈 and (_𝒉𝒓𝒑.Position - 𝒕𝒈.HumanoidRootPart.Position).Magnitude < _𝒓𝒂𝒏𝒈𝒆 then
				pcall(function() 𝒕:Activate() end)
			end
		end
	end
end)

local 𝒃𝒈 = Instance.new("BillboardGui")
𝒃𝒈.Size = UDim2.new(0, 100, 0, 30);𝒃𝒈.StudsOffset = Vector3.new(0, 4, 0);𝒃𝒈.AlwaysOnTop = true
local 𝒍 = Instance.new("TextLabel", 𝒃𝒈)
𝒍.Size = UDim2.new(1, 0, 1, 0);𝒍.BackgroundTransparency = 1
𝒍.TextColor3 = Color3.new(1, 0, 0);𝒍.TextScaled = true

_𝒓.RenderStepped:Connect(function()
	if _𝒉𝒑 then
		local t = 𝒈𝒆𝒕𝑵𝑷𝑪()
		if t and t:FindFirstChild("Humanoid") then
			𝒃𝒈.Parent = t.HumanoidRootPart
			𝒍.Text = "❤️ " .. math.floor(t.Humanoid.Health)
		end
	end
end)