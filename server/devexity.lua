AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        Citizen.CreateThread(function()
            Citizen.Wait(5000) -- Wait for 5000 milliseconds (5 seconds) or adjust as needed
            print("DDDDD   EEEEE  V   V  EEEEE  X   X  III  TTTTT  Y   Y")
            print("D    D  E      V   V  E       X X    I     T     Y Y ")
            print("D    D  EEEE   V   V  EEEE     X     I     T      Y  ")
            print("D    D  E      V   V  E       X X    I     T      Y  ")
            print("DDDDD   EEEEE   V V   EEEEE  X   X  III    T      Y  ")
        end)
    end
end)