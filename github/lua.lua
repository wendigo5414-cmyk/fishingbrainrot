-- ============================================
-- PRIME HUB V2.0 - COMPLETE FIXED VERSION
-- Variables limit fix with proper scoping
-- ============================================

    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local HttpService = game:GetService("HttpService")
    local TweenService = game:GetService("TweenService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    if player.PlayerGui:FindFirstChild("PRIMEHubGUI") then return end

    -- ========================================
    -- KEY SYSTEM MODULE
    -- ========================================
        local KeySettings = {
            Title = "PRIME Hub",
            Subtitle = "Key System",
            Note = "Click 'Get Key' button to obtain the key",
            FileName = "PRIMEHub_Key",
            SaveKey = true,
            GrabKeyFromSite = true,
            Key = {"https://pastebin.com/raw/CD4DyVWc"}
        }

        local function getSavedKey()
            if readfile then
                local success, result = pcall(function()
                    return readfile(KeySettings.FileName .. ".txt")
                end)
                if success and result then return result end
            end
            return nil
        end

        local function saveKeyToFile(key)
            if writefile then
                pcall(function()
                    writefile(KeySettings.FileName .. ".txt", key)
                end)
            end
        end

        local function getKeyFromSite(url)
            local success, result = pcall(function()
                return game:HttpGet(url, true)
            end)
            if success and result then
                return result:gsub("%s+", ""):gsub("\n", ""):gsub("\r", "")
            end
            return nil
        end

        local savedKey = getSavedKey()
        local KeyGui = Instance.new("ScreenGui")
        KeyGui.Name = "PRIMEHubKeyGUI"
        KeyGui.ResetOnSpawn = false
        KeyGui.Parent = player:WaitForChild("PlayerGui")

        local KeyFrame = Instance.new("Frame")
        KeyFrame.Size = UDim2.new(0, 400, 0, 250)
        KeyFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
        KeyFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
        KeyFrame.BorderSizePixel = 0
        KeyFrame.Parent = KeyGui
        Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 12)

        local KeyStroke = Instance.new("UIStroke")
        KeyStroke.Thickness = 2
        KeyStroke.Color = Color3.fromRGB(255, 0, 0)
        KeyStroke.Parent = KeyFrame

        local KeyTitle = Instance.new("TextLabel")
        KeyTitle.Size = UDim2.new(1, 0, 0, 50)
        KeyTitle.BackgroundTransparency = 1
        KeyTitle.Text = KeySettings.Title .. " - " .. KeySettings.Subtitle
        KeyTitle.Font = Enum.Font.GothamBold
        KeyTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
        KeyTitle.TextSize = 20
        KeyTitle.Parent = KeyFrame

        local KeyNote = Instance.new("TextLabel")
        KeyNote.Size = UDim2.new(1, -20, 0, 30)
        KeyNote.Position = UDim2.new(0, 10, 0, 50)
        KeyNote.BackgroundTransparency = 1
        KeyNote.Text = KeySettings.Note
        KeyNote.Font = Enum.Font.Gotham
        KeyNote.TextColor3 = Color3.fromRGB(200, 200, 200)
        KeyNote.TextSize = 12
        KeyNote.TextWrapped = true
        KeyNote.Parent = KeyFrame

        local KeyBox = Instance.new("TextBox")
        KeyBox.Size = UDim2.new(0, 350, 0, 40)
        KeyBox.Position = UDim2.new(0.5, -175, 0, 90)
        KeyBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        KeyBox.BorderSizePixel = 0
        KeyBox.PlaceholderText = "Enter Key Here..."
        KeyBox.Text = ""
        KeyBox.Font = Enum.Font.Gotham
        KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        KeyBox.TextSize = 16
        KeyBox.Parent = KeyFrame
        Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 8)

        local KeyBoxStroke = Instance.new("UIStroke")
        KeyBoxStroke.Thickness = 1
        KeyBoxStroke.Color = Color3.fromRGB(255, 0, 0)
        KeyBoxStroke.Transparency = 0.5
        KeyBoxStroke.Parent = KeyBox

        KeyBox:GetPropertyChangedSignal("Text"):Connect(function()
            local text = KeyBox.Text
            local cleanText = text:gsub(" ", "")
            if text ~= cleanText then KeyBox.Text = cleanText end
        end)

        local GetKeyBtn = Instance.new("TextButton")
        GetKeyBtn.Size = UDim2.new(0, 350, 0, 40)
        GetKeyBtn.Position = UDim2.new(0.5, -175, 0, 145)
        GetKeyBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        GetKeyBtn.Text = "Get Key"
        GetKeyBtn.Font = Enum.Font.GothamBold
        GetKeyBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
        GetKeyBtn.TextSize = 18
        GetKeyBtn.BorderSizePixel = 0
        GetKeyBtn.Parent = KeyFrame
        Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 8)

        local GetKeyStroke = Instance.new("UIStroke")
        GetKeyStroke.Thickness = 1.5
        GetKeyStroke.Color = Color3.fromRGB(255, 0, 0)
        GetKeyStroke.Parent = GetKeyBtn

        local SubmitKeyBtn = Instance.new("TextButton")
        SubmitKeyBtn.Size = UDim2.new(0, 350, 0, 40)
        SubmitKeyBtn.Position = UDim2.new(0.5, -175, 0, 200)
        SubmitKeyBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        SubmitKeyBtn.Text = "Submit Key"
        SubmitKeyBtn.Font = Enum.Font.GothamBold
        SubmitKeyBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
        SubmitKeyBtn.TextSize = 18
        SubmitKeyBtn.BorderSizePixel = 0
        SubmitKeyBtn.Parent = KeyFrame
        Instance.new("UICorner", SubmitKeyBtn).CornerRadius = UDim.new(0, 8)

        local SubmitKeyStroke = Instance.new("UIStroke")
        SubmitKeyStroke.Thickness = 1.5
        SubmitKeyStroke.Color = Color3.fromRGB(255, 0, 0)
        SubmitKeyStroke.Parent = SubmitKeyBtn

        GetKeyBtn.MouseButton1Click:Connect(function()
            setclipboard("https://direct-link.net/1462308/RRaO8s6Woee8")
            game.StarterGui:SetCore("SendNotification", {
                Title = "PRIME Hub",
                Text = "Key link copied to clipboard!",
                Duration = 5
            })
        end)

        local function verifyKey(inputKey)
            local cleanInput = inputKey:gsub("%s+", ""):gsub("\n", ""):gsub("\r", "")
            for _, keyValue in pairs(KeySettings.Key) do
                if KeySettings.GrabKeyFromSite then
                    local siteKey = getKeyFromSite(keyValue)
                    if siteKey and cleanInput == siteKey then return true end
                else
                    local cleanKey = keyValue:gsub("%s+", ""):gsub("\n", ""):gsub("\r", "")
                    if cleanInput == cleanKey then return true end
                end
            end
            return false
        end

        local keyVerified = false

        if KeySettings.SaveKey and savedKey and verifyKey(savedKey) then
            keyVerified = true
            KeyGui:Destroy()
            return true
        else
            SubmitKeyBtn.MouseButton1Click:Connect(function()
                SubmitKeyBtn.Text = "Checking..."
                SubmitKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 0)
                wait(0.3)

                local inputKey = KeyBox.Text
                if verifyKey(inputKey) then
                    keyVerified = true
                    if KeySettings.SaveKey then
                        saveKeyToFile(inputKey:gsub("%s+", ""))
                    end
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "PRIME Hub",
                        Text = "Key Verified! Loading...",
                        Duration = 3
                    })
                    wait(0.3)
                    KeyGui:Destroy()
                else
                    SubmitKeyBtn.Text = "Submit Key"
                    SubmitKeyBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "PRIME Hub",
                        Text = "Invalid Key! Check Discord for help",
                        Duration = 3
                    })
                end
            end)

            repeat wait() until keyVerified
            return true
        end


    -- ========================================
    -- MAIN HUB UI INITIALIZATION
    -- ========================================
    game.StarterGui:SetCore("SendNotification", {
        Title = "PRIME Hub",
        Text = "Loaded | By WENDIGO",
        Duration = 7
    })

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PRIMEHubGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(255, 0, 0)
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 12)

local TopBarStroke = Instance.new("UIStroke")
TopBarStroke.Thickness = 1
TopBarStroke.Color = Color3.fromRGB(255, 0, 0)
TopBarStroke.Transparency = 0.6
TopBarStroke.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "PRIME Hub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -70, 0.5, -15)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinimizeBtn.Text = "-"
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 0)
MinimizeBtn.TextSize = 20
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Parent = TopBar

Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 6)

local MinimizeStroke = Instance.new("UIStroke")
MinimizeStroke.Thickness = 1.5
MinimizeStroke.Color = Color3.fromRGB(255, 255, 0)
MinimizeStroke.Transparency = 0.3
MinimizeStroke.Parent = MinimizeBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
CloseBtn.TextSize = 18
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TopBar

Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Thickness = 1.5
CloseStroke.Color = Color3.fromRGB(255, 50, 50)
CloseStroke.Transparency = 0.3
CloseStroke.Parent = CloseBtn

-- Draggable Top Bar
local draggingMain = false
local dragInputMain
local dragStartMain
local startPosMain

local function updateMain(input)
local delta = input.Position - dragStartMain
MainFrame.Position = UDim2.new(startPosMain.X.Scale, startPosMain.X.Offset + delta.X, startPosMain.Y.Scale, startPosMain.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
draggingMain = true
dragStartMain = input.Position
startPosMain = MainFrame.Position

input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
draggingMain = false
end
end)
end
end)

TopBar.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInputMain = input
end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
if input == dragInputMain and draggingMain then
updateMain(input)
end
end)

local LeftSection = Instance.new("ScrollingFrame")
LeftSection.Size = UDim2.new(0, 150, 1, -50)
LeftSection.Position = UDim2.new(0, 5, 0, 45)
LeftSection.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
LeftSection.BorderSizePixel = 0
LeftSection.ScrollBarThickness = 6
LeftSection.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
LeftSection.CanvasSize = UDim2.new(0, 0, 0, 0)
LeftSection.Parent = MainFrame

Instance.new("UICorner", LeftSection).CornerRadius = UDim.new(0, 8)

local LeftStroke = Instance.new("UIStroke")
LeftStroke.Thickness = 1
LeftStroke.Color = Color3.fromRGB(255, 0, 0)
LeftStroke.Transparency = 0.6
LeftStroke.Parent = LeftSection

local LeftListLayout = Instance.new("UIListLayout")
LeftListLayout.Padding = UDim.new(0, 5)
LeftListLayout.Parent = LeftSection

local RightSection = Instance.new("Frame")
RightSection.Size = UDim2.new(0, 330, 1, -50)
RightSection.Position = UDim2.new(0, 160, 0, 45)
RightSection.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
RightSection.BorderSizePixel = 0
RightSection.Visible = false
RightSection.Parent = MainFrame

Instance.new("UICorner", RightSection).CornerRadius = UDim.new(0, 8)

local RightStroke = Instance.new("UIStroke")
RightStroke.Thickness = 1
RightStroke.Color = Color3.fromRGB(255, 0, 0)
RightStroke.Transparency = 0.6
RightStroke.Parent = RightSection

local ContentFrame = Instance.new("ScrollingFrame")
ContentFrame.Size = UDim2.new(1, 0, 1, 0)
ContentFrame.Position = UDim2.new(0, 5, 0, 5)
ContentFrame.BackgroundTransparency = 1
ContentFrame.BorderSizePixel = 0
ContentFrame.ScrollBarThickness = 6
ContentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ContentFrame.Parent = RightSection

local ContentListLayout = Instance.new("UIListLayout")
ContentListLayout.Padding = UDim.new(0, 10)
ContentListLayout.Parent = ContentFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 10, 0.5, -30)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Text = "P"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.TextSize = 28
ToggleButton.BorderSizePixel = 0
ToggleButton.Parent = ScreenGui

Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 30)

local ToggleBtnStroke = Instance.new("UIStroke")
ToggleBtnStroke.Thickness = 2
ToggleBtnStroke.Color = Color3.fromRGB(255, 0, 0)
ToggleBtnStroke.Transparency = 0.3
ToggleBtnStroke.Parent = ToggleButton

local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
local delta = input.Position - dragStart
ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

ToggleButton.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = ToggleButton.Position

input.Changed:Connect(function()
if input.UserInputState == Enum.UserInputState.End then
dragging = false
end
end)
end
end)

ToggleButton.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
if input == dragInput and dragging then
update(input)
end
end)

ToggleButton.MouseButton1Click:Connect(function()
MainFrame.Visible = not MainFrame.Visible
end)

local isMinimized = false
local originalSize = MainFrame.Size

MinimizeBtn.MouseButton1Click:Connect(function()
isMinimized = not isMinimized
if isMinimized then
MainFrame:TweenSize(UDim2.new(0, 500, 0, 40), "Out", "Quad", 0.3, true)
wait(0.3)
LeftSection.Visible = false
RightSection.Visible = false
else
MainFrame:TweenSize(originalSize, "Out", "Quad", 0.3, true)
wait(0.3)
LeftSection.Visible = true
end
end)

CloseBtn.MouseButton1Click:Connect(function()
ScreenGui:Destroy()
end)

local currentSection = nil

-- Utility Functions
local function convertMoneyToNumber(moneyString)
moneyString = tostring(moneyString):gsub("%$", ""):gsub(",", ""):gsub("%s", "")

local multipliers = {
K = 1000,
M = 1000000,
B = 1000000000,
T = 1000000000000,
QD = 1000000000000000,
QN = 1000000000000000000,
SX = 1000000000000000000000,
SP = 1000000000000000000000000

}

local number = tonumber(moneyString:match("[%d%.]+"))
local suffix = moneyString:match("[KMBTQ][DN]?")

if not number then return 0 end

if suffix and multipliers[suffix] then
return number * multipliers[suffix]
end

return number
end

-- SETTINGS SAVE/LOAD SYSTEM
local SettingsFileName = "PRIMEHub_Settings"

local function getDefaultSettings()
return {
-- Main Features
autoCarryEnabled = false,
autoSpeedEnabled = false,
selectedSpeedValue = 1,
autoBrainrotEnabled = false,
autoRebirthEnabled = false,
autoCollectEnabled = false,
currentCollectDelay = 1,

-- Game Features
speedEnabled = false,
currentSpeed = 16,
pickupEnabled = false,
debugEnabled = true,
farmBrainrotEnabled = false,
selectedRarity = "Secret",
currentMoneyThreshold = 1,

-- UI Settings
currentTheme = "Red Theme"
}
end

