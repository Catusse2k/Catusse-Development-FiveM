
-- cliccando sul link vi ritroverete direttamente alla pagina dove potete trovare id delle icone e dei colori https://docs.fivem.net/docs/game-references/blips/
-- per creare un blips segui la stringa in verde qui sotto cambiando nome/id blips/colore e coordinate e inserisci quelle dove ti serve il blips in mappa (vector3)

--         ||
--         ||
--         \/


	local blips = {
 --    Modello da seguire inserendo le coordinate vector3 {title= "Nome blip", colour= 0, id= 1, x = 1.0, y = 1.03, z = 1.0},
     {title= "Centrale di Polizia", colour= 3, id= 60, x = 381.09, y = -1593.12, z = 30.05}, -- Esempio
  }
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	    BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

-- By Catusse2k