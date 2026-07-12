-- Universe Store - Volleyball Legends

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Universe Store - Volleyball Legends",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "Volleyball Legends",
    ConfigurationSaving = {Enabled = true, FolderName = "UniverseStore", FileName = "Config"}
})

local MainTab = Window:CreateTab("⚡ Main", 4483362458)

local SpinsEnabled = false
local YenEnabled = false
local HabilidadeEnabled = false

local function RequestReward(arg)
    pcall(function()
        local Event = game:GetService("ReplicatedStorage")
            .Packages._Index["sleitnick_knit@1.7.0"]
            .knit.Services.SeasonService.RF.RequestRankedReward
        Event:InvokeServer(arg)
    end)
end

-- Toggle Lucky Spins (Normal)
MainTab:CreateToggle({
    Name = "Lucky Spins Infinitos",
    CurrentValue = false,
    Flag = "SpinsToggle",
    Callback = function(Value)
        SpinsEnabled = Value
        if Value then
            spawn(function()
                while SpinsEnabled do
                    RequestReward(1)
                    wait(0.7)
                end
            end)
        end
    end
})

-- Toggle Yen
MainTab:CreateToggle({
    Name = "Yen Infinitos",
    CurrentValue = false,
    Flag = "YenToggle",
    Callback = function(Value)
        YenEnabled = Value
        if Value then
            spawn(function()
                while YenEnabled do
                    RequestReward(2)
                    wait(0.7)
                end
            end)
        end
    end
})

-- Novo: Toggle Lucky Spin de Habilidade
MainTab:CreateToggle({
    Name = "Lucky Spin de Habilidade",
    CurrentValue = false,
    Flag = "HabilidadeToggle",
    Callback = function(Value)
        HabilidadeEnabled = Value
        if Value then
            spawn(function()
                while HabilidadeEnabled do
                    RequestReward(4)
                    wait(0.7)
                end
            end)
        end
    end
})

MainTab:CreateParagraph({
    Title = "⚠️ Aviso",
    Content = "Use com moderação.\nDelays muito baixos podem causar kick ou ban."
})

Rayfield:Notify({
    Title = "Script Carregado",
    Content = "Universe Store carregado com sucesso.",
    Duration = 6
})
