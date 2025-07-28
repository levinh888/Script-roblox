local a=game:GetService;local b=a("Players")local c=a("StarterGui")local d=b.LocalPlayer
local e=d.Character or d.CharacterAdded:Wait()local f=e:WaitForChild("Humanoid")
local g=false local h=false local i="freepvp1day" local j=nil

local k={
"rbxassetid://522635514",
"rbxassetid://507766666",
"rbxassetid://656117878",
"rbxassetid://10922176",
"rbxassetid://656118852",
"rbxassetid://148840371",
"rbxassetid://4905911340",
}

local l=Instance.new("ScreenGui",d:WaitForChild("PlayerGui"))l.Name="XK"
local m=Instance.new("Frame",l)m.Size=UDim2.new(0,300,0,150)m.Position=UDim2.new(0.5,-150,0.4,0)
m.BackgroundColor3=Color3.fromRGB(50,50,50)m.BorderSizePixel=0

local n=Instance.new("TextLabel",m)n.Text="🔐 Nhập Key để sử dụng Tool"n.Size=UDim2.new(1,0,0,30)
n.TextColor3=Color3.new(1,1,1)n.BackgroundTransparency=1
n.Font=Enum.Font.SourceSansBold n.TextSize=20

local o=Instance.new("TextBox",m)o.PlaceholderText="Nhập key tại đây..."
o.Size=UDim2.new(1,-20,0,30)o.Position=UDim2.new(0,10,0.4,0)
o.Font=Enum.Font.SourceSans o.TextSize=18
o.BackgroundColor3=Color3.fromRGB(80,80,80)o.TextColor3=Color3.new(1,1,1)

local p=Instance.new("TextButton",m)p.Text="✅ Xác nhận"p.Size=UDim2.new(1,-20,0,30)
p.Position=UDim2.new(0,10,0.7,0)p.BackgroundColor3=Color3.fromRGB(0,170,0)
p.TextColor3=Color3.new(1,1,1)p.Font=Enum.Font.SourceSansBold p.TextSize=18

local q=Instance.new("ScreenGui",d:WaitForChild("PlayerGui"))q.Name="TG"
q.Enabled=false

local r=Instance.new("TextButton",q)r.Text="Bật Tool Đánh Nhanh ⚡"
r.Size=UDim2.new(0,200,0,40)r.Position=UDim2.new(0,10,0.7,0)
r.BackgroundColor3=Color3.fromRGB(30,144,255)r.TextColor3=Color3.new(1,1,1)
r.Font=Enum.Font.SourceSansBold r.TextSize=18

local function s()
	if not h or not f then return end
	if j and j.IsPlaying then j:Stop()end
	local t=Instance.new("Animation")
	t.AnimationId=k[math.random(1,#k)]
	j=f:LoadAnimation(t)j:Play()j:AdjustSpeed(5)
end

p.MouseButton1Click:Connect(function()
	if o.Text==i then
		g=true m:Destroy()q.Enabled=true
		c:SetCore("SendNotification",{Title="Thành công ✅";Text="Key chính xác! Tool đã bật.";Duration=4})
	else
		c:SetCore("SendNotification",{Title="Sai key ❌";Text="Key không hợp lệ.";Duration=3})
	end
end)

task.spawn(function()
	while true do wait(0.15)
		if g and h then s()end
	end
end)

r.MouseButton1Click:Connect(function()
	h=not h
	r.Text=h and "Tắt Tool 🛑" or "Bật Tool Đánh Nhanh ⚡"
	r.BackgroundColor3=h and Color3.fromRGB(200,50,50) or Color3.fromRGB(30,144,255)
	if not h and j and j.IsPlaying then j:Stop()end
end)

d.CharacterAdded:Connect(function(u)
	e=u f=e:WaitForChild("Humanoid")
end)