local function saveSettings(settings)
if writefile then
pcall(function()
writefile(SettingsFileName .. ".json", HttpService:JSONEncode(settings))
if debugEnabled then print("[SAVE] Settings saved successfully!") end
end)
end
end

local function loadSettings()
if readfile then
local success, result = pcall(function()
return HttpService:JSONDecode(readfile(SettingsFileName .. ".json"))
end)
if success and result then
if debugEnabled then print("[LOAD] Settings loaded successfully!") end
return result
end
end
if debugEnabled then print("[LOAD] No saved settings found, using defaults") end
return getDefaultSettings()
end

-- Load saved settings
local savedSettings = loadSettings()

local function formatMoney(value)
if value >= 1000000000000000000000000 then
return string.format("$%.1fSP", value / 1000000000000000000000000)
elseif value >= 1000000000000000000000 then
return string.format("$%.1fSX", value / 1000000000000000000000)
elseif value >= 1000000000000000000 then
return string.format("$%.1fQN", value / 1000000000000000000)
elseif value >= 1000000000000000 then
return string.format("$%.1fQD", value / 1000000000000000)
elseif value >= 1000000000000 then
return string.format("$%.1fT", value / 1000000000000)
elseif value >= 1000000000 then
return string.format("$%.1fB", value / 1000000000)
elseif value >= 1000000 then
return string.format("$%.1fM", value / 1000000)
elseif value >= 1000 then
return string.format("$%.1fK", value / 1000)
else
return string.format("$%.0f", value)
end
end

local function detectMyPlot()
local plots = workspace:FindFirstChild("CoreObjects")
if not plots then return nil end

plots = plots:FindFirstChild("Plots")
if not plots then return nil end

for _, plot in pairs(plots:GetChildren()) do
local boxPrompt = plot:FindFirstChild("BoxPrompt")
if boxPrompt then
if boxPrompt:FindFirstChild("BoxPrompAttachment") or boxPrompt:FindFirstChildOfClass("BoxPrompAttachment") then
return plot
end
end
end

return nil
end

local function getPlayerMoney()
local success, money = pcall(function()
return player.leaderstats.Cash.Value
end)

if success then
return convertMoneyToNumber(money)
end
return 0
end

local function getBrainrotPrice(stand)
local success, price = pcall(function()
local upgradeButton = stand:FindFirstChild("UpgradeButton")
if not upgradeButton then return nil end

local upgradeGUI = upgradeButton:FindFirstChild("UpgradeGUI")
if not upgradeGUI then return nil end

local upgrade = upgradeGUI:FindFirstChild("Upgrade")
if not upgrade then return nil end

local priceLabel = upgrade:FindFirstChild("Price")
if not priceLabel then return nil end

return priceLabel.Text
end)

if success and price then
return convertMoneyToNumber(price)
end
return nil
end

local function upgradeBrainrot(standName)
local success, result = pcall(function()
local args = {standName}
return ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Networker"):WaitForChild("RF/UpgradeBrainrot"):InvokeServer(unpack(args))
end)

return success and result
end

    -- AUTO BUY FOOD DATA
    local FoodData = {
        AllFoods = {},
        SelectedFoods = {},
        AutoBuyEnabled = false
    }

    local function LoadFoods()
        local success, result = pcall(function()
            local foodMerchant = player.PlayerGui:WaitForChild("Main"):WaitForChild("Frames"):WaitForChild("FoodMerchant"):WaitForChild("ShopContent")

            local count = 0
            for _, item in pairs(foodMerchant:GetChildren()) do
                if item:IsA("Frame") and item.Name ~= "Template" then
                    table.insert(FoodData.AllFoods, item.Name)
                    count = count + 1
                end
            end

            table.sort(FoodData.AllFoods)
            return count
        end)

        return success and result or 0
    end

    local function GetFoodStock(foodName)
        local success, stock = pcall(function()
            local foodFrame = player.PlayerGui.Main.Frames.FoodMerchant.ShopContent:FindFirstChild(foodName)
            if not foodFrame then return 0 end

            local stockLabel = foodFrame:FindFirstChild("Stock")
            if not stockLabel then return 0 end

            local stockText = stockLabel.Text
            local stockNum = tonumber(stockText:match("x(%d+)"))
            return stockNum or 0
        end)

        return success and stock or 0
    end

    local function GetFoodPrice(foodName)
        local success, price = pcall(function()
            local foodFrame = player.PlayerGui.Main.Frames.FoodMerchant.ShopContent:FindFirstChild(foodName)
            if not foodFrame then return nil end

            local priceLabel = foodFrame:FindFirstChild("ItemCost")
            if not priceLabel then return nil end

            return priceLabel.Text
        end)

        if success and price then
            return convertMoneyToNumber(price)
        end
        return nil
    end

    local function BuyFood(foodName)
        local success, result = pcall(function()
            local args = {foodName}
            return ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Networker"):WaitForChild("RF/BuyFood"):InvokeServer(unpack(args))
        end)

        return success and result
    end

    local function AutoBuyFoodLoop()
        while FoodData.AutoBuyEnabled do
            local processedAny = false

            for _, foodName in pairs(FoodData.SelectedFoods) do
                if not FoodData.AutoBuyEnabled then break end

                local stock = GetFoodStock(foodName)

                if stock > 0 then
                    local price = GetFoodPrice(foodName)

                    if price and price > 0 then
                        local playerMoney = getPlayerMoney()

                        if playerMoney >= price then
                            local success = BuyFood(foodName)

                            if success then
                                processedAny = true
                                wait(0.5)
                            end
                        else
                            -- Wait for money
                            while getPlayerMoney() < price do
                                wait(1)
                                if not FoodData.AutoBuyEnabled then break end
                            end
                        end
                    end
                end
            end

            if not processedAny then
                wait(2)
            else
                wait(1)
            end
        end
    end

    -- Initialize Food Data
    LoadFoods()
    
-- AUTO UPGRADE BRAINROTS
local autoUpgradeEnabled = savedSettings.autoUpgradeEnabled or false
local maxMoneyThreshold = savedSettings.maxMoneyThreshold or 1000

local function autoUpgradeBrainrots()
while autoUpgradeEnabled do
local myPlot = detectMyPlot()

if myPlot then
local stands = myPlot:FindFirstChild("Stands")

if stands then
local playerMoney = getPlayerMoney()

for _, stand in pairs(stands:GetChildren()) do
if not autoUpgradeEnabled then break end

local hasBrainrot = false
for _, child in pairs(stand:GetChildren()) do
if child:IsA("Model") then
hasBrainrot = true
break
end
end

if hasBrainrot then
local upgradePrice = getBrainrotPrice(stand)

if upgradePrice and upgradePrice > 0 then
if playerMoney >= upgradePrice and upgradePrice <= maxMoneyThreshold then
local success = upgradeBrainrot(stand.Name)

if success then
wait(0.3)
playerMoney = getPlayerMoney()
end

wait(0.5)
end
end
end
end
end
end

wait(2)
end
end

-- AUTO BRAINROT EGGS DATA
local EggData = {
AllEggs = {},
AllMutations = {},
SelectedEggs = {},
SelectedMutations = {"Normal"},
MinBudget = savedSettings.MinBudget or 1,
MaxBudget = savedSettings.MaxBudget or 1000,
RebirthEggsEnabled = savedSettings.RebirthEggsEnabled or false,
AutoBrainrotEnabled = savedSettings.AutoBrainrotEnabled or false
}

local function LoadEggs()
local success, result = pcall(function()
local eggsFolder = ReplicatedStorage:FindFirstChild("Assets")
if eggsFolder then eggsFolder = eggsFolder:FindFirstChild("Eggs") end
if not eggsFolder then return 0 end

local count = 0
for _, eggModel in pairs(eggsFolder:GetChildren()) do
if eggModel:IsA("Model") then
local eggName = eggModel.Name
if not eggName:match("^Gold ") and not eggName:match("^Diamond ") then
table.insert(EggData.AllEggs, eggName)
count = count + 1
end
end
end

table.sort(EggData.AllEggs)
return count
end)

return success and result or 0
end

local function LoadMutations()
EggData.AllMutations = {"Normal", "Gold", "Diamond"}

local success = pcall(function()
local mutationFolder = ReplicatedStorage:FindFirstChild("Assets")
if mutationFolder then mutationFolder = mutationFolder:FindFirstChild("WeatherEventAssets") end

if mutationFolder then
for _, mutation in pairs(mutationFolder:GetDescendants()) do
if mutation:IsA("Model") or mutation:IsA("Folder") then
local mutationName = mutation.Name
local alreadyExists = false
for _, existing in pairs(EggData.AllMutations) do
if existing == mutationName then
alreadyExists = true
break
end
end
if not alreadyExists then
table.insert(EggData.AllMutations, mutationName)
end
end
end
end
end)
end

local function SpawnEgg()
local success = pcall(function()
ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Networker"):WaitForChild("RF/RequestEggSpawn"):InvokeServer()
end)
return success
end

local function GetEggInfo(eggModel)
local info = {
Name = "",
Mutation = "Normal",
Price = 0,
IsRebirth = false,
IsFake = false
}

local hasMeshes = false
for _, child in pairs(eggModel:GetChildren()) do
if child.Name:match("Meshes/") then
hasMeshes = true
break
end
end

if not hasMeshes then
info.IsFake = true
return info
end

info.IsRebirth = eggModel:FindFirstChild("RebirthRequirement") ~= nil

for _, child in pairs(eggModel:GetDescendants()) do
if child.Name == "Price" and child:IsA("TextLabel") then
info.Price = convertMoneyToNumber(child.Text)
break
end
end

if info.Price == 0 then
info.IsFake = true
return info
end

for _, child in pairs(eggModel:GetDescendants()) do
if child:IsA("BoolValue") and child.Name:match("MutationVFX_") then
info.Mutation = child.Name:gsub("MutationVFX_", "")
break
end
end

info.Name = eggModel.Name
for _, mutation in pairs(EggData.AllMutations) do
if mutation ~= "Normal" and info.Name:match("^" .. mutation .. " ") then
info.Name = info.Name:gsub("^" .. mutation .. " ", "")
break
end
end

return info
end

local function ProcessEgg(eggModel)
local eggInfo = GetEggInfo(eggModel)

if eggInfo.IsFake then
return false
end

local playerMoney = getPlayerMoney()

-- ============================================
-- REBIRTH EGGS SECTION (SIRF MAX BUDGET CHECK)
-- ============================================
if eggInfo.IsRebirth then
if not EggData.RebirthEggsEnabled then
return false
end

-- SIRF MAX BUDGET CHECK (MIN BUDGET NAHI)
if eggInfo.Price > EggData.MaxBudget then
return false
end

-- Money wait karne ka code
if playerMoney < eggInfo.Price then
AutoSellStatus.Text = "Waiting for money: " .. formatMoney(eggInfo.Price)
while getPlayerMoney() < eggInfo.Price do
wait(1)
if not EggData.AutoBrainrotEnabled then break end
end
playerMoney = getPlayerMoney()
end

-- Buy prompt logic
local buyPrompt = nil
for _, child in pairs(eggModel:GetChildren()) do
if child.Name:match("Meshes/") then
buyPrompt = child:FindFirstChild("BuyPrompt", true)
if buyPrompt and buyPrompt:IsA("ProximityPrompt") then
break
end
end
end

if buyPrompt then
player.Character:PivotTo(eggModel:GetPivot())
wait(0.2)

for distance = 0, 10 do
pcall(function()
fireproximityprompt(buyPrompt, distance)
end)
end

pcall(function()
buyPrompt:InputHoldBegin()
wait(0.05)
buyPrompt:InputHoldEnd()
end)

pcall(function()
buyPrompt.Triggered:Fire(player)
end)

pcall(function()
local clickDetector = buyPrompt.Parent:FindFirstChildOfClass("ClickDetector")
if clickDetector then
fireclickdetector(clickDetector)
end
end)

wait(0.2)

local eggStillExists = false
pcall(function()
local eggsFolder = workspace.CoreObjects.Eggs
if eggsFolder:FindFirstChild(eggModel.Name) then
eggStillExists = true
end
end)

if eggStillExists then
wait(0.3)
return ProcessEgg(eggModel)
end

return true
end

return false
end

-- ============================================
-- NORMAL EGGS SECTION (MIN + MAX DONO CHECK)
-- ============================================

-- Check if egg is selected
local eggSelected = false
for _, selected in pairs(EggData.SelectedEggs) do
if selected == eggInfo.Name then
eggSelected = true
break
end
end

if not eggSelected then
return false
end

-- Check if mutation is selected
local mutationSelected = false
for _, selected in pairs(EggData.SelectedMutations) do
if selected == eggInfo.Mutation then
mutationSelected = true
break
end
end

if not mutationSelected then
return false
end

-- NORMAL EGGS: MIN + MAX DONO CHECK
if eggInfo.Price < EggData.MinBudget or eggInfo.Price > EggData.MaxBudget then
return false
end

-- Money wait karne ka code
if playerMoney < eggInfo.Price then
AutoSellStatus.Text = "Waiting for money: " .. formatMoney(eggInfo.Price)
while getPlayerMoney() < eggInfo.Price do
wait(1)
if not EggData.AutoBrainrotEnabled then break end
end
playerMoney = getPlayerMoney()
end

-- Buy prompt logic
local buyPrompt = nil
for _, child in pairs(eggModel:GetChildren()) do
if child.Name:match("Meshes/") then
buyPrompt = child:FindFirstChild("BuyPrompt", true)
if buyPrompt and buyPrompt:IsA("ProximityPrompt") then
break
end
end
end

if buyPrompt then
player.Character:PivotTo(eggModel:GetPivot())
wait(0.2)

for distance = 0, 10 do
pcall(function()
fireproximityprompt(buyPrompt, distance)
end)
end

pcall(function()
buyPrompt:InputHoldBegin()
wait(0.05)
buyPrompt:InputHoldEnd()
end)

pcall(function()
buyPrompt.Triggered:Fire(player)
end)

pcall(function()
local clickDetector = buyPrompt.Parent:FindFirstChildOfClass("ClickDetector")
if clickDetector then
fireclickdetector(clickDetector)
end
end)

wait(0.2)

local eggExists = false
pcall(function()
eggExists = workspace.CoreObjects.Eggs:FindFirstChild(eggModel.Name) ~= nil
end)

if eggExists then
wait(0.3)
return ProcessEgg(eggModel)
end

return true
end

return false
end

local function MonitorEggs()
while EggData.AutoBrainrotEnabled do
local processedAny = false

