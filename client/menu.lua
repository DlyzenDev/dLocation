local cooldown = true
local openLocation = false
menuLocation = RageUI.CreateMenu("Location", " ")
menuLocation.Closed = function()
    openLocation = false
end

function openMenuLocation(valeur)
    if openLocation then
        openLocation = false
        RageUI.Visible(menuLocation, false)
        return
    else
        openLocation = true
        RageUI.Visible(menuLocation, true)
        CreateThread(function()
            while openLocation do
                RageUI.IsVisible(menuLocation, function()
                    for _,v in pairs(valeur.listVehicle) do
                        RageUI.Separator("~b~↓~s~ Véhicules disponibles ~b~↓~s~")
                        RageUI.Button(v.label, "Appuyer sur ENTER pour louer le véhicule.", {RightLabel = ("~b~%s$~s~"):format(v.price)}, cooldown, {
                            onSelected = function()
                                cooldown = false
                                TriggerServerEvent("buyVehicle", v.price, v.name, v.spawnpoint, #(GetEntityCoords(PlayerPedId())-valeur.point))
                                ESX.SetTimeout(2000, function()
                                    cooldown = true
                                end)
                                RageUI.CloseAll()
                            end
                        })
                    end
                end)
                Wait(0)
            end
        end)
    end
end