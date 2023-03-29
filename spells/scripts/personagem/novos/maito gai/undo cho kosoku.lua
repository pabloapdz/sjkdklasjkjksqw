-- dash as it was in avaOT by Night Wolf
local config = { 
storage = 21580,
cooldown = 10 --- tempo entre um uso e outro
} 

local damage = 0 -- dano que toma qnd bate em algum obstáculo
local speed = 999 -- velocidade do player ao usar o dash (vai de 0 a mil)
local pzprotect = true -- nao deixa entrar em pz com a spell
local distance = 10 -- quantos sqms anda
local invisible = createConditionObject(CONDITION_GAMEMASTER, -1, false, GAMEMASTER_INVISIBLE)
local outfit = createConditionObject(CONDITION_INVISIBLE, -1, false)
setConditionParam(invisible, CONDITION_PARAM_TICKS, 100)
setConditionParam(outfit, CONDITION_PARAM_TICKS, 100)

local function isWalkable(pos, creature, proj, pz)-- by Nord
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
    if getTileInfo(pos).protection and pz then return false, true end
    local n = not proj and 3 or 2
    for i = 0, 3000 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end
    return true
end  

function onWalk2(cid)
    if isCreature(cid) then
        local poslook = getCreatureLookPosition(cid)
        poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
        if isWalkable(poslook, false, false, pzprotect) then
            if not isCreature(getThingfromPos(poslook).uid) then
                doMoveCreature(cid, getPlayerLookDirection(cid))
                local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x, y=p.y, z=p.z},
[1] = {x=p.x, y=p.y, z=p.z},
[2] = {x=p.x, y=p.y, z=p.z},
[3] = {x=p.x, y=p.y, z=p.z}
}
local y = {
[0] = 1119, -- para cima
[1] = 1117, -- para direita
[2] = 1120, -- baixo
[3] = 1118 -- esquerda
}
pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]
doSendMagicEffect(pos, eff)
        end
    end

end
return true
end

function onCastSpell(cid, var)  

  if os.time() - getPlayerStorageValue(cid, 21580) >= config.cooldown then
setPlayerStorageValue(cid, 21580, os.time())

		--doCreatureSay(cid, "Undo Cho Kosoku", TALKTYPE_MONSTER)
else
doPlayerSendCancel(cid, "Undo Cho Kosoku esta em cooldown, sera possivel usa-lo novamente em "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 21580))).." segundos.")
return false
end
  
    for i = 0, distance do
        addEvent(onWalk2, (1001- math.min(speed, 1000)) *i, cid)
    end
    doAddCondition(cid, invisible)
doAddCondition(cid, outfit)
doSendMagicEffect(getCreaturePos(cid), 0)
return true
end