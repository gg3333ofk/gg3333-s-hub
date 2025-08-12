local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Drop a poop [BETA]", "RJTheme5")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Exploits/Farming")
local stata = nil

Section:NewButton("Buy All", "buying luckyfood", function()
    for _, i in pairs(game.ReplicatedStorage.LuckyFoodModels:GetChildren()) do
        game.ReplicatedStorage.Network["LuckyFoodShop:RequestPurchase"]:InvokeServer(i.Name)
    end
end)
Section:NewToggle("Poop Exploit", "Fast poops", function(state)
    stata = state
    while stata == true and task.wait(0.0001) do
        game.ReplicatedStorage.PoopChargeStart:FireServer()
        game.ReplicatedStorage.PoopEvent:FireServer(1)
        game.ReplicatedStorage.PoopChargeStart:FireServer()
    end
end)

Section:NewToggle("Sell Exploit", "selling poop", function(state)
    stata = state
    while stata == true and task.wait(0.01) do
        game.ReplicatedStorage.Sell_Inventory:FireServer()
    end
end)
local Section = Tab:NewSection("Soon...")
