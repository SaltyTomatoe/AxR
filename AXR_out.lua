local client = game.Players.LocalPlayer
local gameId = game.PlaceId
local lib = loadstring(game:HttpGet("https://skiddedcoders.tk/scripts/ui"))()
local isluau = isluau()
local games = {
	[1174971858] = "Speed World Simulator"
}
--//services
local ws = game:GetService("Workspace")
local players = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")
local coregui = game:GetService("CoreGui")
local startergui = game:GetService("StarterGui")

--//end && start helper funcs
local function notify(opts)
	startergui:SetCore("SendNotification",{
		Title = opts[1];
		Text = opts[2];
		Duritation = opts[3];
	})
end

--//End helper funcs & start gui login
local welcome = lib:CreateWindow({["text"] = "Welcome!"})
local credits = welcome:AddLabel("Credits")
local mainCred = welcome:AddBox("NoobieNoober2123 - Main")
local wallyui = welcome:AddBox("Wally - UI Lib")
--//Gui login done
if(gameId == 1174971858)then
	--//Values
	local farming = false
	local orbs = ws.Orbs
	local hoops = ws.Hoops
	--//End
	local function toggle(bool)
		farming = bool
		if(not bool) then return end
		for i,v in pairs(orbs:GetChildren())do
			pcall(function()
				v.PrimaryPart.CFrame = client.Character.HumanoidRootPart.CFrame
			end)
		end
		for i,v in pairs(hoops:GetChildren())do
			pcall(function()
				v.PrimaryPart.CFrame = client.Character.HumanoidRootPart.CFrame
			end)
		end
	end
	local function grabOrbs()
		for i,v in pairs(orbs:GetChildren())do
			pcall(function()
				v.PrimaryPart.CFrame = client.Character.HumanoidRootPart.CFrame
			end)
		end
	end
	local function grabHoops()
		for i,v in pairs(hoops:GetChildren())do
			pcall(function()
				v.PrimaryPart.CFrame = client.Character.HumanoidRootPart.CFrame
			end)
		end
	end
	local main = lib:CreateWindow({text = "Main Cheats"})
	local header = main:AddLabel(games[gameId] .. " Hax")
	local autofarm = main:AddToggle("AutoFarm",toggle)
	local grabOrbs = main:AddButton("Grab Orbs",grabOrbs)
	local grabHoops = main:AddButton("Grab Hoops",grabHoops)
	
	orbs.ChildAdded:Connect(function(x)
		pcall(function() wait(.25) if(farming==nil or not farming) then return end
			x.PrimaryPart.CFrame = client.Character.HumanoidRootPart.CFrame
		end)
	end)
	hoops.ChildAdded:Connect(function(x)
		pcall(function() wait(.25) if(farming==nil or not farming) then return end
			x.PrimaryPart.CFrame = client.Character.HumanoidRootPart.CFrame
		end)
	end)
end