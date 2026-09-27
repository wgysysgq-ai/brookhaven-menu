-- ============================================
-- BROOKHAVEN RP MENU v10
-- WH + GODMODE + FLY + NOCLIP
-- KEY: 123
-- ============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ============================================
-- KEY SYSTEM
-- ============================================
local unlockKey = "123"
local unlocked = false

if game.CoreGui:FindFirstChild("KeyGui") then
    game.CoreGui.KeyGui:Destroy()
end

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "KeyGui"
KeyGui.ResetOnSpawn = false
KeyGui.Parent = game.CoreGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 260, 0, 130)
KeyFrame.Position = UDim2.new(0.5, -130, 0.5, -65)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
KeyFrame.BorderSizePixel = 0
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = KeyGui

local KCorner = Instance.new("UICorner")
KCorner.CornerRadius = UDim.new(0, 10)
KCorner.Parent = KeyFrame

local KStroke = Instance.new("UIStroke")
KStroke.Color = Color3.fromRGB(80, 80, 80)
KStroke.Parent = KeyFrame

local KTitle = Instance.new("TextLabel")
KTitle.Size = UDim2.new(1, 0, 0, 30)
KTitle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
KTitle.BorderSizePixel = 0
KTitle.Text = "🔒 Введи ключ"
KTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KTitle.TextSize = 15
KTitle.Font = Enum.Font.GothamBold
KTitle.Parent = KeyFrame

local KTitleCorner = Instance.new("UICorner")
KTitleCorner.CornerRadius = UDim.new(0, 10)
KTitleCorner.Parent = KTitle

local KInput = Instance.new("TextBox")
KInput.Size = UDim2.new(0, 200, 0, 36)
KInput.Position = UDim2.new(0.5, -100, 0, 40)
KInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KInput.BorderSizePixel = 0
KInput.Text = ""
KInput.PlaceholderText = "Введи код..."
KInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
KInput.TextSize = 15
KInput.Font = Enum.Font.Gotham
KInput.Parent = KeyFrame

local KInputCorner = Instance.new("UICorner")
KInputCorner.CornerRadius = UDim.new(0, 6)
KInputCorner.Parent = KInput

local KBtn = Instance.new("TextButton")
KBtn.Size = UDim2.new(0, 200, 0, 34)
KBtn.Position = UDim2.new(0.5, -100, 0, 84)
KBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
KBtn.BorderSizePixel = 0
KBtn.Text = "ВОЙТИ"
KBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
KBtn.TextSize = 14
KBtn.Font = Enum.Font.GothamBold
KBtn.Parent = KeyFrame

local KBtnCorner = Instance.new("UICorner")
KBtnCorner.CornerRadius = UDim.new(0, 6)
KBtnCorner.Parent = KBtn

KBtn.MouseButton1Click:Connect(function()
    if KInput.Text == unlockKey then
        unlocked = true
        KeyGui:Destroy()
        loadMenu()
    else
        KInput.Text = ""
        KInput.PlaceholderText = "❌ Неверный ключ"
        KInput.PlaceholderColor3 = Color3.fromRGB(255, 80, 80)
    end
end)

KInput.FocusLost:Connect(function(enter)
    if enter then KBtn.MouseButton1Click:Fire() end
end)

-- ============================================
-- МЕНЮ
-- ============================================
function loadMenu()

if game.CoreGui:FindFirstChild("BrookhavenMenu") then
    game.CoreGui.BrookhavenMenu:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BrookhavenMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game.CoreGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 250, 0, 290)
Main.Position = UDim2.new(0, 20, 0, 60)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(70, 70, 70)
Stroke.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 28)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.BorderSizePixel = 0
Title.Text = "🏠 Brookhaven Menu v10"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.Parent = Main

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -30, 0, 2)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = Main

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local function makeButton(text, yPos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 210, 0, 32)
    btn.Position = UDim2.new(0.5, -105, 0, yPos)
    btn.BackgroundColor3 = color or Color3.fromRGB(200, 50, 50)
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.Parent = Main
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    return btn
end

local WHBtn = makeButton("WH: OFF", 36)
local GodBtn = makeButton("GODMODE: OFF", 74)
local FlyBtn = makeButton("FLY: OFF", 112)
local NoclipBtn = makeButton("NOCLIP: OFF", 150)

