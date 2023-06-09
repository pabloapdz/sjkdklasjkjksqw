local remove_time = 5 -- tempo em segundos para remover as magic wall
local item_id = 5750 -- id da magic wall

function isWalkable(pos, creature, pz, proj)
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
	local creature = getTopCreature(pos)
    if creature.type > 0 then	return false end
	if getTilePzInfo(pos) and not pz then return false end
	local n = not proj and 3 or 2
	for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
	end
return true
end

function removeItem(posAll)
	for i=1, #posAll do
		for j=0, 255 do
			pos_stack = {x=posAll[i].x,y=posAll[i].y,z=posAll[i].z,stackpos=j}
			removeTile = getThingfromPos(pos_stack)
			if removeTile.itemid == item_id then
				doRemoveItem(removeTile.uid)
			end
		end
	end
end

function onCastSpell(cid, var)



local waittime = 3 -- Tempo de exhaustion em segundos
local storage = 5853 -- Storage de Spell, nunca usar a mesma em outra spell, a menos que não queira usar duas spell juntas!

if exhaustion.check(cid, storage) then
doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
return false
end

local pos = getThingPos(getCreatureTarget(cid))
posTile1 = {x=pos.x+1,y=pos.y+1,z=pos.z,stackpos=1}
posTile2 = {x=pos.x+1,y=pos.y,z=pos.z,stackpos=1}
posTile3 = {x=pos.x+1,y=pos.y-1,z=pos.z,stackpos=1}
posTile4 = {x=pos.x,y=pos.y-1,z=pos.z,stackpos=1}
posTile5 = {x=pos.x-1,y=pos.y-1,z=pos.z,stackpos=1}
posTile6 = {x=pos.x-1,y=pos.y,z=pos.z,stackpos=1}
posTile7 = {x=pos.x-1,y=pos.y+1,z=pos.z,stackpos=1}
posTile8 = {x=pos.x,y=pos.y+1,z=pos.z,stackpos=1}
posAll = {posTile1,posTile2,posTile3,posTile4,posTile5,posTile6,posTile7,posTile8}

for i=1, #posAll do
	if isWalkable(posAll[i]) then
		doCreateItem(item_id, 1, posAll[i])
	end
end 
addEvent(removeItem, remove_time*1000, posAll)
exhaustion.set(cid, storage, waittime)

return true
end