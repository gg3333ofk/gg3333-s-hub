local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Prospecting! [BETA SCRIPT]", "RJTheme5")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Farming")
local stt = nil
local plr = game.Players.LocalPlayer
Section:NewButton("Sell All", "sell all lol", function()
    local prevpos = plr.Character.HumanoidRootPart.CFrame
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-4, 25, 43)
    game.ReplicatedStorage.Remotes.Shop.GetInventorySellPrice:InvokeServer()
    game.ReplicatedStorage.Remotes.Shop.SellAll:InvokeServer()
    task.wait(0.25)
    plr.Character.HumanoidRootPart.CFrame = prevpos + Vector3.new(0, 65, 0)
    game:GetService("RunService").RenderStepped:Wait()
    plr.Character.HumanoidRootPart.CFrame = prevpos
end)
local stst = nil
local prev = nil
Section:NewToggle("Auto Shaking", "No requires", function(state)
    stst = state
    prev = plr.Character.HumanoidRootPart.CFrame
    while stst == true and game:GetService("RunService").RenderStepped:Wait() do
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(-82, 9, 38)
        for _, i in pairs(workspace.Characters[game.Players.LocalPlayer.Name]:GetChildren()) do
            if i:FindFirstChild("Rewards") then
                print(i.Name)
                game.Players.LocalPlayer.Character[i.Name].Scripts.Pan:InvokeServer()
                game.Players.LocalPlayer.Character[i.Name].Scripts.Shake:FireServer()
            end
        end
        plr.Character.HumanoidRootPart.Anchored = true
    end
    if stst == false then
        plr.Character.HumanoidRootPart.CFrame = prev
        plr.Character.HumanoidRootPart.Anchored = false
    end
end)
Section:NewToggle("Auto Pan (check an info) [IN DEV]", "hold Mouse 1", function(state)
    stst = state
    while stst == true do
        game:GetService("RunService").RenderStepped:Wait()
        for _, i in pairs(workspace.Characters[game.Players.LocalPlayer.Name]:GetChildren()) do
            if i:FindFirstChild("Rewards") then
                workspace:WaitForChild("Characters")[game.Players.LocalPlayer.Name][i.Name].Scripts.ToggleShovelActive:FireServer(true)
                workspace:WaitForChild("Characters")[game.Players.LocalPlayer.Name][i.Name].Scripts.Pan:InvokeServer()
                workspace:WaitForChild("Characters")[game.Players.LocalPlayer.Name][i.Name].Scripts.Collect:InvokeServer()
                workspace:WaitForChild("Characters")[game.Players.LocalPlayer.Name][i.Name].Scripts.Pan:InvokeServer()
                workspace:WaitForChild("Characters")[game.Players.LocalPlayer.Name][i.Name].Scripts.Collect:InvokeServer(1.0)
                workspace:WaitForChild("Characters")[game.Players.LocalPlayer.Name][i.Name].Scripts.Pan:InvokeServer()
            end
        end
    end
end)