-- FLY SPEED слайдер
local FlyFrame = Instance.new("Frame")
FlyFrame.Size = UDim2.new(0, 210, 0, 36)
FlyFrame.Position = UDim2.new(0.5, -105, 0, 188)
FlyFrame.BackgroundTransparency = 1
FlyFrame.Parent = Main

local FlyLabel = Instance.new("TextLabel")
FlyLabel.Size = UDim2.new(1, 0, 0, 14)
FlyLabel.BackgroundTransparency = 1
FlyLabel.Text = "FLY SPEED: 50"
FlyLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
FlyLabel.TextSize = 12
FlyLabel.Font = Enum.Font.Gotham
FlyLabel.Parent = FlyFrame

local FlyBar = Instance.new("Frame")
FlyBar.Size = UDim2.new(1, 0, 0, 8)
FlyBar.Position = UDim2.new(0, 0, 0, 20)
FlyBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FlyBar.BorderSizePixel = 0
FlyBar.Parent = FlyFrame

local FlyBarCorner = Instance.new("UICorner")
FlyBarCorner.CornerRadius = UDim.new(1, 0)
FlyBarCorner.Parent = FlyBar

local FlyFill = Instance.new("Frame")
FlyFill.Size = UDim2.new(0.1, 0, 1, 0)
FlyFill.BackgroundColor3 = Color3.fromRGB(80, 180, 255)
FlyFill.BorderSizePixel = 0
FlyFill.Parent = FlyBar

local FlyFillCorner = Instance.new("UICorner")
FlyFillCorner.CornerRadius = UDim.new(1, 0)
FlyFillCorner.Parent = FlyFill

local FlyKnob = Instance.new("Frame")
FlyKnob.Size = UDim2.new(0, 14, 0, 14)
FlyKnob.AnchorPoint = Vector2.new(0.5, 0.5)
FlyKnob.Position = UDim2.new(0.1, 0, 0.5, 0)
FlyKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyKnob.BorderSizePixel = 0
FlyKnob.Parent = FlyBar

local FlyKnobCorner = Instance.new("UICorner")
FlyKnobCorner.CornerRadius = UDim.new(1, 0)
FlyKnobCorner.Parent = FlyKnob

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, 0, 0, 30)
InfoLabel.Position = UDim2.new(0, 0, 1, -34)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Fly: WASD + Space/Ctrl"
InfoLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
InfoLabel.TextSize = 10
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.Parent = Main

-- ============================================
-- ПЕРЕМЕННЫЕ
-- ============================================
local flySpeed = 50
local FLY_MIN = 10
local FLY_MAX = 500

local whEnabled = false
local godEnabled = false
local flyEnabled = false
local noclipEnabled = false

-- ============================================
-- ОБНОВЛЕНИЕ СЛАЙДЕРА
-- ============================================
local function updateFlyDisplay()
    FlyLabel.Text = "FLY SPEED: " .. flySpeed
    local r = (flySpeed - FLY_MIN) / (FLY_MAX - FLY_MIN)
    FlyFill.Size = UDim2.new(r, 0, 1, 0)
    FlyKnob.Position = UDim2.new(r, 0, 0.5, 0)
end

local dragFly = false

FlyBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragFly = true end
end)
FlyKnob.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragFly = true end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragFly = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
    if dragFly then
        local mp = UserInputService:GetMouseLocation()
        local bp, bs = FlyBar.AbsolutePosition, FlyBar.AbsoluteSize
        local r = math.clamp((mp.X - bp.X) / bs.X, 0, 1)
        flySpeed = math.floor(FLY_MIN + r * (FLY_MAX - FLY_MIN))
        updateFlyDisplay()
    end
end)

-- ============================================
-- WH
-- ============================================
local whCache = {}

local function createWH(player)
    if player == LocalPlayer then return end
    if whCache[player] then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "WH_Highlight"
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Adornee = player.Character

    highlight.Parent = player.Character or player
    whCache[player] = highlight

    player.CharacterAdded:Connect(function(char)
        highlight.Adornee = char
        highlight.Parent = char
    end)
end

local function removeWH(player)
    if whCache[player] then
        whCache[player]:Destroy()
        whCache[player] = nil
    end
end

local function clearWH()
    for p, h in pairs(whCache) do h:Destroy() end
    whCache = {}
end

