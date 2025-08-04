local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("Poop Scripted", "RJTheme3")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Exploits")
local stt = false
Section:NewToggle("Rapid-Poops Exploit(safe)", "Toggle", function(state)
    print(state)
    stt = state
    while stt == true do
        game.ReplicatedStorage.PoopChargeStart:FireServer()
		game.ReplicatedStorage.PoopEvent:FireServer()
		task.wait(0.45)
    end
end)
Section:NewToggle("Double Rapid-Poops Exploit(it can crash the server!)", "Toggle", function(state)
    print(state)
    stt = state
    while stt == true do
        game.ReplicatedStorage.PoopChargeStart:FireServer()
		game.ReplicatedStorage.PoopEvent:FireServer()
		task.wait(0.23)
    end
end)
Section:NewToggle("Auto Sell Exploit", "Toggle", function(state)
    print(state)
    stt = state
    while stt == true do
		game.ReplicatedStorage.PoopStartDialogue:FireServer()
		game.ReplicatedStorage.PoopResponseChosen:FireServer("1. [Sure, take my poop!]")
		game.ReplicatedStorage.PoopResponseChosen:FireServer("2. [I want to sell my inventory.]")
        task.wait(0.45)
    end
end)
local Section = Tab:NewSection("Other")
Section:NewToggle("Optimization(Client)", "Toggle", function(state)
    print(state)
    stt = state
    while stt == true and game:GetService("RunService").RenderStepped:Wait() do
		for _, i in pairs(workspace:GetChildren()) do
			if i.Name == "Poop" then
				i:Destroy()
			end
		end
    end
end)
local Section = Tab:NewSection("Fun")
Section:NewButton("Spawn a poop(Client)", "Button", function()
    local Clon = game.ReplicatedStorage.ClassicDogPoop:Clone()
	Clon.Parent = workspace
end)
Section:NewButton("Delete all poops(Client)", "Button", function()
    for _, i in pairs(workspace:GetChildren()) do
		if i.Name == "ClassicDogPoop" then
			i:Destroy()
		end
	end
end)
local previpos = workspace.PoopSellerNPC.HumanoidRootPart.CFrame
Section:NewButton("Teleport NPC to you", "Button", function()
    workspace.PoopSellerNPC.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)
local previpos = workspace.PoopSellerNPC.HumanoidRootPart.CFrame
Section:NewButton("Teleport NPC to default position", "Button", function()
    workspace.PoopSellerNPC.HumanoidRootPart.CFrame = previpos
end)
