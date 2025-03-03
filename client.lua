local QBCore = exports['qb-core']:GetCoreObject()
local inCraftingZone = false

-- 📌 Aggiunta dei target per i tavoli di crafting
CreateThread(function()
    for _, v in pairs(Config.CraftingTables) do
        exports['qb-target']:AddBoxZone("crafting_table_" .. v.type, v.coords, 1.5, 1.5, {
            name = "crafting_table_" .. v.type,
            heading = v.heading,
            debugPoly = false,
            minZ = v.coords.z - 1,
            maxZ = v.coords.z + 1
        }, {
            options = {
                {
                    type = "client",
                    event = "crafting:openMenu",
                    icon = "fas fa-hammer",
                    label = "Apri Tavolo di Crafting",
                    craftType = v.type
                }
            },
            distance = 2.0
        })
    end
end)

-- 📌 Apertura del menu crafting
RegisterNetEvent('crafting:openMenu', function(data)
    local craftType = data.craftType

    if not craftType or not Config.CraftingRecipes[craftType] then
        print("❌ ERRORE: Tipo di crafting non valido!", craftType)
        return
    end

    local craftingItems = Config.CraftingRecipes[craftType]

    local menu = {
        id = "crafting_menu",
        title = "Tavolo di Crafting - " .. (craftType == "legal" and "Legale" or "Illegale"),
        options = {}
    }

    for item, recipe in pairs(craftingItems) do
        if QBCore.Shared.Items[item] then
            menu.options[#menu.options + 1] = {
                title = QBCore.Shared.Items[item].label or "Sconosciuto",
                description = "Tempo: " .. recipe.time .. "s | XP: " .. (Config.XPRequired[item] or 0),
                icon = "nui://qb-inventory/html/images/" .. item .. ".png",
                event = "crafting:startCraft",
                args = { item = item, recipe = recipe, craftType = craftType }
            }
        else
            print("⚠️ ERRORE: Item non trovato in QBCore.Shared.Items -> " .. tostring(item))
        end
    end

    exports.ox_lib:registerContext(menu)
    exports.ox_lib:showContext("crafting_menu")
end)

-- 📌 Avvio del crafting
RegisterNetEvent('crafting:startCraft', function(data)
    local item = data.item
    local recipe = data.recipe
    local craftType = data.craftType

    QBCore.Functions.TriggerCallback('crafting:checkIngredients', function(hasIngredients)
        if hasIngredients then
            QBCore.Functions.Progressbar("crafting_item", "Crafting in corso...", recipe.time * 1000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_ped",
                flags = 49
            }, {}, {}, function()
                TriggerServerEvent('crafting:finishCraft', item, craftType)
            end, function()
                QBCore.Functions.Notify("Crafting annullato", "error")
            end)
        else
            QBCore.Functions.Notify("Materiali insufficienti!", "error")
        end
    end, recipe.ingredients)
end)