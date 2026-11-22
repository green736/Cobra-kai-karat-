-- ============================================================
--  COBRA KAI KARATE — Script by Betmenbd3 (Neon UI Edition)
-- ============================================================
local plr = game.Players.LocalPlayer
local pg  = plr:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local RunService   = game:GetService("RunService")

-- Colors (Строго под превью)
local COL_BG       = Color3.fromRGB(15, 15, 15)      -- Темный фон
local COL_CARD     = Color3.fromRGB(25, 25, 30)      -- Фон карточек
local COL_TEXT     = Color3.fromRGB(255, 255, 255)   -- Белый текст
local COL_MUTED    = Color3.fromRGB(180, 180, 180)   -- Серый текст
local COL_BLUE     = Color3.fromRGB(0, 150, 255)     -- Синий (кнопки/иконки)
local COL_GREEN    = Color3.fromRGB(0, 255, 100)     -- Зеленый (обводка)
local COL_RED      = Color3.fromRGB(255, 30, 30)     -- Красный (лого/крестик)

-- ============ ROOT ============
local gui = Instance.new("ScreenGui")
gui.Name = "CobraKaiKarate_Betmenbd3"
gui.Parent = pg
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999
gui.IgnoreGuiInset = true

-- Main window
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 360, 0, 400)
frame.Position = UDim2.new(0.5, -180, 0.5, -200)
frame.BackgroundColor3 = COL_BG
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ZIndex = 2

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = frame

-- Неоновая обводка (Зеленая)
local frameStroke = Instance.new("UIStroke")
frameStroke.Color = COL_GREEN
frameStroke.Thickness = 2
frameStroke.Transparency = 0.3
frameStroke.Parent = frame

-- Тень
local shadow = Instance.new("ImageLabel")
shadow.Parent = gui
shadow.Size = UDim2.new(0, 380, 0, 420)
shadow.Position = UDim2.new(0.5, -190, 0.5, -210)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://6014261993"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.4
shadow.ZIndex = 1

local function updateShadow()
    if not frame.Visible then shadow.Visible = false return end
    shadow.Visible = true
    shadow.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset - 10, frame.Position.Y.Scale, frame.Position.Y.Offset - 10)
end
RunService.RenderStepped:Connect(updateShadow)

-- ============ TITLE BAR ============
local titleBar = Instance.new("Frame")
titleBar.Parent = frame
titleBar.Size = UDim2.new(1, 0, 0, 60)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 3
local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 12)
titleBarCorner.Parent = titleBar

-- Красная нижняя полоса (как на фото)
local redLine = Instance.new("Frame")
redLine.Parent = titleBar
redLine.Size = UDim2.new(1, 0, 0, 2)
redLine.Position = UDim2.new(0, 0, 1, -2)
redLine.BackgroundColor3 = COL_RED
redLine.BorderSizePixel = 0
redLine.ZIndex = 4

-- Лого (Красный круг с коброй)
local logoBg = Instance.new("Frame")
logoBg.Parent = titleBar
logoBg.Size = UDim2.new(0, 40, 0, 40)
logoBg.Position = UDim2.new(0, 10, 0.5, -20)
logoBg.BackgroundColor3 = COL_RED
logoBg.BorderSizePixel = 0
logoBg.ZIndex = 5
local logoBgCorner = Instance.new("UICorner")
logoBgCorner.CornerRadius = UDim.new(1, 0)
logoBgCorner.Parent = logoBg

local cobraLogo = Instance.new("ImageLabel")
cobraLogo.Parent = logoBg
cobraLogo.Size = UDim2.new(0.8, 0, 0.8, 0)
cobraLogo.Position = UDim2.new(0.1, 0, 0.1, 0)
cobraLogo.BackgroundTransparency = 1
cobraLogo.Image = "rbxassetid://1033980200" -- Картинка кобры
cobraLogo.ImageColor3 = Color3.fromRGB(255, 255, 255)
cobraLogo.ZIndex = 6

-- Заголовки
local titleText = Instance.new("TextLabel")
titleText.Parent = titleBar
titleText.BackgroundTransparency = 1
titleText.Size = UDim2.new(1, -120, 0, 20)
titleText.Position = UDim2.new(0, 60, 0, 10)
titleText.Text = "COBRA KAI"
titleText.TextColor3 = COL_TEXT
titleText.Font = Enum.Font.GothamBlack
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.ZIndex = 5

