ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("buyVehicle")
AddEventHandler("buyVehicle", function(price, name, spawnpoint, dist)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local getMoney = xPlayer.getAccount('money').money
    local getBank = xPlayer.getAccount('bank').money
    local haveMoney = false

    if dist >= 20 then
        DropPlayer(_src, "Le cheat n'est pas autorisé sur notre serveur !")
    end

    if getMoney >= price then
        haveMoney = true
        xPlayer.removeAccountMoney('money', price)
    elseif getBank >= price then
        haveMoney = true
        xPlayer.removeAccountMoney('bank', price)
    else
        TriggerClientEvent('esx:showNotification', _src, "Vous n'avez pas assez d'argent pour louer un véhicule.")
    end

    if haveMoney then
        TriggerClientEvent("spawnVehicle", _src, name, spawnpoint)
        TriggerClientEvent('esx:showNotification', _src, "Vous avez louer un véhicule.")
    end
end)

print("Script de Location par Dlyzeennn")