pcall(function()
local eggsFolder = workspace:WaitForChild("CoreObjects"):WaitForChild("Eggs")

for _, eggModel in pairs(eggsFolder:GetChildren()) do
if eggModel:IsA("Model") and eggModel.Parent then
local success, result = pcall(function()
return ProcessEgg(eggModel)
end)

if success and result then
processedAny = true
wait(0.4)
wait(0.3)  -- YE BHI ADD KIYA - agar process nahi hua to bhi wait
end
end
end
end)

if not processedAny then
local spawnSuccess = SpawnEgg()
if not spawnSuccess then
wait(0.5)
else
wait(0.5)
end
end

wait(0.4)
end
end

-- Initialize Eggs Data
LoadEggs()
LoadMutations()

-- MAIN CONTAINER
local MainContainer = Instance.new("ScrollingFrame")
MainContainer.Size = UDim2.new(1, -20, 1, -15)
MainContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainContainer.BorderSizePixel = 0
MainContainer.Visible = false
MainContainer.ScrollBarThickness = 6
MainContainer.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
MainContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
MainContainer.Parent = ContentFrame

Instance.new("UICorner", MainContainer).CornerRadius = UDim.new(0, 8)

local MainContainerStroke = Instance.new("UIStroke")
MainContainerStroke.Thickness = 1.5
MainContainerStroke.Color = Color3.fromRGB(255, 0, 0)
MainContainerStroke.Transparency = 0.4
MainContainerStroke.Parent = MainContainer

local MainContainerTitle = Instance.new("TextLabel")
MainContainerTitle.Size = UDim2.new(1, -20, 0, 35)
MainContainerTitle.Position = UDim2.new(0, 10, 0, 10)
MainContainerTitle.BackgroundTransparency = 1
MainContainerTitle.Text = "⚡ Main Features"
MainContainerTitle.Font = Enum.Font.GothamBold
MainContainerTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
MainContainerTitle.TextSize = 20
MainContainerTitle.Parent = MainContainer

local MainBtn = Instance.new("TextButton")
MainBtn.Size = UDim2.new(1, -10, 0, 35)
MainBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainBtn.Text = "Main"
MainBtn.Font = Enum.Font.GothamBold
MainBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
MainBtn.TextSize = 16
MainBtn.BorderSizePixel = 0
MainBtn.Parent = LeftSection

Instance.new("UICorner", MainBtn).CornerRadius = UDim.new(0, 6)

local MainBtnStroke = Instance.new("UIStroke")
MainBtnStroke.Thickness = 1
MainBtnStroke.Color = Color3.fromRGB(255, 0, 0)
MainBtnStroke.Transparency = 0.5
MainBtnStroke.Parent = MainBtn

local MainListLayout = Instance.new("UIListLayout")
MainListLayout.Padding = UDim.new(0, 15)
MainListLayout.Parent = MainContainer
MainListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local TitleSpacer = Instance.new("Frame")
TitleSpacer.Size = UDim2.new(1, 0, 0, 15)
TitleSpacer.BackgroundTransparency = 1
TitleSpacer.LayoutOrder = 0
TitleSpacer.Parent = MainContainer

-- FEATURE 1: AUTO UPGRADE BRAINROTS
local AutoUpgradeFrame = Instance.new("Frame")
AutoUpgradeFrame.Size = UDim2.new(1, -5, 0, 88)
AutoUpgradeFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
AutoUpgradeFrame.BorderSizePixel = 0
AutoUpgradeFrame.LayoutOrder = 1
AutoUpgradeFrame.Parent = MainContainer

Instance.new("UICorner", AutoUpgradeFrame).CornerRadius = UDim.new(0, 8)

local AutoUpgradeStroke = Instance.new("UIStroke")
AutoUpgradeStroke.Thickness = 1
AutoUpgradeStroke.Color = Color3.fromRGB(255, 0, 0)
AutoUpgradeStroke.Transparency = 0.6
AutoUpgradeStroke.Parent = AutoUpgradeFrame

local FeatureTitle = Instance.new("TextLabel")
FeatureTitle.Size = UDim2.new(1, -80, 0, 28)
FeatureTitle.Position = UDim2.new(0, 8, 0, 4)
FeatureTitle.BackgroundTransparency = 1
FeatureTitle.Text = "🔄 Auto Upgrade Brainrots"
FeatureTitle.Font = Enum.Font.GothamBold
FeatureTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
FeatureTitle.TextSize = 13
FeatureTitle.TextXAlignment = Enum.TextXAlignment.Left
FeatureTitle.Parent = AutoUpgradeFrame

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 58, 0, 24)
ToggleBtn.Position = UDim2.new(1, -62, 0, 6)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
ToggleBtn.Text = "OFF"
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 11
ToggleBtn.BorderSizePixel = 0
ToggleBtn.Parent = AutoUpgradeFrame

if autoUpgradeEnabled then
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
ToggleBtn.Text = "ON"
end

Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 6)

local SliderLabel = Instance.new("TextLabel")
SliderLabel.Size = UDim2.new(1, -100, 0, 16)
SliderLabel.Position = UDim2.new(0, 8, 0, 36)
SliderLabel.BackgroundTransparency = 1
SliderLabel.Text = "Max Upgrade Budget:"
SliderLabel.Font = Enum.Font.GothamBold
SliderLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
SliderLabel.TextSize = 11
SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
SliderLabel.Parent = AutoUpgradeFrame

local ValueLabel = Instance.new("TextLabel")
ValueLabel.Size = UDim2.new(0, 78, 0, 16)
ValueLabel.Position = UDim2.new(1, -82, 0, 36)
ValueLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ValueLabel.Text = formatMoney(maxMoneyThreshold)
ValueLabel.Font = Enum.Font.GothamBold
ValueLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
ValueLabel.TextSize = 10
ValueLabel.BorderSizePixel = 0
ValueLabel.Parent = AutoUpgradeFrame

Instance.new("UICorner", ValueLabel).CornerRadius = UDim.new(0, 5)

local SliderBg = Instance.new("Frame")
SliderBg.Size = UDim2.new(1, -12, 0, 7)
SliderBg.Position = UDim2.new(0, 8, 0, 60)
SliderBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SliderBg.BorderSizePixel = 0
SliderBg.Parent = AutoUpgradeFrame

Instance.new("UICorner", SliderBg).CornerRadius = UDim.new(0, 3)

local SliderFill = Instance.new("Frame")
SliderFill.Size = UDim2.new(0, 0, 1, 0)
SliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
SliderFill.BorderSizePixel = 0
SliderFill.Parent = SliderBg

Instance.new("UICorner", SliderFill).CornerRadius = UDim.new(0, 3)

local SliderBtn = Instance.new("TextButton")
SliderBtn.Size = UDim2.new(0, 14, 0, 14)
SliderBtn.Position = UDim2.new(0, -7, 0.5, -7)
SliderBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
SliderBtn.Text = ""
SliderBtn.BorderSizePixel = 0
SliderBtn.Parent = SliderBg

Instance.new("UICorner", SliderBtn).CornerRadius = UDim.new(1, 0)

local minMoney = 1
local maxMoney = 100000000000000000000000000
local draggingSlider = false

local function updateSlider(input)
local sliderSize = SliderBg.AbsoluteSize.X
local mousePos = input.Position.X - SliderBg.AbsolutePosition.X
local percentage = math.clamp(mousePos / sliderSize, 0, 1)
local logMin = math.log10(minMoney)
local logMax = math.log10(maxMoney)
local logValue = logMin + (percentage * (logMax - logMin))
maxMoneyThreshold = math.floor(10 ^ logValue)
ValueLabel.Text = formatMoney(maxMoneyThreshold)
SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
SliderBtn.Position = UDim2.new(percentage, -7, 0.5, -7)
end

SliderBtn.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
draggingSlider = true
end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
draggingSlider = false
end
end)

    -- Delay Slider fix (line 1303-1311 ke around)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
    if delayDrag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then 
    updateDelaySlider(input) 
    end
    end)

    DelaySliderBg.InputBegan:Connect(function(i) 
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then 
    updateDelaySlider(i) 
    end 
    end)

-- Restore saved money threshold slider
do
local logMin = math.log10(1)
local logMax = math.log10(1000000000000)
local logValue = math.log10(maxMoneyThreshold)
local percentage = (logValue - logMin) / (logMax - logMin)

ValueLabel.Text = formatMoney(maxMoneyThreshold)
SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
SliderBtn.Position = UDim2.new(percentage, -7, 0.5, -7)
end

SliderBg.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
updateSlider(input)
end
end)

-- Restore saved money threshold slider
do
local logMin = math.log10(1)
local logMax = math.log10(1000000000000)
local logValue = math.log10(maxMoneyThreshold)
local percentage = (logValue - logMin) / (logMax - logMin)

ValueLabel.Text = formatMoney(maxMoneyThreshold)
SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
SliderBtn.Position = UDim2.new(percentage, -7, 0.5, -7)
end

ToggleBtn.MouseButton1Click:Connect(function()
autoUpgradeEnabled = not autoUpgradeEnabled

if autoUpgradeEnabled then
ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
ToggleBtn.Text = "ON"
game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Auto Upgrade Started! Max: " .. formatMoney(maxMoneyThreshold),
Duration = 3
})
spawn(autoUpgradeBrainrots)
else
ToggleBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
ToggleBtn.Text = "OFF"
game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Auto Upgrade Stopped!",
Duration = 3
})
end

savedSettings.autoUpgradeEnabled = autoUpgradeEnabled
saveSettings(savedSettings)
end)

-- FEATURE 2: AUTO BRAINROT EGGS (with dropdowns)
local AutoEggsFrame = Instance.new("Frame")
AutoEggsFrame.Size = UDim2.new(1, -5, 0, 270)
AutoEggsFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
AutoEggsFrame.BorderSizePixel = 0
AutoEggsFrame.LayoutOrder = 2
AutoEggsFrame.Parent = MainContainer

Instance.new("UICorner", AutoEggsFrame).CornerRadius = UDim.new(0, 8)

local AutoEggsStroke = Instance.new("UIStroke")
AutoEggsStroke.Thickness = 1
AutoEggsStroke.Color = Color3.fromRGB(255, 0, 0)
AutoEggsStroke.Transparency = 0.6
AutoEggsStroke.Parent = AutoEggsFrame

local AutoEggsTitle = Instance.new("TextLabel")
AutoEggsTitle.Size = UDim2.new(1, -80, 0, 28)
AutoEggsTitle.Position = UDim2.new(0, 8, 0, 4)
AutoEggsTitle.BackgroundTransparency = 1
AutoEggsTitle.Text = "🥚 Auto Brainrot Eggs"
AutoEggsTitle.Font = Enum.Font.GothamBold
AutoEggsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoEggsTitle.TextSize = 13
AutoEggsTitle.TextXAlignment = Enum.TextXAlignment.Left
AutoEggsTitle.Parent = AutoEggsFrame

local AutoEggsToggle = Instance.new("TextButton")
AutoEggsToggle.Size = UDim2.new(0, 58, 0, 24)
AutoEggsToggle.Position = UDim2.new(1, -62, 0, 6)
AutoEggsToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
AutoEggsToggle.Text = "OFF"
AutoEggsToggle.Font = Enum.Font.GothamBold
AutoEggsToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoEggsToggle.TextSize = 11
AutoEggsToggle.BorderSizePixel = 0
AutoEggsToggle.Parent = AutoEggsFrame

if EggData.AutoBrainrotEnabled then
AutoEggsToggle.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
AutoEggsToggle.Text = "ON"
end

Instance.new("UICorner", AutoEggsToggle).CornerRadius = UDim.new(0, 6)

-- Min Budget Slider  
local MinLabel = Instance.new("TextLabel")
MinLabel.Size = UDim2.new(1, -100, 0, 16)
MinLabel.Position = UDim2.new(0, 8, 0, 36)
MinLabel.BackgroundTransparency = 1
MinLabel.Text = "Min Budget:"
MinLabel.Font = Enum.Font.GothamBold
MinLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
MinLabel.TextSize = 11
MinLabel.TextXAlignment = Enum.TextXAlignment.Left
MinLabel.Parent = AutoEggsFrame

local MinValue = Instance.new("TextLabel")
MinValue.Size = UDim2.new(0, 78, 0, 16)
MinValue.Position = UDim2.new(1, -82, 0, 36)
MinValue.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MinValue.Text = "$1"
MinValue.Font = Enum.Font.GothamBold
MinValue.TextColor3 = Color3.fromRGB(255, 0, 0)
MinValue.TextSize = 10
MinValue.BorderSizePixel = 0
MinValue.Parent = AutoEggsFrame
Instance.new("UICorner", MinValue).CornerRadius = UDim.new(0, 5)

local MinSliderBg = Instance.new("Frame")
MinSliderBg.Size = UDim2.new(1, -12, 0, 7)
MinSliderBg.Position = UDim2.new(0, 8, 0, 58)
MinSliderBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MinSliderBg.BorderSizePixel = 0
MinSliderBg.Parent = AutoEggsFrame
Instance.new("UICorner", MinSliderBg).CornerRadius = UDim.new(0, 3)

local MinSliderFill = Instance.new("Frame")
MinSliderFill.Size = UDim2.new(0, 0, 1, 0)
MinSliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MinSliderFill.BorderSizePixel = 0
MinSliderFill.Parent = MinSliderBg
Instance.new("UICorner", MinSliderFill).CornerRadius = UDim.new(0, 3)

local MinSliderBtn = Instance.new("TextButton")
MinSliderBtn.Size = UDim2.new(0, 14, 0, 14)
MinSliderBtn.Position = UDim2.new(0, -7, 0.5, -7)
MinSliderBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MinSliderBtn.Text = ""
MinSliderBtn.BorderSizePixel = 0
MinSliderBtn.Parent = MinSliderBg
Instance.new("UICorner", MinSliderBtn).CornerRadius = UDim.new(1, 0)

-- Max Budget Slider
local MaxLabel = Instance.new("TextLabel")
MaxLabel.Size = UDim2.new(1, -100, 0, 16)
MaxLabel.Position = UDim2.new(0, 8, 0, 76)
MaxLabel.BackgroundTransparency = 1
MaxLabel.Text = "Max Budget:"
MaxLabel.Font = Enum.Font.GothamBold
MaxLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
MaxLabel.TextSize = 11
MaxLabel.TextXAlignment = Enum.TextXAlignment.Left
MaxLabel.Parent = AutoEggsFrame

local MaxValue = Instance.new("TextLabel")
MaxValue.Size = UDim2.new(0, 78, 0, 16)
MaxValue.Position = UDim2.new(1, -82, 0, 76)
MaxValue.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MaxValue.Text = "$1K"
MaxValue.Font = Enum.Font.GothamBold
MaxValue.TextColor3 = Color3.fromRGB(255, 0, 0)
MaxValue.TextSize = 10
MaxValue.BorderSizePixel = 0
MaxValue.Parent = AutoEggsFrame
Instance.new("UICorner", MaxValue).CornerRadius = UDim.new(0, 5)

