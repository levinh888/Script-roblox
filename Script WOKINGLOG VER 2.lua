local a0=Instance.new("ScreenGui")
a0.Name="X5X5"
a0.ResetOnSpawn=false
a0.Parent=game.CoreGui

local b1=Instance.new("Frame")
b1.Size=UDim2.new(0,300,0,180)
b1.Position=UDim2.new(0.5,-150,0.5,-90)
b1.BackgroundColor3=Color3.fromRGB(245,245,245)
b1.BorderSizePixel=0
b1.Active=true
b1.Draggable=true
b1.Parent=a0

local t1=Instance.new("TextLabel")
t1.Size=UDim2.new(1,0,0,40)
t1.BackgroundTransparency=1
t1.Text="🔒 Nhập mật khẩu"
t1.Font=Enum.Font.GothamBold
t1.TextSize=20
t1.TextColor3=Color3.new(0,0,0)
t1.Parent=b1

local b2=Instance.new("TextBox")
b2.Size=UDim2.new(0.9,0,0,40)
b2.Position=UDim2.new(0.05,0,0.4,0)
b2.PlaceholderText="Nhập mật khẩu..."
b2.Text=""
b2.TextSize=18
b2.Font=Enum.Font.Gotham
b2.TextColor3=Color3.new(0,0,0)
b2.BackgroundColor3=Color3.fromRGB(255,255,255)
b2.BorderSizePixel=1
b2.Parent=b1

local x0=Instance.new("TextButton")
x0.Size=UDim2.new(0.9,0,0,40)
x0.Position=UDim2.new(0.05,0,0.7,0)
x0.Text="XÁC NHẬN"
x0.Font=Enum.Font.GothamBold
x0.TextSize=18
x0.TextColor3=Color3.new(1,1,1)
x0.BackgroundColor3=Color3.fromRGB(0,170,127)
x0.BorderSizePixel=0
x0.Parent=b1

local mF=Instance.new("Frame")
mF.Size=UDim2.new(0,500,0,340)
mF.Position=UDim2.new(0.5,-250,0.5,-170)
mF.BackgroundColor3=Color3.fromRGB(245,245,245)
mF.BorderSizePixel=0
mF.Visible=false
mF.Active=true
mF.Draggable=true
mF.Parent=a0

local h0=Instance.new("TextLabel")
h0.Size=UDim2.new(1,0,0,40)
h0.BackgroundTransparency=1
h0.Text="MENU BY WOKINGLOG 👹 VER 2 ĐỘC QUYỀN"
h0.Font=Enum.Font.GothamBold
h0.TextSize=18
h0.TextColor3=Color3.new(0,0,0)
h0.Parent=mF

local tH=Instance.new("Frame")
tH.Size=UDim2.new(1,0,0,40)
tH.Position=UDim2.new(0,0,0,40)
tH.BackgroundTransparency=1
tH.Parent=mF

local cF=Instance.new("Frame")
cF.Size=UDim2.new(1,-20,1,-90)
cF.Position=UDim2.new(0,10,0,80)
cF.BackgroundTransparency=1
cF.Name="C_"
cF.Parent=mF

local function Xx(name,idx,fn)
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(0,130,0,30)
    b.Position=UDim2.new(0,(idx-1)*140,0,5)
    b.Text=name
    b.Font=Enum.Font.Gotham
    b.TextSize=14
    b.BackgroundColor3=Color3.fromRGB(220,220,220)
    b.TextColor3=Color3.fromRGB(0,0,0)
    b.Parent=tH
    b.MouseButton1Click:Connect(fn)
end

