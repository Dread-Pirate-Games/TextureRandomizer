local selectionService = game:GetService("Selection")
local changeHistoryService = game:GetService("ChangeHistoryService")

local toolbar = plugin:CreateToolbar("Texture Randomizer")
local button1 = toolbar:CreateButton("Randomize Textures", "Randomize Texture ", "rbxassetid://7509385682")


function GetRandomizedValue(LowerBound, UpperBound)
	-- returns a random decimal value between the bounds, rounded to 2 decimal places
	
	--print("=========================================================")
	--print("     Lower/Upper bounds = " .. LowerBound .. "/" .. UpperBound)
	
	--get a random integer bewtween the two bounds
	local randInt = math.random(LowerBound, UpperBound - 1)
	--print("     randInt = " .. randInt)
	
	-- get a real between 0 and 1 and add to the int
	local randReal = math.random() + randInt
	--print("     randReal = " .. randReal)
	
	-- use math.floor to round to two decimal places
	local value = math.floor(randReal * 100)/100  
	--print("     final value = " .. value)
	--print("=========================================================")

	--local value = math.floor((math.random(LowerBound, UpperBound) * math.random()) * 100)/100  
	return value
end

local ui = script:WaitForChild("ScreenGui")
local cancelButton = ui.Frame.CancelButton
local randomizeButton = ui.Frame.RandomizeButton

button1.Click:Connect(function()
	
	ui.Parent = game:GetService("CoreGui")
	ui.Enabled = true
	
end)

function onCancel()
	ui.Enabled = false

end

function randomizeTextures()
	
	local badInput = false
	
	for _, child in pairs(ui.Frame:GetChildren()) do
		if child.ClassName == "TextBox" then
			if child.Text == "" then
				badInput = true
				child.BorderColor3 = Color3.new(255,0,0)
				child.BorderSizePixel = 5
			elseif tonumber(child.Text) == nil then
				child.BorderColor3 = Color3.new(27, 42, 53)
				child.BorderSizePixel = 1
			end
		end
		
	end
	
	if badInput == true then
		return
			
	end
	
	local OffsetStudsULower = ui.Frame.OffsetStudsULower.Text
	local OffsetStudsUUpper = ui.Frame.OffsetStudsUUpper.Text
	local OffsetStudsVLower = ui.Frame.OffsetStudsVLower.Text
	local OffsetStudsVUpper = ui.Frame.OffsetStudsVUpper.Text
	local StudsPerTileULower = ui.Frame.StudsPerTileULower.Text
	local StudsPerTileUUpper = ui.Frame.StudsPerTileUUpper.Text
	local StudsPerTileVLower = ui.Frame.StudsPerTileVLower.Text
	local StudsPerTileVUpper = ui.Frame.StudsPerTileVUpper.Text
	
	

	ui.Enabled = false
	print("=========================================================")
	print(">> Randomization parameters:")
	print(">> OffsetStudsU: " .. OffsetStudsULower .. "/" .. OffsetStudsUUpper)
	print(">> OffsetStudsV: " .. OffsetStudsVLower .. "/" .. OffsetStudsVUpper)
	print(">> StudsPerTileU: " .. StudsPerTileULower .. "/" .. StudsPerTileUUpper)
	print(">> StudsPerTileV: " .. StudsPerTileVLower .. "/" .. StudsPerTileVUpper)
	print("=========================================================")
	
	
	local selected = selectionService:Get()
	if  #selected > 0 then
		changeHistoryService:SetWaypoint("Randomizing textures")

		for _, object in pairs(selected) do
			local texturesFound = false
			
			if object.ClassName == "Texture" then
				object.OffsetStudsU = GetRandomizedValue(OffsetStudsULower, OffsetStudsUUpper)
				object.OffsetStudsV = GetRandomizedValue(OffsetStudsVLower, OffsetStudsVUpper)
				object.StudsPerTileU = GetRandomizedValue(StudsPerTileULower, StudsPerTileUUpper)
				object.StudsPerTileV = GetRandomizedValue(StudsPerTileVLower, StudsPerTileVUpper)
			else
				print(object.Name .. " was not a Texture instance. Getting this instance's children...")
				
				--get children and find textures
				local children = object:GetChildren()

				--print(" ")
				--print("********************************************************")
				--print("Getting children of " .. object.Name)

				for _, child in pairs(children) do
					if child.ClassName == "Texture" then

						texturesFound = true


						child.OffsetStudsU = GetRandomizedValue(OffsetStudsULower, OffsetStudsUUpper)
						child.OffsetStudsV = GetRandomizedValue(OffsetStudsVLower, OffsetStudsVUpper)
						child.StudsPerTileU = GetRandomizedValue(StudsPerTileULower, StudsPerTileUUpper)
						child.StudsPerTileV = GetRandomizedValue(StudsPerTileVLower, StudsPerTileVUpper)

						--print("New values set:")
						--print("OffsetStudsU: " .. child.OffsetStudsU)
						--print("OffsetStudsV: " .. child.OffsetStudsU)
						--print("StudsPerTileU: " .. child.StudsPerTileU)
						--print("StudsPerTileV: " .. child.StudsPerTileV)

					end

					--print("********************************************************")
					--print(" ")

				end
				
			end
			


			if texturesFound == false then
				warn("Selected item(s) did not contain a Texture instance.")
			end

		end

		changeHistoryService:SetWaypoint("Randomizing textures")

	else	
		warn("Nothing was selected")
	end

end



cancelButton.Activated:Connect(onCancel)
randomizeButton.Activated:Connect(randomizeTextures)