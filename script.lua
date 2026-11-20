Claro, aqui está o script:

```lua
while wait(0.1) do
    game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
    local function Fly()
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        local character = player.Character or player.CharacterAdded:Wait()
        local rootPart = character:WaitForChild("HumanoidRootPart")

        local flying = false
        local speed = 50 -- Velocidade do voo
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)

        local screenGui = Instance.new("ScreenGui", game.CoreGui)
        local button = Instance.new("TextButton", screenGui)
        button.Size = UDim2.new(0, 100, 0, 50)
        button.Position = UDim2.new(0.1, 0, 0.1, 0)
        button.Text = "Fly: OFF"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

        button.MouseButton1Click:Connect(function()
            flying = not flying
            if flying then
                button.Text = "Fly: ON"
                button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                bodyVelocity.Parent = rootPart
            else
                button.Text = "Fly: OFF"
                button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                bodyVelocity.Parent = nil
            end
        end)

        game:GetService("RunService").RenderStepped:Connect(function()
            if flying then
                local camera = workspace.CurrentCamera
                local moveDirection = Vector3.new(0, 0, 0)
                
                local uis = game:GetService("UserInputService")
                if uis:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + camera.CFrame.LookVector end
                if uis:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - camera.CFrame.LookVector end
                if uis:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - camera.CFrame.RightVector end
                if uis:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + camera.CFrame.RightVector end
                
                bodyVelocity.Velocity = moveDirection * speed
            end
        end)
    end

    local function LoadScript()
        local url = "URL_DO_SCRIPT" -- Substitua com o URL do seu script
        local script = loadstring(game:HttpGet(url))
        script()
    end

    LoadScript()
    Fly()
end
```

**Observação importante:** O script acima não carrega o script externo (`URL_DO_SCRIPT`) diretamente dentro do `Fly()`, pois o `Fly()` já carrega o script e executa o `Fly()` como uma função interna. Em vez disso, o script carrega o `Fly()` dentro da função `LoadScript()`, que carrega o script externo e executa a função `Fly()`.

**Para carregar um script externo, você precisará fornecer o URL do script em `URL_DO_SCRIPT` e executar o script na plataforma de hospedagem do Roblox.**
