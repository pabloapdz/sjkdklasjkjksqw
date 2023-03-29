local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1750, -6.0, -2225)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x, y=getCreaturePosition(target).y + 1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 867)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 3 -- Tempo de exhaustion
local storage = 8234

if exhaustion.check(cid, storage) then
doPlayerSendTextMessage(cid,"info", "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
return false
end

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1 }
addEvent(onCastSpell1, 1, parameters, target)
addEvent(onCastSpell1, 400, parameters, target)
addEvent(onCastSpell1, 800, parameters, target)
addEvent(onCastSpell1, 1200, parameters, target)
-- doCreatureSay(cid, "Senpo Mokuton Daichi Myakudo", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
return TRUE
end