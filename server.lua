-- local QBCore = exports['qb-core']:GetCoreObject()

-- -- Make all engine items usable
-- for i = 1, 5 do
--     QBCore.Functions.CreateUseableItem("engine" .. i, function(source, item)
--         TriggerClientEvent("customengine:applyUpgrade", source, item.name)
--     end)
-- end

-- -- Server-side state setting
-- RegisterNetEvent("customengine:saveUpgrade", function(netId, engineItem)
--     local veh = NetworkGetEntityFromNetworkId(netId)
--     if DoesEntityExist(veh) then
--         Entity(veh).state:set("engineUpgrade", engineItem, true)
--     end
-- end)
