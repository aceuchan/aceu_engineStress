local QBCore = exports['qb-core']:GetCoreObject()

-- Get engine upgrade level from installed vehicle mod (modType 11 = engine)
local function GetUpgradeLevel(veh)
    local mod = GetVehicleMod(veh, 11)
    if mod == -1 then return 1 end -- No upgrade, stock
    return mod + 1 -- Mod level is zero-based, so +1 to match config level
end

-- Explosion check loop
CreateThread(function()
    while true do
        Wait(Config.CheckInterval)

        local ped = PlayerPedId()
        if not IsPedInAnyVehicle(ped, false) then goto continue end

        local veh = GetVehiclePedIsIn(ped, false)
        if GetPedInVehicleSeat(veh, -1) ~= ped then goto continue end

        local rpm = GetVehicleCurrentRpm(veh)
        if rpm < Config.ExplodeRPM then goto continue end

        local level = GetUpgradeLevel(veh)
        local chance = Config.EngineExplosionChance[level] or 0

        -- Debug print (optional)
        print(("[DEBUG] RPM: %.2f | Engine Level: %s | Chance: %s%%"):format(rpm, level, chance))

        if level > 1 and math.random(100) <= chance then
            QBCore.Functions.Notify("Your engine exploded due to extreme RPM!", "error")
            AddExplosion(GetEntityCoords(veh), 5, 1.0, true, false, 1.0)
            SetVehicleEngineHealth(veh, 0.0)
            SetVehicleUndriveable(veh, true)
        end

        ::continue::
    end
end)
