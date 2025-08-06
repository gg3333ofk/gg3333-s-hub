local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Brookhaven Scripted [Beta]", "RJTheme2")
local Tab = Window:NewTab("Main")
local plr3 = nil
local plr2 = nil
local Section = Tab:NewSection("Players")

if not game.Players.LocalPlayer.Backpack:FindFirstChild("Stretcher") then
    game.ReplicatedStorage.RE["1Too1l"]:InvokeServer("PickingTools", "Stretcher")
end
Section:NewTextBox("Player's nickname(And press Enter)", "Lots of bugs", function(txt)
    plr3 = txt
end)
Section:NewButton("Kill Player", "it may not work with people who have a weak device", function()
    local plr = game.Players.LocalPlayer
    local name = game.Players.LocalPlayer.Name
    print(plr3)
    plr2 = game.Players[plr3]
    if workspace[name]:FindFirstChild("Stretcher") then
        workspace[name].Stretcher.Parent = plr.Backpack
    end
    if plr.Backpack:FindFirstChild("Stretcher") then
        plr.Backpack.Stretcher.Parent = workspace[name]
        local prevpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.05)
        for i = 0, 225 do
            plr.Character.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame + (-plr2.Character.HumanoidRootPart.CFrame.LookVector * 4.1) + Vector3.new(0, -0.65, 0)
            game:GetService("RunService").RenderStepped:Wait()
        end
        for i = 0, 400 do
            plr.Character.HumanoidRootPart.CFrame += Vector3.new(12.5, -0.25, 0)
            game:GetService("RunService").RenderStepped:Wait()
        end

        wait(0.80)
        workspace[name].Stretcher.Parent = plr.Backpack
        wait(0.5)
        plr.Character.HumanoidRootPart.CFrame = prevpos
    end

end)
