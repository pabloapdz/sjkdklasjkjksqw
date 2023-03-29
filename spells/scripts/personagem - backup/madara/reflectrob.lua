local config = { 
storage = 318210, -- storage que salva o tempo da spell
storagecol = 3482101, -- storage que salva o tempo entre 1 uso e outro
cooldown = 185, -- tempo de um uso e outro
duration = 5, -- tempo que a spell dura
effect1 = 12 --- efeito que sai qnd usa a spell
} 


function onCastSpell(cid, var)
if getPlayerStorageValue(cid, config.storage) - os.time() > 0  then
doPlayerSendCancel(cid, "Voc� est� protegido pela Gunbai !")
return false
end
if os.time() - getPlayerStorageValue(cid, config.storagecol) >= config.cooldown then
	setPlayerStorageValue(cid, config.storagecol, os.time())
	doSendMagicEffect(getCreaturePosition(cid), config.effect1)
	setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
	doPlayerSendTextMessage(cid, 27, "Voc� ativou o modo Reflect Gunbai e nos pr�ximos ".. config.duration.." segundos refletir� danos.")
else
	doPlayerSendCancel(cid, "Voc� est� cansado, precisa aguardar "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, config.storagecol))).." segundos.")
return false
end
return true
end