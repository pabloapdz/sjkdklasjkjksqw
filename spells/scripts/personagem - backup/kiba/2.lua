function formulaByWeaponDmg(cid, level, skill, attack, factor)
min = -(1.2 * (1 * (skill + 150) / 25 + (level - 1) / 10) / factor)
max = -(2 * (2 * (skill + 200) / 25 + (level - 1) / 10) / factor)
return min, max
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTWHITE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, -200, -2.0, -300)

local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 400)
return doCombat(cid, combat1, var)
end
 
function onCastSpell(cid, var)
for k = 1, 2 do
    addEvent(function()
        if isCreature(cid) then
            addEvent(onCastSpell1, 1, cid, var)
        end
    end, 1 + ((k-1) * 500))
end
return true
end