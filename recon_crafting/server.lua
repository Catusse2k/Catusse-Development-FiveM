local QBCore = exports['qb-core']:GetCoreObject()

-- 📌 Callback per verificare se il giocatore ha gli ingredienti necessari
QBCore.Functions.CreateCallback('crafting:checkIngredients', function(source, cb, ingredients)
    local Player = QBCore.Functions.GetPlayer(source)
    local hasAllItems = true

    for _, ingredient in pairs(ingredients) do
        local item = Player.Functions.GetItemByName(ingredient.item)
        if not item or item.amount < ingredient.amount then
            hasAllItems = false
            break
        end
    end

    cb(hasAllItems)
end)

-- 📌 Completamento del crafting
RegisterNetEvent('crafting:finishCraft', function(item, craftType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local recipe = Config.CraftingRecipes[craftType][item]

    -- 📌 Controllo ingredienti
    for _, ingredient in pairs(recipe.ingredients) do
        Player.Functions.RemoveItem(ingredient.item, ingredient.amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ingredient.item], "remove")
    end

    -- 📌 Aggiunta oggetto craftato
    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
    
    -- 📌 Aggiunta XP per progressione crafting
    if Config.XPRequired[item] then
        local currentXP = Player.Functions.GetMetaData("crafting_xp") or 0
        Player.Functions.SetMetaData("crafting_xp", currentXP + Config.XPRequired[item])
        TriggerClientEvent('QBCore:Notify', src, "Hai guadagnato XP per il crafting!", "success")
    end

    TriggerClientEvent('QBCore:Notify', src, "Hai craftato con successo: " .. QBCore.Shared.Items[item].label, "success")
end)
