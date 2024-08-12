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
        TriggerClientEvent('ox_lib:notify', player, { type = 'success', description = ' '..HarryBarry['Locales']['solditem']..' '..count..' '..itemLabel..' ' })
    else
        TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..HarryBarry['Locales']['noitemtosell']..' ' })
    end
end

-- House Robbery items
for index, item in ipairs(HarryBarry['House_Robbery']) do
    RegisterServerEvent('sellItems_' .. index)
    AddEventHandler('sellItems_' .. index, function(count)
        local player = source
        local itemIndex = index
        if not HarryBarry['House_Robbery'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..HarryBarry['Locales']['invaliditem']..' ' })
            return
        end
        local itemName = HarryBarry['House_Robbery'][itemIndex].name
        local itemLabel = HarryBarry['House_Robbery'][itemIndex].label
        local itemPrice = HarryBarry['House_Robbery'][itemIndex].price

        sellItem(itemIndex, itemName, count, itemPrice, itemLabel, player)
    end)
end

-- Katanas/Knives items
for index, item in ipairs(HarryBarry['Katanas/Knives']) do
    RegisterServerEvent('sellItems_' .. index)
    AddEventHandler('sellItems_' .. index, function(count)
        local player = source
        local itemIndex = index
        if not HarryBarry['Katanas/Knives'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..HarryBarry['Locales']['invaliditem']..' ' })
            return
        end
        local itemName = HarryBarry['Katanas/Knives'][itemIndex].name
        local itemLabel = HarryBarry['Katanas/Knives'][itemIndex].label
        local itemPrice = HarryBarry['Katanas/Knives'][itemIndex].price

        sellItem(itemIndex, itemName, count, itemPrice, itemLabel, player)
    end)
end

-- Click To Use items
for index, item in ipairs(HarryBarry['Click To Use']) do
    RegisterServerEvent('sellItems_' .. index)
    AddEventHandler('sellItems_' .. index, function(count)
        local player = source
        local itemIndex = index
        if not HarryBarry['Click To Use'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..HarryBarry['Locales']['invaliditem']..' ' })
            return
        end
        local itemName = HarryBarry['Click To Use'][itemIndex].name
        local itemLabel = HarryBarry['Click To Use'][itemIndex].label
        local itemPrice = HarryBarry['Click To Use'][itemIndex].price

        sellItem(itemIndex, itemName, count, itemPrice, itemLabel, player)
    end)
end
