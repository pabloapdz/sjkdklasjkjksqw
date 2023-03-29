function onGetFormulaValues(cid, level, maglevel)
	skill = getPlayerSkillLevel(cid, 2)
	local min = -((level*8)+(skill*45.0)+1000)
	local max = -((level*8)+(skill*45.0)+2000)
	print(skill)
	return min, max
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat, CALLBACK_PARAM_LEVELMAGICVALUE, -1.0, -200, -1.0, -200)
--setCombatFormula(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 555)
return doCombat(cid, combat, var)
end