local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9.0, -1050, -10.0, -1250)

arr1 = {
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 1, 0, 0, 0},
	{0, 0, 0, 3, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

local function onCastSpell1(cid, target)
doCreatureSetNoMove(cid, true)
end
 
local function onCastSpell2(cid, target)
doCreatureSetNoMove(cid, false)
end

function onCastSpell(cid, var)
if isPlayer(cid) and exhaustion.check(cid, 13895) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

	local hits = 6
	local time = 150
	local p = getCreaturePosition(cid)
	local x = {
		[0] = {x=p.x+3, y=p.y-1, z=p.z},
		[1] = {x=p.x+8, y=p.y, z=p.z},
		[2] = {x=p.x+3, y=p.y+7, z=p.z},
		[3] = {x=p.x-1, y=p.y, z=p.z}
	}
	local y = {
		[0] = 1081, -- /\
		[1] = 1082, -- >
		[2] = 1080, -- \/
		[3] = 1083  -- <
	}
	pos = x[getCreatureLookDirection(cid)]
	eff = y[getCreatureLookDirection(cid)]
	
	for i = 1, hits do
		addEvent(doSendMagicEffect, time * i ,pos, eff)
		addEvent(doCombat, time * i, cid, combat1, var)
                addEvent(onCastSpell1, 0, cid, target)
                addEvent(onCastSpell2, 100, cid, target) --- 1 segundo para voltar a andar
	end
	--doCreatureSay(cid, "Katon Kairyudan no Jutsu", TALKTYPE_MONSTER)
	return true
end