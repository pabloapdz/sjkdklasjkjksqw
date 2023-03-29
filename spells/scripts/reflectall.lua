local config = { 
storage = 318210, -- storage que salva o tempo da spell
storagecol = 3482101, -- storage que salva o tempo entre 1 uso e outro
cooldown = 120, -- tempo de um uso e outro
duration = 5, -- tempo que a spell dura
effect1 = 12 --- efeito que sai qnd usa a spell
} 


function onCastSpell(cid, var)
		local storage = config.storagecol

		if exhaustion.check(cid, storage) then
		doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, config.storagecol) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
		return false
		end
			if getPlayerStorageValue(cid, config.storage) - os.time() > 0  then
				doPlayerSendCancel(cid, "Você esta refletindo !")
			return false
			end
			if os.time() - getPlayerStorageValue(cid, config.storagecol) >= config.cooldown then
				setPlayerStorageValue(cid, config.storagecol, os.time())
				doSendMagicEffect(getCreaturePosition(cid), config.effect1)
				setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
				doPlayerSendTextMessage(cid, 27, "Você ativou o modo Reflect e nos próximos ".. config.duration.." segundos refletirá danos.")
			else
				doPlayerSendCancel(cid, "Você está cansado, precisa aguardar "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, config.storagecol))).." segundos.")
				return false
			end	

		exhaustion.set(cid, storage, config.cooldown)
 
	return true
end