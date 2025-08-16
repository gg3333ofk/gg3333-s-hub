local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Drop a poop Scripted", "RJTheme5")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Exploits/Farming")
local stata = nil
local stata1 = nil
local stata2 = nil
local stata3 = nil
Section:NewButton("Buy All", "buying luckyfood", function()
    for _, i in pairs(game.ReplicatedStorage.LuckyFoodModels:GetChildren()) do
        game.ReplicatedStorage.Network["LuckyFoodShop:RequestPurchase"]:InvokeServer(i.Name)
    end
end)
Section:NewToggle("Poop Exploit", "buying luckyfood", function(state)
    stata3 = state
    while task.wait() and stata3 do
        game.ReplicatedStorage:FindFirstChild("PoopChargeStart"):FireServer()
        for i = 0, 550 do
            task.wait()
            game.ReplicatedStorage.PoopEvent:FireServer(0)
        end
    end
end)

Section:NewToggle("Sell Exploit", "selling poop", function(state)
    stata2 = state
    while stata2 == true and task.wait(0.01) do
        game.ReplicatedStorage.Sell_Inventory:FireServer()
    end
end)
local Section = Tab:NewSection("Viewer")
local inpt = game:GetService("UserInputService")
local prev = workspace.LuckyFoodShopNPC.Torso.ProximityPrompt.MaxActivationDistance
Section:NewButton("View Stock", "Stock Viewer", function()
    fireproximityprompt(workspace.LuckyFoodShopNPC.Torso.ProximityPrompt)
end)
