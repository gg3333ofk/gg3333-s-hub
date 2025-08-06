local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Super Hero Tycoon Scripted", "RJTheme3")
local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Farming")
local vdd = nil
Section:NewToggle("Auto Collect Money", "Server can be lag", function(state)
    vdd = state
    while vdd == true and game:GetService("RunService").RenderStepped:Wait() do
        game.ReplicatedStorage.ReplicaRemoteEvents["Replica_ReplicaSignal"]:FireServer(math.random(0, 15), "collectMoney", game.Players.LocalPlayer)
    end
end)
local sta = nil
Section:NewToggle("Auto Farm", "Server can be lag", function(state)
    local PlayerRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
	sta = state
	while sta == true do
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
            task.wait(0.00001)
			i.Position = prevpos
    	end
	end
end)
local vdds = nil
Section:NewToggle("Auto buy dropper (First Floor)", "Server can be lag (Second floor soon...)", function(state)
    vdds = state
    while vdds == true and game:GetService("RunService").RenderStepped:Wait() do
        print("st")
        game.ReplicatedStorage.ReplicaRemoteEvents["Replica_ReplicaSignal"]:FireServer(math.random(1, 15), "buyButton", "Begin Working! - [$0]")
        task.wait(0.001)
        game.ReplicatedStorage.ReplicaRemoteEvents["Replica_ReplicaSignal"]:FireServer(math.random(1, 15), "buyButton", "Buy Power Dropper - [$100]")
        task.wait(0.001)
        game.ReplicatedStorage.ReplicaRemoteEvents["Replica_ReplicaSignal"]:FireServer(math.random(1, 15), "buyButton", "Buy Power Dropper - [$150]")
        task.wait(0.001)
        game.ReplicatedStorage.ReplicaRemoteEvents["Replica_ReplicaSignal"]:FireServer(math.random(1, 15), "buyButton", "Buy Power Dropper - [$425]")
        task.wait(0.001)
        game.ReplicatedStorage.ReplicaRemoteEvents["Replica_ReplicaSignal"]:FireServer(math.random(1, 15), "buyButton", "Buy MEGA Dropper - [$900]")
        task.wait(0.001)
        game.ReplicatedStorage.ReplicaRemoteEvents["Replica_ReplicaSignal"]:FireServer(math.random(1, 15), "buyButton", "Buy MEGA Dropper - [$2250]")
        task.wait(0.001)
        game.ReplicatedStorage.ReplicaRemoteEvents["Replica_ReplicaSignal"]:FireServer(math.random(1, 15), "buyButton", "Buy ULTIMATE Upgrader - [$3400]")
        task.wait(0.001)
        game.ReplicatedStorage.ReplicaRemoteEvents["Replica_ReplicaSignal"]:FireServer(math.random(1, 15), "buyButton", "Buy ULTIMATE Upgrader - [$8500]")
        print("str")
    end
end)

local Section = Tab:NewSection("Player")
Section:NewSlider("WalkSpeed", "Player's Speed", 250, 1, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section:NewSlider("JumpPower", "Player's Jump Power", 250, 1, function(s) -- 500 (Макс. значение) | 0 (Мин. значение)
    game.Players.LocalPlayer.Character.Humanoid.JumpHeight = s
end)
