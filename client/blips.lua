Citizen.CreateThread(function()

    local blip = AddBlipForCoord(-1034.531860, -2732.795654, 19.172062)

    SetBlipSprite(blip, 326) -- Model du blip
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7) -- Taille du blip
    SetBlipColour(blip, 3) -- Couleur du blip
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName('Location') -- Nom du blips
    EndTextCommandSetBlipName(blip)
end)

print("Script de Location par Dlyzeennn")