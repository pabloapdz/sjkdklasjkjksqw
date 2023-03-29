local config = {
pos = {x=1733, y=738, z=7},
tempo = 0,
effect1 = 108, 
effect2 = 108, 
storage = 19333
}
 
function onStatsChange(cid, attacker, type, combat, value) 
if type == STATSCHANGE_HEALTHLOSS and value >= getCreatureHealth(cid) then 
if getPlayerStorageValue(cid, config.storage) > 0 then 
doPlayerSetStorageValue(cid, config.storage, (getPlayerStorageValue(cid, config.storage)-1)) 
addEvent(doTeleportThing, 1000*config.tempo, cid, getThingPos(cid), true) 
addEvent(doSendMagicEffect, 1000*config.tempo, getThingPos(cid), config.effect2) 
doSendMagicEffect(getThingPos(cid), config.effect1) 
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid)) 
doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid)) 
doTeleportThing(cid, config.pos) 
if isCreature(attacker) then 
doPlayerSendTextMessage(cid, 27, "Voce perdeu um dos 6x Olhos de Izanagi.")
end
for i = 1,config.tempo  do
addEvent(function()
if isCreature(cid) then
doPlayerSendTextMessage(cid,25,"")
end
end, 1000*i)
end
return false 
end 
end 
return true 
end