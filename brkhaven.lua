local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
local Window = MacLib:Window({
	Title = "Brookhaven Scripted",
	Subtitle = "Version: Beta 2",
	Size = UDim2.fromOffset(868, 650),
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
})
local tabGroups = {
	TabGroup1 = Window:TabGroup()
}
local tabs = {
	Main = tabGroups.TabGroup1:Tab({ Name = "Players"}),
	Main2 = tabGroups.TabGroup1:Tab({ Name = "Tools"}),
	Main3 = tabGroups.TabGroup1:Tab({ Name = "Local Player"}),
	Main4 = tabGroups.TabGroup1:Tab({ Name = "Fun"}),
	
}
local sections = {
	MainSection6 = tabs.Main4:Section({ Side = "Left" }),
	MainSection5 = tabs.Main:Section({ Side = "Left" }),
	MainSection1 = tabs.Main:Section({ Side = "Left" }),
	MainSectionTp = tabs.Main:Section({ Side = "Left" }),
	MainSection2 = tabs.Main2:Section({ Side = "Left" }),
	MainSection3 = tabs.Main3:Section({ Side = "Left" }),
	MainSection4 = tabs.Main3:Section({ Side = "Left" }),
}

sections.MainSection1:Header({
	Name = "Auto Kill"
})
sections.MainSectionTp:Header({
	Name = "Other"
})
sections.MainSection3:Header({
	Name = "Player"
})
sections.MainSection4:Header({
	Name = "Houses"
})
local plr = game.Players.LocalPlayer
local plr3 = nil
local plr2 = nil


sections.MainSection1:Input({
	Name = "Player's name",
	Placeholder = "Name",
	AcceptedCharacters = "All",
	Callback = function(input)
		plr3 = input
	end,
}, "Input")

sections.MainSection5:Button({
	Name = "Get Couch",
	Callback = function()
        plr.Character.PrimaryPart.CFrame = workspace.WorkspaceCom["003_CouchGiveTool"].Main.CFrame + Vector3.new(0, 1, 0)
	end,
})
sections.MainSection1:Button({
	Name = "Kill Player(Required Couch in inventory)",
	Callback = function()
        plr2 = game.Players[plr3]
        local name = game.Players.LocalPlayer.Name
        if workspace[name]:FindFirstChild("Couch") then
            workspace[name].Couch.Parent = plr.Backpack
        end
        if plr.Backpack:FindFirstChild("Couch") then
            plr.Backpack.Couch.Parent = workspace[name]
            local prevpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            task.wait(0.05)
            for i = 0, 100 do
                plr.Character.HumanoidRootPart.CFrame = plr2.Character.PrimaryPart.CFrame + Vector3.new(0, -3.5, 0) 
                task.wait()
            end
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(100000, 25, 0)
            task.wait(0.80)
            workspace[name].Couch.Parent = plr.Backpack
            task.wait(0.3)
            plr.Character.HumanoidRootPart.CFrame = prevpos
            
        end
	end,
})
local plrtp = nil
sections.MainSectionTp:Input({
	Name = "Player's name",
	Placeholder = "Name",
	AcceptedCharacters = "All",
	Callback = function(input)
		plrtp = input
	end,
}, "Input")
sections.MainSectionTp:Button({
	Name = "Tp to player",
	Callback = function()
        plr.Character.PrimaryPart.CFrame = game.Players[plrtp].Character.PrimaryPart.CFrame
	end,
})
sections.MainSection2:Button({
	Name = "Equip All Tools(Requires open tools menu)",
	Callback = function()
        for _, i in pairs(game.Players.LocalPlayer.PlayerGui.NoResetGUIHandler.MainToolMenu.Catalog.Container.ScrollingFrame:GetChildren()) do
            if i.Name ~= "UIGridLayout" then
                game:GetService("ReplicatedStorage").RE["1Too1l"]:InvokeServer("PickingTools", i.Name)
                task.wait()
            end
        end
        for _, i in pairs(plr.Backpack:GetChildren()) do
            i.Parent = workspace[plr.Name]
        end
        
	end,
})

sections.MainSection3:Slider({
	Name = "WalkSpeed",
	Default = 20,
	Minimum = 0,
	Maximum = 500,
	DisplayMethod = "Speed",
	Precision = 0,
	Callback = function(Value)
	    plr.Character.Humanoid.WalkSpeed = Value
	end
}, "Slider")
sections.MainSection3:Slider({
	Name = "Jump Boost",
	Default = 20,
	Minimum = 0,
	Maximum = 500,
	DisplayMethod = "Boost",
	Precision = 0,
	Callback = function(Value)
	    plr.Character.Humanoid.JumpPower = Value
	end
}, "Slider")

sections.MainSection4:Button({
	Name = "Anti Ban",
	Callback = function()
        for _, i in pairs(workspace:GetDescendants()) do
		    if i.Name == "BannedBlock" or "PropBlocker13" and i:FindFirstChild("PropBlocker13") then
		        i:Destroy()
		    end
		end
	end,
})
sections.MainSection4:Button({
	Name = "Remove all doors",
	Callback = function()
        for _, i in pairs(workspace:GetDescendants()) do
            if i.Name == "Door" or i.Name == "FakeDoor" or i.Name == "Doors" or i.Name == "Frame" or i.Name == "DoorRight" then
                i:Destroy()
            end
        end
	end,
})
sections.MainSectionTp:Button({
	Name = "Tp player to you(Required Couch in inventory)",
	Callback = function()
        local name = game.Players.LocalPlayer.Name
        if workspace[name]:FindFirstChild("Couch") then
            workspace[name].Couch.Parent = plr.Backpack
        end
        if plr.Backpack:FindFirstChild("Couch") then
            plr.Backpack.Couch.Parent = workspace[name]
            local prevpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            task.wait(0.05)
            for i = 0, 100 do
                plr.Character.HumanoidRootPart.CFrame = game.Players[plrtp].Character.PrimaryPart.CFrame + Vector3.new(0, -3.5, 0) 
                task.wait()
            end
            plr.Character.HumanoidRootPart.CFrame = prevpos
            task.wait(0.5)
            workspace[name].Couch.Parent = plr.Backpack
            
        end
	end,
})
sections.MainSection6:Button({
	Name = "Spawn all cars(Required open car menu)",
	Callback = function()
        for _, i in pairs(game:GetService("ReplicatedStorage").UiClone.DealershipUI1.MainVehicleMenu.Catalog.Container.ScrollingFrame:GetChildren()) do
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer("PickingCar", i.Name)
            task.wait()
        end
	end,
})
