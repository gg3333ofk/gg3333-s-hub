local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Prospecting! Scripted", "RJTheme5")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Farming")
local stt = nil
local plr = game.Players.LocalPlayer
local prevspeed = plr.Character.Humanoid.WalkSpeed
local prevjump = plr.Character.Humanoid.JumpHeight
Section:NewButton("Sell All", "no bypass", function()
    local prevpos = plr.Character.HumanoidRootPart.CFrame
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(-4, 25, 43)
    game.ReplicatedStorage.Remotes.Shop.GetInventorySellPrice:InvokeServer()
    game.ReplicatedStorage.Remotes.Shop.SellAll:InvokeServer()
end)
local stst = nil
local prev = nil
Section:NewToggle("Auto Shaking", "No requires", function(state)
    stst = state
    prev = plr.Character.HumanoidRootPart.CFrame
    while stst == true and game:GetService("RunService").RenderStepped:Wait() do
        for isd = 0, 10 do
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-82, 9, 38)
            if (plr.Character.HumanoidRootPart.Position - Vector3.new(-82, 9, 38)).Magnitude < 6 then
                plr.Character.Humanoid.WalkSpeed = 0
                plr.Character.Humanoid.JumpHeight = 0
                for _, i in pairs(workspace.Characters[game.Players.LocalPlayer.Name]:GetChildren()) do
                    if i:FindFirstChild("Rewards") then
                        print(i.Name)
                        game.Players.LocalPlayer.Character[i.Name].Scripts.Pan:InvokeServer()
                        game.Players.LocalPlayer.Character[i.Name].Scripts.Shake:FireServer()
                        game.ReplicatedStorage.Remotes.Info.ClaimCollectionReward:FireServer(game.ReplicatedStorage.Items.Valuables.Ashvein.Name)
                    end
                end
            end
        end
    end

    if stst == false then
        plr.Character.Humanoid.WalkSpeed = prevspeed
        plr.Character.Humanoid.JumpHeight = prevjump
    end
end)

Section:NewToggle("Auto Pan (check info!!!)", "If it doesnt working then you can join in private servers", function(state)
    stst = state
    while stst == true do
        task.wait(0.00000001)
        for _, i in pairs(workspace.Characters[game.Players.LocalPlayer.Name]:GetChildren()) do
            if i:FindFirstChild("Rewards") then
                plr.Character.Humanoid.AutoRotate = false
                workspace:WaitForChild("Characters")[plr.Name][i.Name].Scripts.ToggleShovelActive:FireServer(true)
                workspace:WaitForChild("Characters")[plr.Name][i.Name].Scripts.Pan:InvokeServer()
                workspace:WaitForChild("Characters")[plr.Name][i.Name].Scripts.Collect:InvokeServer()
                workspace:WaitForChild("Characters")[plr.Name][i.Name].Scripts.Pan:InvokeServer()
                workspace:WaitForChild("Characters")[plr.Name][i.Name].Scripts.Collect:InvokeServer(1.0)
                workspace:WaitForChild("Characters")[plr.Name][i.Name].Scripts.Pan:InvokeServer()
                game.ReplicatedStorage.Modules.Utility.TweenServicePlus.SyncedTime.DelayedRequestEvent:InvokeServer(-12345)
            end
        end
    end

    if stst == false then
        print("Start")
        plr.Character.Humanoid.AutoRotate = true
        plr.Character.Humanoid.WalkSpeed = prevspeed
        plr.Character.Humanoid.JumpPower = prevjump
        workspace:WaitForChild("Characters")[plr.Name][i.Name].Scripts.ToggleShovelActive:FireServer(false)
    end
end)
local Section = Tab:NewSection("Fun")
Section:NewTextBox("Fake Money", "fake money(working)", function(txt)
    game.Players.LocalPlayer.leaderstats.Money.Value = txt
end)
Section:NewTextBox("Fake Level", "fake level(working)", function(txt)
    game.Players.LocalPlayer.leaderstats.Level.Value = txt
end)

local Section = Tab:NewSection("Player")
local newspeed = nil
local newjump = nil
Section:NewSlider("WalkSpeed", "Recomended is 40-50", 75, 0, function(s)
    newspeed = s
end)

local stata = nil
Section:NewToggle("Toggle WalkSpeed Changer", "Bypassed Anti Cheat!", function(state)
    stata = state
    while stata == true and task.wait(0.001) do
        plr.Character.Humanoid.WalkSpeed = newspeed
        task.wait(0.2)
        plr.Character.Humanoid.WalkSpeed = prevspeed
        task.wait(0.03)
        plr.Character.Humanoid.WalkSpeed = 0
        task.wait(0.115)
    end

    if stata == false then
        for i = 0, 10 do
            plr.Character.Humanoid.WalkSpeed = prevspeed
        end
    end
end)
