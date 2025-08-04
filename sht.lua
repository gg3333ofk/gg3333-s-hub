local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Super Hero Tycoon Scripted", "RJTheme3")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Farming")
local stt = nil
Section:NewToggle("Auto Farm", "ToggleInfo", function(state)
    local PlayerRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
	stt = state
	while stt == true do
		task.wait(0.1)
		offf = workspace.CratesCache:GetChildren()
  		for _, i in pairs(offf) do
    		object = i
    		break
 		end
  		for _, i in pairs(object:GetChildren()) do
			prevpos = i.Position
            i.Transparency = 0
			i.CanCollide = false
			i.CFrame = PlayerRoot.CFrame
            task.wait(0.0000000000000001)
			i.Position = prevpos
    	end
	end
end)

local Section = Tab:NewSection("Player")
Section:NewSlider("WalkSpeed", "Player's Speed", 250, 1, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section:NewSlider("JumpPower", "Player's Jump Power", 250, 1, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.JumpHeight = s
end)
