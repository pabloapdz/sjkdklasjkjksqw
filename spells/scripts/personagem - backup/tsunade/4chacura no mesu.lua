local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 504)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -200, -1.0, -250)
 
local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell4(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

 
function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 100012

local parameters = { cid = cid, var = var}
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(onCastSpell1, 100, parameters)
addEvent(doSendMagicEffect, 100, {x = poz.x+1, y = poz.y+1, z = poz.z}, 506)
addEvent(onCastSpell2, 300, parameters)
addEvent(doSendMagicEffect, 300, {x = poz.x+1, y = poz.y+1, z = poz.z}, 506)
addEvent(onCastSpell3, 600, parameters)
addEvent(doSendMagicEffect, 600, {x = poz.x+1, y = poz.y+1, z = poz.z}, 506)
addEvent(onCastSpell4, 900, parameters)
addEvent(doSendMagicEffect, 900, {x = poz.x+1, y = poz.y+1, z = poz.z}, 506)
exhaustion.set(cid, storage, waittime)
return true
end 