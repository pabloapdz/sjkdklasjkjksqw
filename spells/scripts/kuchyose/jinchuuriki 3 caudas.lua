function onCastSpell(cid, var)

local waittime = 60 -- Tempo de exhaustion
local storage = 110145



print(getMonsterFriendList(cid))
if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
	local poz = getCreaturePosition(cid) -- effeito no caster

	function invocar_summon(cid)
        local maxSummons = 1    
        for n = 1, maxSummons do
                if #getCreatureSummons(cid) >= maxSummons then
                        break
                end
                local clone = doCreateMonster("Sanbi", getThingPos(cid), false)
                if isCreature(clone) then
                        doTeleportThing(clone, getThingPos(cid), false)
                        doConvinceCreature(cid, clone)
                        setCreatureMaxHealth(clone, getCreatureMaxHealth(cid))
                        doCreatureAddHealth(clone, getCreatureHealth(cid))
                        doSendMagicEffect(getThingPos(cid), 111)
                end
        end
		local seconds = 30
		for _, monsters in ipairs(getCreatureSummons(cid)) do
				addEvent(doRemoveCreature, seconds*1000, monsters)
				addEvent(doSendMagicEffect, seconds*1000, {x = poz.x, y = poz.y, z = poz.z}, 111)
		end
	end
	addEvent(doSendMagicEffect, 100, {x = poz.x, y = poz.y, z = poz.z}, 1215)
	addEvent(doSendMagicEffect, 500, {x = poz.x+1, y = poz.y+1, z = poz.z}, 152)
	addEvent(doSendMagicEffect, 700, {x = poz.x+1, y = poz.y+1, z = poz.z}, 111)
	addEvent(invocar_summon, 700, cid)

		
exhaustion.set(cid, storage, waittime)
return true
end




