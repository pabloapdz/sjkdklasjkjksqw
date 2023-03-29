local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 1022)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.75, -435, -1.75, -500)

arr = {
	{3}
}


local area = createCombatArea(arr)
setCombatArea(combat, area)
 
local function onCastSpell1(parameters)
return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end


function onCastSpell(cid, var)

local position = getPlayerPosition(cid)
local parameters = { cid = cid, var = var}
--doCreatureSay(cid, "Futon Shinku Taigyoku", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell1, 500, parameters)
addEvent(onCastSpell1, 700, parameters)
addEvent(onCastSpell1, 900, parameters)
addEvent(onCastSpell1, 1200, parameters)
return TRUE
end