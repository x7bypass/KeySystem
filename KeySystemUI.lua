--[[
Key System Ui 
This example uses the KeyUI 
]]--

local function CreateKeyWindow(settings)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local UserInputService = game:GetService("UserInputService")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(tonumber(settings.Theme.Background:sub(1, 2), 16), tonumber(settings.Theme.Background:sub(3, 4), 16), tonumber(settings.Theme.Background:sub(5, 6), 16))
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(tonumber(settings.Theme.Border:sub(1, 2), 16), tonumber(settings.Theme.Border:sub(3, 4), 16), tonumber(settings.Theme.Border:sub(5, 6), 16))
    frame.Active = true
    frame.Draggable = true
    frame.Parent = screenGui

    local headerLabel = Instance.new("TextLabel")
    headerLabel.Size = UDim2.new(1, 0, 0, 30)
    headerLabel.Position = UDim2.new(0, 0, 0, 0)
    headerLabel.Text = settings.Text.Title or "HG HUB Universal Script Solara"
    headerLabel.Font = Enum.Font.SourceSansBold
    headerLabel.TextSize = 18
    headerLabel.TextColor3 = Color3.fromRGB(tonumber(settings.Theme.Text:sub(1, 2), 16), tonumber(settings.Theme.Text:sub(3, 4), 16), tonumber(settings.Theme.Text:sub(5, 6), 16))
    headerLabel.BackgroundTransparency = 1
    headerLabel.Parent = frame

    -- Buat tombol close (X)
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 18
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.Parent = frame
     closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        if settings.Cancelled then
            settings.Cancelled()
        end
    end)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 50)
    label.Position = UDim2.new(0, 0, 0, 30)
    label.Text = settings.Text.Body or "Key System"
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 24
    label.TextColor3 = Color3.fromRGB(tonumber(settings.Theme.Text:sub(1, 2), 16), tonumber(settings.Theme.Text:sub(3, 4), 16), tonumber(settings.Theme.Text:sub(5, 6), 16))
    label.BackgroundTransparency = 1
    label.Parent = frame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.8, 0, 0, 30)
    textBox.Position = UDim2.new(0.1, 0, 0.4, 0)
    textBox.PlaceholderText = "Masukkan Key"
    textBox.Font = Enum.Font.SourceSans
    textBox.TextSize = 18
    textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    textBox.TextWrapped = true -- supaya teks tetap di dalam text box
    textBox.Parent = frame

    local validationLabel = Instance.new("TextLabel")
    validationLabel.Size = UDim2.new(0.8, 0, 0, 30)
    validationLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
    validationLabel.Text = ""
    validationLabel.Font = Enum.Font.SourceSansBold
    validationLabel.TextSize = 18
    validationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    validationLabel.BackgroundTransparency = 1
    validationLabel.Parent = frame

    local getKeyButton = Instance.new("TextButton")
    getKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
    getKeyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
    getKeyButton.Text = "Get Key"
    getKeyButton.Font = Enum.Font.SourceSansBold
    getKeyButton.TextSize = 18
    getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    getKeyButton.Parent = frame
local checkKeyButton = Instance.new("TextButton")
    checkKeyButton.Size = UDim2.new(0.4, 0, 0, 30)
    checkKeyButton.Position = UDim2.new(0.5, 0, 0.7, 0)
    checkKeyButton.Text = "Check Key"
    checkKeyButton.Font = Enum.Font.SourceSansBold
    checkKeyButton.TextSize = 18
    checkKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkKeyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    checkKeyButton.Parent = frame

    -- Label untuk pesan "Link copied!"
    local linkCopiedLabel = Instance.new("TextLabel")
    linkCopiedLabel.Size = UDim2.new(0.8, 0, 0, 30)
    linkCopiedLabel.Position = UDim2.new(0.1, 0, 0.8, 0)
    linkCopiedLabel.Text = ""
    linkCopiedLabel.Font = Enum.Font.SourceSansBold
    linkCopiedLabel.TextSize = 18
    linkCopiedLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    linkCopiedLabel.BackgroundTransparency = 1
    linkCopiedLabel.Parent = frame

    -- Fungsi untuk Get Key
    getKeyButton.MouseButton1Click:Connect(function()
        -- Mengarahkan ke link untuk mendapatkan key
        local getKeyLink = settings.GetKeyLink or "https://example.com/"
        setclipboard(getKeyLink)
        linkCopiedLabel.Text = "Link copied!"
        wait(2)
        linkCopiedLabel.Text = ""
    end)

    -- Fungsi untuk Check Key
    checkKeyButton.MouseButton1Click:Connect(function()
        local enteredKey = textBox.Text
        local currentKey = settings.KeySettings.Key -- ganti ini dengan key yang benar
        if enteredKey == currentKey then
            validationLabel.Text = "Key is valid"
            validationLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            if settings.Passed then
                settings.Passed()
            end
        else
            validationLabel.Text = "Key is not valid"
            validationLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            if settings.Failed then
                settings.Failed()
            end
        end
    end)

    return {
        Failed = function(callback)
            settings.Failed = callback
        end,
        Passed = function(callback)
            settings.Passed = callback
        end,
        Cancelled = function(callback)
            settings.Cancelled = callback
        end
    }
end
