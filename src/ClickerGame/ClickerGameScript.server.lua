-- Clicker Game Script

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create a RemoteEvent for communication between client and server
local ClickEvent = Instance.new("RemoteEvent")
ClickEvent.Name = "ClickEvent"
ClickEvent.Parent = ReplicatedStorage

-- Create a RemoteFunction for getting the current score
local GetScoreFunction = Instance.new("RemoteFunction")
GetScoreFunction.Name = "GetScoreFunction"
GetScoreFunction.Parent = ReplicatedStorage

-- Initialize a table to store player scores
local playerScores = {}

-- Function to handle player clicks
local function onPlayerClick(player)
    playerScores[player] = (playerScores[player] or 0) + 1
    print(player.Name .. " clicked! Score: " .. playerScores[player])
end

-- Connect the RemoteEvent to the onPlayerClick function
ClickEvent.OnServerEvent:Connect(onPlayerClick)

-- Function to handle score requests
local function onGetScoreRequest(player)
    return playerScores[player] or 0
end

-- Connect the RemoteFunction to the onGetScoreRequest function
GetScoreFunction.OnServerInvoke = onGetScoreRequest

print("Clicker Game Script loaded")