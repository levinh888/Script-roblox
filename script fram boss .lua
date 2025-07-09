local _1OIlO0=game:GetService("Players")local l0ll0O=game:GetService("RunService")local lIl0Ol=_1OIlO0.LocalPlayer
repeat wait()until lIl0Ol.Character and lIl0Ol.Character:FindFirstChild("HumanoidRootPart")
local O0O0lO=lIl0Ol.Character local O0llOl=O0O0lO:WaitForChild("HumanoidRootPart")local O0lOl=O0O0lO:FindFirstChildOfClass("Humanoid")
local lO1l1=Instance.new("ScreenGui",lIl0Ol:WaitForChild("PlayerGui"))lO1l1.Name="WOKINGLOG_GUI"lO1l1.ResetOnSpawn=false
local Ol1ll=Instance.new("Frame",lO1l1)Ol1ll.Size=UDim2.new(0,300,0,220)Ol1ll.Position=UDim2.new(0.35,0,0.3,0)Ol1ll.BackgroundColor3=Color3.fromRGB(20,20,20)Ol1ll.BorderSizePixel=2 Ol1ll.BorderColor3=Color3.fromRGB(255,0,0)
local l1OO1=Instance.new("TextLabel",Ol1ll)l1OO1.Size=UDim2.new(1,0,0,30)l1OO1.BackgroundColor3=Color3.fromRGB(40,0,0)
l1OO1.Text="👹 WOKINGLOG MENU 👹"l1OO1.TextColor3=Color3.new(1,0,0)l1OO1.Font=Enum.Font.GothamBlack l1OO1.TextScaled=true
local l01lO=Instance.new("TextButton",Ol1ll)l01lO.Size=UDim2.new(0,30,0,30)l01lO.Position=UDim2.new(1,-30,0,0)
l01lO.Text="X"l01lO.BackgroundColor3=Color3.fromRGB(60,0,0)l01lO.TextColor3=Color3.new(1,1,1)l01lO.Font=Enum.Font.GothamBlack l01lO.TextScaled=true
local l0OOO=Instance.new("TextButton",lO1l1)l0OOO.Size=UDim2.new(0,60,0,60)l0OOO.Position=UDim2.new(0,20,0.9,-60)l0OOO.Text="👹"
l0OOO.Visible=false l0OOO.BackgroundColor3=Color3.fromRGB(50,0,0)l0OOO.TextColor3=Color3.new(1,1,1)l0OOO.Font=Enum.Font.GothamBold l0OOO.TextScaled=true
l01lO.MouseButton1Click:Connect(function()Ol1ll.Visible=false l0OOO.Visible=true end)l0OOO.MouseButton1Click:Connect(function()Ol1ll.Visible=true l0OOO.Visible=false end)
local O1l1O=Instance.new("TextButton",Ol1ll)O1l1O.Position=UDim2.new(0.1,0,0,50)O1l1O.Size=UDim2.new(0.8,0,0,50)O1l1O.Text="🔥 Bật Fram Boss"
O1l1O.BackgroundColor3=Color3.fromRGB(50,0,0)O1l1O.TextColor3=Color3.new(1,1,1)O1l1O.Font=Enum.Font.GothamBold O1l1O.TextScaled=true
local OOlOl=Instance.new("TextLabel",Ol1ll)OOlOl.Size=UDim2.new(1,0,0,30)OOlOl.Position=UDim2.new(0,0,1,-30)
OOlOl.BackgroundColor3=Color3.fromRGB(30,0,0)OOlOl.Text="© WOKINGLOG 👹"OOlOl.TextColor3=Color3.new(1,1,1)OOlOl.Font=Enum.Font.Gotham OOlOl.TextScaled=true
local O0O0O=Instance.new("Frame",lO1l1)O0O0O.Position=UDim2.new(0.7,0,0.05,0)O0O0O.Size=UDim2.new(0,180,0,50)O0O0O.BackgroundColor3=Color3.fromRGB(30,0,0)O0O0O.BorderSizePixel=2
O0O0O.BorderColor3=Color3.fromRGB(255,0,0)O0O0O.Visible=false local l00l1=Instance.new("TextLabel",O0O0O)l00l1.Size=UDim2.new(1,0,1,0)l00l1.Text="HP: ..."
l00l1.Font=Enum.Font.GothamBlack l00l1.TextScaled=true l00l1.TextColor3=Color3.new(1,1,1)l00l1.BackgroundTransparency=1
local O10OO=false O1l1O.MouseButton1Click:Connect(function()O10OO=not O10OO O0O0O.Visible=O10OO O1l1O.Text=O10OO and "🛑 Dừng Fram Boss" or "🔥 Bật Fram Boss"end)
function O1ll0()local lO0O1=nil local OOOOl=math.huge for _,O0O1O in pairs(workspace:GetDescendants())do
if O0O1O:IsA("Model")and O0O1O:FindFirstChild("HumanoidRootPart")and O0O1O~=O0O0lO then local dist=(O0llOl.Position-O0O1O.HumanoidRootPart.Position).Magnitude
if dist<OOOOl and dist<100 then OOOOl=dist lO0O1=O0O1O end end end return lO0O1 end
function lO01O(center)local points={}for i=0,2 do local rad=math.rad(i*120)local x=math.cos(rad)*30 local z=math.sin(rad)*30
table.insert(points,center+Vector3.new(x,0.5,z))end return points end
function Ol0l1()local tool=O0O0lO:FindFirstChildOfClass("Tool")if tool then pcall(function()tool:Activate()end)end end
spawn(function()while true do if O10OO and O0lOl then O0lOl.PlatformStand=false O0lOl.Sit=false O0lOl.Jump=true task.delay(0.05,function()O0lOl.Jump=false end)end wait(0.1)end end)
spawn(function()local idx=1 while true do if O10OO then local boss=O1ll0()if boss and boss:FindFirstChild("HumanoidRootPart")then
local tri=lO01O(boss.HumanoidRootPart.Position)local tgt=tri[idx]local dir=(tgt-O0llOl.Position).Unit*200
O0llOl.Velocity=dir O0llOl.CFrame=CFrame.new(O0llOl.Position,boss.HumanoidRootPart.Position)if(O0llOl.Position-tgt).Magnitude<3 then idx=(idx%#tri)+1 end
Ol0l1()local h=boss:FindFirstChildOfClass("Humanoid")if h then l00l1.Text="HP: "..math.floor(h.Health).."/"..math.floor(h.MaxHealth)end
else l00l1.Text="HP: ..."end else O0llOl.Velocity=Vector3.zero end l0ll0O.Stepped:Wait()end end)