local titleKarate = Instance.new("TextLabel")
titleKarate.Parent = titleBar
titleKarate.BackgroundTransparency = 1
titleKarate.Size = UDim2.new(1, -120, 0, 20)
titleKarate.Position = UDim2.new(0, 60, 0, 28)
titleKarate.Text = "KARATE"
titleKarate.TextColor3 = COL_RED
titleKarate.Font = Enum.Font.GothamBlack
titleKarate.TextSize = 18
titleKarate.TextXAlignment = Enum.TextXAlignment.Left
titleKarate.ZIndex = 5

local subtitleText = Instance.new("TextLabel")
subtitleText.Parent = titleBar
subtitleText.BackgroundTransparency = 1
subtitleText.Size = UDim2.new(1, -120, 0, 14)
subtitleText.Position = UDim2.new(0, 60, 0, 46)
subtitleText.Text = "Script by Betmenbd3"
subtitleText.TextColor3 = COL_MUTED
subtitleText.Font = Enum.Font.Gotham
subtitleText.TextSize = 10
subtitleText.TextXAlignment = Enum.TextXAlignment.Left
subtitleText.ZIndex = 5

-- Кнопки управления (— и X)
local minBtn = Instance.new("TextButton")
minBtn.Parent = titleBar
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -75, 0.5, -15)
minBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
minBtn.BorderSizePixel = 0
minBtn.Text = "—"
minBtn.TextColor3 = COL_TEXT
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 18
minBtn.AutoButtonColor = false
minBtn.ZIndex = 6
local minBtnCorner = Instance.new("UICorner")
minBtnCorner.CornerRadius = UDim.new(0, 8)
minBtnCorner.Parent = minBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Parent = titleBar
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0.5, -15)
closeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
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

-- ============ CONTENT ============
local content = Instance.new("Frame")
content.Parent = frame
content.Size = UDim2.new(1, -20, 1, -70)
content.Position = UDim2.new(0, 10, 0, 65)
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
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = card
    local s = Instance.new("UIStroke")
    s.Color = COL_GREEN
    s.Thickness = 1
    s.Transparency = 0.4
    s.Parent = card
    return card
end

-- Иконки для карточек
local function addIcon(parent, id, xOffset)
    local iconBg = Instance.new("Frame")
    iconBg.Parent = parent
    iconBg.Size = UDim2.new(0, 36, 0, 36)
    iconBg.Position = UDim2.new(0, xOffset, 0.5, -18)
    iconBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    iconBg.BackgroundTransparency = 0.5
    iconBg.ZIndex = 5
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(1, 0)
    c.Parent = iconBg
    local s = Instance.new("UIStroke")
    s.Color = COL_BLUE
    s.Thickness = 1.5
    s.Parent = iconBg
    
    local img = Instance.new("ImageLabel")
    img.Parent = iconBg
    img.Size = UDim2.new(0.6, 0, 0.6, 0)
    img.Position = UDim2.new(0.2, 0, 0.2, 0)
    img.BackgroundTransparency = 1
    img.Image = "rbxassetid://" .. id
    img.ImageColor3 = COL_BLUE
    img.ZIndex = 6
    return iconBg
end

-- SPY CARD
local spyCard = makeCard(0, 70)
addIcon(spyCard, "6031091004", 10) -- Иконка камеры

local spyTitle = Instance.new("TextLabel")
spyTitle.Parent = spyCard
spyTitle.BackgroundTransparency = 1
spyTitle.Size = UDim2.new(1, -150, 0, 20)
spyTitle.Position = UDim2.new(0, 55, 0, 15)
spyTitle.Text = "STEP 1 — CAPTURE"
spyTitle.TextColor3 = COL_BLUE
spyTitle.Font = Enum.Font.GothamBold
spyTitle.TextSize = 12
spyTitle.TextXAlignment = Enum.TextXAlignment.Left
spyTitle.ZIndex = 5

local spySub = Instance.new("TextLabel")
spySub.Parent = spyCard
spySub.BackgroundTransparency = 1
spySub.Size = UDim2.new(1, -150, 0, 20)
spySub.Position = UDim2.new(0, 55, 0, 35)
spySub.Text = "Do one push-up to sniff"
spySub.TextColor3 = COL_TEXT
spySub.Font = Enum.Font.Gotham
spySub.TextSize = 12
spySub.TextXAlignment = Enum.TextXAlignment.Left
spySub.ZIndex = 5

