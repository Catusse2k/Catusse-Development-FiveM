Config = {}

-- 📌 Posizioni dei tavoli da crafting (legali e illegali)
Config.CraftingTables = {
    { coords = vector3(487.32, -997.06, 30.69), heading = 180.0, type = 'legal' },
    { coords = vector3(482.64, -995.27, 30.69), heading = 90.0, type = 'illegal' },
}

-- 📌 Ricette di crafting
Config.CraftingRecipes = {
    legal = {
        ["advanced_lockpick"] = {
            level = 2,
            time = 5,
            ingredients = {
                { item = "metalscrap", amount = 2 },
                { item = "plastic", amount = 1 },
            }
        },
        ["armor"] = {
            level = 0,
            time = 8,
            ingredients = {
                { item = "steel", amount = 3 },
                { item = "rubber", amount = 2 },
            }
        },
        ["weapon_pistol"] = {
            level = 5,
            time = 10,
            ingredients = {
                { item = "metalscrap", amount = 5 },
                { item = "plastic", amount = 3 },
            }
        },
        ["weapon_combatpistol"] = {
            level = 0,
            time = 12,
            ingredients = {
                { item = "metalscrap", amount = 6 },
                { item = "plastic", amount = 4 },
            }
        },
        ["weapon_carbinerifle"] = {
            level = 7,
            time = 15,
            ingredients = {
                { item = "metalscrap", amount = 8 },
                { item = "plastic", amount = 5 },
            }
        },
        ["weapon_smg"] = {
            level = 7,
            time = 14,
            ingredients = {
                { item = "metalscrap", amount = 7 },
                { item = "plastic", amount = 4 },
            }
        },
    },
    illegal = {
        ["weapon_pistol"] = {
            level = 5,
            time = 10,
            ingredients = {
                { item = "metalscrap", amount = 5 },
                { item = "plastic", amount = 3 },
            }
        },
        ["weapon_combatpistol"] = {
            level = 6,
            time = 12,
            ingredients = {
                { item = "metalscrap", amount = 6 },
                { item = "plastic", amount = 4 },
            }
        },
        ["weapon_carbinerifle"] = {
            level = 7,
            time = 15,
            ingredients = {
                { item = "metalscrap", amount = 8 },
                { item = "plastic", amount = 5 },
            }
        },
        ["weapon_assaultrifle"] = {
            level = 8,
            time = 18,
            ingredients = {
                { item = "metalscrap", amount = 10 },
                { item = "plastic", amount = 6 },
            }
        },
        ["weapon_smg"] = {
            level = 7,
            time = 14,
            ingredients = {
                { item = "metalscrap", amount = 7 },
                { item = "plastic", amount = 4 },
            }
        },
        ["cocaine"] = {
            level = 5,
            time = 10,
            ingredients = {
                { item = "coca_leaf", amount = 5 },
                { item = "chemicals", amount = 2 },
            }
        },
        ["meth"] = {
            level = 6,
            time = 12,
            ingredients = {
                { item = "ephedrine", amount = 4 },
                { item = "chemicals", amount = 3 },
            }
        }
    }
}

-- 📌 Sistema XP e progressione crafting
Config.XPRequired = {
    ["pistol"] = 50,
    ["combatpistol"] = 75,
    ["carbine"] = 100,
    ["assaultrifle"] = 125,
    ["smg"] = 90,
    ["cocaine"] = 60,
    ["meth"] = 80
}

-- 📌 Colore UI ox_lib
Config.UIColor = "#D4A017" -- Giallo ocra

return Config
