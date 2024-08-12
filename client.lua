local QBCore = exports['qb-core']:GetCoreObject()



RegisterNetEvent('openHouseRobberyMenu')
AddEventHandler('openHouseRobberyMenu', function(items)
    local options = {}

    for index, item in ipairs(HarryBarry['House_Robbery']) do
        table.insert(options, {
            title = item.label .. " - $" .. item.price,
            event = 'sellItem_' .. index,
            arrow = true
        })
    end

    lib.registerContext({
        id = 'HouseRobberymenu',
        title = 'House Items Menu',
        options = options
    })

    lib.showContext('HouseRobberymenu')
end)

for index, item in ipairs(HarryBarry['House_Robbery']) do
    RegisterNetEvent('sellItem_' .. index)
    AddEventHandler('sellItem_' .. index, function()
        local options = {
            {title = 'Sell All', event = 'sellItem_all_' .. index},
            {title = 'Sell Quantity', event = 'sellItem_quantity_' .. index}
        }

        lib.registerContext({
            id = 'SellItemContext_' .. index,
            title = 'Select Selling Option',
            options = options
        })

        lib.showContext('SellItemContext_' .. index)
    end)

    RegisterNetEvent('sellItem_all_' .. index)
    AddEventHandler('sellItem_all_' .. index, function()
        TriggerServerEvent('sellItems_' .. index, -1) -- -1 for selling all
    end)

    RegisterNetEvent('sellItem_quantity_' .. index)
    AddEventHandler('sellItem_quantity_' .. index, function()
        local input = lib.inputDialog('Enter quantity to sell', { {type = 'number', name = 'quantity', label = 'Quantity'} })
        if input then
            local quantity = tonumber(input.quantity)
            if quantity and quantity > 0 then
                TriggerServerEvent('sellItems_' .. index, quantity)
            end
        end
    end)
end

RegisterNetEvent('openKatanas/KnivesMenu')
AddEventHandler('openKatanas/KnivesMenu', function(items)
    local options = {}

    for index, item in ipairs(HarryBarry['Katanas/Knives']) do
        table.insert(options, {
            title = item.label .. " - $" .. item.price,
            event = 'sellItem_' .. index,
            arrow = true
        })
    end

    lib.registerContext({
        id = 'Katanas/Knivesmenu',
        title = 'Katanas/Knives Menu',
        options = options
    })

    lib.showContext('Katanas/Knivesmenu')
end)

for index, item in ipairs(HarryBarry['Katanas/Knives']) do
    RegisterNetEvent('sellItem_' .. index)
    AddEventHandler('sellItem_' .. index, function()
        local options = {
            {title = 'Sell All', event = 'sellItem_all_' .. index},
            {title = 'Sell Quantity', event = 'sellItem_quantity_' .. index}
        }

        lib.registerContext({
            id = 'SellItemContext_' .. index,
            title = 'Select Selling Option',
            options = options
        })

        lib.showContext('SellItemContext_' .. index)
    end)

    RegisterNetEvent('sellItem_all_' .. index)
    AddEventHandler('sellItem_all_' .. index, function()
        TriggerServerEvent('sellItems_' .. index, -1)
    end)

    RegisterNetEvent('sellItem_quantity_' .. index)
    AddEventHandler('sellItem_quantity_' .. index, function()
        local input = lib.inputDialog('Enter quantity to sell', { {type = 'number', name = 'quantity', label = 'Quantity'} })
        if input then
            local quantity = tonumber(input.quantity)
            if quantity and quantity > 0 then
                TriggerServerEvent('sellItems_' .. index, quantity)
            end
        end
    end)
end

RegisterNetEvent('openclicktouseMenu')
AddEventHandler('openclicktouseMenu', function(items)
    local options = {}

    for index, item in ipairs(HarryBarry['Click To Use']) do
        table.insert(options, {
            title = item.label .. " - $" .. item.price,
            event = 'sellItem_' .. index,
            arrow = true
        })
    end

    lib.registerContext({
        id = 'clicktousemenu',
        title = 'Click To Use Menu',
        options = options
    })

    lib.showContext('clicktousemenu')
end)

