local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -20, -7000, -24, -9000)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2500)
setConditionParam(condition, CONDITION_PARAM_SPEED, -500)
setConditionFormula(condition, -0.2, 0, -0.2, 0)
setCombatCondition(combat1, condition)


local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
--doSendMagicEffect(position1, 688)
return doCombat(cid, combat1, var)
end
 

function onCastSpell(cid, var)
    local waittime = 3 -- Tempo de exhaustion
    local storage = 100035

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end

    local pos_caster = getCreaturePosition(cid)
    local pos_target = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}

    addEvent(doSendMagicEffect, 1, {x = pos_target.x, y = pos_target.y, z = pos_target.z}, 691)
    addEvent(onCastSpell1, 1, cid, var)
    exhaustion.set(cid, storage, waittime)
    return true
end



