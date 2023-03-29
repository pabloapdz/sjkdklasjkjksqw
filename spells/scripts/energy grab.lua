local config = {
walks = 5, -- qnts passos ele vai dar
delay = 100, -- de qnts em qnts milisegundos ele dá cada passo
speed = 600 -- velocidade que ele vai ficar enquanto estiver sob efeito do taunt
}

local function doPushCreature(target, cid)
    if target > 0 then
   if not isNpc(target) then
   local position = getThingPosition(cid)
   local fromPosition = getThingPosition(target)
   local x = ((fromPosition.x - position.x) < 0 and -1 or ((fromPosition.x - position.x) == 0 and 0 or 1))
   local y = ((fromPosition.y - position.y) < 0 and -1 or ((fromPosition.y - position.y) == 0 and 0 or 1))
   local toPosition = {x = fromPosition.x - x, y = fromPosition.y - y, z = fromPosition.z}
   if doTileQueryAdd(target, toPosition) == 0 then
   doTeleportThing(target, toPosition, true)
   end
   end
    end
end


function onCastSpell(cid, var)
	local itemid = 11322
	local waittime = 180 -- Tempo de exhaustion
	local storage = 6377
	local poz = getCreaturePosition(cid) -- effeito no caster

	if exhaustion.check(cid, storage) then
		doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
		return false
	end
	if getPlayerItemCount(cid, itemid) >= 1 then
		if getPlayerSlotItem(cid, 9).itemid == itemid then
			Taunt(cid, variantToNumber(var), config.delay, config.walks) 
			doChangeSpeed(variantToNumber(var), (config.speed - getCreatureBaseSpeed(variantToNumber(var))))
			addEvent(function() 
					if isCreature(variantToNumber(var)) then
						addEvent(doSendMagicEffect, 100, {x = poz.x+4, y = poz.y, z = poz.z}, 624)
						doChangeSpeed(variantToNumber(var), (-config.speed + getCreatureBaseSpeed(variantToNumber(var))))
					end
				end, config.delay * (config.walks + 1))

			doPushCreature(target, cid)
			exhaustion.set(cid, storage, waittime)
			return true
		else
			doPlayerSendCancel(cid, "Voce precisa estar equipado com o Rinnegan Eye para executar este Jutsu !")
			return false
		end
	else
		doPlayerSendCancel(cid, "Voce precisa de um Rinnegan Eye para executar este Jutsu !")
		return false
	end
end 