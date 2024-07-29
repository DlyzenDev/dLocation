ESX = exports["es_extended"]:getSharedObject()

CreateThread(function()
    while true do
        local interval = 500
        local posPlayer = GetEntityCoords(PlayerPedId())
        for _,v in pairs(Location) do
            local dest = v.point
            local dist = #(posPlayer-dest)
            if dist <= 3 then
                interval = 0
                DrawMarker(25, dest, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 103, 170, 255, 250, false, false, false, false, false, false, false)
                if dist <= 1.5 then
                    ESX.ShowHelpNotification(v.text)
                    if IsControlJustPressed(1, 51) then
                        openMenuLocation(v)
                    end
                end
            end
        end
        Wait(interval)
    end
end)



RegisterNetEvent("spawnVehicle")
AddEventHandler("spawnVehicle", function(name, spawnpoint)
    local ModelHash = name
    RequestModel(ModelHash)
    while not HasModelLoaded(ModelHash) do
        Wait(10)
    end
    local MyPed = PlayerPedId()
    local vehicle = CreateVehicle(ModelHash, spawnpoint, true, false)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
end)