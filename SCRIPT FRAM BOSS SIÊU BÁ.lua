--[[⚠ Script bảo vệ bản quyền by WOKINGLOG ⚠]]--

local p="WOKINGLOG123"
local u=Instance.new("ScreenGui",game:GetService("CoreGui"))
u.ResetOnSpawn=false
local f=Instance.new("Frame",u)
f.BackgroundColor3=Color3.new(0,0,0)
f.BorderSizePixel=0
f.Position=UDim2.new(0.3,0,0.4,0)
f.Size=UDim2.new(0,300,0,150)
f.Visible=true
local t=Instance.new("TextBox",f)
t.Size=UDim2.new(0,280,0,50)
t.Position=UDim2.new(0,10,0,30)
t.PlaceholderText="Nhập mật khẩu..."
t.Text=""
t.TextColor3=Color3.new(1,1,1)
t.BackgroundColor3=Color3.fromRGB(30,30,30)
local b=Instance.new("TextButton",f)
b.Size=UDim2.new(0,280,0,40)
b.Position=UDim2.new(0,10,0,90)
b.Text="Xác nhận"
b.BackgroundColor3=Color3.fromRGB(40,40,40)
b.TextColor3=Color3.new(1,1,1)

b.MouseButton1Click:Connect(function()
    if t.Text==p then
        f.Visible=false
        -- Mở GUI chính
        local g=Instance.new("ScreenGui",game:GetService("CoreGui"))
        local mf=Instance.new("Frame",g)
        mf.Position=UDim2.new(0,0,0.4,0)
        mf.Size=UDim2.new(0,220,0,180)
        mf.BackgroundColor3=Color3.fromRGB(10,10,10)
        mf.BorderSizePixel=2

        local mt=Instance.new("TextLabel",mf)
        mt.Size=UDim2.new(1,0,0,30)
        mt.BackgroundTransparency=1
        mt.Text="🔥 WOKINGLOG - FRAM BOSS 🔥"
        mt.TextColor3=Color3.new(1,1,0)
        mt.TextScaled=true

        local btn=Instance.new("TextButton",mf)
        btn.Position=UDim2.new(0,10,0,50)
        btn.Size=UDim2.new(0,200,0,50)
        btn.Text="FRAM BOSS"
        btn.BackgroundColor3=Color3.fromRGB(0,100,255)
        btn.TextColor3=Color3.new(1,1,1)
        btn.TextScaled=true

        btn.MouseButton1Click:Connect(function()
            -- Tăng speed
            local p=game.Players.LocalPlayer
            p.Character.Humanoid.WalkSpeed=80
            -- Auto đánh
            spawn(function()
                while wait(0.2) do
                    local h=p.Character and p.Character:FindFirstChild("Humanoid")
                    local tool=p.Character:FindFirstChildOfClass("Tool")
                    if h and tool then
                        tool:Activate()
                    end
                end
            end)
            -- Hiện máu NPC2
            for _,v in pairs(workspace:GetDescendants()) do
                if v:IsA("Model") and v.Name=="NPC2" and not v:FindFirstChild("BillboardGui") then
                    local h=v:FindFirstChildOfClass("Humanoid")
                    if h then
                        local bb=Instance.new("BillboardGui",v)
                        bb.Size=UDim2.new(0,100,0,20)
                        bb.AlwaysOnTop=true
                        bb.Adornee=v:FindFirstChild("Head") or v.PrimaryPart
                        local tx=Instance.new("TextLabel",bb)
                        tx.Size=UDim2.new(1,0,1,0)
                        tx.BackgroundTransparency=1
                        tx.TextColor3=Color3.new(1,0,0)
                        tx.TextScaled=true
                        tx.Text="Máu: "..math.floor(h.Health)
                        h:GetPropertyChangedSignal("Health"):Connect(function()
                            tx.Text="Máu: "..math.floor(h.Health)
                        end)
                    end
                end
            end
        end)
    else
        t.Text=""
        t.PlaceholderText="❌ Sai mật khẩu"
    end
end)
