-- 1. CARGAR PANEL VISUAL BONITO (Orion Library - Sin Sonido y Auto-Apertura)
local OrionLib = loadstring(game:HttpGet(('https://githubusercontent.com')))()
local Window = OrionLib:MakeWindow({
    Name = "Brainrot Premium Hub", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "OrionTest",
    IntroText = "Cargando Panel..." -- Pantalla de carga bonita de inicio
})

-- 2. PESTAÑA DE MOVIMIENTO (SALTO INFINITO SEGURO)
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
        
        -- Evento de Roblox que detecta cuando presionas la pantalla para saltar
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfiniteJump then
                -- El script cambia el estado del personaje de forma suave para que el juego no te expulse
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                if humanoid then
                    humanoid:ChangeState("Jumping")
                end
            end
        end)
    end
})

-- 3. PESTAÑA DE RENDIMIENTO (BAJAR GRÁFICOS Y SUBIR FPS)
local TabRendimiento = Window:MakeTab({
    Name = "Rendimiento",
    Icon = "rbxassetid://4483345998",
    Premium = false
})

TabRendimiento:AddButton({
    Name = "Activar Súper FPS Booster",
    Callback = function()
        -- Cambia el renderizado del mapa a plástico liso (quita carga al procesador)
        for _, object in pairs(game.Workspace:GetDescendants()) do
            if object:IsA("MeshPart") or object:IsA("Part") or object:IsA("CornerWedgePart") then
                object.Material = Enum.Material.SmoothPlastic
                object.Reflectance = 0
            elseif object:IsA("Decal") or object:IsA("Texture") then
                object:Destroy() -- Elimina imágenes del suelo/paredes para liberar memoria RAM
            end
        end
        
        -- Desactiva efectos visuales pesados de iluminación y sombras
        game.Lighting.GlobalShadows = false
        game.Lighting.FogEnd = 9e9
        settings().Rendering.QualityLevel = 1 -- Fuerza a Roblox a usar la calidad gráfica más baja interna
        
        OrionLib:MakeNotification({
            Name = "Optimización",
            Content = "Gráficos bajados al mínimo. FPS Optimizados.",
            Image = "rbxassetid://4483345998",
            Time = 4
        })
    end
})

-- Inicializa el script de forma automática al inyectar
OrionLib:Init()
