local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -9.0, -1050, -10.0, -1250)

arr = {
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 3, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

local function onCastSpell1(parameters)
return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)

local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x+1, y=p.y, z=p.z},
[1] = {x=p.x+2, y=p.y+1, z=p.z},
[2] = {x=p.x+1, y=p.y+2, z=p.z},
[3] = {x=p.x, y=p.y+1, z=p.z}
}
local y = {
[0] = 1110, -- /\
[1] = 1111, -- >
[2] = 1112, -- \/
[3] = 1113  -- <
}

pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]

doSendMagicEffect(pos, eff)
--doCreatureSay(cid, "Saigo Asa Kujaku", TALKTYPE_MONSTER)

local position = getPlayerPosition(cid)
local parameters = { cid = cid, var = var}

addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell1, 500, parameters)
return TRUE
end