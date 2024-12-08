-- Define the blips data
local blips = {
    -- EXAMPLE: {title = "Hookah Lounge", colour = 5, id = 93, coords = vector3(-437.96, -34.62, 46.2)},
  }
  
  -- Table to store created blip handles if needed later
  local createdBlips = {}
  
  -- Helper function to create a blip
  local function createBlip(blipInfo)
    -- Validate blipInfo structure
    if not blipInfo.title or not blipInfo.colour or not blipInfo.id or not blipInfo.coords then
        print("Invalid blip information. Skipping blip creation.")
        return
    end
  
    if type(blipInfo.coords) ~= "vector3" then
        print(("Invalid coordinates for blip '%s'. Expected vector3, got %s."):format(blipInfo.title, type(blipInfo.coords)))
        return
    end
  
    -- Create the blip using vector3's unpack method for clarity
    local blip = AddBlipForCoord(blipInfo.coords.x, blipInfo.coords.y, blipInfo.coords.z)
  
    -- Set blip properties
    SetBlipSprite(blip, blipInfo.id)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, blipInfo.colour)
    SetBlipAsShortRange(blip, true)
  
    -- Set blip name
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipInfo.title)
    EndTextCommandSetBlipName(blip)
  
    -- Store the blip handle
    createdBlips[blipInfo.title] = blip
  end
  
  -- Optional: Helper function to remove a blip by title
  local function removeBlipByTitle(title)
    if createdBlips[title] then
        RemoveBlip(createdBlips[title])
        createdBlips[title] = nil
        print(("Blip '%s' has been removed."):format(title))
    else
        print(("Blip '%s' not found."):format(title))
    end
  end
  
  -- Create all blips in a separate thread to prevent blocking
  Citizen.CreateThread(function()
    for _, blipInfo in ipairs(blips) do
        createBlip(blipInfo)
    end
  
    -- Example: Remove a specific blip after a certain condition or time
    -- Citizen.Wait(60000) -- Wait for 60 seconds
    -- removeBlipByTitle("Casino")
  end)
  