local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Tower of Hell [BETA SCRIPT]", "RJTheme6")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Teleports")

Section:NewButton("Finish the tower", "beta", function()
    
    local plr = game:GetService("Players").LocalPlayer
    local character = plr.Character or plr.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    humanoidRootPart.Anchored = true

    local posx = workspace.tower.sections.finish.exit.carpet.Position.X
    local posz = workspace.tower.sections.finish.exit.carpet.Position.Z
    local posy = workspace.tower.sections.finish.exit.carpet.Position.Y
    print(posx)
    humanoidRootPart.CFrame = CFrame.new(posx, humanoidRootPart.Position.Y, posz)
    while plr.Character.HumanoidRootPart.Position.Y < posy do
        humanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0, 2, 0)
        wait(0.025)
    end
    humanoidRootPart.Anchored = false
end)
