local QBCore = exports['qb-core']:GetCoreObject()



RegisterNetEvent('openSellPed1Menu')
AddEventHandler('openSellPed1Menu', function(items)
    local options = {}

    for index, item in ipairs(HarryBarry['SellPed1']) do
        table.insert(options, {
            title = item.label .. " - $" .. item.price,
            event = 'sellItem_' .. index,
            arrow = true
        })
    end

    lib.registerContext({
        id = 'SellPed1menu',
        title = ' Sell Items Menu 1', -- Change It to what ever you want to be displayed in the menu at the top
        options = options
    })

    lib.showContext('SellPed1menu')
end)

for index, item in ipairs(HarryBarry['SellPed1']) do
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

RegisterNetEvent('openSellPed2Menu')
AddEventHandler('openSellPed2Menu', function(items)
    local options = {}

    for index, item in ipairs(HarryBarry['SellPed2']) do
        table.insert(options, {
            title = item.label .. " - $" .. item.price,
            event = 'sellItem_' .. index,
            arrow = true
        })
    end

    lib.registerContext({
        id = 'SellPed2menu',
        title = 'Sell Items Menu 2', -- Change It to what ever you want to be displayed in the menu at the top
        options = options
    })

    lib.showContext('SellPed2menu')
end)

for index, item in ipairs(HarryBarry['SellPed2']) do
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

RegisterNetEvent('openSellPed3Menu')
AddEventHandler('openSellPed3Menu', function(items)
    local options = {}

    for index, item in ipairs(HarryBarry['SellPed3']) do
        table.insert(options, {
            title = item.label .. " - $" .. item.price,
            event = 'sellItem_' .. index,
            arrow = true
        })
    end

    lib.registerContext({
        id = 'SellPed3menu',
        title = ' Sell Items Menu 3', -- Change It to what ever you want to be displayed in the menu at the top
        options = options
    })

    lib.showContext('SellPed3menu')
end)

for index, item in ipairs(HarryBarry['SellPed3']) do
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

for k, v in pairs(HarryBarry['Coords'].SellPed1) do
    ox_target:addSphereZone({
        name = 'SellPed1' ..k,
        coords = v.coords,
        radius = 0.45,
        debug = drawZones,
        options = {
            {
                name = 'satinal',
                event = 'openSellPed1Menu',
                label = 'Sell Items 1', --Change it too what you would like it too display when you interact with it (Third Eye)
                canInteract = function(entity, distance, coords, name)
                    return true
                end
            }
        },
    })
end

for k, v in pairs(HarryBarry['Coords'].SellPed2) do
    ox_target:addSphereZone({
        name = 'SellPed2' ..k,
        coords = v.coords,
        radius = 0.45,
        debug = drawZones,
        options = {
            {
                name = 'satinal',
                event = 'openSellPed2Menu',
                label = 'Sell Items 2', --Change it too what you would like it too display when you interact with it (Third Eye) 
                canInteract = function(entity, distance, coords, name)
                    return true
                end
            }
        },
    })
end

for k, v in pairs(HarryBarry['Coords'].SellPed3) do
    ox_target:addSphereZone({
        name = 'SellPed3' ..k,
        coords = v.coords,
        radius = 0.45,
        debug = drawZones,
        options = {
            {
                name = 'satinal',
                event = 'openSellPed3Menu',
                label = 'Sell Items 3', --Change it too what you would like it too display when you interact with it (Third Eye)
                canInteract = function(entity, distance, coords, name)
                    return true
                end
            }
        },
    })
end

Citizen.CreateThread(function()
    for k,v in pairs(HarryBarry['Coords'].SellPed1) do
        RequestModel(v.npc.ped)
        while not HasModelLoaded(v.npc.ped) do
            Wait(1)
        end
        HarryBarry2 = CreatePed(1, v.npc.ped, v.npc.x, v.npc.y, v.npc.z - 1, v.npc.h, false, true)
        SetBlockingOfNonTemporaryEvents(HarryBarry2, true)
        SetPedDiesWhenInjured(HarryBarry2, false)
        SetPedCanPlayAmbientAnims(HarryBarry2, true)
        SetPedCanRagdollFromPlayerImpact(HarryBarry2, false)
        SetEntityInvincible(HarryBarry2, true)
        FreezeEntityPosition(HarryBarry2, true)
        TaskStartScenarioInPlace(HarryBarry2, v.npc.anim, 0, true);
        
    end

    for k,v in pairs(HarryBarry['Coords'].SellPed2) do
        RequestModel(v.npc.ped)
        while not HasModelLoaded(v.npc.ped) do
            Wait(1)
        end
        HarryBarry3 = CreatePed(1, v.npc.ped, v.npc.x, v.npc.y, v.npc.z - 1, v.npc.h, false, true)
        SetBlockingOfNonTemporaryEvents(HarryBarry3, true)
        SetPedDiesWhenInjured(HarryBarry3, false)
        SetPedCanPlayAmbientAnims(HarryBarry3, true)
        SetPedCanRagdollFromPlayerImpact(HarryBarry3, false)
        SetEntityInvincible(HarryBarry3, true)
        FreezeEntityPosition(HarryBarry3, true)
        TaskStartScenarioInPlace(HarryBarry3, v.npc.anim, 0, true);
        
    end

    for k,v in pairs(HarryBarry['Coords'].SellPed3) do
        RequestModel(v.npc.ped)
        while not HasModelLoaded(v.npc.ped) do
            Wait(1)
        end
        HarryBarry4 = CreatePed(1, v.npc.ped, v.npc.x, v.npc.y, v.npc.z - 1, v.npc.h, false, true)
        SetBlockingOfNonTemporaryEvents(HarryBarry4, true)
        SetPedDiesWhenInjured(HarryBarry4, false)
        SetPedCanPlayAmbientAnims(HarryBarry4, true)
        SetPedCanRagdollFromPlayerImpact(HarryBarry4, false)
        SetEntityInvincible(HarryBarry4, true)
        FreezeEntityPosition(HarryBarry4, true)
        TaskStartScenarioInPlace(HarryBarry4, v.npc.anim, 0, true);
        
    end

end)

