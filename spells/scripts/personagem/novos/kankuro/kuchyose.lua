function onCastSpell(cid, var)
local waittime = 60 -- Tempo de exhaustion
local storage = 8321

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local config = {
[1] = {x=getCreaturePosition(cid).x ,y=getCreaturePosition(cid).y ,z=getCreaturePosition(cid).z},
[2] = {x=getCreaturePosition(cid).x ,y=getCreaturePosition(cid).y+1 ,z=getCreaturePosition(cid).z},
[3] = {x=getCreaturePosition(cid).x+1 ,y=getCreaturePosition(cid).y+1 ,z=getCreaturePosition(cid).z},
[4] = {x=getCreaturePosition(cid).x+2 ,y=getCreaturePosition(cid).y+1 ,z=getCreaturePosition(cid).z},
[5] = {x=getCreaturePosition(cid).x+2 ,y=getCreaturePosition(cid).y ,z=getCreaturePosition(cid).z},
[6] = {x=getCreaturePosition(cid).x+2 ,y=getCreaturePosition(cid).y-1 ,z=getCreaturePosition(cid).z},
[7] = {x=getCreaturePosition(cid).x+1 ,y=getCreaturePosition(cid).y-1 ,z=getCreaturePosition(cid).z},
[8] = {x=getCreaturePosition(cid).x ,y=getCreaturePosition(cid).y-1 ,z=getCreaturePosition(cid).z},
[9] = {x=getCreaturePosition(cid).x+1 ,y=getCreaturePosition(cid).y ,z=getCreaturePosition(cid).z},
}

local from1,to1 = {x=962, y=885, z=7},{x=973, y=892, z=7}
local from2,to2 = {x=979, y=901, z=7},{x=991, y=905, z=7}

local pos = getCreaturePosition(cid)
local MaximoSummon = 1
local summons = getCreatureSummons(cid)

if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) then
doPlayerSendCancel(cid, "Você não pode usar Summons Aqui!")
return FALSE
end

if(table.maxn(summons) < MaximoSummon) then
local sumon1 = doCreateMonster("karasuu", pos)
local sumon2 = doCreateMonster("kuroarii", pos)
local sumon3 = doCreateMonster("sanshouoo", pos)
--doCreatureSay(cid, "Kuchyose Kugutsu no Jutsu", TALKTYPE_MONSTER)
doConvinceCreature(cid, sumon1)
doConvinceCreature(cid, sumon2)
doConvinceCreature(cid, sumon3)
for i=1, #config do
doSendMagicEffect(config[i], 54)
exhaustion.set(cid, storage, waittime)
end
return TRUE
end
end