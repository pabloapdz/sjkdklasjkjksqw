--[[
Made by Moira (Lurk on TibiaKing)
NÃO REMOVA OS CRÉDITOS
]]--

function onAttack(cid, target)
if getPlayerStorageValue(cid, 234513) > os.time() and isPlayer(target) then
	return doPlayerSendCancel(cid, "Voce esta sob efeito do Genjutsu Kai voce deve esperar".. getPlayerStorageValue(cid, 234513) - os.time() .." segundos para atacar novamente.") and false
end
return true
end