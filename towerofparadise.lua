local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Tower of Hell Scripted", "RJTheme6")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Movement")
local plr = game.Players.LocalPlayer
Section:NewButton("Finish the tower", "-- Fixed", function()
    local posx = workspace:WaitForChild("tower"):WaitForChild("sections"):WaitForChild("finish"):WaitForChild("exit"):WaitForChild("carpet").Position.X
    local posz = workspace:WaitForChild("tower"):WaitForChild("sections"):WaitForChild("finish"):WaitForChild("exit"):WaitForChild("carpet").Position.Z
    local posy = workspace:WaitForChild("tower"):WaitForChild("sections"):WaitForChild("finish"):WaitForChild("exit"):WaitForChild("carpet").Position.Y
    print("finished")
    local character = plr.Character
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    humanoidRootPart.Anchored = true
    print(posx)
    humanoidRootPart.CFrame = CFrame.new(posx, humanoidRootPart.Position.Y, posz)
    while plr.Character.HumanoidRootPart.Position.Y < posy do
        humanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0, 4, 0)
        wait(0.0001)
    end
    humanoidRootPart.Anchored = false
end)
local Section = Tab:NewSection("Other")
local speed = nil
local jump = nil
local Section = Tab:NewSection("Player")
Section:NewSlider("WalkSpeed", "WalkSpeed", 150, 0, function(s)
    speed = s
end)
Section:NewSlider("Jump Boost", "WalkSpeed", 150, 0, function(s)
    jump = s
end)
local stat2 = nil
Section:NewToggle("Godmode", "Godmode -- working", function(state)
    stat2 = state
    while task.wait() and stat2 do
        game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 10000
        game.Players.LocalPlayer.Character.Humanoid.Health = 10000
    end
end)

while game:GetService("RunService").RenderStepped:Wait() do
    plr.Character.Humanoid.WalkSpeed = speed
    plr.Character.Humanoid.JumpPower = jump
end
