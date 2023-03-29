local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2.0, -400, -2.0, -600)

arr1 = {
    {3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat, area1)

local function onCastSpell1(cid, var)
    if (not isCreature(variantToNumber(var))) then return true end
    local targetPosition = getCreaturePosition(variantToNumber(var))
    local position = {x = targetPosition.x, y = targetPosition.y, z = targetPosition.z}
    doSendMagicEffect(position, 501)
    return doCombat(cid, combat, var)
end

function onCastSpell(cid, var)
    local parameters = { cid = cid, var = var}
    addEvent(onCastSpell1, 100, cid, var)
    addEvent(onCastSpell1, 300, cid, var)
    addEvent(onCastSpell1, 500, cid, var)
   return true
end