local MaxSliderBg = Instance.new("Frame")
MaxSliderBg.Size = UDim2.new(1, -12, 0, 7)
MaxSliderBg.Position = UDim2.new(0, 8, 0, 98)
MaxSliderBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MaxSliderBg.BorderSizePixel = 0
MaxSliderBg.Parent = AutoEggsFrame
Instance.new("UICorner", MaxSliderBg).CornerRadius = UDim.new(0, 3)

local MaxSliderFill = Instance.new("Frame")
MaxSliderFill.Size = UDim2.new(0.16, 0, 1, 0)
MaxSliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MaxSliderFill.BorderSizePixel = 0
MaxSliderFill.Parent = MaxSliderBg
Instance.new("UICorner", MaxSliderFill).CornerRadius = UDim.new(0, 3)

local MaxSliderBtn = Instance.new("TextButton")
MaxSliderBtn.Size = UDim2.new(0, 14, 0, 14)
MaxSliderBtn.Position = UDim2.new(0.16, -7, 0.5, -7)
MaxSliderBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MaxSliderBtn.Text = ""
MaxSliderBtn.BorderSizePixel = 0
MaxSliderBtn.Parent = MaxSliderBg
Instance.new("UICorner", MaxSliderBtn).CornerRadius = UDim.new(1, 0)

-- Smooth Slider Functions
local function updateMinSlider(input)
local size = MinSliderBg.AbsoluteSize.X
local pos = input.Position.X - MinSliderBg.AbsolutePosition.X
local pct = math.clamp(pos / size, 0, 1)
local logMin = math.log10(1)
local logMax = math.log10(1000000000000000000000000)
local logValue = logMin + (pct * (logMax - logMin))
EggData.MinBudget = math.floor(10 ^ logValue)
MinValue.Text = formatMoney(EggData.MinBudget)
MinSliderFill.Size = UDim2.new(pct, 0, 1, 0)
MinSliderBtn.Position = UDim2.new(pct, -7, 0.5, -7)
end

local function updateMaxSlider(input)
local size = MaxSliderBg.AbsoluteSize.X
local pos = input.Position.X - MaxSliderBg.AbsolutePosition.X
local pct = math.clamp(pos / size, 0, 1)
local logMin = math.log10(1)
local logMax = math.log10(1000000000000000000000000)
local logValue = logMin + (pct * (logMax - logMin))
EggData.MaxBudget = math.floor(10 ^ logValue)
MaxValue.Text = formatMoney(EggData.MaxBudget)
MaxSliderFill.Size = UDim2.new(pct, 0, 1, 0)
MaxSliderBtn.Position = UDim2.new(pct, -7, 0.5, -7)
end

local minDrag, maxDrag = false, false
MinSliderBtn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then minDrag = true end end)
MaxSliderBtn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then maxDrag = true end end)
game:GetService("UserInputService").InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then minDrag, maxDrag = false, false end end)
    -- Min/Max Budget Slider fix (line 716-726 ke around)
    game:GetService("UserInputService").InputChanged:Connect(function(i)
    if minDrag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then updateMinSlider(i) end
    if maxDrag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then updateMaxSlider(i) end
    end)
    MinSliderBg.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then updateMinSlider(i) end end)
    MaxSliderBg.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then updateMaxSlider(i) end end)

-- EGGS DROPDOWN with Search and Select All
local EggsDropdownBtn = Instance.new("TextButton")
EggsDropdownBtn.Size = UDim2.new(1, -12, 0, 26)
EggsDropdownBtn.Position = UDim2.new(0, 8, 0, 116)
EggsDropdownBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
EggsDropdownBtn.Text = "🥚 Select Eggs ▼"
EggsDropdownBtn.Font = Enum.Font.GothamBold
EggsDropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EggsDropdownBtn.TextSize = 11
EggsDropdownBtn.TextXAlignment = Enum.TextXAlignment.Left
EggsDropdownBtn.BorderSizePixel = 0
EggsDropdownBtn.Parent = AutoEggsFrame
Instance.new("UICorner", EggsDropdownBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIPadding", EggsDropdownBtn).PaddingLeft = UDim.new(0, 6)

local EggsDropContent = Instance.new("Frame")
EggsDropContent.Size = UDim2.new(1, -12, 0, 0)
EggsDropContent.Position = UDim2.new(0, 8, 0, 147)
EggsDropContent.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
EggsDropContent.BorderSizePixel = 0
EggsDropContent.Visible = false
EggsDropContent.ClipsDescendants = true
EggsDropContent.Parent = AutoEggsFrame
Instance.new("UICorner", EggsDropContent).CornerRadius = UDim.new(0, 5)

local EggsSearchBox = Instance.new("TextBox")
EggsSearchBox.Size = UDim2.new(1, -8, 0, 22)
EggsSearchBox.Position = UDim2.new(0, 4, 0, 4)
EggsSearchBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
EggsSearchBox.PlaceholderText = "🔍 Search eggs..."
EggsSearchBox.Text = ""
EggsSearchBox.Font = Enum.Font.Gotham
EggsSearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
EggsSearchBox.TextSize = 10
EggsSearchBox.BorderSizePixel = 0
EggsSearchBox.Parent = EggsDropContent
Instance.new("UICorner", EggsSearchBox).CornerRadius = UDim.new(0, 4)
Instance.new("UIPadding", EggsSearchBox).PaddingLeft = UDim.new(0, 4)

local EggsSelectAllBtn = Instance.new("TextButton")
EggsSelectAllBtn.Size = UDim2.new(1, -8, 0, 22)
EggsSelectAllBtn.Position = UDim2.new(0, 4, 0, 30)
EggsSelectAllBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
EggsSelectAllBtn.Text = "✓ Select All"
EggsSelectAllBtn.Font = Enum.Font.GothamBold
EggsSelectAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EggsSelectAllBtn.TextSize = 10
EggsSelectAllBtn.BorderSizePixel = 0
EggsSelectAllBtn.Parent = EggsDropContent
Instance.new("UICorner", EggsSelectAllBtn).CornerRadius = UDim.new(0, 4)

local EggsScrollFrame = Instance.new("ScrollingFrame")
EggsScrollFrame.Size = UDim2.new(1, -8, 0, 120)
EggsScrollFrame.Position = UDim2.new(0, 4, 0, 56)
EggsScrollFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
EggsScrollFrame.BorderSizePixel = 0
EggsScrollFrame.ScrollBarThickness = 3
EggsScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
EggsScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
-- YE 2 LINES ADD KARO
EggsScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
EggsScrollFrame.ScrollBarImageTransparency = 0
-- Scroll speed control karne ke liye ye property
EggsScrollFrame.CanvasPosition = Vector2.new(0, 0)
EggsScrollFrame.Parent = EggsDropContent
Instance.new("UICorner", EggsScrollFrame).CornerRadius = UDim.new(0, 4)

local EggsListLayout = Instance.new("UIListLayout")
EggsListLayout.Padding = UDim.new(0, 1)
EggsListLayout.Parent = EggsScrollFrame

local eggButtons = {}
local eggsDropdownOpen = false

for i, eggName in ipairs(EggData.AllEggs) do
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, -4, 0, 20)
btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
btn.Text = ""
btn.BorderSizePixel = 0
btn.Parent = EggsScrollFrame
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 3)

local check = Instance.new("TextLabel")
check.Size = UDim2.new(0, 13, 0, 13)
check.Position = UDim2.new(0, 2, 0.5, -6.5)
check.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
check.Text = ""
check.Font = Enum.Font.GothamBold
check.TextColor3 = Color3.fromRGB(0, 255, 0)
check.TextSize = 10
check.BorderSizePixel = 0
check.Parent = btn
Instance.new("UICorner", check).CornerRadius = UDim.new(0, 2)

local lbl = Instance.new("TextLabel")
lbl.Size = UDim2.new(1, -20, 1, 0)
lbl.Position = UDim2.new(0, 18, 0, 0)
lbl.BackgroundTransparency = 1
lbl.Text = eggName
lbl.Font = Enum.Font.Gotham
lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
lbl.TextSize = 9
lbl.TextXAlignment = Enum.TextXAlignment.Left
lbl.Parent = btn

table.insert(eggButtons, {button = btn, name = eggName, check = check})

btn.MouseButton1Click:Connect(function()
local found = false
for j, sel in ipairs(EggData.SelectedEggs) do
if sel == eggName then
table.remove(EggData.SelectedEggs, j)
found = true
break
end
end
if not found then
table.insert(EggData.SelectedEggs, eggName)
end
check.Text = (not found) and "✓" or ""
end)
end

EggsSearchBox:GetPropertyChangedSignal("Text"):Connect(function()
local searchText = EggsSearchBox.Text:lower()
for _, data in ipairs(eggButtons) do
if searchText == "" or data.name:lower():find(searchText, 1, true) then
data.button.Visible = true
else
data.button.Visible = false
end
end
EggsScrollFrame.CanvasSize = UDim2.new(0, 0, 0, EggsListLayout.AbsoluteContentSize.Y + 4)
end)

local allSelected = false

EggsSelectAllBtn.MouseButton1Click:Connect(function()
allSelected = not allSelected
if allSelected then
EggData.SelectedEggs = {}
for _, eggName in ipairs(EggData.AllEggs) do
table.insert(EggData.SelectedEggs, eggName)
end
for _, data in ipairs(eggButtons) do
data.check.Text = "✓"
end
EggsSelectAllBtn.Text = "✗ Deselect All"
EggsSelectAllBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
else
EggData.SelectedEggs = {}
for _, data in ipairs(eggButtons) do
data.check.Text = ""
end
EggsSelectAllBtn.Text = "✓ Select All"
EggsSelectAllBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end
end)



-- MUTATIONS DROPDOWN with Search and Select All
local MutDropdownBtn = Instance.new("TextButton")
MutDropdownBtn.Size = UDim2.new(1, -12, 0, 26)
MutDropdownBtn.Position = UDim2.new(0, 8, 0, 148)
MutDropdownBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MutDropdownBtn.Text = "✨ Select Mutations ▼"
MutDropdownBtn.Font = Enum.Font.GothamBold
MutDropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MutDropdownBtn.TextSize = 11
MutDropdownBtn.TextXAlignment = Enum.TextXAlignment.Left
MutDropdownBtn.BorderSizePixel = 0
MutDropdownBtn.Parent = AutoEggsFrame
Instance.new("UICorner", MutDropdownBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIPadding", MutDropdownBtn).PaddingLeft = UDim.new(0, 6)

local MutDropContent = Instance.new("Frame")
MutDropContent.Size = UDim2.new(1, -12, 0, 0)
MutDropContent.Position = UDim2.new(0, 8, 0, 179)
MutDropContent.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MutDropContent.BorderSizePixel = 0
MutDropContent.Visible = false
MutDropContent.ClipsDescendants = true
MutDropContent.Parent = AutoEggsFrame
Instance.new("UICorner", MutDropContent).CornerRadius = UDim.new(0, 5)

local MutSearchBox = Instance.new("TextBox")
MutSearchBox.Size = UDim2.new(1, -8, 0, 22)
MutSearchBox.Position = UDim2.new(0, 4, 0, 4)
MutSearchBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MutSearchBox.PlaceholderText = "🔍 Search mutations..."
MutSearchBox.Text = ""
MutSearchBox.Font = Enum.Font.Gotham
MutSearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MutSearchBox.TextSize = 10
MutSearchBox.BorderSizePixel = 0
MutSearchBox.Parent = MutDropContent
Instance.new("UICorner", MutSearchBox).CornerRadius = UDim.new(0, 4)
Instance.new("UIPadding", MutSearchBox).PaddingLeft = UDim.new(0, 4)

local MutSelectAllBtn = Instance.new("TextButton")
MutSelectAllBtn.Size = UDim2.new(1, -8, 0, 22)
MutSelectAllBtn.Position = UDim2.new(0, 4, 0, 30)
MutSelectAllBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MutSelectAllBtn.Text = "✓ Select All"
MutSelectAllBtn.Font = Enum.Font.GothamBold
MutSelectAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MutSelectAllBtn.TextSize = 10
MutSelectAllBtn.BorderSizePixel = 0
MutSelectAllBtn.Parent = MutDropContent
Instance.new("UICorner", MutSelectAllBtn).CornerRadius = UDim.new(0, 4)

local MutScrollFrame = Instance.new("ScrollingFrame")
MutScrollFrame.Size = UDim2.new(1, -8, 0, 100)
MutScrollFrame.Position = UDim2.new(0, 4, 0, 56)
MutScrollFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MutScrollFrame.BorderSizePixel = 0
MutScrollFrame.ScrollBarThickness = 3
MutScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
MutScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
-- YE 2 LINES ADD KARO
MutScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
MutScrollFrame.ScrollBarImageTransparency = 0
-- Scroll speed control
MutScrollFrame.CanvasPosition = Vector2.new(0, 0)
MutScrollFrame.Parent = MutDropContent
Instance.new("UICorner", MutScrollFrame).CornerRadius = UDim.new(0, 4)

local MutListLayout = Instance.new("UIListLayout")
MutListLayout.Padding = UDim.new(0, 1)
MutListLayout.Parent = MutScrollFrame

local mutButtons = {}
local mutDropdownOpen = false

for i, mutName in ipairs(EggData.AllMutations) do
local btn = Instance.new("TextButton")
btn.Size = UDim2.new(1, -4, 0, 20)
btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
btn.Text = ""
btn.BorderSizePixel = 0
btn.Parent = MutScrollFrame
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 3)

local check = Instance.new("TextLabel")
check.Size = UDim2.new(0, 13, 0, 13)
check.Position = UDim2.new(0, 2, 0.5, -6.5)
check.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
check.Text = (mutName == "Normal") and "✓" or ""
check.Font = Enum.Font.GothamBold
check.TextColor3 = Color3.fromRGB(0, 255, 0)
check.TextSize = 10
check.BorderSizePixel = 0
check.Parent = btn
Instance.new("UICorner", check).CornerRadius = UDim.new(0, 2)

local lbl = Instance.new("TextLabel")
lbl.Size = UDim2.new(1, -20, 1, 0)
lbl.Position = UDim2.new(0, 18, 0, 0)
lbl.BackgroundTransparency = 1
lbl.Text = mutName
lbl.Font = Enum.Font.Gotham
lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
lbl.TextSize = 9
lbl.TextXAlignment = Enum.TextXAlignment.Left
lbl.Parent = btn

table.insert(mutButtons, {button = btn, name = mutName, check = check})

