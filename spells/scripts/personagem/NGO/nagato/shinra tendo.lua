local function doPushCreature(target, cid)
    if target > 0 then
   if not isNpc(target) then
   local position = getThingPosition(cid)
   local fromPosition = getThingPosition(target)
   local x = ((fromPosition.x - position.x) < 0 and -1 or ((fromPosition.x - position.x) == 0 and 0 or 1))
   local y = ((fromPosition.y - position.y) < 0 and -1 or ((fromPosition.y - position.y) == 0 and 0 or 1))
   local toPosition = {x = fromPosition.x + x, y = fromPosition.y + y, z = fromPosition.z}
   if doTileQueryAdd(target, toPosition) == 0 then
   doTeleportThing(target, toPosition, true)
   end
   end
    end
end
local spell = {}
spell.config = {
    [3] = {
   damageType = 1,
   areaEffect = 0,
   area = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 3, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
   }   
    },
    [2] = {
   damageType = 1,
   areaEffect = 0,
   area = {
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 1, 0, 0, 0, 1, 0},
   {0, 1, 0, 3, 0, 1, 0},
   {0, 1, 0, 0, 0, 1, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 0, 0, 0, 0, 0}
   }   
    },
    [1] = {
   damageType = 1,
   areaEffect = 0,
   area = {
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 1, 2, 1, 0, 0},
   {0, 0, 1, 1, 1, 0, 0},
   {0, 0, 0, 0, 0, 0, 0},
   {0, 0, 0, 0, 0, 0, 0}
   }   
    }
}
  
spell.combats = {}
for _, config in ipairs(spell.config) do
    local combat = createCombatObject()
    setCombatParam(combat, COMBAT_PARAM_TYPE, config.damageType)
    setCombatParam(combat, COMBAT_PARAM_EFFECT, config.position07)
    setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -4, -400, -6, -700)
    function onTargetCreature(cid, target)
   doPushCreature(target, cid)
    end
    setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
    setCombatArea(combat, createCombatArea(config.area))
    table.insert(spell.combats, combat)


end

function onCastSpell(cid, var)
local waittime = 1.5
local storage = 100036

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
return false
end

--doCreatureSay(cid, "Shinra Tensei", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
    for n = 1, #spell.combats do
   addEvent(doCombat, (n * 120), cid, spell.combats[n], var)
   local position07 = {x=getPlayerPosition(cid).x+4, y=getPlayerPosition(cid).y+2, z=getPlayerPosition(cid).z}
    doSendMagicEffect(position07, 888)
    end
    return true
end