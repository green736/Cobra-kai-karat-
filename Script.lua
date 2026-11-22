-- ============================================================
--  COBRA KAI KARATE — Script by Betmenbd3
-- ============================================================
local plr = game.Players.LocalPlayer
local pg  = plr:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local RunService   = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

-- palette
local COL_BG       = Color3.fromRGB(24, 26, 34)
local COL_BG2      = Color3.fromRGB(34, 37, 48)
local COL_CARD     = Color3.fromRGB(40, 44, 58)
local COL_STROKE   = Color3.fromRGB(60, 65, 85)
local COL_TEXT     = Color3.fromRGB(235, 238, 245)
local COL_MUTED    = Color3.fromRGB(150, 158, 175)
local COL_ACCENT   = Color3.fromRGB(90, 140, 255)
local COL_GREEN    = Color3.fromRGB(60, 190, 120)
local COL_RED      = Color3.fromRGB(230, 90, 100)

-- ============ ROOT ============
local gui = Instance.new("ScreenGui")
gui.Name = "CobraKaiKarate_Betmenbd3"
gui.Parent = pg
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999
gui.IgnoreGuiInset = true

-- shadow
local shadow = Instance.new("Frame")
shadow.Parent = gui
shadow.Size = UDim2.new(0, 300, 0, 306)
shadow.Position = UDim2.new(0.5, -146, 0.5, -146)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.5
shadow.BorderSizePixel = 0
shadow.ZIndex = 0
local shCorner = Instance.new("UICorner")
shCorner.CornerRadius = UDim.new(0, 20)
shCorner.Parent = shadow

-- main window
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 300, 0, 306)
frame.Position = UDim2.new(0.5, -150, 0.5, -150)
frame.BackgroundColor3 = COL_BG
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ClipsDescendants = true
frame.ZIndex = 2

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 14)
frameCorner.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = COL_STROKE
frameStroke.Thickness = 1
frameStroke.Parent = frame

local bgGrad = Instance.new("UIGradient")
bgGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, COL_BG),
    ColorSequenceKeypoint.new(1, COL_BG2),
}
bgGrad.Rotation = 90
bgGrad.Parent = frame

local SHADOW_OFFSET = 4
local function updateShadow()
    if not frame.Visible then
        shadow.Visible = false
        return
    end
    shadow.Visible = true
    shadow.Position = UDim2.new(
        frame.Position.X.Scale, frame.Position.X.Offset + SHADOW_OFFSET,
        frame.Position.Y.Scale, frame.Position.Y.Offset + SHADOW_OFFSET
    )
end
RunService.RenderStepped:Connect(updateShadow)

-- ============ TITLE BAR ============
local titleBar = Instance.new("Frame")
titleBar.Parent = frame
titleBar.Size = UDim2.new(1, 0, 0, 52)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 33, 44)
titleBar.BackgroundTransparency = 0.2
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 3

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 14)
titleBarCorner.Parent = titleBar

local titleBarBottom = Instance.new("Frame")
titleBarBottom.Parent = titleBar
titleBarBottom.Size = UDim2.new(1, 0, 0, 14)
titleBarBottom.Position = UDim2.new(0, 0, 1, -14)
titleBarBottom.BackgroundColor3 = Color3.fromRGB(30, 33, 44)
titleBarBottom.BackgroundTransparency = 0.2
titleBarBottom.BorderSizePixel = 0
titleBarBottom.ZIndex = 3

local accentLine = Instance.new("Frame")
accentLine.Parent = titleBar
accentLine.Size = UDim2.new(1, 0, 0, 2)
accentLine.Position = UDim2.new(0, 0, 1, -2)
accentLine.BackgroundColor3 = COL_ACCENT
accentLine.BorderSizePixel = 0
accentLine.ZIndex = 4

local accentGrad = Instance.new("UIGradient")
accentGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 140, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(160, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 140, 255)),
}
accentGrad.Parent = accentLine

local logoDot = Instance.new("Frame")
logoDot.Parent = titleBar
logoDot.Size = UDim2.new(0, 10, 0, 10)
logoDot.Position = UDim2.new(0, 16, 0.5, -5)
logoDot.BackgroundColor3 = COL_ACCENT
logoDot.BorderSizePixel = 0
logoDot.ZIndex = 5
local logoDotCorner = Instance.new("UICorner")
logoDotCorner.CornerRadius = UDim.new(1, 0)
logoDotCorner.Parent = logoDot

