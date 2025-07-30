local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Super Hero Tycoon Scripted",
   LoadingTitle = "Rayfield",
   LoadingSubtitle = "by gg3333",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "super hero tycoon scripted"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local prevpos = nil
local Tab = Window:CreateTab("Main")
local Section = Tab:CreateSection("Farm")
local Toggle = Tab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    local PlayerRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
	val = Value
	while val == true do
		task.wait(0.1)
		for _, i in pairs(workspace.CrateSpawns:GetChildren()) do
			i.CFrame = PlayerRoot.CFrame
		end

		offf = workspace.CratesCache:GetChildren()
  		for _, i in pairs(offf) do
    		object = i
    		break
 		end
  		for _, i in pairs(object:GetChildren()) do
			prevpos = i.Position
			i.CanCollide = false
			i.CFrame = PlayerRoot.CFrame
    		task.wait(0.001)
			i.Position = prevpos
    	end
	end
   end,
})
local Section = Tab:CreateSection("Player")

local Slider = Tab:CreateSlider({
   Name = "Walk Speed",
   Range = {10, 200},
   Increment = 2,
   Suffix = "Walkspeed",
   CurrentValue = 20,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})
local Slider = Tab:CreateSlider({
   Name = "Jump Power",
   Range = {10, 200},
   Increment = 2,
   Suffix = "Jump Power",
   CurrentValue = 20,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		while game:GetService("RunService").RenderStepped:Wait() do
			game.Players.LocalPlayer.Character.Humanoid.JumpHeight = Value
		end
   end,
})