btn.MouseButton1Click:Connect(function()
local found = false
for j, sel in ipairs(EggData.SelectedMutations) do
if sel == mutName then
table.remove(EggData.SelectedMutations, j)
found = true
break
end
end
if not found then
table.insert(EggData.SelectedMutations, mutName)
end
check.Text = (not found) and "✓" or ""
end)
end

MutSearchBox:GetPropertyChangedSignal("Text"):Connect(function()
local searchText = MutSearchBox.Text:lower()
for _, data in ipairs(mutButtons) do
if searchText == "" or data.name:lower():find(searchText, 1, true) then
data.button.Visible = true
else
data.button.Visible = false
end
end
MutScrollFrame.CanvasSize = UDim2.new(0, 0, 0, MutListLayout.AbsoluteContentSize.Y + 4)
end)

local allMutSelected = false
MutSelectAllBtn.MouseButton1Click:Connect(function()
allMutSelected = not allMutSelected
if allMutSelected then
EggData.SelectedMutations = {}
for _, mutName in ipairs(EggData.AllMutations) do
table.insert(EggData.SelectedMutations, mutName)
end
for _, data in ipairs(mutButtons) do
data.check.Text = "✓"
end
MutSelectAllBtn.Text = "✗ Deselect All"
MutSelectAllBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
else
EggData.SelectedMutations = {}
for _, data in ipairs(mutButtons) do
data.check.Text = ""
end
MutSelectAllBtn.Text = "✓ Select All"
MutSelectAllBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end
end)



-- Rebirth Toggle
local RebirthFrame = Instance.new("Frame")
RebirthFrame.Size = UDim2.new(1, -12, 0, 28)
RebirthFrame.Position = UDim2.new(0, 8, 0, 180)
RebirthFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
RebirthFrame.BorderSizePixel = 0
RebirthFrame.Parent = AutoEggsFrame
Instance.new("UICorner", RebirthFrame).CornerRadius = UDim.new(0, 5)

local RebirthLabel = Instance.new("TextLabel")
RebirthLabel.Size = UDim2.new(1, -75, 1, 0)
RebirthLabel.Position = UDim2.new(0, 8, 0, 0)
RebirthLabel.BackgroundTransparency = 1
RebirthLabel.Text = "♻️ Rebirth Eggs"
RebirthLabel.Font = Enum.Font.GothamBold
RebirthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
RebirthLabel.TextSize = 11
RebirthLabel.TextXAlignment = Enum.TextXAlignment.Left
RebirthLabel.Parent = RebirthFrame

local RebirthToggle = Instance.new("TextButton")
RebirthToggle.Size = UDim2.new(0, 58, 0, 20)
RebirthToggle.Position = UDim2.new(1, -62, 0.5, -10)
RebirthToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
RebirthToggle.Text = "OFF"
RebirthToggle.Font = Enum.Font.GothamBold
RebirthToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
RebirthToggle.TextSize = 10
RebirthToggle.BorderSizePixel = 0
RebirthToggle.Parent = RebirthFrame
Instance.new("UICorner", RebirthToggle).CornerRadius = UDim.new(0, 5)

RebirthToggle.MouseButton1Click:Connect(function()
EggData.RebirthEggsEnabled = not EggData.RebirthEggsEnabled
RebirthToggle.Text = EggData.RebirthEggsEnabled and "ON" or "OFF"
RebirthToggle.BackgroundColor3 = EggData.RebirthEggsEnabled and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(180, 0, 0)
end)

-- Main Auto Eggs Toggle
AutoEggsToggle.MouseButton1Click:Connect(function()
EggData.AutoBrainrotEnabled = not EggData.AutoBrainrotEnabled

if EggData.AutoBrainrotEnabled then
AutoEggsToggle.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
AutoEggsToggle.Text = "ON"

game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Auto Brainrot Eggs Started!",
Duration = 3
})

spawn(MonitorEggs)
else
AutoEggsToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
AutoEggsToggle.Text = "OFF"

game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Auto Brainrot Eggs Stopped!",
Duration = 3
})
end
end)

-- FEATURE 4: AUTO UPGRADE CONVEYOR
local AutoConveyorFrame = Instance.new("Frame")
AutoConveyorFrame.Size = UDim2.new(1, -5, 0, 88)
AutoConveyorFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
AutoConveyorFrame.BorderSizePixel = 0
AutoConveyorFrame.LayoutOrder = 4
AutoConveyorFrame.Parent = MainContainer

Instance.new("UICorner", AutoConveyorFrame).CornerRadius = UDim.new(0, 8)

local AutoConveyorStroke = Instance.new("UIStroke")
AutoConveyorStroke.Thickness = 1
AutoConveyorStroke.Color = Color3.fromRGB(255, 0, 0)
AutoConveyorStroke.Transparency = 0.6
AutoConveyorStroke.Parent = AutoConveyorFrame

local AutoConveyorTitle = Instance.new("TextLabel")
AutoConveyorTitle.Size = UDim2.new(1, -80, 0, 28)
AutoConveyorTitle.Position = UDim2.new(0, 8, 0, 4)
AutoConveyorTitle.BackgroundTransparency = 1
AutoConveyorTitle.Text = "⚙️ Auto Upgrade Conveyor"
AutoConveyorTitle.Font = Enum.Font.GothamBold
AutoConveyorTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoConveyorTitle.TextSize = 13
AutoConveyorTitle.TextXAlignment = Enum.TextXAlignment.Left
AutoConveyorTitle.Parent = AutoConveyorFrame

local AutoConveyorToggle = Instance.new("TextButton")
AutoConveyorToggle.Size = UDim2.new(0, 58, 0, 24)
AutoConveyorToggle.Position = UDim2.new(1, -62, 0, 6)
AutoConveyorToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
AutoConveyorToggle.Text = "OFF"
AutoConveyorToggle.Font = Enum.Font.GothamBold
AutoConveyorToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoConveyorToggle.TextSize = 11
AutoConveyorToggle.BorderSizePixel = 0
AutoConveyorToggle.Parent = AutoConveyorFrame
Instance.new("UICorner", AutoConveyorToggle).CornerRadius = UDim.new(0, 6)

local ConveyorInfoLabel = Instance.new("TextLabel")
ConveyorInfoLabel.Size = UDim2.new(1, -12, 0, 18)
ConveyorInfoLabel.Position = UDim2.new(0, 8, 0, 36)
ConveyorInfoLabel.BackgroundTransparency = 1
ConveyorInfoLabel.Text = "Current Price: Detecting..."
ConveyorInfoLabel.Font = Enum.Font.Gotham
ConveyorInfoLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
ConveyorInfoLabel.TextSize = 10
ConveyorInfoLabel.TextXAlignment = Enum.TextXAlignment.Left
ConveyorInfoLabel.Parent = AutoConveyorFrame

local ConveyorStatusLabel = Instance.new("TextLabel")
ConveyorStatusLabel.Size = UDim2.new(1, -12, 0, 18)
ConveyorStatusLabel.Position = UDim2.new(0, 8, 0, 56)
ConveyorStatusLabel.BackgroundTransparency = 1
ConveyorStatusLabel.Text = "Status: Idle"
ConveyorStatusLabel.Font = Enum.Font.Gotham
ConveyorStatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ConveyorStatusLabel.TextSize = 10
ConveyorStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
ConveyorStatusLabel.Parent = AutoConveyorFrame

-- Auto Conveyor Variables
local autoConveyorEnabled = false

-- Function to get conveyor price
local function getConveyorPrice()
local success, price = pcall(function()
local myPlot = detectMyPlot()
if not myPlot then return nil end

local upgrades = myPlot:FindFirstChild("Upgrades")
if not upgrades then return nil end

local upgradeConveyor = upgrades:FindFirstChild("UpgradeConveyor")
if not upgradeConveyor then return nil end

local hitbox = upgradeConveyor:FindFirstChild("Hitbox")
if not hitbox then return nil end

local attachment = hitbox:FindFirstChild("Attachment")
if not attachment then return nil end

local billboardGui = attachment:FindFirstChild("BillboardGui")
if not billboardGui then return nil end

local priceLabel = billboardGui:FindFirstChild("Price")
if not priceLabel then return nil end

return priceLabel.Text
end)

if success and price then
return convertMoneyToNumber(price)
end
return nil
end

-- Function to get conveyor hitbox
local function getConveyorHitbox()
local success, hitbox = pcall(function()
local myPlot = detectMyPlot()
if not myPlot then return nil end

local upgrades = myPlot:FindFirstChild("Upgrades")
if not upgrades then return nil end

local upgradeConveyor = upgrades:FindFirstChild("UpgradeConveyor")
if not upgradeConveyor then return nil end

return upgradeConveyor:FindFirstChild("Hitbox")
end)

if success and hitbox then
return hitbox
end
return nil
end

-- Auto Upgrade Conveyor Function
local function autoUpgradeConveyor()
while autoConveyorEnabled do
local success = pcall(function()
local conveyorPrice = getConveyorPrice()

if conveyorPrice then
ConveyorInfoLabel.Text = "Current Price: " .. formatMoney(conveyorPrice)
ConveyorInfoLabel.TextColor3 = Color3.fromRGB(255, 200, 0)

local playerMoney = getPlayerMoney()

if playerMoney >= conveyorPrice then
ConveyorStatusLabel.Text = "Status: Upgrading conveyor..."
ConveyorStatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)

local hitbox = getConveyorHitbox()

if hitbox then
-- TP to conveyor hitbox
player.Character:PivotTo(hitbox:GetPivot())
wait(0.2)

-- Fire proximity prompt if exists
local proximityPrompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
if proximityPrompt then
for distance = 0, 10 do
pcall(function()
fireproximityprompt(proximityPrompt, distance)
end)
end

pcall(function()
proximityPrompt:InputHoldBegin()
wait(0.05)
proximityPrompt:InputHoldEnd()
end)

pcall(function()
proximityPrompt.Triggered:Fire(player)
end)
end

-- Try click detector
local clickDetector = hitbox:FindFirstChildOfClass("ClickDetector")
if clickDetector then
pcall(function()
fireclickdetector(clickDetector)
end)
end

wait(0.5)
ConveyorStatusLabel.Text = "Status: Upgraded! Checking again..."
ConveyorStatusLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
else
ConveyorStatusLabel.Text = "Status: Hitbox not found!"
ConveyorStatusLabel.TextColor3 = Color3.fromRGB(255, 100, 0)
end
else
ConveyorStatusLabel.Text = "Status: Need " .. formatMoney(conveyorPrice - playerMoney) .. " more"
ConveyorStatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
end
else
ConveyorInfoLabel.Text = "Current Price: Not detected"
ConveyorInfoLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
ConveyorStatusLabel.Text = "Status: Conveyor not found!"
ConveyorStatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
end
end)

if not success then
ConveyorStatusLabel.Text = "Status: Error occurred!"
ConveyorStatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
end

wait(2)  -- Check every 2 seconds
end

ConveyorStatusLabel.Text = "Status: Idle"
ConveyorStatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ConveyorInfoLabel.Text = "Current Price: Detecting..."
ConveyorInfoLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
end

-- Toggle Auto Conveyor
AutoConveyorToggle.MouseButton1Click:Connect(function()
autoConveyorEnabled = not autoConveyorEnabled

if autoConveyorEnabled then
AutoConveyorToggle.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
AutoConveyorToggle.Text = "ON"

game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Auto Upgrade Conveyor Started!",
Duration = 3
})

spawn(autoUpgradeConveyor)
else
AutoConveyorToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
AutoConveyorToggle.Text = "OFF"

game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Auto Upgrade Conveyor Stopped!",
Duration = 3
})
end
end)

-- YE HANDLER YAHI LAGAO (MutSelectAllBtn ke baad)
MutDropdownBtn.MouseButton1Click:Connect(function()
mutDropdownOpen = not mutDropdownOpen
if mutDropdownOpen then
RebirthFrame.Visible = false
MutDropContent.Visible = true
-- Yahan size badha do
MutDropContent:TweenSize(UDim2.new(1, -12, 0, 160), "Out", "Quad", 0.2, true)
MutDropdownBtn.Text = "✨ Select Mutations ▲"
-- Frame ka total size bhi badha do
AutoEggsFrame.Size = UDim2.new(1, -5, 0, 430)
else
MutDropContent:TweenSize(UDim2.new(1, -12, 0, 0), "Out", "Quad", 0.2, true)
MutDropdownBtn.Text = "✨ Select Mutations ▼"
wait(0.2)
MutDropContent.Visible = false
RebirthFrame.Visible = true
AutoEggsFrame.Size = UDim2.new(1, -5, 0, 270)
end
end)

MutListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
MutScrollFrame.CanvasSize = UDim2.new(0, 0, 0, MutListLayout.AbsoluteContentSize.Y + 4)
end)
-- YE HANDLER YAHI LAGAO (EggsSelectAllBtn ke baad)
EggsDropdownBtn.MouseButton1Click:Connect(function()
eggsDropdownOpen = not eggsDropdownOpen
if eggsDropdownOpen then
MutDropdownBtn.Visible = false
RebirthFrame.Visible = false
EggsDropContent.Visible = true
-- Yahan size badha do
EggsDropContent:TweenSize(UDim2.new(1, -12, 0, 180), "Out", "Quad", 0.2, true)
EggsDropdownBtn.Text = "🥚 Select Eggs ▲"
-- Frame ka total size bhi badha do
AutoEggsFrame.Size = UDim2.new(1, -5, 0, 455)
else
EggsDropContent:TweenSize(UDim2.new(1, -12, 0, 0), "Out", "Quad", 0.2, true)
EggsDropdownBtn.Text = "🥚 Select Eggs ▼"
wait(0.2)
EggsDropContent.Visible = false
MutDropdownBtn.Visible = true
RebirthFrame.Visible = true
AutoEggsFrame.Size = UDim2.new(1, -5, 0, 270)
end
end)

EggsListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
EggsScrollFrame.CanvasSize = UDim2.new(0, 0, 0, EggsListLayout.AbsoluteContentSize.Y + 4)
end)

-- FEATURE 3: AUTO SELL BOXES
local AutoSellFrame = Instance.new("Frame")
AutoSellFrame.Size = UDim2.new(1, -5, 0, 120)
AutoSellFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
AutoSellFrame.BorderSizePixel = 0
AutoSellFrame.LayoutOrder = 3
AutoSellFrame.Parent = MainContainer

Instance.new("UICorner", AutoSellFrame).CornerRadius = UDim.new(0, 8)

local AutoSellStroke = Instance.new("UIStroke")
AutoSellStroke.Thickness = 1
AutoSellStroke.Color = Color3.fromRGB(255, 0, 0)
AutoSellStroke.Transparency = 0.6
AutoSellStroke.Parent = AutoSellFrame

