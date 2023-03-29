local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.25, -875, -4.25, -1125)

local combat2 = createCombatObject()
local condition = createConditionObject(CONDITION_FIRE)
addDamageCondition(condition, 5, 1000, -10000)
setCombatCondition(combat2, condition)

arr1 = {
    {0, 1, 1, 1, 1, 1, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 0, 1, 1, 1, 0, 0},
    {0, 0, 0, 1, 0, 0, 0},
    {0, 0, 0, 3, 0, 0, 0},
    {0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
setCombatArea(combat2, area1)

local function onCastSpell1(cid, target)
doCreatureSetNoMove(cid, true)
end
 
local function onCastSpell2(cid, target)
doCreatureSetNoMove(cid, false)
end


function onCastSpell(cid, var)

local waittime = 2 -- Tempo de exhaustion
local storage = 120125

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

if isPlayer(cid) and exhaustion.check(cid, 13895) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

    local hits = 4
    local time = 200
    local p = getCreaturePosition(cid)
    local x = {
        [0] = {x=p.x+3, y=p.y-1, z=p.z},
        [1] = {x=p.x+8, y=p.y, z=p.z},
        [2] = {x=p.x+3, y=p.y+7, z=p.z},
        [3] = {x=p.x-1, y=p.y, z=p.z}
    }
    local y = {
        [0] = 1081, -- /\
        [1] = 1082, -- >
        [2] = 1080, -- \/
        [3] = 1083  -- <
    }
    pos = x[getCreatureLookDirection(cid)]
    eff = y[getCreatureLookDirection(cid)]
    
    for i = 1, hits do
        addEvent(doSendMagicEffect, time * i ,pos, eff)
        addEvent(doCombat, time * i, cid, combat1, var)
                addEvent(onCastSpell1, 0, cid, target)
                addEvent(onCastSpell2, 1000, cid, target) --- 1 segundo para voltar a andar
    end
    addEvent(doCombat, 2000, cid, combat2, var)

    --doCreatureSay(cid, "Katon Kairyudan no Jutsu", TALKTYPE_MONSTER)
    return true
end