-- ============================================================
--  COBRA KAI KARATE — PULL-UP BYPASS TEST
-- ============================================================
local plr = game.Players.LocalPlayer
local pg  = plr:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local RunService   = game:GetService("RunService")

-- Palette
local COL_BG       = Color3.fromRGB(24, 26, 34)
local COL_CARD     = Color3.fromRGB(40, 44, 58)
local COL_TEXT     = Color3.fromRGB(235, 238, 245)
local COL_ACCENT   = Color3.fromRGB(90, 140, 255)
local COL_GREEN    = Color3.fromRGB(60, 190, 120)
local COL_RED      = Color3.fromRGB(230, 90, 100)
local COL_STROKE   = Color3.fromRGB(60, 65, 85)
local COL_MUTED    = Color3.fromRGB(150, 158, 175)

-- ============ ROOT ============
local gui = Instance.new("ScreenGui")
gui.Name = "CobraKaiBypass"
gui.Parent = pg
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.5, -150, 0.5, -125)
frame.BackgroundColor3 = COL_BG
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 14)
frameCorner.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = COL_STROKE
frameStroke.Parent = frame

-- TITLE
local titleBar = Instance.new("Frame")
titleBar.Parent = frame
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 33, 44)
titleBar.ZIndex = 3
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 14)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Parent = titleBar
titleText.BackgroundTransparency = 1
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.Text = "PULL-UP BYPASS TEST"
titleText.TextColor3 = COL_TEXT
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 14

-- CONTENT
local content = Instance.new("Frame")
content.Parent = frame
content.Size = UDim2.new(1, -20, 1, -50)
content.Position = UDim2.new(0, 10, 0, 50)
content.BackgroundTransparency = 1

-- SPY BUTTON
local spyBtn = Instance.new("TextButton")
spyBtn.Parent = content
spyBtn.Size = UDim2.new(1, 0, 0, 40)
spyBtn.Position = UDim2.new(0, 0, 0, 0)
spyBtn.BackgroundColor3 = COL_ACCENT
spyBtn.Text = "1. SPY (Do one pull-up)"
spyBtn.TextColor3 = COL_TEXT
spyBtn.Font = Enum.Font.GothamBold
spyBtn.TextSize = 13
local sCorner = Instance.new("UICorner")
sCorner.CornerRadius = UDim.new(0, 8)
sCorner.Parent = spyBtn

-- AUTO BUTTON
local autoBtn = Instance.new("TextButton")
autoBtn.Parent = content
autoBtn.Size = UDim2.new(1, 0, 0, 40)
autoBtn.Position = UDim2.new(0, 0, 0, 50)
autoBtn.BackgroundColor3 = COL_CARD
autoBtn.Text = "2. START BYPASS"
autoBtn.TextColor3 = COL_TEXT
autoBtn.Font = Enum.Font.GothamBold
autoBtn.TextSize = 13
local aCorner = Instance.new("UICorner")
aCorner.CornerRadius = UDim.new(0, 8)
aCorner.Parent = autoBtn

-- LOG
local logLabel = Instance.new("TextLabel")
logLabel.Parent = content
logLabel.Size = UDim2.new(1, 0, 0, 40)
logLabel.Position = UDim2.new(0, 0, 0, 100)
logLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
logLabel.TextColor3 = COL_GREEN
logLabel.Font = Enum.Font.Code
logLabel.TextSize = 12
logLabel.Text = "Waiting for SPY..."
local lCorner = Instance.new("UICorner")
lCorner.CornerRadius = UDim.new(0, 8)
lCorner.Parent = logLabel

-- INFO
local infoLabel = Instance.new("TextLabel")
infoLabel.Parent = content
infoLabel.Size = UDim2.new(1, 0, 0, 40)
infoLabel.Position = UDim2.new(0, 0, 0, 150)
infoLabel.BackgroundTransparency = 1
infoLabel.Text = "⚠️ Press SPY near the PULL-UP BAR.\nDo ONE pull-up manually."
infoLabel.TextColor3 = COL_MUTED
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 11
infoLabel.TextWrapped = true

-- ============ LOGIC ============
local captured = nil
local spying = false
local farming = false

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    if spying and not captured and not checkcaller() then
        if method == "FireServer" or method == "InvokeServer" then
            captured = { remote = self, method = method, args = {...} }
            spying = false
            logLabel.Text = "✅ Captured: " .. tostring(self.Name)
            logLabel.TextColor3 = COL_ACCENT
            
            -- Print arguments for debugging
            print("[SPY] Captured remote:", self:GetFullName())
            for i, v in ipairs(captured.args) do
                print("arg["..i.."]:", typeof(v), v)
            end
        end
    end
    return oldNamecall(self, ...)
end)

spyBtn.MouseButton1Click:Connect(function()
    captured = nil
    spying = true
    logLabel.Text = "Waiting for pull-up (SPY ON)..."
    logLabel.TextColor3 = COL_MUTED
end)

autoBtn.MouseButton1Click:Connect(function()
    if not captured then
        logLabel.Text = "❌ Press SPY first!"
        logLabel.TextColor3 = COL_RED
        return
    end

    if farming then
        farming = false
        autoBtn.Text = "2. START BYPASS"
        autoBtn.BackgroundColor3 = COL_CARD
        logLabel.Text = "Stopped."
        return
    end

    farming = true
    autoBtn.Text = "2. STOP (Spamming...)"
    autoBtn.BackgroundColor3 = COL_RED
    logLabel.Text = "🚀 SPAMMING! (10 times/sec)"
    
    task.spawn(function()
        local count = 0
        while farming do
            -- Method 1 & 2: Spam + Time Shift (if any timestamp exists)
            pcall(function()
                local newArgs = {}
                for i, v in ipairs(captured.args) do
                    -- If argument looks like a timestamp, add 3 seconds
                    if type(v) == "number" and v > 1000000000 then
                        newArgs[i] = v + 3 
                    else
                        newArgs[i] = v
                    end
                end
                
                if captured.method == "InvokeServer" then
                    captured.remote:InvokeServer(unpack(newArgs))
                else
                    captured.remote:FireServer(unpack(newArgs))
                end
            end)
            
            count = count + 1
            logLabel.Text = "Requests sent: " .. count
            
            -- Wait 0.1s = 10 requests per second
            task.wait(0.1)
        end
    end)
end)

print("[Pull-Up Bypass] Loaded.")
