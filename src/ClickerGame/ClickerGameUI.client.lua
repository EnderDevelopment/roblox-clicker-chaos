-- Clicker Game UI Script

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get the RemoteEvent and RemoteFunction
local ClickEvent = ReplicatedStorage:WaitForChild("ClickEvent")
local GetScoreFunction = ReplicatedStorage:WaitForChild("GetScoreFunction")

-- Create the UI
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ClickerGameUI"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.5, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.Text = "Score: 0"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundTransparency = 1
textLabel.TextScaled = true
textLabel.Parent = frame

local clickButton = Instance.new("TextButton")
clickButton.Size = UDim2.new(1, 0, 0.5, 0)
clickButton.Position = UDim2.new(0, 0, 0.5, 0)
clickButton.Text = "Click Me!"
clickButton.TextColor3 = Color3.new(1, 1, 1)
clickButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
clickButton.BorderSizePixel = 0
clickButton.Parent = frame

-- Function to update the score display
local function updateScore()
    local score = GetScoreFunction:InvokeServer()
    textLabel.Text = "Score: " .. score
end

-- Connect the button click to the RemoteEvent and update the score
clickButton.MouseButton1Click:Connect(function()
    ClickEvent:FireServer()
    updateScore()
end)

-- Initial score update
updateScore()

print("Clicker Game UI loaded")