local titleText = Instance.new("TextLabel")
titleText.Parent = titleBar
titleText.BackgroundTransparency = 1
titleText.Size = UDim2.new(1, -100, 0, 18)
titleText.Position = UDim2.new(0, 34, 0, 8)
titleText.Text = "COBRA KAI KARATE"
titleText.TextColor3 = COL_TEXT
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 13
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.ZIndex = 5

local subtitleText = Instance.new("TextLabel")
subtitleText.Parent = titleBar
subtitleText.BackgroundTransparency = 1
subtitleText.Size = UDim2.new(1, -100, 0, 14)
subtitleText.Position = UDim2.new(0, 34, 0, 28)
subtitleText.Text = "Script by Betmenbd3"
subtitleText.TextColor3 = COL_MUTED
subtitleText.Font = Enum.Font.GothamMedium
subtitleText.TextSize = 10
subtitleText.TextXAlignment = Enum.TextXAlignment.Left
subtitleText.ZIndex = 5

-- Minimize Button (—) - Возвращена на место
local minBtn = Instance.new("TextButton")
minBtn.Parent = titleBar
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -74, 0.5, -15)
minBtn.BackgroundColor3 = Color3.fromRGB(52, 56, 72)
minBtn.BorderSizePixel = 0
minBtn.Text = "—"
minBtn.TextColor3 = COL_TEXT
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 16
minBtn.AutoButtonColor = false
minBtn.ZIndex = 6
local minBtnCorner = Instance.new("UICorner")
minBtnCorner.CornerRadius = UDim.new(0, 8)
minBtnCorner.Parent = minBtn

-- Close/Circle Button (X) - Строго в правом верхнем углу
local closeBtn = Instance.new("TextButton")
closeBtn.Parent = titleBar
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -38, 0.5, -15)
closeBtn.BackgroundColor3 = Color3.fromRGB(52, 56, 72)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "X"
closeBtn.TextColor3 = COL_TEXT
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.AutoButtonColor = false
closeBtn.ZIndex = 6
local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0, 8)
closeBtnCorner.Parent = closeBtn

-- Hover effects
minBtn.MouseEnter:Connect(function() TweenService:Create(minBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(70, 76, 96)}):Play() end)
minBtn.MouseLeave:Connect(function() TweenService:Create(minBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(52, 56, 72)}):Play() end)
closeBtn.MouseEnter:Connect(function() TweenService:Create(closeBtn, TweenInfo.new(0.15), {BackgroundColor3 = COL_RED}):Play() end)
closeBtn.MouseLeave:Connect(function() TweenService:Create(closeBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(52, 56, 72)}):Play() end)

-- ============ CIRCLE FLOATING BUTTON ============
local circleBtn = Instance.new("TextButton")
circleBtn.Parent = gui
circleBtn.Size = UDim2.new(0, 50, 0, 50)
circleBtn.Position = UDim2.new(1, -70, 0, 70) 
circleBtn.BackgroundColor3 = COL_BG
circleBtn.BorderSizePixel = 0
circleBtn.Text = "CKK"
circleBtn.TextColor3 = COL_ACCENT
circleBtn.Font = Enum.Font.GothamBold
circleBtn.TextSize = 13
circleBtn.Visible = false
circleBtn.ZIndex = 10
circleBtn.AutoButtonColor = false

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0)
circleCorner.Parent = circleBtn

local circleStroke = Instance.new("UIStroke")
circleStroke.Color = COL_ACCENT
circleStroke.Thickness = 2
circleStroke.Parent = circleBtn

-- Логика перетаскивания кружка
local draggingCircle = false
local dragStart = nil
local startPos = nil
local dragMoved = false

circleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingCircle = true
        dragMoved = false
        dragStart = input.Position
        startPos = circleBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingCircle = false
            end
        end)
    end
end)

circleBtn.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if draggingCircle then
            local delta = input.Position - dragStart
            if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
                dragMoved = true
            end
            circleBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
end)

-- ============ CONTENT ============
local content = Instance.new("Frame")
content.Parent = frame
content.Size = UDim2.new(1, -24, 1, -68)
content.Position = UDim2.new(0, 12, 0, 60)
content.BackgroundTransparency = 1
content.ZIndex = 3

