local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 8)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9.0, -2, -9.0, -2)


local combat2 = createCombatObject()
--setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 1232)
--setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)


local combat3 = createCombatObject()
--setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 10)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 1500)
setConditionParam(condition, CONDITION_PARAM_SPEED, -1250)
setConditionFormula(condition, -0.2, 0, -0.2, 0)
setCombatCondition(combat3, condition)


area = {{0,	1,	1,	1,	1,	0,	1,	1,	0,	1,	0},
		{1,	0,	0,	0,	1,	1,	0,	0,	1,	1,	0},
		{1,	1,	1,	0,	0,	0,	1,	1,	0,	1,	0},
		{1,	1,	1,	0,	1,	1,	1,	1,	1,	1,	1},
		{0,	0,	1,	1,	0,	3,	1,	1,	0,	1,	1},
		{0,	0,	0,	0,	0,	0,	1,	0,	0,	1,	1},
		{1,	0,	0,	0,	0,	1,	1,	0,	0,	0,	0},
		{1,	1,	0,	1,	1,	1,	0,	1,	1,	1,	0},
		{0,	0,	0,	0,	0,	0,	1,	0,	1,	1,	1},

}

area_full = {{1, 1,	1,	1,	1,	1,	1,	1,	1,	1,	1},
			 {1, 1,	1,	1,	1,	1,	1,	1,	1,	1,	1},
			 {1, 1,	1,	1,	1,	1,	1,	1,	1,	1,	1},
			 {1, 1,	1,	1,	1,	1,	1,	1,	1,	1,	1},
			 {1, 1,	1,	1,	1,	2,	1,	1,	1,	1,	1},
			 {1, 1,	1,	1,	1,	1,	1,	1,	1,	1,	1},
			 {1, 1,	1,	1,	1,	1,	1,	1,	1,	1,	1},
			 {1, 1,	1,	1,	1,	1,	1,	1,	1,	1,	1},
			 {1, 1,	1,	1,	1,	1,	1,	1,	1,	1,	1},
			 {1, 1,	1,	1,	1,	1,	1,	1,	1,	1,	1},
}



local area1 = createCombatArea(area)
setCombatArea(combat1, area1)
setCombatArea(combat2, area1)

local area2 = createCombatArea(area_full)
setCombatArea(combat3, area2)


local function onCastSpell0(parameters)
	doCreatureSetNoMove(parameters.cid, true)
    return doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell1(parameters)
	--doCreatureSetNoMove(parameters.cid, true)
    return doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell2(parameters)
	doCreatureSetNoMove(parameters.cid, false)
    return doCombat(parameters.cid, combat1, parameters.var)
end


function onCastSpell(cid, var)
--local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
--doSendMagicEffect(position1, 29) 
local parameters = { cid = cid, var = var}
addEvent(onCastSpell0, 1, parameters)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 1500, parameters)
--return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
--return doCombat(cid, combat1, var)
return true
end