local spyBtn = Instance.new("TextButton")
spyBtn.Parent = spyCard
spyBtn.Size = UDim2.new(0, 80, 0, 36)
spyBtn.Position = UDim2.new(1, -95, 0.5, -18)
spyBtn.BackgroundColor3 = COL_BLUE
spyBtn.BorderSizePixel = 0
spyBtn.Text = "SPY"
spyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
spyBtn.Font = Enum.Font.GothamBlack
spyBtn.TextSize = 14
spyBtn.AutoButtonColor = false
spyBtn.ZIndex = 5
local spyBtnCorner = Instance.new("UICorner")
spyBtnCorner.CornerRadius = UDim.new(0, 8)
spyBtnCorner.Parent = spyBtn
local spyBtnStroke = Instance.new("UIStroke")
spyBtnStroke.Color = Color3.fromRGB(150, 220, 255)
spyBtnStroke.Thickness = 2
spyBtnStroke.Parent = spyBtn

-- AUTO CARD
local autoCard = makeCard(80, 70)
addIcon(autoCard, "6031075934", 10) -- Иконка шестеренки

local autoTitle = Instance.new("TextLabel")
autoTitle.Parent = autoCard
autoTitle.BackgroundTransparency = 1
autoTitle.Size = UDim2.new(1, -150, 0, 20)
autoTitle.Position = UDim2.new(0, 55, 0, 15)
autoTitle.Text = "STEP 2 — AUTO FARM"
autoTitle.TextColor3 = COL_BLUE
autoTitle.Font = Enum.Font.GothamBold
autoTitle.TextSize = 12
autoTitle.TextXAlignment = Enum.TextXAlignment.Left
autoTitle.ZIndex = 5

local statusLabel = Instance.new("TextLabel")
statusLabel.Parent = autoCard
statusLabel.BackgroundTransparency = 1
statusLabel.Size = UDim2.new(1, -150, 0, 20)
statusLabel.Position = UDim2.new(0, 55, 0, 35)
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
switchBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
switchBg.BorderSizePixel = 0
switchBg.ZIndex = 5
local switchCorner = Instance.new("UICorner")
switchCorner.CornerRadius = UDim.new(1, 0)
switchCorner.Parent = switchBg
local switchStroke = Instance.new("UIStroke")
switchStroke.Color = COL_GREEN
switchStroke.Thickness = 1
switchStroke.Parent = switchBg

local switchKnob = Instance.new("Frame")
switchKnob.Parent = switchBg
switchKnob.Size = UDim2.new(0, 24, 0, 24)
switchKnob.Position = UDim2.new(0, 3, 0.5, -12)
switchKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
local setCard = makeCard(160, 70)
addIcon(setCard, "6035047409", 10) -- Иконка часов

local delayTitle = Instance.new("TextLabel")
delayTitle.Parent = setCard
delayTitle.BackgroundTransparency = 1
delayTitle.Size = UDim2.new(1, -150, 0, 20)
delayTitle.Position = UDim2.new(0, 55, 0, 15)
delayTitle.Text = "DELAY (MS)"
delayTitle.TextColor3 = COL_BLUE
delayTitle.Font = Enum.Font.GothamBold
delayTitle.TextSize = 12
delayTitle.TextXAlignment = Enum.TextXAlignment.Left
delayTitle.ZIndex = 5

local delayHint = Instance.new("TextLabel")
delayHint.Parent = setCard
delayHint.BackgroundTransparency = 1
delayHint.Size = UDim2.new(1, -150, 0, 20)
delayHint.Position = UDim2.new(0, 55, 0, 35)
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
delayBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
delayBox.BorderSizePixel = 0
delayBox.Text = "1200"
delayBox.TextColor3 = COL_TEXT
delayBox.Font = Enum.Font.GothamBold
delayBox.TextSize = 14
delayBox.ClearTextOnFocus = false
delayBox.ZIndex = 5
local delayBoxCorner = Instance.new("UICorner")
delayBoxCorner.CornerRadius = UDim.new(0, 6)
delayBoxCorner.Parent = delayBox
local delayStroke = Instance.new("UIStroke")
delayStroke.Color = COL_GREEN
delayStroke.Thickness = 1
delayStroke.Transparency = 0.3
delayStroke.Parent = delayBox

