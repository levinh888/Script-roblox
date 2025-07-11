local g, ws, rs = game, workspace, game:GetService("RunService")
local lp, cg, vs = game.Players.LocalPlayer, game.CoreGui, game:GetService("VirtualUser")
pcall(function() if cg:FindFirstChild("PV_UI") then cg.PV_UI:Destroy() end end)

local gui = Instance.new("ScreenGui", cg) gui.Name = "PV_UI"
local ic = Instance.new("ImageButton", gui) ic.Size = UDim2.new(0,38,0,38) ic.Position = UDim2.new(0,8,0.5,-20)
ic.Image = "rbxassetid://3926307971" ic.BackgroundTransparency = 1 ic.ImageRectOffset = Vector2.new(964,324) ic.ImageRectSize = Vector2.new(36,36)

local fr = Instance.new("Frame", gui) fr.Size = UDim2.new(0,260,0,340) fr.Position = UDim2.new(0.5,-130,0.5,-170)
fr.BackgroundColor3 = Color3.fromRGB(25,25,25) fr.BorderSizePixel = 0 fr.Active = true fr.Draggable = true

local lay = Instance.new("UIListLayout", fr) lay.Padding = UDim.new(0,5)
local t = Instance.new("TextLabel", fr) t.Size = UDim2.new(1,0,0,28) t.Text = "⚔️ PvP Super Tool ⚔️"
t.BackgroundTransparency = 1 t.TextColor3 = Color3.new(1,1,1) t.Font = Enum.Font.GothamBold t.TextSize = 15

ic.MouseButton1Click:Connect(function() fr.Visible = not fr.Visible end)
lp.Idled:Connect(function() vs:Button2Down(Vector2.new(),ws.CurrentCamera.CFrame) wait(1) vs:Button2Up(Vector2.new(),ws.CurrentCamera.CFrame) end)

local mk = function(tx,cb)
	local b = Instance.new("TextButton", fr) b.Size = UDim2.new(0.92,0,0,28) b.BackgroundColor3 = Color3.fromRGB(40,40,40)
	b.BorderSizePixel = 0 b.Text = "🔘 "..tx b.Font = Enum.Font.Gotham b.TextColor3 = Color3.new(1,1,1) b.TextSize = 14
	local on = false
	b.MouseButton1Click:Connect(function()
		on = not on b.Text = (on and "✅ " or "🔘 ")..tx cb(on)
	end)
end

-- AIMBOT
mk("Aimbot", function(st)
	if st then
		_G.ab = true
		rs.RenderStepped:Connect(function()
			if not _G.ab then return end
			local cam = ws.CurrentCamera local dist = math.huge local tar
			for _,p in pairs(game.Players:GetPlayers()) do
				if p~=lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
					local d = (p.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude
					if d < dist then dist = d tar = p end
				end
			end
			if tar then cam.CFrame = CFrame.new(cam.CFrame.Position, tar.Character.HumanoidRootPart.Position) end
		end)
	else _G.ab = false
	end
end)

-- ESP
mk("ESP", function(st)
	if st then
		for _,p in pairs(game.Players:GetPlayers()) do
			if p~=lp and p.Character and p.Character:FindFirstChild("Head") then
				local bb = Instance.new("BillboardGui", p.Character.Head)
				bb.Name = "ESPV" bb.Size = UDim2.new(0,100,0,20) bb.AlwaysOnTop = true
				local tx = Instance.new("TextLabel", bb) tx.Size = UDim2.new(1,0,1,0) tx.Text = p.Name
				tx.TextColor3 = Color3.fromRGB(255,0,0) tx.TextScaled = true tx.BackgroundTransparency = 1
			end
		end
	else
		for _,p in pairs(game.Players:GetPlayers()) do
			if p.Character then
				for _,c in pairs(p.Character:GetChildren()) do if c:IsA("BillboardGui") and c.Name=="ESPV" then c:Destroy() end end
			end
		end
	end
end)

-- ✅ AUTO ATTACK
mk("Auto Attack", function(st)
	if st then
		_G.aAtk = true
		task.spawn(function()
			while _G.aAtk do wait(0.25)
				local toolEquipped = false
				for _,v in pairs(lp.Character:GetChildren()) do if v:IsA("Tool") then toolEquipped = true break end end
				if toolEquipped then
					for _,p in pairs(game.Players:GetPlayers()) do
						if p ~= lp and p.Character and (p.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).Magnitude < 10 then
							for _,tool in pairs(lp.Character:GetChildren()) do if tool:IsA("Tool") then tool:Activate() end end
						end
					end
				end
			end
		end)
	else _G.aAtk = false
	end
end)

-- SPEED
mk("Speed", function(st)
	lp.Character.Humanoid.WalkSpeed = st and 55 or 16
end)

-- FLY
mk("Fly (phím E)", function(st)
	if st then loadstring(game:HttpGet("https://pastebin.com/raw/YvdZbE2f"))() end
end)

-- NO COOLDOWN
mk("No Cooldown", function(st)
	if st then
		for _,f in pairs(getgc(true)) do
			if type(f)=="function" and debug.getinfo(f).name=="cooldown" then
				hookfunction(f, function() return end)
			end
		end
	end
end)

-- HITBOX
mk("Hitbox", function(st)
	for _,p in pairs(game.Players:GetPlayers()) do
		if p~=lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			local h = p.Character.HumanoidRootPart
			if st then
				h.Size = Vector3.new(10,10,10) h.Transparency = 0.5 h.Material = Enum.Material.Neon h.BrickColor = BrickColor.Red()
			else h.Size = Vector3.new(2,2,1) h.Transparency = 1 end
		end
	end
end)

-- 🧲 GIM CHẶT ĐỊCH
mk("Gim Chặt Địch", function(st)
	if st then
		_G.lockDir = true
		rs.RenderStepped:Connect(function()
			if not _G.lockDir then return end
			local closest, d = nil, math.huge
			for _,pl in pairs(game.Players:GetPlayers()) do
				if pl ~= lp and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
					local dis = (lp.Character.HumanoidRootPart.Position - pl.Character.HumanoidRootPart.Position).Magnitude
					if dis < d then d = dis closest = pl end
				end
			end
			if closest then
				local root = lp.Character:FindFirstChild("HumanoidRootPart")
				if root then
					root.CFrame = CFrame.new(root.Position, closest.Character.HumanoidRootPart.Position)
				end
			end
		end)
	else _G.lockDir = false
	end
end)