loadstring(game:HttpGet"https://raw.githubusercontent.com/710200999/notification/refs/heads/main/notification(Copy).lua")() -- notification

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local PlaceID = game.PlaceId

-- Số người tối đa bạn muốn trong server
local MaxPlayers = 12 -- bạn có thể chỉnh 2, 3, 10 tùy ý

-- Tránh quay lại server cũ
local VisitedServers = {}

function HopLowPlayer()
    local url = "https://games.roblox.com/v1/games/"..PlaceID.."/servers/Public?sortOrder=Asc&limit=100"
    local response = HttpService:JSONDecode(game:HttpGet(url))

    for _, server in pairs(response.data) do
        if server.playing <= MaxPlayers and server.playing < server.maxPlayers then
            if not table.find(VisitedServers, server.id) then
                table.insert(VisitedServers, server.id)
                TeleportService:TeleportToPlaceInstance(PlaceID, server.id, LocalPlayer)
                break
            end
        end
    end
end


HopLowPlayer()