local function show(name)
    for _,v in pairs(cF:GetChildren()) do v:Destroy() end
    local y=10
    local function Zz(txt,callback)
        local btn=Instance.new("TextButton",cF)
        btn.Size=UDim2.new(0,460,0,30)
        btn.Position=UDim2.new(0,10,0,y)
        btn.Text=txt
        btn.Font=Enum.Font.Gotham
        btn.TextSize=13
        btn.TextColor3=Color3.new(0,0,0)
        btn.BackgroundColor3=Color3.fromRGB(230,230,230)
        btn.MouseButton1Click:Connect(callback)
        y=y+35
    end

    if name=="PVP" then
        Zz("⚡ HITBOX",function()
            for _,v in pairs(game.Players:GetPlayers()) do
                if v~=game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local h=v.Character.HumanoidRootPart
                    h.Size=Vector3.new(15,15,14)
                    h.Transparency=0.5
                    h.BrickColor=BrickColor.White()
                    h.Material=Enum.Material.Neon
                end
            end
        end)
        Zz("⚔️ TỰ ĐÁNH",function()
            _G.autoHit=not _G.autoHit
            while _G.autoHit do
                local t=game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if t then t:Activate() end
                wait(0.5)
            end
        end)
        Zz("🧲 KÉO NGƯỜI",function()
            for _,v in pairs(game.Players:GetPlayers()) do
                if v~=game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    v.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(5,0,0)
                end
            end
        end)
        Zz("🚀 SPEED",function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/levinh888/FlySpeed/main/flyspeed.lua"))()
        end)
        Zz("💥 AUTO JUMP",function()
            _G.autoJump=not _G.autoJump
            while _G.autoJump do
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                wait(0.5)
            end
        end)
        Zz("👻 ẨN THÂN",function()
            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.Name~="HumanoidRootPart" then
                    v.Transparency=1
                end
            end
        end)
        Zz("🔫 GIM TÂM SAU",function()
            local lp=game.Players.LocalPlayer.Character
            local cl,d= nil,999
            for _,v in pairs(game.Players:GetPlayers()) do
                if v~=game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    local dist=(v.Character.HumanoidRootPart.Position-lp.HumanoidRootPart.Position).Magnitude
                    if dist<d and dist<=10 then
                        d=dist
                        cl=v
                    end
                end
            end
            if cl then
                lp.HumanoidRootPart.CFrame=cl.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-2)
            end
        end)
    elseif name=="FIX LAG" then
        Zz("🔧 GIẢM 30",function()
            local l=game:GetService("Lighting")
            l.GlobalShadows=false
            l.FogEnd=1e5
            l.Brightness=0
        end)
        Zz("🧹 GIẢM 70",function()
            for _,v in pairs(game.Lighting:GetDescendants()) do
                if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") then
                    v.Enabled=false
                end
            end
        end)
        Zz("🌈 FPS HIỆU ỨNG",function()
            local lbl=Instance.new("TextLabel",a0)
            lbl.Size=UDim2.new(0,120,0,25)
            lbl.Position=UDim2.new(0,10,0,10)
            lbl.BackgroundTransparency=1
            lbl.TextSize=14
            lbl.Font=Enum.Font.GothamBold
            lbl.Text="FPS: 0"
            lbl.Name="FPSCounter"
            coroutine.wrap(function()
                local rs=game:GetService("RunService")
                local last=tick()
                local cnt=0
                while lbl do
                    cnt=cnt+1
                    if tick()-last>=1 then
                        lbl.Text="FPS: "..cnt
                        lbl.TextColor3=Color3.fromHSV(tick()%5/5,1,1)
                        last=tick()
                        cnt=0
                    end
                    rs.RenderStepped:Wait()
                end
            end)()
        end)
    elseif name=="TROLL" then
        Zz("👑 GHẾ NGỒI",function()
            local s=Instance.new("Seat")
            s.Size=Vector3.new(4,1,4)
            s.Position=game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-3,0)
            s.Anchored=true
            s.Name="CHAIR123"
            s.Parent=workspace
        end)
        Zz("🌀 SPIN",function()
            local r=game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if r then
                coroutine.wrap(function()
                    for i=1,100 do
                        r.CFrame=r.CFrame*CFrame.Angles(0,math.rad(15),0)*CFrame.new(0,0.5,0)
                        wait()
                    end
                end)()
            end
        end)
        Zz("📡 BAY TỚI NGƯỜI",function()
            local lst=""
            for _,v in pairs(game.Players:GetPlayers()) do
                if v~=game.Players.LocalPlayer then
                    lst=lst..v.Name.."\n"
                end
            end
            setclipboard(lst)
            game.StarterGui:SetCore("SendNotification",{Title="TÊN NGƯỜI CHƠI",Text="Đã sao chép danh sách\nDán vào chat tên để bay tới",Duration=5})
            game.Players.LocalPlayer.Chatted:Connect(function(msg)
                for _,v in pairs(game.Players:GetPlayers()) do
                    if v.Name:lower()==msg:lower() then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=v.Character.HumanoidRootPart.CFrame+Vector3.new(0,5,0)
                    end
                end
            end)
        end)
    end
end

Xx("PVP",1,function() show("PVP") end)
Xx("FIX LAG",2,function() show("FIX LAG") end)
Xx("TROLL",3,function() show("TROLL") end)

x0.MouseButton1Click:Connect(function()
    if b2.Text=="WOKINGLOGVER2" then
        b1.Visible=false
        mF.Visible=true
    else
        b2.Text=""
        b2.PlaceholderText="Sai mật khẩu!"
    end
end)