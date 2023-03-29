local config = {
pos1 = {x = 1115, y = 1059, z = 11}, -- pos que o caster da spell vai ir
key = 100026, -- storage que salvara a pos (Note que esse e os proximos 2 storages seguintes serao utilizados)
effect = 507, -- efeito ao ser teleportado
storagecol = 100029, -- storage que salva o cooldown
cooldown = 225, -- tempo entre 1 uso e outro
msgligada = true, -- true/false para ligar/desligar o envio de msg.
msg = "Tsukuyomi", -- msg a ser enviada ao dizer a spell
from = {x=1109, y=1055, z=11}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to = {x=1121, y=1064, z=11}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)  
from1 = {x=1109, y=1055, z=11}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to1 = {x=1121, y=1064, z=11}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)  
from2 = {x = 1109, y = 1055, z = 11}, --- quina do kamui (pra impedir players de usarem o kamui dentro do kamui)
to2 = {x = 1121, y = 1064, z = 11},
time = 10
}

function onCastSpell(cid, var)	
	local pos = getCreaturePosition(cid)
	local target = getCreatureTarget(cid)
	local targetpos = getCreaturePosition(target)

	if isInRange(getCreaturePosition(cid), config.from, config.to) then
		doPlayerSendCancel(cid, "Você não pode usar Tsukuyomi dentro do Tsukuyomi")
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
		local pos = getCreaturePosition(target)
		local poz = getCreaturePosition(cid) -- effeito no caster
		addEvent(doSendMagicEffect, 100, {x = pos.x, y = pos.y, z = pos.z}, 84)
		addEvent(doSendMagicEffect, 300, getCreaturePosition(cid), config.effect)
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