local function makeCard(y, h)
    local card = Instance.new("Frame")
    card.Parent = content
    card.Size = UDim2.new(1, 0, 0, h)
    card.Position = UDim2.new(0, 0, 0, y)
    card.BackgroundColor3 = COL_CARD
    card.BorderSizePixel = 0
    card.ZIndex = 4
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 10)
    c.Parent = card
    local s = Instance.new("UIStroke")
    s.Color = COL_STROKE
    s.Thickness = 1
    s.Parent = card
    return card
end

-- SPY CARD
local spyCard = makeCard(0, 56)
local spyTitle = Instance.new("TextLabel")
spyTitle.Parent = spyCard
spyTitle.BackgroundTransparency = 1
spyTitle.Size = UDim2.new(1, -110, 0, 20)
spyTitle.Position = UDim2.new(0, 14, 0, 9)
spyTitle.Text = "STEP 1 — CAPTURE"
spyTitle.TextColor3 = COL_MUTED
spyTitle.Font = Enum.Font.GothamBold
spyTitle.TextSize = 10
spyTitle.TextXAlignment = Enum.TextXAlignment.Left
spyTitle.ZIndex = 5

local spySub = Instance.new("TextLabel")
spySub.Parent = spyCard
spySub.BackgroundTransparency = 1
spySub.Size = UDim2.new(1, -110, 0, 22)
spySub.Position = UDim2.new(0, 14, 0, 26)
spySub.Text = "Do one push-up to sniff the remote"
spySub.TextColor3 = COL_TEXT
spySub.Font = Enum.Font.Gotham
spySub.TextSize = 12
spySub.TextXAlignment = Enum.TextXAlignment.Left
spySub.ZIndex = 5

local spyBtn = Instance.new("TextButton")
spyBtn.Parent = spyCard
spyBtn.Size = UDim2.new(0, 80, 0, 34)
spyBtn.Position = UDim2.new(1, -94, 0.5, -17)
spyBtn.BackgroundColor3 = COL_ACCENT
spyBtn.BorderSizePixel = 0
spyBtn.Text = "SPY"
spyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
spyBtn.Font = Enum.Font.GothamBold
spyBtn.TextSize = 13
spyBtn.AutoButtonColor = false
spyBtn.ZIndex = 5
local spyBtnCorner = Instance.new("UICorner")
spyBtnCorner.CornerRadius = UDim.new(0, 8)
spyBtnCorner.Parent = spyBtn

spyBtn.MouseEnter:Connect(function() TweenService:Create(spyBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(120, 165, 255)}):Play() end)
spyBtn.MouseLeave:Connect(function()
    if spyBtn.Text == "SPY" then TweenService:Create(spyBtn, TweenInfo.new(0.15), {BackgroundColor3 = COL_ACCENT}):Play() end
end)

-- AUTO CARD
local autoCard = makeCard(64, 72)
local autoTitle = Instance.new("TextLabel")
autoTitle.Parent = autoCard
autoTitle.BackgroundTransparency = 1
autoTitle.Size = UDim2.new(1, -110, 0, 20)
autoTitle.Position = UDim2.new(0, 14, 0, 10)
autoTitle.Text = "STEP 2 — AUTO FARM"
autoTitle.TextColor3 = COL_MUTED
autoTitle.Font = Enum.Font.GothamBold
autoTitle.TextSize = 10
autoTitle.TextXAlignment = Enum.TextXAlignment.Left
autoTitle.ZIndex = 5

local statusLabel = Instance.new("TextLabel")
statusLabel.Parent = autoCard
statusLabel.BackgroundTransparency = 1
statusLabel.Size = UDim2.new(1, -110, 0, 22)
statusLabel.Position = UDim2.new(0, 14, 0, 30)
statusLabel.Text = "Idle — press SPY first"
statusLabel.TextColor3 = COL_TEXT
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.ZIndex = 5

local switchBg = Instance.new("Frame")
switchBg.Parent = autoCard
switchBg.Size = UDim2.new(0, 54, 0, 30)
switchBg.Position = UDim2.new(1, -68, 0.5, -15)
switchBg.BackgroundColor3 = Color3.fromRGB(60, 65, 85)
switchBg.BorderSizePixel = 0
switchBg.ZIndex = 5
local switchCorner = Instance.new("UICorner")
switchCorner.CornerRadius = UDim.new(1, 0)
switchCorner.Parent = switchBg

