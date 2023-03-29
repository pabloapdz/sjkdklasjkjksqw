local config = {
	storageID = 49609,
	mark_time = 6,
}

function onCastSpell(cid, var)
	local waittime = 2 -- Tempo de exhaustion
	local storage =100225

	if exhaustion.check(cid, storage) then
		doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
		return false
	end

	--local target = getThingFromPosition(variantToPosition(var), 1)
	local canto1 = {x = 488, y = 90, z = 3} -- Canto superior esquerdo do local
	local canto2 = {x = 616, y = 294, z = 10} -- Canto inferior direito do local
	if isInRange(getCreaturePosition(cid), canto1, canto2) then
		return doPlayerSendTextMessage(cid, 27, "Você não pode usar essa spell no castle.")
	end

	
	if getPlayerStorageValue (cid, config.storageID) == 1 then
		setPlayerStorageValue(cid, config.storageID, 2)
	else
		doPlayerSendTextMessage(cid,22, "Voce nao marcou nenhum jogador.")
		return false
	end
	exhaustion.set(cid, storage, waittime)  
	return true
end