local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, -2.0, -400, -2.0, -500)

local function onCastSpell1(cid, var)
local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 62)
return doCombat(cid, combat1, var)
end
 
function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 100005
for k = 1, 2 do
    addEvent(function()
        if isCreature(cid) then
            addEvent(onCastSpell1, 1, cid, var)
        end
    end, 1 + ((k-1) * 500))
end
exhaustion.set(cid, storage, waittime)
return true
end