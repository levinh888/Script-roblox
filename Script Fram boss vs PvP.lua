-- 𝗥𝗲𝗺𝗼𝘃𝗲𝗱 𝗖𝗼𝗺𝗺𝗲𝗻𝘁𝘀 𝗮𝗻𝗱 𝗢𝗯𝗳𝘂𝘀𝗰𝗮𝘁𝗲𝗱 𝗦𝘁𝗿𝘂𝗰𝘁𝘂𝗿𝗲
local a,b,c,d=game,workspace,game:GetService("RunService"),game.Players
local e,f,g=d.LocalPlayer,a.CoreGui,game:GetService("VirtualUser")
pcall(function()if f:FindFirstChild("Vinh_UI")then f.Vinh_UI:Destroy()end end)
local h=Instance.new("ScreenGui",f)h.Name="Vinh_UI"
local i=Instance.new("ImageButton",h)i.Size=UDim2.new(0,38,0,38)i.Position=UDim2.new(0,8,0.5,-20)
i.Image="rbxassetid://3926307971"i.BackgroundTransparency=1
i.ImageRectOffset=Vector2.new(964,324)i.ImageRectSize=Vector2.new(36,36)
local j=Instance.new("Frame",h)j.Size=UDim2.new(0,280,0,360)j.Position=UDim2.new(0.5,-140,0.5,-180)
j.BackgroundColor3=Color3.fromRGB(30,30,30)j.Visible=false j.Active=true j.Draggable=true
i.MouseButton1Click:Connect(function()j.Visible=not j.Visible end)
e.Idled:Connect(function()g:Button2Down(Vector2.new(),a.CurrentCamera.CFrame)wait(1)g:Button2Up(Vector2.new(),a.CurrentCamera.CFrame)end)
local k=Instance.new("Frame",j)k.Size=UDim2.new(1,0,0,30)k.BackgroundColor3=Color3.fromRGB(45,45,45)
local l=Instance.new("TextButton",k)l.Size=UDim2.new(0.5,0,1,0)l.Text="⚔️ PvP"l.BackgroundColor3=Color3.fromRGB(60,60,60)l.TextColor3=Color3.new(1,1,1)
local m=Instance.new("TextButton",k)m.Size=UDim2.new(0.5,0,1,0)m.Position=UDim2.new(0.5,0,0,0)
m.Text="👹 Fram Boss"m.BackgroundColor3=Color3.fromRGB(40,40,40)m.TextColor3=Color3.new(1,1,1)
local n=Instance.new("Frame",j)n.Position=UDim2.new(0,0,0,30)n.Size=UDim2.new(1,0,1,-30)n.BackgroundTransparency=1
local o=Instance.new("Frame",j)o.Position=UDim2.new(0,0,0,30)o.Size=UDim2.new(1,0,1,-30)o.BackgroundTransparency=1
o.Visible=false
l.MouseButton1Click:Connect(function()n.Visible=true o.Visible=false end)
m.MouseButton1Click:Connect(function()n.Visible=false o.Visible=true end)
local function p(q,r,s)local t=Instance.new("TextButton",q)
t.Size=UDim2.new(0.92,0,0,28)t.Position=UDim2.new(0.04,0,0,#q:GetChildren()*30)
t.BackgroundColor3=Color3.fromRGB(40,40,40)t.BorderSizePixel=0
t.Text="🔘 "..r
t.Font=Enum.Font.Gotham t.TextColor3=Color3.new(1,1,1)t.TextSize=14
local u=false
t.MouseButton1Click:Connect(function()u=not u t.Text=(u and "✅ "or"🔘 ")..r s(u)end)end
p(n,"Aimbot",function(v)if v then _G.ab=true c.RenderStepped:Connect(function()
if not _G.ab then return end local w,x,y=a.CurrentCamera,math.huge,nil
for _,z in pairs(d:GetPlayers())do if z~=e and z.Character and z.Character:FindFirstChild("HumanoidRootPart")then local A=(z.Character.HumanoidRootPart.Position-e.Character.HumanoidRootPart.Position).Magnitude if A<x then x=A y=z end end end if y then w.CFrame=CFrame.new(w.CFrame.Position,y.Character.HumanoidRootPart.Position)end end)else _G.ab=false end end)
p(n,"Auto Attack",function(v)if v then _G.aAtk=true task.spawn(function()while _G.aAtk do wait(0.25)for _,B in pairs(e.Character:GetChildren())do if B:IsA("Tool")then B:Activate()end end end end)else _G.aAtk=false end end)
p(n,"Speed",function(v)e.Character.Humanoid.WalkSpeed=v and 55 or 16 end)
p(n,"Gim Chặt Địch",function(v)if v then _G.lockDir=true c.RenderStepped:Connect(function()if not _G.lockDir then return end local C,D=nil,math.huge for _,E in pairs(d:GetPlayers())do if E~=e and E.Character and E.Character:FindFirstChild("HumanoidRootPart")then local F=(e.Character.HumanoidRootPart.Position-E.Character.HumanoidRootPart.Position).Magnitude if F<D then D=F C=E end end end if C then local G=e.Character:FindFirstChild("HumanoidRootPart")if G then G.CFrame=CFrame.new(G.Position,C.Character.HumanoidRootPart.Position)end end end)else _G.lockDir=false end end)
p(o,"Bay Quanh NPC Gần Nhất",function(v)if v then _G.flyNPC=true spawn(function()local H=0 while _G.flyNPC do wait()local I=e.Character if not I or not I:FindFirstChild("HumanoidRootPart")then continue end local J=I.HumanoidRootPart local K,L=nil,math.huge for _,M in pairs(b:GetDescendants())do if M:IsA("Model")and M:FindFirstChild("Humanoid")and M:FindFirstChild("HumanoidRootPart")then if M~=I then local N=(J.Position-M.HumanoidRootPart.Position).Magnitude if N<L then L=N K=M end end end end if K then H+=0.05*3 local O=K.HumanoidRootPart.Position local P=Vector3.new(math.cos(H)*19.5,3,math.sin(H)*19.5)J.CFrame=CFrame.new(O+P,O)for _,Q in pairs(I:GetChildren())do if Q:IsA("Tool")then Q:Activate()end end end end end)else _G.flyNPC=false end end)
