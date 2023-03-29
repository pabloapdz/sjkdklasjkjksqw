local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTWHITE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -150, -1.5, -200)

local function onCastSpell1(cid, var)
    local pos = getCreaturePosition(cid)
    local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
    doSendMagicEffect(position1, 400)
    return doCombat(cid, combat1, var)
end
 
function onCastSpell(cid, var)
    local waittime = 0.5 -- Tempo de exhaustion
    local storage = 1100102

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end
    for k = 1, 2 do
        addEvent(function()
            if isCreature(cid) then
                addEvent(onCastSpell1, 1, cid, var)
            end
        end, 1 + ((k-1) * 500))
    end
    exhaustion.set(cid, storage, waittime)
    return true
end