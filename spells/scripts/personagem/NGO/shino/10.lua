local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -30, -16150, -45, -20000)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x+3, y=getCreaturePosition(target).y+3, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 912)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -85.5, -6650, -104.5, -8550)

local function onCastSpell2(parameters, target)
    if not isPlayer(parameters.cid) then return true end
    if not isCreature(target) then return true end

    return doCombat(parameters.cid, parameters.combat2, parameters.var)

end

function onCastSpell(cid, var)
    local waittime = 4 -- Tempo de exhaustion
    local storage = 100098
    local chanceMana = 100
    local manaPercent = 5

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end

    local target = getCreatureTarget(cid)
    local mana = 0
    local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
    addEvent(onCastSpell1, 1, parameters, target)
    addEvent(onCastSpell2, 500, parameters, target)

    if (math.random(1,100) > (100 - chanceMana)) then
        mana = (getCreatureMaxMana(cid)*(manaPercent/100))
    end

    if isPlayer(target) then
        doPlayerAddMana(cid, mana)
        doPlayerSendTextMessage(cid, 23, "Você sugou ".. tostring(mana).." de mana do "..getCreatureName(target)..".")
    end

    exhaustion.set(cid, storage, waittime)
    --doCreatureSay(cid, "Hijutsu Mushiude", TALKTYPE_MONSTER)
    return true
end