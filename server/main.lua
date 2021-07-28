ESX  = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

players = {}

RegisterServerEvent("Exa_Zombiesnewplayer")
AddEventHandler("Exa_Zombiesnewplayer", function(id)
    players[source] = id
    TriggerClientEvent("Exa_Zombiesplayerupdate", -1, players)
end)

AddEventHandler("playerDropped", function(reason)
    players[source] = nil
    TriggerClientEvent("Exa_Zombiesclear", source)
    TriggerClientEvent("Exa_Zombiesplayerupdate", -1, players)
end)

AddEventHandler("onResourceStop", function()
	 TriggerClientEvent("Exa_Zombiesclear", -1)
end)

RegisterServerEvent('Exa_Zombiesmoneyloot')
AddEventHandler('Exa_Zombiesmoneyloot', function()
    local xPlayer = ESX.GetPlayerFromId(source)
	local random = math.random(50, 500)
    xPlayer.addMoney(random)
    TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~g~$' .. random .. ' dollars'))
end)

RegisterServerEvent('Exa_Zombiesitemloot')
AddEventHandler('Exa_Zombiesitemloot', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
	local random = math.random(1,2)
    if xPlayer.canCarryItem(item, random) then
        xPlayer.addInventoryItem(item, random)
        TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~y~' .. random .. 'x ~b~' .. item))
    else
        xPlayer.showNotification('You cannot pickup that because your inventory is full!')
    end
end)
RegisterServerEvent('Exa_ZombiesCarsloot')
AddEventHandler('Exa_ZombiesCarsloot', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
	local random = math.random(1,2)
    if xPlayer.canCarryItem(item, random) then
        xPlayer.addInventoryItem(item, random)
        TriggerClientEvent("esx:showNotification", xPlayer.source, ('You found ~y~' .. random .. 'x ~b~' .. Cars))
    else
        xPlayer.showNotification('You cannot pickup that because your inventory is full!')
    end
end)


entitys = {}

RegisterServerEvent("RegisterNewZombie")
AddEventHandler("RegisterNewZombie", function(entity)
	TriggerClientEvent("ZombieSync", -1, entity)
	table.insert(entitys, entity)
end)

-- xp for kills
AddEventHandler("baseevents:onPlayerKilled", function(killer, reason)
    TriggerClientEvent('esx_xp:Add', killer, 250)
end)

RegisterServerEvent('Exa_Zombies:Sound:PlayWithinDistance')
AddEventHandler('Exa_Zombies:Sound:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('Exa_Zombies:Sound:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume)
end)

RegisterServerEvent('Exa_Zombies:PlayOnOne')
AddEventHandler('Exa_Zombies:PlayOnOne', function(clientNetId, soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayOnOne', clientNetId, soundFile, soundVolume)
end)
RegisterServerEvent('Exa_Zombies:PlayOnSource')
AddEventHandler('Exa_Zombies:PlayOnSource', function(soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayOnOne', source, soundFile, soundVolume)
end)
RegisterServerEvent('Exa_Zombies:PlayOnAll')
AddEventHandler('Exa_Zombies:PlayOnAll', function(soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayOnAll', -1, soundFile, soundVolume)
end)

RegisterServerEvent('Exa_Zombies:PlayWithinDistance')
AddEventHandler('Exa_Zombies:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('InteractSound_CL:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume)
end)