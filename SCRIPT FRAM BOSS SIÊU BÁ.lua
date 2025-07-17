--// Script Rối By WOKINGLOG 🧠 Bảo mật cao
local a=Instance.new;local b=game;local c="WOKINGLOG123"
local function d()local e=Instance.new("ScreenGui")e.Name="🔐"
local f=a("Frame",e)f.Size=UDim2.new(0.3,0,0.25,0)f.Position=UDim2.new(0.35,0,0.4,0)f.BackgroundColor3=Color3.fromRGB(10,10,30)
f.BorderSizePixel=2
local g=a("TextBox",f)g.Size=UDim2.new(1,0,0.4,0)g.Position=UDim2.new(0,0,0.1,0)
g.PlaceholderText="🔒 Nhập mật khẩu...";g.Text="";g.TextScaled=true;g.BackgroundColor3=Color3.fromRGB(30,30,60)
local h=a("TextButton",f)h.Text="✅ Xác nhận";h.Size=UDim2.new(1,0,0.3,0);h.Position=UDim2.new(0,0,0.6,0)
h.BackgroundColor3=Color3.fromRGB(50,100,150);h.TextScaled=true

h.MouseButton1Click:Connect(function()
    if g.Text==c then
        e:Destroy()_G["🧠"]=true
        load()
    else
        g.Text="❌ Sai mật khẩu!"
    end
end)
e.Parent=b.Players.LocalPlayer:WaitForChild("PlayerGui")
end

function load()
local gui=Instance.new("ScreenGui",game.Players.LocalPlayer:WaitForChild("PlayerGui"))
gui.Name="🎮MENU"
local frame=Instance.new("Frame",gui)
frame.Size=UDim2.new(0.15,0,0.3,0)
frame.Position=UDim2.new(0.02,0,0.4,0)
frame.BackgroundColor3=Color3.fromRGB(25,25,35)
frame.BorderSizePixel=1
local title=Instance.new("TextLabel",frame)
title.Text="🌟 FRAM BOSS 🌟\nBY WOKINGLOG"
title.Size=UDim2.new(1,0,0.4,0)
title.BackgroundTransparency=1
title.TextColor3=Color3.fromRGB(255,255,255)
title.TextScaled=true

local btn=Instance.new("TextButton",frame)
btn.Text="▶️ Bật Tool"
btn.Size=UDim2.new(1,0,0.3,0)
btn.Position=UDim2.new(0,0,0.5,0)
btn.BackgroundColor3=Color3.fromRGB(60,80,130)
btn.TextColor3=Color3.fromRGB(255,255,255)
btn.TextScaled=true

btn.MouseButton1Click:Connect(function()
    spawn(function()
        while wait(0.1) do
            local plr=game.Players.LocalPlayer
            local char=plr.Character or plr.CharacterAdded:Wait()
            local tool=char:FindFirstChildOfClass("Tool")
            if tool then
                local hum=char:FindFirstChild("Humanoid")
                hum:EquipTool(tool)
                hum:MoveTo(tool.Position+Vector3.new(1,0,0))
            end
            for _,npc in pairs(workspace:GetChildren()) do
                if npc.Name=="NPC2" and npc:FindFirstChild("Humanoid") then
                    local tag=npc:FindFirstChild("WLOG") or Instance.new("BillboardGui",npc)
                    tag.Name="WLOG"
                    tag.Size=UDim2.new(0,100,0,50)
                    tag.Adornee=npc:FindFirstChild("Head")
                    tag.AlwaysOnTop=true
                    local hp=tag:FindFirstChild("Txt") or Instance.new("TextLabel",tag)
                    hp.Name="Txt"
                    hp.Size=UDim2.new(1,0,1,0)
                    hp.BackgroundTransparency=1
                    hp.TextColor3=Color3.fromRGB(255,0,0)
                    hp.TextScaled=true
                    hp.Text="♥️ "..math.floor(npc.Humanoid.Health)
                end
            end
        end
    end)
end)
end

d()