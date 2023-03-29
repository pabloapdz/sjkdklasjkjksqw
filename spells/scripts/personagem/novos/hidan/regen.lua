function onCastSpell(cid, var)
	local waittime = 60 -- Tempo de exhaustion
	local storage = 333312

	if exhaustion.check(cid, storage) then
	doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
	return false
	end


	setPlayerStorageValue(cid, storage, os.time () + waittime)  -- 5 = 5 segundos
	local playerpos = getCreaturePosition(cid)
	local target = getCreatureTarget(cid)
	local trapos = getCreaturePosition(target)
	local level = getPlayerLevel(cid)

	local quanto_bate = 10000 --1500
	local quanto_cura = 80000 --3000

	--levelz = math.random(numero1, numero2)

	doCreatureAddHealth(target, -quanto_bate)
	doSendAnimatedText(trapos, quanto_bate, COLOR_PURPLE)
	doCreatureAddHealth(cid, quanto_cura)
	doSendAnimatedText(playerpos, quanto_cura, COLOR_PURPLE)

	addEvent(doSendDistanceShoot, 1, trapos, playerpos, 132)
	addEvent(doSendMagicEffect, 1, playerpos, 5)
	--doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde "..exhaustion.get(cid, storage).. " segundos para usar o jutsu novamente.")
	--doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
	return true
end