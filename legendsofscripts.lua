local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Ninja Legends [BETA]",
   LoadingTitle = "Beta script",
   LoadingSubtitle = "by gg3333",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "sdsd"
   },
   Discord = {
      Enabled = false,
      Invite = "t.me/gamescriptedrbx", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
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
local plr = game.Players.LocalPlayer
local Tab = Window:CreateTab("Main")

local Section = Tab:CreateSection("Farming")
local stata = nil
local stats2 = nil
local Toggle = Tab:CreateToggle({
   Name = "Auto Click",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    stata = Value
    while stata == true and task.wait() do
        game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer("swingKatana")
    end
   end,
})
local Toggle = Tab:CreateToggle({
   Name = "Auto Collect Chis",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    stats2 = Value
    while stats2 do
        plr.Character.PrimaryPart.CFrame = workspace.spawnedCoins.Valley:GetChildren()[math.random(1, #workspace.spawnedCoins.Valley:GetChildren())].CFrame
        task.wait(0.1)
    end
   end,
})
local prevpos = nil
local Toggle = Tab:CreateToggle({
   Name = "Auto Sell",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    stats2 = Value
    while stats2 do
        prevpos = workspace.sellAreaCircles.sellAreaCircle.circleInner.CFrame
    
        workspace.sellAreaCircles.sellAreaCircle.circleInner.CFrame = plr.Character.PrimaryPart.CFrame
        task.wait()
        workspace.sellAreaCircles.sellAreaCircle.circleInner.CFrame = prevpos
    end
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Auto Buy Swords",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    stats2 = Value
    while stats2 do
        for _, i in pairs(game.ReplicatedStorage.Weapons.Ground:GetChildren()) do
            game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer("buySword", i.Name)
            task.wait()
        end
    end
   end,
})
local Section = Tab:CreateSection("Player")
local Slider = Tab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 350},
   Increment = 2,
   Suffix = "Player's speed",
   CurrentValue = 20,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    plr.Character.Humanoid.WalkSpeed = Value
   end,
})


local Tab = Window:CreateTab("Information")
local Label = Tab:CreateLabel("Script Version: Beta 2")
local Label = Tab:CreateLabel("Telegram Channel:  t.me/gamescriptedrbx")
