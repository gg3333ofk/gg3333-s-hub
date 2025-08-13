local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Drop a poop [BETA]", "RJTheme5")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Exploits/Farming")
local stata = nil
local stata1 = nil
local stata2 = nil

Section:NewButton("Buy All", "buying luckyfood", function()
    for _, i in pairs(game.ReplicatedStorage.LuckyFoodModels:GetChildren()) do
        game.ReplicatedStorage.Network["LuckyFoodShop:RequestPurchase"]:InvokeServer(i.Name)
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
Section:NewToggle("LuckyFood Shop Stock Viewer(Check info!!!!!)", "Press button 'E' 2 times", function(state)
    stata = state
    inpt.InputBegan:Connect(function(key)
        if key.KeyCode == Enum.KeyCode.E and stata then
            workspace.LuckyFoodShopNPC.Torso.ProximityPrompt.MaxActivationDistance = 1000000
            task.wait(1.5)
            workspace.LuckyFoodShopNPC.Torso.ProximityPrompt.MaxActivationDistance = prev
        end
    end)
end)
