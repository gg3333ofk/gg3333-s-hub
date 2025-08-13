local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
local Window = MacLib:Window({
	Title = "Brookhaven Scripted",
	Subtitle = "Version: Early Beta 1",
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
	
}
local sections = {
	MainSection1 = tabs.Main:Section({ Side = "Left" }),
	MainSection2 = tabs.Main2:Section({ Side = "Left" }),
}

sections.MainSection1:Header({
	Name = "Auto Kill"
})
local plr = game.Players.LocalPlayer
local plr3 = nil
local plr2 = nil
sections.MainSection1:Input({
	Name = "User's name",
	Placeholder = "Write username",
	AcceptedCharacters = "All",
	Callback = function(input)
		plr3 = input
	end,
})

sections.MainSection1:Button({
	Name = "Get Couch",
	Callback = function()
        plr.Character.PrimaryPart.CFrame = workspace.WorkspaceCom["003_CouchGiveTool"].Main.CFrame + Vector3.new(0, 1, 0)
	end,
})
sections.MainSection1:Button({
	Name = "Kill Player(, Required Couch in inventory)",
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
            for i = 0, 130 do
                plr.Character.HumanoidRootPart.CFrame = plr2.Character.HumanoidRootPart.CFrame - Vector3.new(0, 1.5, 0)
                task.wait()
            end
            for i = 0, 200 do
                plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(45.5, 1.5, 0)
                task.wait()
            end
            task.wait(0.80)
            workspace[name].Couch.Parent = plr.Backpack
            task.wait(0.3)
            plr.Character.HumanoidRootPart.CFrame = prevpos
            
        end
	end,
})

sections.MainSection2:Button({
	Name = "Equip All Tools(Requires open tools menu)",
	Callback = function()
        for _, i in pairs(game:GetService("Players")["33asdsaddfssdaadsd"].PlayerGui.NoResetGUIHandler.MainToolMenu.Catalog.Container.ScrollingFrame:GetChildren()) do
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
