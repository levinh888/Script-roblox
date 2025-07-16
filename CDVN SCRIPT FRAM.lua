local z1=game:GetService("Players")
local z2=game:GetService("RunService")
local z3=z1.LocalPlayer
local z4=z3.Character or z3.CharacterAdded:Wait()
local z5=z4:WaitForChild("HumanoidRootPart")
local z6=nil
local z7=false
local z8=0
local z9=3
local za=tick()
local zb=0.7
local zc="SCRIPT CDVN FRAM"

local function zd()
	local ze,zf=nil,math.huge
	for _,zg in pairs(workspace:GetChildren()) do
		if zg:IsA("Model") and zg:FindFirstChild("Humanoid") and zg:FindFirstChild("HumanoidRootPart") then
			local zh=(zg.HumanoidRootPart.Position-z5.Position).Magnitude
			if zh<zf and zg.Humanoid.Health>0 then
				ze,zf=zg,zh
			end
		end
	end
	return ze
end

local function zi()
	for _,zj in pairs(z3.Backpack:GetChildren()) do
		if zj:IsA("Tool") then
			zj.Parent=z4
			z6=zj
			break
		end
	end
end

local function zk()
	if z6 and tick()-za>=zb then
		za=tick()
		if z6:FindFirstChild("RemoteEvent") then
			z6.RemoteEvent:FireServer()
		elseif z6:FindFirstChild("Activate") then
			z6:Activate()
		end
	end
end

-- 🔄 Vòng lặp fram boss (đã bỏ gim mặt)
z2.RenderStepped:Connect(function()
	if z7 then
		local zl=zd()
		if zl then
			zi()
			zk()
			z8+=0.04
			local zm=Vector3.new(math.cos(z8),0,math.sin(z8))*z9
			local zn=zl.HumanoidRootPart.Position+zm
			z5.CFrame=z5.CFrame:Lerp(CFrame.new(zn), 0.3)
		end
	end
end)

-- 🔐 GUI mật khẩu
local zo=Instance.new("ScreenGui",game.CoreGui)
zo.Name="GUI_FRAM_WOKING"

local zp=Instance.new("Frame",zo)
zp.Size=UDim2.new(0,300,0,160)
zp.Position=UDim2.new(0.35,0,0.35,0)
zp.BackgroundColor3=Color3.fromRGB(35,35,50)
zp.Active=true
zp.Draggable=true
Instance.new("UICorner",zp).CornerRadius=UDim.new(0,10)

local zq=Instance.new("TextLabel",zp)
zq.Text="🔐 NHẬP MẬT KHẨU TOOL"
zq.Size=UDim2.new(1,0,0,40)
zq.BackgroundTransparency=1
zq.Font=Enum.Font.GothamBold
zq.TextColor3=Color3.fromRGB(255,255,255)
zq.TextSize=16

local zr=Instance.new("TextBox",zp)
zr.PlaceholderText="Nhập mật khẩu..."
zr.Size=UDim2.new(0.9,0,0,40)
zr.Position=UDim2.new(0.05,0,0.4,0)
zr.Font=Enum.Font.Gotham
zr.TextColor3=Color3.fromRGB(255,255,255)
zr.BackgroundColor3=Color3.fromRGB(50,50,70)
zr.TextSize=14
Instance.new("UICorner",zr).CornerRadius=UDim.new(0,8)

local zs=Instance.new("TextButton",zp)
zs.Text="✅ XÁC NHẬN"
zs.Size=UDim2.new(0.9,0,0,35)
zs.Position=UDim2.new(0.05,0,0.75,0)
zs.Font=Enum.Font.GothamBold
zs.TextColor3=Color3.fromRGB(255,255,255)
zs.BackgroundColor3=Color3.fromRGB(40,140,80)
zs.TextSize=14
Instance.new("UICorner",zs).CornerRadius=UDim.new(0,8)

-- 📦 GUI chính
local zt=Instance.new("Frame",zo)
zt.Size=UDim2.new(0,240,0,190)
zt.Position=UDim2.new(0.1,0,0.25,0)
zt.BackgroundColor3=Color3.fromRGB(28,28,40)
zt.Active=true
zt.Draggable=true
zt.Visible=false
Instance.new("UICorner",zt).CornerRadius=UDim.new(0,12)

local zu=Instance.new("TextLabel",zt)
zu.Text="👹 WOKING TOOL"
zu.Size=UDim2.new(1,0,0,40)
zu.BackgroundTransparency=1
zu.Font=Enum.Font.GothamBold
zu.TextColor3=Color3.fromRGB(255,255,255)
zu.TextSize=18

local zv=Instance.new("TextLabel",zt)
zv.Text="🔥 TAB: AUTO FRAM BOSS"
zv.Size=UDim2.new(1,0,0,25)
zv.Position=UDim2.new(0,0,0,45)
zv.BackgroundTransparency=1
zv.Font=Enum.Font.GothamSemibold
zv.TextColor3=Color3.fromRGB(255,170,0)
zv.TextSize=15

local zw=Instance.new("TextButton",zt)
zw.Size=UDim2.new(0.9,0,0,45)
zw.Position=UDim2.new(0.05,0,0.45,0)
zw.Text="▶️ BẬT AUTO FRAM BOSS"
zw.BackgroundColor3=Color3.fromRGB(40,40,60)
zw.Font=Enum.Font.Gotham
zw.TextColor3=Color3.fromRGB(255,255,255)
zw.TextSize=15
Instance.new("UICorner",zw).CornerRadius=UDim.new(0,10)

zw.MouseButton1Click:Connect(function()
	z7=not z7
	zw.Text=z7 and "⛔️ TẮT AUTO FRAM BOSS" or "▶️ BẬT AUTO FRAM BOSS"
	zw.BackgroundColor3=z7 and Color3.fromRGB(255,70,70) or Color3.fromRGB(40,40,60)
end)

local zx=Instance.new("TextLabel",zt)
zx.Size=UDim2.new(1,0,0,20)
zx.Position=UDim2.new(0,0,1,-20)
zx.BackgroundTransparency=1
zx.Text="👑 WOKINGLOG – MƯỢT KHÔNG GIM 👑"
zx.Font=Enum.Font.Gotham
zx.TextColor3=Color3.fromRGB(160,160,160)
zx.TextSize=12

zs.MouseButton1Click:Connect(function()
	if zr.Text==zc then
		zp.Visible=false
		zt.Visible=true
	else
		zr.Text="❌ Sai mật khẩu!"
		wait(1)
		zr.Text=""
	end
end)
