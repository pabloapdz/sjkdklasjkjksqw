local config = {
itemid = 12669, -- id certo da trap 12669 
duration = 5, -- duration antes de ser removida
actionid = 13247, -- actionid que sera setado na bomba (pro movements)
effect = 3, -- efeito que sai ao colocar a bomba
msg = "Tomara que funcione" -- mensagem que sai ao ser colocado a bomba
}


local combat = createCombatObject()
setCombatArea(combat, createCombatArea({
	{0, 0, 0, 0, 0},
	{0, 1, 1, 1, 0},
	{0, 1, 2, 1, 0},
	{0, 1, 1, 1, 0},
	{0, 0, 0, 0, 0}
}))

function onTargetTile(cid, position)
	items = doCreateItem(config.itemid, 1, position)
	setItemAid(items, config.actionid)
	doItemSetAttribute(items, 'ref', getCreatureName(cid))
	--doSendMagicEffect(position, config.effect)

	addEvent(function()
		local thing = getTileItemById(position, config.itemid).uid
		if(thing ~= 0) then
			doRemoveItem(thing)
		end
	end, config.duration * 1000)
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
	local waittime = 3 -- Tempo de exhaustion
	local storage = 100089

	if exhaustion.check(cid, storage) then
	doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
	return false
	end
	doCombat(cid, combat, var)
	doCreatureSay(cid, config.msg, 20)
	return true
end

--[[

function removeTrap(pos, id)
local item = getTileItemById(pos, id)
	if item.uid > 0 then
		doRemoveItem(item.uid)
	end
return true
end

local function onAtivateSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end



function onCastSpell(cid, var)
	local position = getCreaturePosition(cid)
	--local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
	--local position2 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
	--local position3 = {x=getPlayerPosition(cid).x-1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}

	--local position4 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y-1, z=getPlayerPosition(cid).z}
	--local position5 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y-1, z=getPlayerPosition(cid).z}
	--local position6 = {x=getPlayerPosition(cid).x-1, y=getPlayerPosition(cid).y-1, z=getPlayerPosition(cid).z}

	--local position7 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
	--local position8 = {x=getPlayerPosition(cid).x-1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}

	local pos = {

	 pos1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z},  
	 pos2 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z},  
	 pos3 = {x=getPlayerPosition(cid).x-1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z},  
	 pos4 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y-1, z=getPlayerPosition(cid).z},  
	 pos5 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y-1, z=getPlayerPosition(cid).z},
	 pos6 = {x=getPlayerPosition(cid).x-1, y=getPlayerPosition(cid).y-1, z=getPlayerPosition(cid).z},
	 pos7 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z},
	 pos8 = {x=getPlayerPosition(cid).x-1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z},

	}

	local item1 = doCreateItem(config.itemid, 1, pos.pos1)
	local item2 = doCreateItem(config.itemid, 1, pos.pos2)
	local item3 = doCreateItem(config.itemid, 1, pos.pos3)
	local item4 = doCreateItem(config.itemid, 1, pos.pos4)
	local item5 = doCreateItem(config.itemid, 1, pos.pos5)
	local item6 = doCreateItem(config.itemid, 1, pos.pos6)
	local item7 = doCreateItem(config.itemid, 1, pos.pos7)
	local item8 = doCreateItem(config.itemid, 1, pos.pos8)


	--local item1 = doCreateItem(config.itemid, 1, position1)
	--local item2 = doCreateItem(config.itemid, 1, position2)
	--local item3 = doCreateItem(config.itemid, 1, position3)
	--local item4 = doCreateItem(config.itemid, 1, position4)
	--local item5 = doCreateItem(config.itemid, 1, position5)
	--local item6 = doCreateItem(config.itemid, 1, position6)
	--local item7 = doCreateItem(config.itemid, 1, position7)
	--local item8 = doCreateItem(config.itemid, 1, position8)

	setItemAid(item1, config.actionid)
	setItemAid(item2, config.actionid)
	setItemAid(item3, config.actionid)
	setItemAid(item4, config.actionid)
	setItemAid(item5, config.actionid)
	setItemAid(item6, config.actionid)
	setItemAid(item7, config.actionid)
	setItemAid(item8, config.actionid)

	doItemSetAttribute(item1, 'ref', getCreatureName(cid))
	doItemSetAttribute(item2, 'ref', getCreatureName(cid))
	doItemSetAttribute(item3, 'ref', getCreatureName(cid))
	doItemSetAttribute(item4, 'ref', getCreatureName(cid))
	doItemSetAttribute(item5, 'ref', getCreatureName(cid))
	doItemSetAttribute(item6, 'ref', getCreatureName(cid))
	doItemSetAttribute(item7, 'ref', getCreatureName(cid))
	doItemSetAttribute(item8, 'ref', getCreatureName(cid))

	doCreatureSay(cid, config.msg, 20)
	doSendMagicEffect(position, config.effect)
	addEvent(removeTrap, config.duration * 1000, position1, config.itemid)	
	addEvent(removeTrap, config.duration * 1000, position2, config.itemid)	
	addEvent(removeTrap, config.duration * 1000, position3, config.itemid)	
	addEvent(removeTrap, config.duration * 1000, position4, config.itemid)	
	addEvent(removeTrap, config.duration * 1000, position5, config.itemid)	
	addEvent(removeTrap, config.duration * 1000, position6, config.itemid)	
	addEvent(removeTrap, config.duration * 1000, position7, config.itemid)	
	addEvent(removeTrap, config.duration * 1000, position8, config.itemid)	

return true
end

]]--