local AutoSellTitle = Instance.new("TextLabel")
AutoSellTitle.Size = UDim2.new(1, -80, 0, 28)
AutoSellTitle.Position = UDim2.new(0, 8, 0, 4)
AutoSellTitle.BackgroundTransparency = 1
AutoSellTitle.Text = "📦 Auto Sell Boxes"
AutoSellTitle.Font = Enum.Font.GothamBold
AutoSellTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoSellTitle.TextSize = 13
AutoSellTitle.TextXAlignment = Enum.TextXAlignment.Left
AutoSellTitle.Parent = AutoSellFrame

local AutoSellToggle = Instance.new("TextButton")
AutoSellToggle.Size = UDim2.new(0, 58, 0, 24)
AutoSellToggle.Position = UDim2.new(1, -62, 0, 6)
AutoSellToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
AutoSellToggle.Text = "OFF"
AutoSellToggle.Font = Enum.Font.GothamBold
AutoSellToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoSellToggle.TextSize = 11
AutoSellToggle.BorderSizePixel = 0
AutoSellToggle.Parent = AutoSellFrame
Instance.new("UICorner", AutoSellToggle).CornerRadius = UDim.new(0, 6)

local DelayLabel = Instance.new("TextLabel")
DelayLabel.Size = UDim2.new(1, -100, 0, 16)
DelayLabel.Position = UDim2.new(0, 8, 0, 36)
DelayLabel.BackgroundTransparency = 1
DelayLabel.Text = "Cycle Delay (seconds):"
DelayLabel.Font = Enum.Font.GothamBold
DelayLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
DelayLabel.TextSize = 11
DelayLabel.TextXAlignment = Enum.TextXAlignment.Left
DelayLabel.Parent = AutoSellFrame

local DelayValue = Instance.new("TextLabel")
DelayValue.Size = UDim2.new(0, 78, 0, 16)
DelayValue.Position = UDim2.new(1, -82, 0, 36)
DelayValue.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
DelayValue.Text = "1s"
DelayValue.Font = Enum.Font.GothamBold
DelayValue.TextColor3 = Color3.fromRGB(255, 0, 0)
DelayValue.TextSize = 10
DelayValue.BorderSizePixel = 0
DelayValue.Parent = AutoSellFrame
Instance.new("UICorner", DelayValue).CornerRadius = UDim.new(0, 5)

local DelaySliderBg = Instance.new("Frame")
DelaySliderBg.Size = UDim2.new(1, -12, 0, 7)
DelaySliderBg.Position = UDim2.new(0, 8, 0, 60)
DelaySliderBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DelaySliderBg.BorderSizePixel = 0
DelaySliderBg.Parent = AutoSellFrame
Instance.new("UICorner", DelaySliderBg).CornerRadius = UDim.new(0, 3)

local DelaySliderFill = Instance.new("Frame")
DelaySliderFill.Size = UDim2.new(0, 0, 1, 0)
DelaySliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
DelaySliderFill.BorderSizePixel = 0
DelaySliderFill.Parent = DelaySliderBg
Instance.new("UICorner", DelaySliderFill).CornerRadius = UDim.new(0, 3)

local DelaySliderBtn = Instance.new("TextButton")
DelaySliderBtn.Size = UDim2.new(0, 14, 0, 14)
DelaySliderBtn.Position = UDim2.new(0, -7, 0.5, -7)
DelaySliderBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
DelaySliderBtn.Text = ""
DelaySliderBtn.BorderSizePixel = 0
DelaySliderBtn.Parent = DelaySliderBg
Instance.new("UICorner", DelaySliderBtn).CornerRadius = UDim.new(1, 0)

local AutoSellStatus = Instance.new("TextLabel")
AutoSellStatus.Size = UDim2.new(1, -12, 0, 20)
AutoSellStatus.Position = UDim2.new(0, 8, 0, 75)
AutoSellStatus.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
AutoSellStatus.Text = "Status: Idle"
AutoSellStatus.Font = Enum.Font.Gotham
AutoSellStatus.TextColor3 = Color3.fromRGB(200, 200, 200)
AutoSellStatus.TextSize = 10
AutoSellStatus.BorderSizePixel = 0
AutoSellStatus.Parent = AutoSellFrame
Instance.new("UICorner", AutoSellStatus).CornerRadius = UDim.new(0, 5)

-- Auto Sell Variables
local autoSellEnabled = false
local cycleDelay = 1

-- Delay Slider Function
local function updateDelaySlider(input)
local size = DelaySliderBg.AbsoluteSize.X
local pos = input.Position.X - DelaySliderBg.AbsolutePosition.X
local pct = math.clamp(pos / size, 0, 1)
cycleDelay = math.floor(1 + (pct * 59))  -- 1 to 10 seconds
DelayValue.Text = cycleDelay .. "s"
DelaySliderFill.Size = UDim2.new(pct, 0, 1, 0)
DelaySliderBtn.Position = UDim2.new(pct, -7, 0.5, -7)
end

local delayDrag = false
DelaySliderBtn.InputBegan:Connect(function(i) 
if i.UserInputType == Enum.UserInputType.MouseButton1 then 
delayDrag = true 
end 
end)

game:GetService("UserInputService").InputEnded:Connect(function(i) 
if i.UserInputType == Enum.UserInputType.MouseButton1 then 
delayDrag = false 
end 
end)

game:GetService("UserInputService").InputChanged:Connect(function(i)
if delayDrag and i.UserInputType == Enum.UserInputType.MouseMovement then 
updateDelaySlider(i) 
end
end)

DelaySliderBg.InputBegan:Connect(function(i) 
if i.UserInputType == Enum.UserInputType.MouseButton1 then 
updateDelaySlider(i) 
end 
end)

-- Restore saved delay slider position
do
local logMin = math.log10(1)
local logMax = math.log10(15)
local logValue = math.log10(cycleDelay)
local percentage = (logValue - logMin) / (logMax - logMin)

DelayValue.Text = tostring(cycleDelay) .. "s"
DelaySliderFill.Size = UDim2.new(percentage, 0, 1, 0)
DelaySliderBtn.Position = UDim2.new(percentage, -7, 0.5, -7)
end

-- Auto Sell Function
local function autoSellBoxes()
while autoSellEnabled do
local success = pcall(function()
AutoSellStatus.Text = "Status: Picking up boxes..."
AutoSellStatus.TextColor3 = Color3.fromRGB(255, 255, 0)

-- Step 1: Fire PickupBoxes
game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Networker"):WaitForChild("RE/PickupBoxes"):FireServer()

wait(0.3)

-- Step 2: Get my plot
local myPlot = detectMyPlot()

if myPlot then
AutoSellStatus.Text = "Status: Finding sell prompt..."

-- Step 3: Find SellPrompt
local sellPrompt = myPlot:FindFirstChild("SellPrompt")

if sellPrompt then
local proximityPrompt = sellPrompt:FindFirstChild("ProximityPrompt")

if proximityPrompt then
AutoSellStatus.Text = "Status: Teleporting to sell..."

-- Step 4: Teleport to SellPrompt
player.Character:PivotTo(sellPrompt:GetPivot())
wait(0.2)

AutoSellStatus.Text = "Status: Selling boxes..."
AutoSellStatus.TextColor3 = Color3.fromRGB(0, 255, 0)

-- Step 5: Fire ProximityPrompt
for distance = 0, 10 do
pcall(function()
fireproximityprompt(proximityPrompt, distance)
end)
end

pcall(function()
proximityPrompt:InputHoldBegin()
wait(0.05)
proximityPrompt:InputHoldEnd()
end)

pcall(function()
proximityPrompt.Triggered:Fire(player)
end)

wait(0.3)
AutoSellStatus.Text = "Status: Sold! Waiting " .. cycleDelay .. "s..."
AutoSellStatus.TextColor3 = Color3.fromRGB(0, 200, 255)
else
AutoSellStatus.Text = "Status: ProximityPrompt not found!"
AutoSellStatus.TextColor3 = Color3.fromRGB(255, 100, 0)
end
else
AutoSellStatus.Text = "Status: SellPrompt not found!"
AutoSellStatus.TextColor3 = Color3.fromRGB(255, 100, 0)
end
else
AutoSellStatus.Text = "Status: Plot not detected!"
AutoSellStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
end
end)

if not success then
AutoSellStatus.Text = "Status: Error occurred!"
AutoSellStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
end

wait(cycleDelay)
end

AutoSellStatus.Text = "Status: Idle"
AutoSellStatus.TextColor3 = Color3.fromRGB(200, 200, 200)
end

-- Toggle Auto Sell
AutoSellToggle.MouseButton1Click:Connect(function()
autoSellEnabled = not autoSellEnabled

if autoSellEnabled then
AutoSellToggle.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
AutoSellToggle.Text = "ON"

game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Auto Sell Started! Delay: " .. cycleDelay .. "s",
Duration = 3
})

spawn(autoSellBoxes)
else
AutoSellToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
AutoSellToggle.Text = "OFF"

game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Auto Sell Stopped!",
Duration = 3
})
end
end)

-- FEATURE 5: PICKUP DELAY (INSTANT PROMPTS)
local PickupFrame = Instance.new("Frame")
PickupFrame.Size = UDim2.new(1, -5, 0, 70)
PickupFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
PickupFrame.BorderSizePixel = 0
PickupFrame.LayoutOrder = 5
PickupFrame.Parent = MainContainer

Instance.new("UICorner", PickupFrame).CornerRadius = UDim.new(0, 8)

local PickupStroke = Instance.new("UIStroke")
PickupStroke.Thickness = 1
PickupStroke.Color = Color3.fromRGB(255, 0, 0)
PickupStroke.Transparency = 0.6
PickupStroke.Parent = PickupFrame

local PickupTitle = Instance.new("TextLabel")
PickupTitle.Size = UDim2.new(1, -80, 0, 28)
PickupTitle.Position = UDim2.new(0, 8, 0, 4)
PickupTitle.BackgroundTransparency = 1
PickupTitle.Text = "⚡ Instant Pickup"
PickupTitle.Font = Enum.Font.GothamBold
PickupTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PickupTitle.TextSize = 13
PickupTitle.TextXAlignment = Enum.TextXAlignment.Left
PickupTitle.Parent = PickupFrame

local PickupToggle = Instance.new("TextButton")
PickupToggle.Size = UDim2.new(0, 58, 0, 24)
PickupToggle.Position = UDim2.new(1, -62, 0, 6)
PickupToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
PickupToggle.Text = "OFF"
PickupToggle.Font = Enum.Font.GothamBold
PickupToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
PickupToggle.TextSize = 11
PickupToggle.BorderSizePixel = 0
PickupToggle.Parent = PickupFrame
Instance.new("UICorner", PickupToggle).CornerRadius = UDim.new(0, 6)

local PickupDesc = Instance.new("TextLabel")
PickupDesc.Size = UDim2.new(1, -12, 0, 30)
PickupDesc.Position = UDim2.new(0, 8, 0, 36)
PickupDesc.BackgroundTransparency = 1
PickupDesc.Text = "Remove hold duration from proximity prompts"
PickupDesc.Font = Enum.Font.Gotham
PickupDesc.TextColor3 = Color3.fromRGB(180, 180, 180)
PickupDesc.TextSize = 11
PickupDesc.TextXAlignment = Enum.TextXAlignment.Left
PickupDesc.TextWrapped = true
PickupDesc.Parent = PickupFrame

-- Pickup Variables
local pickupEnabled = false
local originalProximitySettings = {}

-- Function to modify proximity prompts
local function modifyProximityPrompts()
pcall(function()
for _, prompt in pairs(game:GetDescendants()) do
if prompt:IsA("ProximityPrompt") then
if not originalProximitySettings[prompt] then
originalProximitySettings[prompt] = {
HoldDuration = prompt.HoldDuration,
MaxActivationDistance = prompt.MaxActivationDistance
}
end
prompt.HoldDuration = 0
prompt.MaxActivationDistance = 999999
end
end
end)
end

-- Function to restore proximity prompts
local function restoreProximityPrompts()
pcall(function()
for prompt, settings in pairs(originalProximitySettings) do
if prompt and prompt.Parent then
prompt.HoldDuration = settings.HoldDuration
prompt.MaxActivationDistance = settings.MaxActivationDistance
end
end
originalProximitySettings = {}
end)
end

-- Pickup Toggle Logic
PickupToggle.MouseButton1Click:Connect(function()
pickupEnabled = not pickupEnabled

if pickupEnabled then
PickupToggle.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
PickupToggle.Text = "ON"

modifyProximityPrompts()

game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Instant Pickup Enabled!",
Duration = 3
})
else
PickupToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
PickupToggle.Text = "OFF"

restoreProximityPrompts()

game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Instant Pickup Disabled!",
Duration = 3
})
end
end)