-- STATS CARD (Нижняя часть)
local statsCard = makeCard(240, 60)

-- REPS (Слева)
local repIcon = Instance.new("ImageLabel")
repIcon.Parent = statsCard
repIcon.Size = UDim2.new(0, 24, 0, 24)
repIcon.Position = UDim2.new(0, 15, 0.5, -12)
repIcon.BackgroundTransparency = 1
repIcon.Image = "rbxassetid://6031090999" -- Стрелочки
repIcon.ImageColor3 = COL_BLUE
repIcon.ZIndex = 6

local repsLabel = Instance.new("TextLabel")
repsLabel.Parent = statsCard
repsLabel.BackgroundTransparency = 1
repsLabel.Size = UDim2.new(0.4, 0, 1, 0)
repsLabel.Position = UDim2.new(0, 45, 0, 0)
repsLabel.Text = "REPS  0"
repsLabel.TextColor3 = COL_TEXT
repsLabel.Font = Enum.Font.GothamBlack
repsLabel.TextSize = 16
repsLabel.TextXAlignment = Enum.TextXAlignment.Left
repsLabel.ZIndex = 5

-- SESSION (Справа)
local sessIcon = Instance.new("ImageLabel")
sessIcon.Parent = statsCard
sessIcon.Size = UDim2.new(0, 24, 0, 24)
sessIcon.Position = UDim2.new(0.5, 10, 0.5, -12)
sessIcon.BackgroundTransparency = 1
sessIcon.Image = "rbxassetid://6031094667" -- Часы
sessIcon.ImageColor3 = COL_BLUE
sessIcon.ZIndex = 6

local sessionLabel = Instance.new("TextLabel")
sessionLabel.Parent = statsCard
sessionLabel.BackgroundTransparency = 1
sessionLabel.Size = UDim2.new(0.5, -40, 1, 0)
sessionLabel.Position = UDim2.new(0.5, 40, 0, 0)
sessionLabel.Text = "SESSION  00:00"
sessionLabel.TextColor3 = COL_TEXT
sessionLabel.Font = Enum.Font.GothamBold
sessionLabel.TextSize = 14
sessionLabel.TextXAlignment = Enum.TextXAlignment.Left
sessionLabel.ZIndex = 5

-- ============ CIRCLE FLOATING BUTTON ============
local circleBtn = Instance.new("TextButton")
circleBtn.Parent = gui
circleBtn.Size = UDim2.new(0, 50, 0, 50)
circleBtn.Position = UDim2.new(1, -70, 0, 70) 
circleBtn.BackgroundColor3 = COL_BG
circleBtn.BorderSizePixel = 0
circleBtn.Text = "CKK"
circleBtn.TextColor3 = COL_RED
circleBtn.Font = Enum.Font.GothamBlack
circleBtn.TextSize = 14
circleBtn.Visible = false
circleBtn.ZIndex = 10
circleBtn.AutoButtonColor = false

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(1, 0)
circleCorner.Parent = circleBtn

local circleStroke = Instance.new("UIStroke")
circleStroke.Color = COL_RED
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
                    spyBtn.BackgroundColor3 = COL_BLUE
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
    local color  = on and COL_GREEN or Color3.fromRGB(40, 40, 40)
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

-- ============ MINIMIZE / RESTORE ============

-- Свернуть в полоску (—)
local minimizedBar = false
local fullH = 400
minBtn.MouseButton1Click:Connect(function()
    if minimizedBar then
        frame.Size = UDim2.new(0, 360, 0, fullH)
        content.Visible = true
        minBtn.Text = "—"
        minimizedBar = false
    else
        frame.Size = UDim2.new(0, 360, 0, 60)
        content.Visible = false
        minBtn.Text = "+"
        minimizedBar = true
    end
end)

-- Превратить в кружок (X)
closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    shadow.Visible = false
    circleBtn.Position = UDim2.new(1, -70, 0, 70) 
    circleBtn.Visible = true
end)

-- Вернуть из кружка в центр (Клик по кружку)
circleBtn.MouseButton1Click:Connect(function()
    if dragMoved then return end
    frame.Position = UDim2.new(0.5, -180, 0.5, -200)
    frame.Visible = true
    shadow.Visible = true
    circleBtn.Visible = false
end)

print("[Cobra Kai Karate — Script by Betmenbd3] Neon UI Loaded.")
