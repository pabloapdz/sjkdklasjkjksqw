local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
--setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9.0, -1400, -9.0, -1600)


local area = createCombatArea( AREA_CIRCLE3X3, AREA_CIRCLE3X3)
setCombatArea(combat1, area)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
    local waittime = 3 -- Tempo de exhaustion
    local storage = 100022

        if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
        return false
        end
        local parameters = { cid = cid, var = var}
        local poz = getCreaturePosition(cid) -- effeito no caster

        addEvent(doSendMagicEffect, 25, {x = poz.x+3, y = poz.y+2, z = poz.z}, 303)
        addEvent(onCastSpell1, 500, parameters)
        exhaustion.set(cid, storage, waittime)
        return true

end 