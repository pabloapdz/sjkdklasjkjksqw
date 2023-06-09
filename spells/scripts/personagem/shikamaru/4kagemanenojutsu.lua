local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_GREY) 
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -7.0, -2000, -9.0, -2500)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -3400)
setConditionFormula(condition, -0.2, 0, -0.2, 0)
setCombatCondition(combat1, condition)

arr1 = {
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 3, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

function onCastSpell(cid, var)

local waittime = 2 -- Tempo de exhaustion
local storage = 8032

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end

local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x, y=p.y-1, z=p.z},
[1] = {x=p.x+4, y=p.y, z=p.z},
[2] = {x=p.x, y=p.y+4, z=p.z},
[3] = {x=p.x-1, y=p.y, z=p.z}
}
local y = {
[0] = 204,
[1] = 201,
[2] = 203,
[3] = 202
}
pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]
doSendMagicEffect(pos, eff)
doCreatureSay(cid, "Kagemane no Jutsu", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
doCombat(cid, combat1, var)
end