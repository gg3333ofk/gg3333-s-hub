local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Brookhaven Scripted [Beta]", "RJTheme2")
local Tab = Window:NewTab("Main")
local plr3 = nil
local plr2 = nil
local Section = Tab:NewSection("Players")

Section:NewTextBox("Player's nickname", "nickname lol", function(txt)
    plr3 = txt
end)
Section:NewButton("Kill Player", "ButtonInfo", function()
    game.ReplicatedStorage.RE["1Too1l"]:InvokeServer("PickingTools", "ShoppingCart")
    local plr = game.Players.LocalPlayer
    local name = game.Players.LocalPlayer.Name
    print(plr3)
    plr2 = game.Players[plr3]
    plr.Backpack.ShoppingCart.Parent = workspace[name]
    local prevpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    wait(0.05)
    for i = 0, 80 do
        plr.Character.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame + (-plr2.Character.HumanoidRootPart.CFrame.LookVector * 4) - Vector3.new(0, 1.50, 0)
        task.wait(0.025)
    end
    for i = 0, 10 do
        plr.Character.HumanoidRootPart.CFrame = CFrame.new(100000, -5, 0)
        task.wait(0.01)
    end
end)
