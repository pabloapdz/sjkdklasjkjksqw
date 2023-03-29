local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -27, -7000, -32, -9000)

local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
--doSendMagicEffect(position1, 688)
return doCombat(cid, combat1, var)
end
 

function onCastSpell(cid, var)
    local waittime = 2 -- Tempo de exhaustion
    local storage = 100035

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end

    local pos_caster = getCreaturePosition(cid)
    local pos_target = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

    addEvent(doSendMagicEffect, 1, {x = pos_target.x, y = pos_target.y+1, z = pos_target.z}, 688)
    addEvent(doSendMagicEffect, 551, {x = pos_target.x-1, y = pos_target.y, z = pos_target.z}, 467)
    addEvent(onCastSpell1, 552, cid, var)
    exhaustion.set(cid, storage, waittime)
    return true
end



