--[[ 
    Mã này tạo hai ScreenGui:
    1. PasswordGui: Hiển thị một khung nhập mật khẩu với giao diện hiện đại và "ngầu".
    2. WRGui: Menu mod, mặc định bị ẩn cho đến khi nhập mật khẩu đúng.
--]]

---------------------
-- Menu Mod (WRGui)
---------------------
local menu = Instance.new("ScreenGui")
menu.Name = "WR"
menu.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0.05, 0, 0.05, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(80, 80, 200)
frame.Parent = menu
frame.Visible = false  -- Ẩn menu cho tới khi nhập mật khẩu đúng

-- Phần bo tròn cho menu (nếu muốn)
local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 8)
frameCorner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 100)
title.BorderSizePixel = 0
title.Text = "✨ WRGui ✨"
title.TextColor3 = Color3.fromRGB(255, 215, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.Text = "✖"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.BorderSizePixel = 0
closeButton.Parent = frame
closeButton.MouseButton1Click:Connect(function()
    menu:Destroy()
end)

local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(1, -50, 0, 5)
minimizeButton.Text = "➖"
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
minimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 14
minimizeButton.BorderSizePixel = 0
minimizeButton.Parent = frame

local showButton = Instance.new("TextButton")
showButton.Size = UDim2.new(0, 40, 0, 40)
showButton.Position = UDim2.new(0, 10, 0, 10)
showButton.Text = ""
showButton.BackgroundColor3 = Color3.fromRGB(80, 80, 200)
showButton.TextColor3 = Color3.fromRGB(255, 255, 255)
showButton.Font = Enum.Font.GothamBold
showButton.TextSize = 20
showButton.BorderSizePixel = 0
showButton.Visible = false
showButton.Parent = menu

local minimized = false

minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        frame.Visible = false
        showButton.Visible = true
        showButton.Size = UDim2.new(0, 40, 0, 40)
    else
        frame.Visible = true
        showButton.Visible = false
    end
end)

showButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    showButton.Visible = false
    minimized = false
end)

--------------------------------
-- Password GUI (giao diện nhập mật khẩu "ngầu")
--------------------------------
local passwordGui = Instance.new("ScreenGui")
passwordGui.Name = "PasswordGui"
passwordGui.Parent = game.CoreGui

-- Tạo khung chính cho giao diện nhập mật khẩu
local passwordFrame = Instance.new("Frame")
passwordFrame.Size = UDim2.new(0, 350, 0, 200)
passwordFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
passwordFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
passwordFrame.BackgroundTransparency = 0.1
passwordFrame.AnchorPoint = Vector2.new(0.5, 0.5)
passwordFrame.Parent = passwordGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 15)
frameCorner.Parent = passwordFrame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(80, 80, 255)
frameStroke.Thickness = 3
frameStroke.Parent = passwordFrame

-- Label để hướng dẫn nhập mật khẩu
local promptLabel = Instance.new("TextLabel")
promptLabel.Size = UDim2.new(1, 0, 0, 30)
promptLabel.Position = UDim2.new(0, 0, 0, 15)
promptLabel.BackgroundTransparency = 1
promptLabel.Text = "Nhập mật khẩu để mở menu:"
promptLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
promptLabel.Font = Enum.Font.GothamBold
promptLabel.TextScaled = true
promptLabel.Parent = passwordFrame

-- Hộp nhập mật khẩu
local passwordBox = Instance.new("TextBox")
passwordBox.Size = UDim2.new(0.8, 0, 0, 35)
passwordBox.Position = UDim2.new(0.1, 0, 0.4, 0)
passwordBox.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
passwordBox.BackgroundTransparency = 0.1
passwordBox.TextColor3 = Color3.fromRGB(0, 0, 0)
passwordBox.PlaceholderText = "Mật khẩu..."
passwordBox.Font = Enum.Font.GothamBold
passwordBox.TextSize = 18
passwordBox.ClearTextOnFocus = false
passwordBox.Parent = passwordFrame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 8)
boxCorner.Parent = passwordBox

-- Nút xác nhận
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.5, 0, 0, 40)
submitButton.Position = UDim2.new(0.25, 0, 0.7, 0)
submitButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
submitButton.Text = "Xác nhận"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.Font = Enum.Font.GothamBold
submitButton.TextSize = 20
submitButton.BorderSizePixel = 0
submitButton.Parent = passwordFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = submitButton

-- Label hiển thị lỗi nếu mật khẩu không đúng
local errorLabel = Instance.new("TextLabel")
errorLabel.Size = UDim2.new(1, 0, 0, 20)
errorLabel.Position = UDim2.new(0, 0, 0.85, 0)
errorLabel.BackgroundTransparency = 1
errorLabel.Text = ""
errorLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
errorLabel.Font = Enum.Font.GothamBold
errorLabel.TextSize = 16
errorLabel.Parent = passwordFrame

-- Mật khẩu đúng bây giờ là "123"
local correctPassword = "123"

submitButton.MouseButton1Click:Connect(function()
    if passwordBox.Text == correctPassword then
        -- Nếu mật khẩu đúng, xoá GUI nhập mật khẩu và hiển thị menu mod
        passwordGui:Destroy()
        frame.Visible = true
    else
        errorLabel.Text = "Mật khẩu không đúng. Vui lòng thử lại!"
        passwordBox.Text = ""
    end
end)