-- ============================================
-- GODMODE (работает только против локального урона)
-- ============================================
local function applyGodmode()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.MaxHealth = math.huge
        hum.Health = math.huge
    end
end

RunService.Heartbeat:Connect(function()
    if godEnabled then applyGodmode() end
end)

-- ============================================
-- FLY
-- ============================================
local flyBodyGyro = nil
local flyBodyVel = nil
local flyConnection = nil

local function stopFly()
    if flyConnection then flyConnection:Disconnect() flyConnection = nil end
    if flyBodyGyro then flyBodyGyro:Destroy() flyBodyGyro = nil end
    if flyBodyVel then flyBodyVel:Destroy() flyBodyVel = nil end
end

local function startFly()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    stopFly()

    flyBodyGyro = Instance.new("BodyGyro", hrp)
    flyBodyGyro.P = 9e4
    flyBodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    flyBodyGyro.CFrame = hrp.CFrame

    flyBodyVel = Instance.new("BodyVelocity", hrp)
    flyBodyVel.Velocity = Vector3.new(0, 0, 0)
    flyBodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    flyBodyVel.P = 1250

    flyConnection = RunService.RenderStepped:Connect(function()
        if not flyEnabled then return end
        local c = LocalPlayer.Character
        if not c or not c:FindFirstChild("HumanoidRootPart") then return end
        local root = c.HumanoidRootPart
        local cam = workspace.CurrentCamera
        local move = Vector3.new(0, 0, 0)

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0, 1, 0) end

        root.BodyVelocity.Velocity = move * flySpeed
        root.BodyGyro.CFrame = cam.CFrame
    end)
end

-- ============================================
-- NOCLIP
-- ============================================
local noclipConnection = nil

local function startNoclip()
    stopNoclip()
    noclipConnection = RunService.Stepped:Connect(function()
        if not noclipEnabled then return end
        local char = LocalPlayer.Character
        if not char then return end
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end)
end

function stopNoclip()
    if noclipConnection then noclipConnection:Disconnect() noclipConnection = nil end
end

-- ============================================
-- СОБЫТИЯ
-- ============================================
Players.PlayerAdded:Connect(function(p)
    if whEnabled then createWH(p) end
end)
Players.PlayerRemoving:Connect(function(p)
    removeWH(p)
end)

-- ============================================
-- КНОПКИ
-- ============================================
WHBtn.MouseButton1Click:Connect(function()
    whEnabled = not whEnabled
    WHBtn.Text = "WH: " .. (whEnabled and "ON" or "OFF")
    WHBtn.BackgroundColor3 = whEnabled and Color3.fromRGB(50,200,50) or Color3.fromRGB(200,50,50)
    if whEnabled then
        for _, p in ipairs(Players:GetPlayers()) do createWH(p) end
    else
        clearWH()
    end
end)

GodBtn.MouseButton1Click:Connect(function()
    godEnabled = not godEnabled
    GodBtn.Text = "GODMODE: " .. (godEnabled and "ON" or "OFF")
    GodBtn.BackgroundColor3 = godEnabled and Color3.fromRGB(50,200,50) or Color3.fromRGB(200,50,50)
    if godEnabled then
        applyGodmode()
    else
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.MaxHealth = 100
                hum.Health = 100
            end
        end
    end
end)

FlyBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    FlyBtn.Text = "FLY: " .. (flyEnabled and "ON" or "OFF")
    FlyBtn.BackgroundColor3 = flyEnabled and Color3.fromRGB(50,200,50) or Color3.fromRGB(200,50,50)
    if flyEnabled then
        startFly()
    else
        stopFly()
    end
end)

NoclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    NoclipBtn.Text = "NOCLIP: " .. (noclipEnabled and "ON" or "OFF")
    NoclipBtn.BackgroundColor3 = noclipEnabled and Color3.fromRGB(50,200,50) or Color3.fromRGB(200,50,50)
    if noclipEnabled then
        startNoclip()
    else
        stopNoclip()
    end
end)

-- Авто-восстановление при респавне
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if flyEnabled then startFly() end
    if noclipEnabled then startNoclip() end
    if godEnabled then applyGodmode() end
end)

updateFlyDisplay()

print("[Brookhaven Menu v10] Загружено. Ключ: 123")

end

if unlocked then
    loadMenu()
end