local switchKnob = Instance.new("Frame")
switchKnob.Parent = switchBg
switchKnob.Size = UDim2.new(0, 24, 0, 24)
switchKnob.Position = UDim2.new(0, 3, 0.5, -12)
switchKnob.BackgroundColor3 = Color3.fromRGB(240, 240, 245)
switchKnob.BorderSizePixel = 0
switchKnob.ZIndex = 6
local switchKnobCorner = Instance.new("UICorner")
switchKnobCorner.CornerRadius = UDim.new(1, 0)
switchKnobCorner.Parent = switchKnob

local switchBtn = Instance.new("TextButton")
switchBtn.Parent = autoCard
switchBtn.Size = UDim2.new(0, 54, 0, 30)
switchBtn.Position = switchBg.Position
switchBtn.BackgroundTransparency = 1
switchBtn.Text = ""
switchBtn.ZIndex = 7

-- SETTINGS CARD
local setCard = makeCard(144, 60)
local delayTitle = Instance.new("TextLabel")
delayTitle.Parent = setCard
delayTitle.BackgroundTransparency = 1
delayTitle.Size = UDim2.new(1, -140, 0, 20)
delayTitle.Position = UDim2.new(0, 14, 0, 10)
delayTitle.Text = "DELAY (MS)"
delayTitle.TextColor3 = COL_MUTED
delayTitle.Font = Enum.Font.GothamBold
delayTitle.TextSize = 10
delayTitle.TextXAlignment = Enum.TextXAlignment.Left
delayTitle.ZIndex = 5

local delayHint = Instance.new("TextLabel")
delayHint.Parent = setCard
delayHint.BackgroundTransparency = 1
delayHint.Size = UDim2.new(1, -140, 0, 20)
delayHint.Position = UDim2.new(0, 14, 0, 30)
delayHint.Text = "Recommended: 1200 (safe)"
delayHint.TextColor3 = COL_TEXT
delayHint.Font = Enum.Font.Gotham
delayHint.TextSize = 12
delayHint.TextXAlignment = Enum.TextXAlignment.Left
delayHint.ZIndex = 5

local delayBox = Instance.new("TextBox")
delayBox.Parent = setCard
delayBox.Size = UDim2.new(0, 100, 0, 36)
delayBox.Position = UDim2.new(1, -114, 0.5, -18)
delayBox.BackgroundColor3 = Color3.fromRGB(30, 33, 44)
delayBox.BorderSizePixel = 0
delayBox.Text = "1200"
delayBox.TextColor3 = COL_TEXT
delayBox.Font = Enum.Font.GothamBold
delayBox.TextSize = 14
delayBox.ClearTextOnFocus = false
delayBox.ZIndex = 5
local delayBoxCorner = Instance.new("UICorner")
delayBoxCorner.CornerRadius = UDim.new(0, 8)
delayBoxCorner.Parent = delayBox
local delayStroke = Instance.new("UIStroke")
delayStroke.Color = COL_STROKE
delayStroke.Thickness = 1
delayStroke.Parent = delayBox

-- STATS CARD
local statsCard = makeCard(212, 42)
local repsLabel = Instance.new("TextLabel")
repsLabel.Parent = statsCard
repsLabel.BackgroundTransparency = 1
repsLabel.Size = UDim2.new(0.5, -14, 1, 0)
repsLabel.Position = UDim2.new(0, 14, 0, 0)
repsLabel.Text = "REPS  0"
repsLabel.TextColor3 = COL_TEXT
repsLabel.Font = Enum.Font.GothamBold
repsLabel.TextSize = 13
repsLabel.TextXAlignment = Enum.TextXAlignment.Left
repsLabel.ZIndex = 5

local sessionLabel = Instance.new("TextLabel")
sessionLabel.Parent = statsCard
sessionLabel.BackgroundTransparency = 1
sessionLabel.Size = UDim2.new(0.5, -14, 1, 0)
sessionLabel.Position = UDim2.new(0.5, 0, 0, 0)
sessionLabel.Text = "SESSION  00:00"
sessionLabel.TextColor3 = COL_MUTED
sessionLabel.Font = Enum.Font.GothamBold
sessionLabel.TextSize = 12
sessionLabel.TextXAlignment = Enum.TextXAlignment.Right
sessionLabel.ZIndex = 5

