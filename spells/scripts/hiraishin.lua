local config = {
	storageID = 49609,
	mark_time = 15,
	effectWhenTeleport = 82, -- Efeito ao teleportar
	effectWhenUsed = 152,
}

local errorMsg = {
	pz = "Seu alvo nao pode estar fora do PZ.",
	playerOnly = "Voce so pode usar este jutsu em players.",
	alreadyMarked = "Voce ja marcou um jogador.",
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
--setCombatParam(combat, COMBAT_PARAM_EFFECT, 152)
--setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function onCastSpell(cid, var)
	local waittime = 30 -- Tempo de exhaustion
	local storage =100226

	if exhaustion.check(cid, storage) then
		doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
		return false
	end

	if isPlayer(getCreatureTarget(cid)) then
		if getPlayerStorageValue (cid, config.storageID) <= 0 then
			setPlayerStorageValue(cid, config.storageID, 1)
			doPlayerSendTextMessage(cid,22, "Voce marcou o player ".. getCreatureName(getCreatureTarget(cid)))
			target = getCreatureTarget(cid)
			local pos = getCreaturePosition(target)
			doSendMagicEffect({x = pos.x+1, y = pos.y+1, z = pos.z}, 152)
			--doSendMagicEffect(getPlayerPosition(target), 152)
			local struct = {
				left = config.mark_time, 
				player = cid,
				target = target,
				var = var
			}
			addEvent(teleportIsTrue, 1000, struct)
		else
			doSendMagicEffect(getPlayerPosition(cid), 2)
			doPlayerSendCancel(cid, errorMsg.alreadyMarked)
			return false
		end
	else
		doSendMagicEffect(getPlayerPosition(cid), 2)
		doPlayerSendCancel(cid, errorMsg.playerOnly)
		return false	
	end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
end

function teleportIsTrue (struct)
	if struct.left ~= 0 then
		if getPlayerStorageValue (struct.player, config.storageID) == 2 then
			doTeleportThing(struct.player, getThingPosition(struct.target), true)
			setPlayerStorageValue(struct.player, config.storageID, 0)
			local poz = getCreaturePosition(target)
			--doSendMagicEffect(getPlayerPosition(struct.player), config.effectWhenTeleport)
			doSendMagicEffect({x = poz.x+1, y = poz.y+1, z = poz.z}, config.effectWhenTeleport)
			doPlayerSendTextMessage(struct.player,22, "Voce perdeu sua marcacao.")
			return TRUE
		end
		doPlayerSendTextMessage(struct.player,22, struct.left .. " segundos restantes.")
		struct.left = struct.left - 1
		addEvent (teleportIsTrue, 1000, struct)
	elseif struct.left == 0 then
		doPlayerSendTextMessage(struct.player,22, "Voce perdeu sua marcacao.")
		setPlayerStorageValue(struct.player, config.storageID, 0)
	else
		return FALSE
	end
end