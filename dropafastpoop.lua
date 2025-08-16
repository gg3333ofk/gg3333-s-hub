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
Section:NewToggle("Poop Exploit", "fixed", function(state)
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
local stata4 = nil
Section:NewToggle("Pet Exploit", "Pet dupe", function(state)
    stata4 = state
    while task.wait(0.15) and stata4 do
        for i = 0, 10 do
            game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Pets: Egg Service"):FireServer("HatchPet", workspace:WaitForChild("Eggs"):WaitForChild("PetEgg"))
        end
    end
end)
local Section = Tab:NewSection("Viewer")
Section:NewButton("View Stock", "Stock Viewer", function()
    fireproximityprompt(workspace.LuckyFoodShopNPC.Torso.ProximityPrompt)
end)