-- ============ LOGIC ============
local captured = nil
local spying = false
local farming = false
local repCount = 0
local sessionStart = 0

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if spying and not captured and not checkcaller() then
        if method == "FireServer" or method == "InvokeServer" then
            captured = { remote = self, method = method, args = {...} }
            spying = false
            statusLabel.Text = "Captured: " .. tostring(self.Name)
            statusLabel.TextColor3 = COL_GREEN
            spyBtn.Text = "DONE"
            spyBtn.BackgroundColor3 = COL_GREEN
            task.delay(1.5, function()
                if spyBtn.Text == "DONE" then
                    spyBtn.Text = "SPY"
                    spyBtn.BackgroundColor3 = COL_ACCENT
                end
            end)
        end
    end
    return oldNamecall(self, ...)
end)

spyBtn.MouseButton1Click:Connect(function()
    if farming then return end
    captured = nil
    spying = true
    spyBtn.Text = "WAIT..."
    spyBtn.BackgroundColor3 = Color3.fromRGB(200, 160, 60)
    statusLabel.Text = "Do one push-up now..."
    statusLabel.TextColor3 = Color3.fromRGB(240, 200, 90)
end)

local function setSwitch(on)
    local target = on and UDim2.new(0, 27, 0.5, -12) or UDim2.new(0, 3, 0.5, -12)
    local color  = on and COL_GREEN or Color3.fromRGB(60, 65, 85)
    TweenService:Create(switchKnob, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Position = target}):Play()
    TweenService:Create(switchBg,  TweenInfo.new(0.2), {BackgroundColor3 = color}):Play()
end

switchBtn.MouseButton1Click:Connect(function()
    if not captured then
        statusLabel.Text = "Press SPY first"
        statusLabel.TextColor3 = COL_RED
        return
    end

    if farming then
        farming = false
        setSwitch(false)
        statusLabel.Text = "Stopped — Rep " .. repCount
        statusLabel.TextColor3 = COL_MUTED
        return
    end

    farming = true
    repCount = 0
    sessionStart = tick()
    setSwitch(true)
    statusLabel.Text = "Running: " .. tostring(captured.remote.Name)
    statusLabel.TextColor3 = COL_GREEN

    local delayMs = math.max(50, tonumber(delayBox.Text) or 1200)

    task.spawn(function()
        while farming do
            pcall(function()
                if captured.method == "InvokeServer" then
                    captured.remote:InvokeServer(unpack(captured.args))
                else
                    captured.remote:FireServer(unpack(captured.args))
                end
            end)
            repCount += 1
            repsLabel.Text = "REPS  " .. repCount
            task.wait(delayMs / 1000)
        end
    end)
end)

task.spawn(function()
    while true do
        task.wait(1)
        if farming and sessionStart > 0 then
            local elapsed = math.floor(tick() - sessionStart)
            local m = math.floor(elapsed / 60)
            local s = elapsed % 60
            sessionLabel.Text = string.format("SESSION  %02d:%02d", m, s)
        end
    end
end)

-- ============ MINIMIZE / RESTORE LOGIC ============

-- 1. Обычное сворачивание в полоску (кнопка —)
local minimizedBar = false
local fullH = 306
minBtn.MouseButton1Click:Connect(function()
    if minimizedBar then
        frame.Size = UDim2.new(0, 300, 0, fullH)
        content.Visible = true
        minBtn.Text = "—"
        minimizedBar = false
    else
        frame.Size = UDim2.new(0, 300, 0, 52)
        content.Visible = false
        minBtn.Text = "+"
        minimizedBar = true
    end
end)

-- 2. Превращение в кружок (кнопка X)
closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    shadow.Visible = false
    circleBtn.Position = UDim2.new(1, -70, 0, 70) 
    circleBtn.Visible = true
end)

-- 3. Возврат из кружка в меню
circleBtn.MouseButton1Click:Connect(function()
    if dragMoved then return end
    
    local xScale = circleBtn.Position.X.Scale
    local xOffset = circleBtn.Position.X.Offset - 125 
    local yScale = circleBtn.Position.Y.Scale
    local yOffset = circleBtn.Position.Y.Offset

    if xOffset < -150 then xOffset = -150 end
    if yOffset > 500 then yOffset = 500 end

    frame.Position = UDim2.new(xScale, xOffset, yScale, yOffset)
    frame.Visible = true
    shadow.Visible = true
    circleBtn.Visible = false
end)

print("[Cobra Kai Karate — Script by Betmenbd3] ready.")
