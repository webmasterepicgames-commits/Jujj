-- Script fun pour exécuteur Roblox (Delta, Codex)
-- Camionnette blanche qui apparaît, parle, puis disparaît

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Fonction pour créer la camionnette
local function spawnVan()
    local van = Instance.new("Part")
    van.Size = Vector3.new(6, 3, 12)
    van.Position = hrp.Position + Vector3.new(10, 0, 0) -- À côté du joueur
    van.Anchored = true
    van.BrickColor = BrickColor.new("Institutional white")
    van.Name = "Camionnette"
    van.Parent = workspace

    -- Message au-dessus
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 250, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 5, 0)
    billboard.Adornee = van
    billboard.Parent = van

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "Fais attention, il y a des fous ici !"
    textLabel.TextColor3 = Color3.new(1, 0, 0)
    textLabel.TextScaled = true
    textLabel.Parent = billboard

    -- Faire un petit mouvement vers le joueur
    for i = 1, 20 do
        van.Position = van.Position:Lerp(hrp.Position + Vector3.new(5,0,0), 0.1)
        wait(0.05)
    end

    -- Disparition
    wait(1)
    van:Destroy()
end

spawnVan()
