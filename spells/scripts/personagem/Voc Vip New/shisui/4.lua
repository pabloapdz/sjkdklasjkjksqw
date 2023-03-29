local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_PURPLE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2.5, -435, -2.5, -800)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1008)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

function onCastSpell(cid, var)
local position = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1 }
addEvent(onCastSpell1, 200, parameters, target)
addEvent(doSendDistanceShoot, 1, position, getCreaturePosition(getCreatureTarget(cid)), 169)
--doCreatureSay(cid, "Katon Dragon no Endan", TALKTYPE_MONSTER)
return true
end