-- Monitor new proximity prompts being added
game.DescendantAdded:Connect(function(descendant)
if pickupEnabled and descendant:IsA("ProximityPrompt") then
wait(0.1)
if not originalProximitySettings[descendant] then
originalProximitySettings[descendant] = {
HoldDuration = descendant.HoldDuration,
MaxActivationDistance = descendant.MaxActivationDistance
}
end
descendant.HoldDuration = 0
descendant.MaxActivationDistance = 999999
end
end)

    -- FEATURE 6: AUTO BUY FOOD
    local AutoFoodFrame = Instance.new("Frame")
    AutoFoodFrame.Size = UDim2.new(1, -5, 0, 120)
    AutoFoodFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    AutoFoodFrame.BorderSizePixel = 0
    AutoFoodFrame.LayoutOrder = 6
    AutoFoodFrame.Parent = MainContainer

    Instance.new("UICorner", AutoFoodFrame).CornerRadius = UDim.new(0, 8)

    local AutoFoodStroke = Instance.new("UIStroke")
    AutoFoodStroke.Thickness = 1
    AutoFoodStroke.Color = Color3.fromRGB(255, 0, 0)
    AutoFoodStroke.Transparency = 0.6
    AutoFoodStroke.Parent = AutoFoodFrame

    local AutoFoodTitle = Instance.new("TextLabel")
    AutoFoodTitle.Size = UDim2.new(1, -80, 0, 28)
    AutoFoodTitle.Position = UDim2.new(0, 8, 0, 4)
    AutoFoodTitle.BackgroundTransparency = 1
    AutoFoodTitle.Text = "🍕 Auto Buy Food"
    AutoFoodTitle.Font = Enum.Font.GothamBold
    AutoFoodTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    AutoFoodTitle.TextSize = 13
    AutoFoodTitle.TextXAlignment = Enum.TextXAlignment.Left
    AutoFoodTitle.Parent = AutoFoodFrame

    local AutoFoodToggle = Instance.new("TextButton")
    AutoFoodToggle.Size = UDim2.new(0, 58, 0, 24)
    AutoFoodToggle.Position = UDim2.new(1, -62, 0, 6)
    AutoFoodToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
    AutoFoodToggle.Text = "OFF"
    AutoFoodToggle.Font = Enum.Font.GothamBold
    AutoFoodToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    AutoFoodToggle.TextSize = 11
    AutoFoodToggle.BorderSizePixel = 0
    AutoFoodToggle.Parent = AutoFoodFrame
    Instance.new("UICorner", AutoFoodToggle).CornerRadius = UDim.new(0, 6)

    local FoodDropdownBtn = Instance.new("TextButton")
    FoodDropdownBtn.Size = UDim2.new(1, -12, 0, 26)
    FoodDropdownBtn.Position = UDim2.new(0, 8, 0, 36)
    FoodDropdownBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    FoodDropdownBtn.Text = "🍴 Select Food Items ▼"
    FoodDropdownBtn.Font = Enum.Font.GothamBold
    FoodDropdownBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    FoodDropdownBtn.TextSize = 11
    FoodDropdownBtn.TextXAlignment = Enum.TextXAlignment.Left
    FoodDropdownBtn.BorderSizePixel = 0
    FoodDropdownBtn.Parent = AutoFoodFrame
    Instance.new("UICorner", FoodDropdownBtn).CornerRadius = UDim.new(0, 5)
    Instance.new("UIPadding", FoodDropdownBtn).PaddingLeft = UDim.new(0, 6)

    local FoodDropContent = Instance.new("Frame")
    FoodDropContent.Size = UDim2.new(1, -12, 0, 0)
    FoodDropContent.Position = UDim2.new(0, 8, 0, 67)
    FoodDropContent.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    FoodDropContent.BorderSizePixel = 0
    FoodDropContent.Visible = false
    FoodDropContent.ClipsDescendants = true
    FoodDropContent.Parent = AutoFoodFrame
    Instance.new("UICorner", FoodDropContent).CornerRadius = UDim.new(0, 5)

    local FoodSelectAllBtn = Instance.new("TextButton")
    FoodSelectAllBtn.Size = UDim2.new(1, -8, 0, 22)
    FoodSelectAllBtn.Position = UDim2.new(0, 4, 0, 4)
    FoodSelectAllBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    FoodSelectAllBtn.Text = "✓ Select All"
    FoodSelectAllBtn.Font = Enum.Font.GothamBold
    FoodSelectAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    FoodSelectAllBtn.TextSize = 10
    FoodSelectAllBtn.BorderSizePixel = 0
    FoodSelectAllBtn.Parent = FoodDropContent
    Instance.new("UICorner", FoodSelectAllBtn).CornerRadius = UDim.new(0, 4)

    local FoodScrollFrame = Instance.new("ScrollingFrame")
    FoodScrollFrame.Size = UDim2.new(1, -8, 0, 120)
    FoodScrollFrame.Position = UDim2.new(0, 4, 0, 30)
    FoodScrollFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    FoodScrollFrame.BorderSizePixel = 0
    FoodScrollFrame.ScrollBarThickness = 3
    FoodScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
    FoodScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    FoodScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    FoodScrollFrame.ScrollBarImageTransparency = 0
    FoodScrollFrame.CanvasPosition = Vector2.new(0, 0)
    FoodScrollFrame.Parent = FoodDropContent
    Instance.new("UICorner", FoodScrollFrame).CornerRadius = UDim.new(0, 4)

    local FoodListLayout = Instance.new("UIListLayout")
    FoodListLayout.Padding = UDim.new(0, 1)
    FoodListLayout.Parent = FoodScrollFrame

    local foodButtons = {}
    local foodDropdownOpen = false

    for i, foodName in ipairs(FoodData.AllFoods) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -4, 0, 20)
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        btn.Text = ""
        btn.BorderSizePixel = 0
        btn.Parent = FoodScrollFrame
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 3)

        local check = Instance.new("TextLabel")
        check.Size = UDim2.new(0, 13, 0, 13)
        check.Position = UDim2.new(0, 2, 0.5, -6.5)
        check.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        check.Text = ""
        check.Font = Enum.Font.GothamBold
        check.TextColor3 = Color3.fromRGB(0, 255, 0)
        check.TextSize = 10
        check.BorderSizePixel = 0
        check.Parent = btn
        Instance.new("UICorner", check).CornerRadius = UDim.new(0, 2)

        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, -20, 1, 0)
        lbl.Position = UDim2.new(0, 18, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = foodName
        lbl.Font = Enum.Font.Gotham
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        lbl.TextSize = 9
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.Parent = btn

        table.insert(foodButtons, {button = btn, name = foodName, check = check})

        btn.MouseButton1Click:Connect(function()
            local found = false
            for j, sel in ipairs(FoodData.SelectedFoods) do
                if sel == foodName then
                    table.remove(FoodData.SelectedFoods, j)
                    found = true
                    break
                end
            end
            if not found then
                table.insert(FoodData.SelectedFoods, foodName)
            end
            check.Text = (not found) and "✓" or ""
        end)
    end

    local allFoodSelected = false
    FoodSelectAllBtn.MouseButton1Click:Connect(function()
        allFoodSelected = not allFoodSelected
        if allFoodSelected then
            FoodData.SelectedFoods = {}
            for _, foodName in ipairs(FoodData.AllFoods) do
                table.insert(FoodData.SelectedFoods, foodName)
            end
            for _, data in ipairs(foodButtons) do
                data.check.Text = "✓"
            end
            FoodSelectAllBtn.Text = "✗ Deselect All"
            FoodSelectAllBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
        else
            FoodData.SelectedFoods = {}
            for _, data in ipairs(foodButtons) do
                data.check.Text = ""
            end
            FoodSelectAllBtn.Text = "✓ Select All"
            FoodSelectAllBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)

    FoodDropdownBtn.MouseButton1Click:Connect(function()
        foodDropdownOpen = not foodDropdownOpen
        if foodDropdownOpen then
            FoodDropContent.Visible = true
            FoodDropContent:TweenSize(UDim2.new(1, -12, 0, 154), "Out", "Quad", 0.2, true)
            FoodDropdownBtn.Text = "🍴 Select Food Items ▲"
            AutoFoodFrame.Size = UDim2.new(1, -5, 0, 275)
        else
            FoodDropContent:TweenSize(UDim2.new(1, -12, 0, 0), "Out", "Quad", 0.2, true)
            FoodDropdownBtn.Text = "🍴 Select Food Items ▼"
            wait(0.2)
            FoodDropContent.Visible = false
            AutoFoodFrame.Size = UDim2.new(1, -5, 0, 120)
        end
    end)

    FoodListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        FoodScrollFrame.CanvasSize = UDim2.new(0, 0, 0, FoodListLayout.AbsoluteContentSize.Y + 4)
    end)

    local FoodStatusLabel = Instance.new("TextLabel")
    FoodStatusLabel.Size = UDim2.new(1, -12, 0, 20)
    FoodStatusLabel.Position = UDim2.new(0, 8, 0, 72)
    FoodStatusLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    FoodStatusLabel.Text = "Status: Idle"
    FoodStatusLabel.Font = Enum.Font.Gotham
    FoodStatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    FoodStatusLabel.TextSize = 10
    FoodStatusLabel.BorderSizePixel = 0
    FoodStatusLabel.Parent = AutoFoodFrame
    Instance.new("UICorner", FoodStatusLabel).CornerRadius = UDim.new(0, 5)

    AutoFoodToggle.MouseButton1Click:Connect(function()
        FoodData.AutoBuyEnabled = not FoodData.AutoBuyEnabled

        if FoodData.AutoBuyEnabled then
            AutoFoodToggle.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
            AutoFoodToggle.Text = "ON"

            game.StarterGui:SetCore("SendNotification", {
                Title = "PRIME Hub",
                Text = "Auto Buy Food Started!",
                Duration = 3
            })

            spawn(AutoBuyFoodLoop)
        else
            AutoFoodToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
            AutoFoodToggle.Text = "OFF"

            game.StarterGui:SetCore("SendNotification", {
                Title = "PRIME Hub",
                Text = "Auto Buy Food Stopped!",
                Duration = 3
            })
        end
    end)
MainBtn.MouseButton1Click:Connect(function()
if currentSection == "Main" then
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = TweenService:Create(RightSection, tweenInfo, {Size = UDim2.new(0, 0, 1, -50)})
tween:Play()
wait(0.3)
RightSection.Visible = false
RightSection.Size = UDim2.new(0, 330, 1, -50)
currentSection = nil
else
for _, child in pairs(ContentFrame:GetChildren()) do
if child:IsA("GuiObject") then
child.Visible = false
end
end
MainContainer.Visible = true
RightSection.Size = UDim2.new(0, 0, 1, -50)
RightSection.Visible = true
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = TweenService:Create(RightSection, tweenInfo, {Size = UDim2.new(0, 330, 1, -50)})
tween:Play()
currentSection = "Main"
end
end)


-- UI THEMES SECTION
local ThemesBtn = Instance.new("TextButton")
ThemesBtn.Size = UDim2.new(1, -10, 0, 35)
ThemesBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ThemesBtn.Text = "UI Themes"
ThemesBtn.Font = Enum.Font.GothamBold
ThemesBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
ThemesBtn.TextSize = 16
ThemesBtn.BorderSizePixel = 0
ThemesBtn.Parent = LeftSection

Instance.new("UICorner", ThemesBtn).CornerRadius = UDim.new(0, 6)

local ThemesBtnStroke = Instance.new("UIStroke")
ThemesBtnStroke.Thickness = 1
ThemesBtnStroke.Color = Color3.fromRGB(255, 0, 0)
ThemesBtnStroke.Transparency = 0.5
ThemesBtnStroke.Parent = ThemesBtn

local ThemesContainer = Instance.new("Frame")
ThemesContainer.Size = UDim2.new(1, -20, 0, 0)
ThemesContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ThemesContainer.BorderSizePixel = 0
ThemesContainer.Visible = false
ThemesContainer.Parent = ContentFrame

Instance.new("UICorner", ThemesContainer).CornerRadius = UDim.new(0, 8)

local ThemesStroke = Instance.new("UIStroke")
ThemesStroke.Thickness = 1.5
ThemesStroke.Color = Color3.fromRGB(255, 0, 0)
ThemesStroke.Transparency = 0.4
ThemesStroke.Parent = ThemesContainer

local ThemesTitle = Instance.new("TextLabel")
ThemesTitle.Size = UDim2.new(1, -20, 0, 35)
ThemesTitle.Position = UDim2.new(0, 10, 0, 10)
ThemesTitle.BackgroundTransparency = 1
ThemesTitle.Text = "🎨 Select Theme"
ThemesTitle.Font = Enum.Font.GothamBold
ThemesTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
ThemesTitle.TextSize = 20
ThemesTitle.Parent = ThemesContainer

local ThemesList = {
{Name = "Red Theme", Primary = Color3.fromRGB(255, 0, 0), Secondary = Color3.fromRGB(180, 0, 0), Background = Color3.fromRGB(8, 8, 8), Icon = "🔴", BorderColor = Color3.fromRGB(255, 0, 0)},
{Name = "Blue Theme", Primary = Color3.fromRGB(0, 200, 255), Secondary = Color3.fromRGB(0, 150, 255), Background = Color3.fromRGB(5, 10, 15), Icon = "🔵", BorderColor = Color3.fromRGB(0, 200, 255)},
{Name = "Green Theme", Primary = Color3.fromRGB(0, 255, 100), Secondary = Color3.fromRGB(0, 200, 80), Background = Color3.fromRGB(5, 15, 8), Icon = "🟢", BorderColor = Color3.fromRGB(0, 255, 100)},
{Name = "Purple Theme", Primary = Color3.fromRGB(200, 0, 255), Secondary = Color3.fromRGB(150, 0, 200), Background = Color3.fromRGB(12, 5, 15), Icon = "🟣", BorderColor = Color3.fromRGB(200, 0, 255)},
{Name = "Orange Theme", Primary = Color3.fromRGB(255, 120, 0), Secondary = Color3.fromRGB(255, 80, 0), Background = Color3.fromRGB(15, 8, 5), Icon = "🟠", BorderColor = Color3.fromRGB(255, 120, 0)},
{Name = "Pink Theme", Primary = Color3.fromRGB(255, 0, 150), Secondary = Color3.fromRGB(255, 50, 180), Background = Color3.fromRGB(15, 5, 12), Icon = "🌸", BorderColor = Color3.fromRGB(255, 0, 150)}
}

local currentTheme = ThemesList[1]

local function applyTheme(theme)
currentTheme = theme
MainStroke.Color = theme.Primary
MainFrame.BackgroundColor3 = theme.Background
TopBarStroke.Color = theme.Primary
Title.TextColor3 = theme.Primary
LeftStroke.Color = theme.Primary
LeftSection.ScrollBarImageColor3 = theme.Primary
RightStroke.Color = theme.Primary
ContentFrame.ScrollBarImageColor3 = theme.Primary
ToggleBtnStroke.Color = theme.Primary
ToggleButton.TextColor3 = theme.Primary
ThemesBtnStroke.Color = theme.Primary
ThemesBtn.TextColor3 = theme.Primary
MainContainerStroke.Color = theme.Primary
MainContainerTitle.TextColor3 = theme.Primary
MainBtnStroke.Color = theme.Primary
MainBtn.TextColor3 = theme.Primary
AutoUpgradeStroke.Color = theme.Primary
ValueLabel.TextColor3 = theme.Primary
SliderFill.BackgroundColor3 = theme.Primary
SliderBtn.BackgroundColor3 = theme.Primary
AutoEggsStroke.Color = theme.Primary
MinValue.TextColor3 = theme.Primary
MinSliderFill.BackgroundColor3 = theme.Primary
MinSliderBtn.BackgroundColor3 = theme.Primary
MaxValue.TextColor3 = theme.Primary
MaxSliderFill.BackgroundColor3 = theme.Primary
MaxSliderBtn.BackgroundColor3 = theme.Primary
ThemesStroke.Color = theme.Primary
ThemesTitle.TextColor3 = theme.Primary
        AutoFoodStroke.Color = theme.Primary
        FoodScrollFrame.ScrollBarImageColor3 = theme.Primary
        
game.StarterGui:SetCore("SendNotification", {
Title = "PRIME Hub",
Text = "Theme changed to " .. theme.Name,
Duration = 2
})
end

