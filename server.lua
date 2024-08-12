local QBCore = exports['qb-core']:GetCoreObject()

-- Function to handle item selling
local function sellItem(itemIndex, itemName, count, itemPrice, itemLabel, player)
    local xPlayer = QBCore.Functions.GetPlayer(player)

    if not xPlayer then
        TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = 'Player not found' })
        return
    end

    if count == -1 then -- Selling all items
        count = xPlayer.Functions.GetItemByName(itemName).count
    end

    if xPlayer.Functions.GetItemByName(itemName).count >= count then
        xPlayer.Functions.RemoveItem(itemName, count)
        xPlayer.Functions.AddMoney('cash', itemPrice * count, "Dealer Payment")
        TriggerClientEvent('ox_lib:notify', player, { type = 'success', description = ' '..config['Locales']['solditem']..' '..count..' '..itemLabel..' ' })
    else
        TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..config['Locales']['noitemtosell']..' ' })
    end
end

-- House Robbery items
for index, item in ipairs(config['House_Robbery']) do
    RegisterServerEvent('sellItems_' .. index)
    AddEventHandler('sellItems_' .. index, function(count)
        local player = source
        local itemIndex = index
        if not config['House_Robbery'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..config['Locales']['invaliditem']..' ' })
            return
        end
        local itemName = config['House_Robbery'][itemIndex].name
        local itemLabel = config['House_Robbery'][itemIndex].label
        local itemPrice = config['House_Robbery'][itemIndex].price

        sellItem(itemIndex, itemName, count, itemPrice, itemLabel, player)
    end)
end

-- Katanas/Knives items
for index, item in ipairs(config['Katanas/Knives']) do
    RegisterServerEvent('sellItems_' .. index)
    AddEventHandler('sellItems_' .. index, function(count)
        local player = source
        local itemIndex = index
        if not config['Katanas/Knives'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..config['Locales']['invaliditem']..' ' })
            return
        end
        local itemName = config['Katanas/Knives'][itemIndex].name
        local itemLabel = config['Katanas/Knives'][itemIndex].label
        local itemPrice = config['Katanas/Knives'][itemIndex].price

        sellItem(itemIndex, itemName, count, itemPrice, itemLabel, player)
    end)
end

-- Click To Use items
for index, item in ipairs(config['Click To Use']) do
    RegisterServerEvent('sellItems_' .. index)
    AddEventHandler('sellItems_' .. index, function(count)
        local player = source
        local itemIndex = index
        if not config['Click To Use'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..config['Locales']['invaliditem']..' ' })
            return
        end
        local itemName = config['Click To Use'][itemIndex].name
        local itemLabel = config['Click To Use'][itemIndex].label
        local itemPrice = config['Click To Use'][itemIndex].price

        sellItem(itemIndex, itemName, count, itemPrice, itemLabel, player)
    end)
end
