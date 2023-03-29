function onCastSpell(cid, var)

local waittime = 60 -- Tempo de exhaustion
local storage = 100081

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

        local maxSummons = 1    

                local clone = doCreateMonster("Insect", getThingPos(cid), false)
                if isCreature(clone) then       
                        doTeleportThing(clone, getThingPos(cid), false)
                        doConvinceCreature(cid, clone)
                        setCreatureMaxHealth(clone, 200000)
                        doCreatureAddHealth(clone, 200000)
                        --doSetCreatureOutfit(clone, getCreatureOutfit(cid), -1)
                        doSendMagicEffect(getThingPos(cid), 111)
                end

		local poz = getCreaturePosition(cid) -- effeito no caster
		local seconds = 45
		for _, monsters in ipairs(getCreatureSummons(cid)) do
				addEvent(doRemoveCreature, seconds*1000, monsters)
				addEvent(doSendMagicEffect, seconds*1000, {x = poz.x, y = poz.y, z = poz.z}, 111)
		end
		
exhaustion.set(cid, storage, waittime)
return true
end