for index, item in ipairs(HarryBarry['Click To Use']) do
    RegisterNetEvent('sellItem_' .. index)
    AddEventHandler('sellItem_' .. index, function()
        local options = {
            {title = 'Sell All', event = 'sellItem_all_' .. index},
            {title = 'Sell Quantity', event = 'sellItem_quantity_' .. index}
        }

        lib.registerContext({
            id = 'SellItemContext_' .. index,
            title = 'Select Selling Option',
            options = options
        })

        lib.showContext('SellItemContext_' .. index)
    end)

    RegisterNetEvent('sellItem_all_' .. index)
    AddEventHandler('sellItem_all_' .. index, function()
        TriggerServerEvent('sellItems_' .. index, -1)
    end)

    RegisterNetEvent('sellItem_quantity_' .. index)
    AddEventHandler('sellItem_quantity_' .. index, function()
        local input = lib.inputDialog('Enter quantity to sell', { {type = 'number', name = 'quantity', label = 'Quantity'} })
        if input then
            local quantity = tonumber(input.quantity)
            if quantity and quantity > 0 then
                TriggerServerEvent('sellItems_' .. index, quantity)
            end
        end
    end)
end



local ox_target = exports.ox_target

for k, v in pairs(HarryBarry['Coords'].Buyers) do
    ox_target:addSphereZone({
        name = 'House Robbery' ..k,
        coords = v.coords,
        radius = 0.45,
        debug = drawZones,
        options = {
            {
                name = 'satinal',
                event = 'openHouseRobberyMenu',
                label = 'Sell House Items',
                canInteract = function(entity, distance, coords, name)
                    return true
                end
            }
        },
    })
end

for k, v in pairs(HarryBarry['Coords'].Dealers) do
    ox_target:addSphereZone({
        name = 'Katana/Knives' ..k,
        coords = v.coords,
        radius = 0.45,
        debug = drawZones,
        options = {
            {
                name = 'satinal',
                event = 'openKatanas/KnivesMenu',
                label = 'Sell Katanas/Knives',
                canInteract = function(entity, distance, coords, name)
                    return true
                end
            }
        },
    })
end

for k, v in pairs(HarryBarry['Coords'].Purchasers) do
    ox_target:addSphereZone({
        name = 'Click To Use' ..k,
        coords = v.coords,
        radius = 0.45,
        debug = drawZones,
        options = {
            {
                name = 'satinal',
                event = 'openclicktouseMenu',
                label = 'Sell Click To Use',
                canInteract = function(entity, distance, coords, name)
                    return true
                end
            }
        },
    })
end

Citizen.CreateThread(function()
    for k,v in pairs(HarryBarry['Coords'].Buyers) do
        RequestModel(v.npc.ped)
        while not HasModelLoaded(v.npc.ped) do
            Wait(1)
        end
        stanley = CreatePed(1, v.npc.ped, v.npc.x, v.npc.y, v.npc.z - 1, v.npc.h, false, true)
        SetBlockingOfNonTemporaryEvents(stanley, true)
        SetPedDiesWhenInjured(stanley, false)
        SetPedCanPlayAmbientAnims(stanley, true)
        SetPedCanRagdollFromPlayerImpact(stanley, false)
        SetEntityInvincible(stanley, true)
        FreezeEntityPosition(stanley, true)
        TaskStartScenarioInPlace(stanley, v.npc.anim, 0, true);
        
    end

    for k,v in pairs(HarryBarry['Coords'].Dealers) do
        RequestModel(v.npc.ped)
        while not HasModelLoaded(v.npc.ped) do
            Wait(1)
        end
        stanley = CreatePed(1, v.npc.ped, v.npc.x, v.npc.y, v.npc.z - 1, v.npc.h, false, true)
        SetBlockingOfNonTemporaryEvents(stanley, true)
        SetPedDiesWhenInjured(stanley, false)
        SetPedCanPlayAmbientAnims(stanley, true)
        SetPedCanRagdollFromPlayerImpact(stanley, false)
        SetEntityInvincible(stanley, true)
        FreezeEntityPosition(stanley, true)
        TaskStartScenarioInPlace(stanley, v.npc.anim, 0, true);
        
    end

    for k,v in pairs(HarryBarry['Coords'].Purchasers) do
        RequestModel(v.npc.ped)
        while not HasModelLoaded(v.npc.ped) do
            Wait(1)
        end
        stanley = CreatePed(1, v.npc.ped, v.npc.x, v.npc.y, v.npc.z - 1, v.npc.h, false, true)
        SetBlockingOfNonTemporaryEvents(stanley, true)
        SetPedDiesWhenInjured(stanley, false)
        SetPedCanPlayAmbientAnims(stanley, true)
        SetPedCanRagdollFromPlayerImpact(stanley, false)
        SetEntityInvincible(stanley, true)
        FreezeEntityPosition(stanley, true)
        TaskStartScenarioInPlace(stanley, v.npc.anim, 0, true);
        
    end

end)

