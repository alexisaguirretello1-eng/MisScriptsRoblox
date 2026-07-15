local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Brainrot Premium Hub", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "OrionTest",
    IntroText = "Cargando Panel..."
})

local TabMovimiento = Window:MakeTab({
    Name = "Movimiento",
    Icon = "rbxassetid://4483345998",
    Premium = false
})

_G.InfiniteJump = false
TabMovimiento:AddToggle({
    Name = "Salto Infinito Seguro",
    Default = false,
    Callback = function(Value)
        _G.InfiniteJump = Value
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfiniteJump then
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                if humanoid then
                    humanoid:ChangeState("Jumping")
                end
            end
        end)
    end
})

local TabRendimiento = Window:MakeTab({
    Name = "Rendimiento",
    Icon = "rbxassetid://4483345998",
    Premium = false
})

TabRendimiento:AddButton({
    Name = "Activar Súper FPS Booster",
    Callback = function()
        for _, object in pairs(game.Workspace:GetDescendants()) do
            if object:IsA("MeshPart") or object:IsA("Part") or object:IsA("CornerWedgePart") then
                object.Material = Enum.Material.SmoothPlastic
                object.Reflectance = 0
            elseif object:IsA("Decal") or object:IsA("Texture") then
                object:Destroy()
            end
        end
        game.Lighting.GlobalShadows = false
        game.Lighting.FogEnd = 9e9
        settings().Rendering.QualityLevel = 1
    end
})

OrionLib:Init()
