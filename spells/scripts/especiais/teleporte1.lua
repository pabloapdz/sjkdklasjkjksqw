local config = {
pos1 = {x = 249, y = 151, z = 8}, -- pos que o caster da spell vai ir
key = 14567, -- storage que salvara a pos (Note que esse e os proximos 2 storages seguintes serao utilizados)
effect = 82, -- efeito ao ser teleportado
storagecol = 14566, -- storage que salva o cooldown
cooldown = 225, -- tempo entre 1 uso e outro
msgligada = true, -- true/false para ligar/desligar o envio de msg.
msg = "KAMUI IN", -- msg a ser enviada ao dizer a spell
from = {x=207, y=127, z=5}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to = {x=300, y=178, z=10}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)  
from1 = {x=781, y=853, z=6}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to1 = {x=891, y=953, z=8}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)  
from2 = {x = 488, y = 90, z = 3}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to2 = {x = 616, y = 294, z = 10},
time = 10
}

function onCastSpell(cid, var)	
	local pos = getCreaturePosition(cid)
	local target = getCreatureTarget(cid)
	local targetpos = getCreaturePosition(target)

	if isInRange(getCreaturePosition(cid), config.from, config.to) then
		doPlayerSendCancel(cid, "Você não pode usar Kamui dentro do Kamui")
		doSendMagicEffect(getCreaturePosition(cid), 2)
	return false
	end
	if isInRange(getCreaturePosition(cid), config.from1, config.to1) then
		doPlayerSendCancel(cid, "Você não pode usar esse jutsu aqui.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
	return false
	end
	if isInRange(getCreaturePosition(cid), config.from2, config.to2) then
		doPlayerSendCancel(cid, "Você não pode usar esse jutsu no Castle War.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
	return false
	end
	if getPlayerStorageValue(cid, config.storagecol) - os.time() <= 0 then
		setPlayerStorageValue(cid, config.storagecol, os.time() + config.cooldown)
		if config.msgligada then
			doCreatureSay(cid, config.msg, 20)
		end
		savePos(cid, config.key)
		addEvent(doSendMagicEffect, 1, getCreaturePosition(cid), config.effect)
		doTeleportThing(cid, config.pos1, true)
	else
		doPlayerSendCancel(cid, "Jutsu em cooldown.")
		doSendMagicEffect(getCreaturePosition(cid), 2)
	return false
	end

	local function Teleport_Player(cid)
	doTeleportThing(cid, pos)
	end

	local function Teleport_Target(target)
	doTeleportThing(target, targetpos)
	end

	addEvent(Teleport_Player, config.time*1000, cid)
	addEvent(Teleport_Target, config.time*1000, target)
	
return true
end