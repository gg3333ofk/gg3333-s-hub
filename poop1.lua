local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Poop -- Beta Script",
   LoadingTitle = "UI - Rayfield",
   LoadingSubtitle = "by gg3333",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "gg3333's hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "No key",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Poop Roblox Game", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Exploits")

Rayfield:Notify({
   Title = "gg3333's hub injected",
   Content = "Successfully injected",
   Duration = 6.5,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("Successfully activated the script!")
      end
   },
},
})
local Label = Tab:CreateLabel("RapidPoops Exploit STATUS: WORKING")
local Toggle = Tab:CreateToggle({
   Name = "RapidPoops Exploit(SAFE FROM KICK)",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   Value1 = Value
   while Value1 == true do
		game.ReplicatedStorage.PoopChargeStart:FireServer()
		game.ReplicatedStorage.PoopEvent:FireServer()
		task.wait(0.45)
   end

   end,
})
local toggl3 = Tab:CreateToggle({
   Name = "Double RapidPoops Exploit",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   Value1 = Value
   while Value1 == true do
		game.ReplicatedStorage.PoopChargeStart:FireServer()
		game.ReplicatedStorage.PoopEvent:FireServer()
		task.wait(0.23)
   end

   end,
})
local Label = Tab:CreateLabel("Auto Sell - IN DEVELOPING")
local Section = Tab:CreateSection("Other")
local Button2 = Tab:CreateButton({
   Name = "Sell poop (Teleports to NPC Seller)",
   Callback = function()
		local player = game.Players.LocalPlayer
		player.Character.HumanoidRootPart.CFrame = workspace.PoopSellerNPC.HumanoidRootPart.CFrame
   end,
})
