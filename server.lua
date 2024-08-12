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
for index, item in ipairs(HarryBarry['SellPed1']) do
    RegisterServerEvent('sellItems_' .. index)
    AddEventHandler('sellItems_' .. index, function(count)
        local player = source
        local itemIndex = index
        if not HarryBarry['SellPed1'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..HarryBarry['Locales']['invaliditem']..' ' })
            return
        end
        local itemName = HarryBarry['SellPed1'][itemIndex].name
        local itemLabel = HarryBarry['SellPed1'][itemIndex].label
        local itemPrice = HarryBarry['SellPed1'][itemIndex].price

        sellItem(itemIndex, itemName, count, itemPrice, itemLabel, player)
    end)
end

-- Katanas/Knives items
for index, item in ipairs(HarryBarry['SellPed2']) do
    RegisterServerEvent('sellItems_' .. index)
    AddEventHandler('sellItems_' .. index, function(count)
        local player = source
        local itemIndex = index
        if not HarryBarry['SellPed2'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..HarryBarry['Locales']['invaliditem']..' ' })
            return
        end
        local itemName = HarryBarry['SellPed2'][itemIndex].name
        local itemLabel = HarryBarry['SellPed2'][itemIndex].label
        local itemPrice = HarryBarry['SellPed2'][itemIndex].price

        sellItem(itemIndex, itemName, count, itemPrice, itemLabel, player)
    end)
end

-- Click To Use items
for index, item in ipairs(HarryBarry['SellPed3']) do
    RegisterServerEvent('sellItems_' .. index)
    AddEventHandler('sellItems_' .. index, function(count)
        local player = source
        local itemIndex = index
        if not HarryBarry['SellPed3'][itemIndex] then
            TriggerClientEvent('ox_lib:notify', player, { type = 'error', description = ''..HarryBarry['Locales']['invaliditem']..' ' })
            return
        end
        local itemName = HarryBarry['SellPed3'][itemIndex].name
        local itemLabel = HarryBarry['SellPed3'][itemIndex].label
        local itemPrice = HarryBarry['SellPed3'][itemIndex].price

        sellItem(itemIndex, itemName, count, itemPrice, itemLabel, player)
    end)
end