local ThemeScroll = Instance.new("Frame")
ThemeScroll.Size = UDim2.new(1, -20, 0, 0)
ThemeScroll.Position = UDim2.new(0, 10, 0, 50)
ThemeScroll.BackgroundTransparency = 1
ThemeScroll.BorderSizePixel = 0
ThemeScroll.Parent = ThemesContainer

local ThemeScrollLayout = Instance.new("UIListLayout")
ThemeScrollLayout.Padding = UDim.new(0, 10)
ThemeScrollLayout.Parent = ThemeScroll

for i, theme in ipairs(ThemesList) do
local ThemeBtn = Instance.new("TextButton")
ThemeBtn.Size = UDim2.new(1, -10, 0, 60)
ThemeBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
ThemeBtn.BorderSizePixel = 0
ThemeBtn.Text = ""
ThemeBtn.AutoButtonColor = false
ThemeBtn.Parent = ThemeScroll
Instance.new("UICorner", ThemeBtn).CornerRadius = UDim.new(0, 8)

local ThemeBtnStroke = Instance.new("UIStroke")
ThemeBtnStroke.Thickness = 2
ThemeBtnStroke.Color = theme.BorderColor
ThemeBtnStroke.Transparency = 0.4
ThemeBtnStroke.Parent = ThemeBtn

local ThemeIcon = Instance.new("TextLabel")
ThemeIcon.Size = UDim2.new(0, 40, 1, 0)
ThemeIcon.Position = UDim2.new(0, 10, 0, 0)
ThemeIcon.BackgroundTransparency = 1
ThemeIcon.Text = theme.Icon
ThemeIcon.Font = Enum.Font.GothamBold
ThemeIcon.TextSize = 28
ThemeIcon.Parent = ThemeBtn

local ThemeNameLabel = Instance.new("TextLabel")
ThemeNameLabel.Size = UDim2.new(1, -60, 0, 25)
ThemeNameLabel.Position = UDim2.new(0, 55, 0, 10)
ThemeNameLabel.BackgroundTransparency = 1
ThemeNameLabel.Text = theme.Name
ThemeNameLabel.Font = Enum.Font.GothamBold
ThemeNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ThemeNameLabel.TextSize = 16
ThemeNameLabel.TextXAlignment = Enum.TextXAlignment.Left
ThemeNameLabel.Parent = ThemeBtn

local ThemeDesc = Instance.new("TextLabel")
ThemeDesc.Size = UDim2.new(1, -60, 0, 20)
ThemeDesc.Position = UDim2.new(0, 55, 0, 32)
ThemeDesc.BackgroundTransparency = 1
ThemeDesc.Text = "Click to apply this theme"
ThemeDesc.Font = Enum.Font.Gotham
ThemeDesc.TextColor3 = Color3.fromRGB(180, 180, 180)
ThemeDesc.TextSize = 12
ThemeDesc.TextXAlignment = Enum.TextXAlignment.Left
ThemeDesc.Parent = ThemeBtn

ThemeBtn.MouseEnter:Connect(function()
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
TweenService:Create(ThemeBtn, tweenInfo, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
TweenService:Create(ThemeBtnStroke, tweenInfo, {Transparency = 0.1}):Play()
end)

ThemeBtn.MouseLeave:Connect(function()
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
TweenService:Create(ThemeBtn, tweenInfo, {BackgroundColor3 = Color3.fromRGB(12, 12, 12)}):Play()
TweenService:Create(ThemeBtnStroke, tweenInfo, {Transparency = 0.4}):Play()
end)

ThemeBtn.MouseButton1Click:Connect(function()
applyTheme(theme)
end)
end

ThemeScrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
local contentHeight = ThemeScrollLayout.AbsoluteContentSize.Y
ThemeScroll.Size = UDim2.new(1, -20, 0, contentHeight)
ThemesContainer.Size = UDim2.new(1, -20, 0, contentHeight + 60)
end)

-- ABOUT US SECTION
local AboutBtn = Instance.new("TextButton")
AboutBtn.Size = UDim2.new(1, -10, 0, 35)
AboutBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
AboutBtn.Text = "About Us"
AboutBtn.Font = Enum.Font.GothamBold
AboutBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
AboutBtn.TextSize = 16
AboutBtn.BorderSizePixel = 0
AboutBtn.Parent = LeftSection
Instance.new("UICorner", AboutBtn).CornerRadius = UDim.new(0, 6)

local AboutBtnStroke = Instance.new("UIStroke")
AboutBtnStroke.Thickness = 1
AboutBtnStroke.Color = Color3.fromRGB(255, 0, 0)
AboutBtnStroke.Transparency = 0.5
AboutBtnStroke.Parent = AboutBtn

local AboutContainer = Instance.new("Frame")
AboutContainer.Size = UDim2.new(1, -20, 0, 280)
AboutContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
AboutContainer.BorderSizePixel = 0
AboutContainer.Visible = false
AboutContainer.Parent = ContentFrame
Instance.new("UICorner", AboutContainer).CornerRadius = UDim.new(0, 10)

local AboutStroke = Instance.new("UIStroke")
AboutStroke.Thickness = 1.5
AboutStroke.Color = Color3.fromRGB(255, 0, 0)
AboutStroke.Transparency = 0.4
AboutStroke.Parent = AboutContainer

local AboutHeader = Instance.new("Frame")
AboutHeader.Size = UDim2.new(1, 0, 0, 45)
AboutHeader.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
AboutHeader.BorderSizePixel = 0
AboutHeader.Parent = AboutContainer
Instance.new("UICorner", AboutHeader).CornerRadius = UDim.new(0, 10)

local AboutTitle = Instance.new("TextLabel")
AboutTitle.Size = UDim2.new(1, -20, 1, 0)
AboutTitle.Position = UDim2.new(0, 10, 0, 0)
AboutTitle.BackgroundTransparency = 1
AboutTitle.Text = "📋 PRIME Hub Information"
AboutTitle.Font = Enum.Font.GothamBold
AboutTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
AboutTitle.TextSize = 15
AboutTitle.TextXAlignment = Enum.TextXAlignment.Left
AboutTitle.Parent = AboutHeader

local AboutContent = Instance.new("TextLabel")
AboutContent.Size = UDim2.new(1, -30, 0, 90)
AboutContent.Position = UDim2.new(0, 15, 0, 55)
AboutContent.BackgroundTransparency = 1
AboutContent.TextColor3 = Color3.fromRGB(255, 255, 255)
AboutContent.TextSize = 13
AboutContent.Font = Enum.Font.Gotham
AboutContent.TextWrapped = true
AboutContent.TextXAlignment = Enum.TextXAlignment.Left
AboutContent.TextYAlignment = Enum.TextYAlignment.Top
AboutContent.Text = "Version: 2.0 - Updated\nDeveloper: WENDIGO\n\nCustomizable UI with modern design.\n\nJoin our Discord community:"
AboutContent.Parent = AboutContainer

local DiscordContainer = Instance.new("Frame")
DiscordContainer.Size = UDim2.new(1, -30, 0, 120)
DiscordContainer.Position = UDim2.new(0, 15, 0, 155)
DiscordContainer.BackgroundTransparency = 1
DiscordContainer.Parent = AboutContainer

local StoreDiscordBtn = Instance.new("TextButton")
StoreDiscordBtn.Size = UDim2.new(1, 0, 0, 45)
StoreDiscordBtn.Position = UDim2.new(0, 0, 0, 0)
StoreDiscordBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
StoreDiscordBtn.BorderSizePixel = 0
StoreDiscordBtn.AutoButtonColor = false
StoreDiscordBtn.Text = ""
StoreDiscordBtn.Parent = DiscordContainer
Instance.new("UICorner", StoreDiscordBtn).CornerRadius = UDim.new(0, 8)

local StoreStroke = Instance.new("UIStroke")
StoreStroke.Thickness = 1
StoreStroke.Color = Color3.fromRGB(255, 0, 0)
StoreStroke.Transparency = 0.5
StoreStroke.Parent = StoreDiscordBtn

local StoreIcon = Instance.new("TextLabel")
StoreIcon.Size = UDim2.new(0, 35, 1, 0)
StoreIcon.Position = UDim2.new(0, 8, 0, 0)
StoreIcon.BackgroundTransparency = 1
StoreIcon.Text = "🛒"
StoreIcon.Font = Enum.Font.GothamBold
StoreIcon.TextSize = 20
StoreIcon.TextColor3 = Color3.fromRGB(255, 0, 0)
StoreIcon.Parent = StoreDiscordBtn

local StoreLabel = Instance.new("TextLabel")
StoreLabel.Size = UDim2.new(1, -50, 0, 18)
StoreLabel.Position = UDim2.new(0, 45, 0, 6)
StoreLabel.BackgroundTransparency = 1
StoreLabel.Text = "Store Server"
StoreLabel.Font = Enum.Font.GothamBold
StoreLabel.TextSize = 14
StoreLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StoreLabel.TextXAlignment = Enum.TextXAlignment.Left
StoreLabel.Parent = StoreDiscordBtn

local StoreSubtext = Instance.new("TextLabel")
StoreSubtext.Size = UDim2.new(1, -50, 0, 14)
StoreSubtext.Position = UDim2.new(0, 45, 0, 24)
StoreSubtext.BackgroundTransparency = 1
StoreSubtext.Text = "Premium scripts & products"
StoreSubtext.Font = Enum.Font.Gotham
StoreSubtext.TextSize = 11
StoreSubtext.TextColor3 = Color3.fromRGB(200, 200, 200)
StoreSubtext.TextXAlignment = Enum.TextXAlignment.Left
StoreSubtext.Parent = StoreDiscordBtn

StoreDiscordBtn.MouseButton1Click:Connect(function()
setclipboard("https://discord.gg/CzbW5fKcKS")
StoreLabel.Text = "✓ Link Copied!"
StoreLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
wait(2)
StoreLabel.Text = "Store Server"
StoreLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

local SupportDiscordBtn = Instance.new("TextButton")
SupportDiscordBtn.Size = UDim2.new(1, 0, 0, 45)
SupportDiscordBtn.Position = UDim2.new(0, 0, 0, 55)
SupportDiscordBtn.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
SupportDiscordBtn.BorderSizePixel = 0
SupportDiscordBtn.AutoButtonColor = false
SupportDiscordBtn.Text = ""
SupportDiscordBtn.Parent = DiscordContainer
Instance.new("UICorner", SupportDiscordBtn).CornerRadius = UDim.new(0, 8)

local SupportStroke = Instance.new("UIStroke")
SupportStroke.Thickness = 1
SupportStroke.Color = Color3.fromRGB(255, 0, 0)
SupportStroke.Transparency = 0.5
SupportStroke.Parent = SupportDiscordBtn

local SupportIcon = Instance.new("TextLabel")
SupportIcon.Size = UDim2.new(0, 35, 1, 0)
SupportIcon.Position = UDim2.new(0, 8, 0, 0)
SupportIcon.BackgroundTransparency = 1
SupportIcon.Text = "🛠️"
SupportIcon.Font = Enum.Font.GothamBold
SupportIcon.TextSize = 20
SupportIcon.TextColor3 = Color3.fromRGB(255, 0, 0)
SupportIcon.Parent = SupportDiscordBtn

local SupportLabel = Instance.new("TextLabel")
SupportLabel.Size = UDim2.new(1, -50, 0, 18)
SupportLabel.Position = UDim2.new(0, 45, 0, 6)
SupportLabel.BackgroundTransparency = 1
SupportLabel.Text = "Support & Bug Report"
SupportLabel.Font = Enum.Font.GothamBold
SupportLabel.TextSize = 14
SupportLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SupportLabel.TextXAlignment = Enum.TextXAlignment.Left
SupportLabel.Parent = SupportDiscordBtn

local SupportSubtext = Instance.new("TextLabel")
SupportSubtext.Size = UDim2.new(1, -50, 0, 14)
SupportSubtext.Position = UDim2.new(0, 45, 0, 24)
SupportSubtext.BackgroundTransparency = 1
SupportSubtext.Text = "Get help & report issues"
SupportSubtext.Font = Enum.Font.Gotham
SupportSubtext.TextSize = 11
SupportSubtext.TextColor3 = Color3.fromRGB(200, 200, 200)
SupportSubtext.TextXAlignment = Enum.TextXAlignment.Left
SupportSubtext.Parent = SupportDiscordBtn

SupportDiscordBtn.MouseButton1Click:Connect(function()
setclipboard("https://discord.gg/nUhMevHxCZ")
SupportLabel.Text = "✓ Link Copied!"
SupportLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
wait(2)
SupportLabel.Text = "Support & Bug Report"
SupportLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- Auto-update canvas sizes
LeftListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
LeftSection.CanvasSize = UDim2.new(0, 0, 0, LeftListLayout.AbsoluteContentSize.Y + 10)
end)

ContentListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
ContentFrame.CanvasSize = UDim2.new(0, 0, 0, ContentListLayout.AbsoluteContentSize.Y + 10)
end)

MainListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
MainContainer.CanvasSize = UDim2.new(0, 0, 0, MainListLayout.AbsoluteContentSize.Y + 10)
end)

-- Toggle Themes Section
ThemesBtn.MouseButton1Click:Connect(function()
if currentSection == "Themes" then
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = TweenService:Create(RightSection, tweenInfo, {Size = UDim2.new(0, 0, 1, -50)})
tween:Play()
wait(0.3)
RightSection.Visible = false
RightSection.Size = UDim2.new(0, 330, 1, -50)
currentSection = nil
else
for _, child in pairs(ContentFrame:GetChildren()) do
if child:IsA("GuiObject") then
child.Visible = false
end
end
ThemesContainer.Visible = true
RightSection.Size = UDim2.new(0, 0, 1, -50)
RightSection.Visible = true
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = TweenService:Create(RightSection, tweenInfo, {Size = UDim2.new(0, 330, 1, -50)})
tween:Play()
currentSection = "Themes"
end
end)

-- Toggle About Section
AboutBtn.MouseButton1Click:Connect(function()
if currentSection == "About" then
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = TweenService:Create(RightSection, tweenInfo, {Size = UDim2.new(0, 0, 1, -50)})
tween:Play()
wait(0.3)
RightSection.Visible = false
RightSection.Size = UDim2.new(0, 330, 1, -50)
currentSection = nil
else
for _, child in pairs(ContentFrame:GetChildren()) do
if child:IsA("GuiObject") then
child.Visible = false
end
end
AboutContainer.Visible = true
RightSection.Size = UDim2.new(0, 0, 1, -50)
RightSection.Visible = true
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = TweenService:Create(RightSection, tweenInfo, {Size = UDim2.new(0, 330, 1, -50)})
tween:Play()
currentSection = "About"
end
end)
