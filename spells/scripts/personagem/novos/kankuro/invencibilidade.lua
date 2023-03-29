local config = { 
storage = 91811,
cooldown = 60,  --- tempo entre um uso e outro
duration = 10, --- duração
effect1 = 0 -- efeito que sai ao falar a spell
} 

local function effect01(position1)
doSendMagicEffect(position1, 920) -- Pause
end

local function effect02(position2)
doSendMagicEffect(position2, 919) -- Effect
end

local function effect03(position3)
doSendMagicEffect(position3, 921) -- Broken
end

local function onCastSpell1(cid, target)
doCreatureSetNoMove(cid, true)
end
 
local function onCastSpell2(cid, target)
doCreatureSetNoMove(cid, false)
end

function onCastSpell(cid, var)
local from1 = {x=1964, y=731, z=7}
local to1 = {x=1976, y=742, z=7}
local from2 = {x=979, y=911, z=7}
local to2 = {x=994, y=918, z=7}
local from3 = {x=1964, y=731, z=7}
local to3 = {x=1976, y=742, z=7}
local from4 = {x=1019, y=921, z=5}
local to4 = {x=1033, y=924, z=5}
local from5 = {x=663, y=1098, z=7}
local to5 = {x=685, y=1104, z=7}
local from6 = {x=965, y=1483, z=7}
local to6 = {x=979, y=1494, z=7}
local from7 = {x=1161, y=1177, z=7}
local to7 = {x=1167, y=1188, z=7}
local from8 = {x=984, y=578, z=7} -- shinobi war
local to8 = {x=1044, y=652, z=7} -- shinobi war
local from9 = {x=1243, y=725, z=6} -- Kamui no Jutsu
local to9 = {x=1255, y=738, z=6} -- Kamui no Jutsu
local from10 = {x=1902, y=733, z=7} -- Kokuangyou no Jutsu
local to10 = {x=1906, y=737, z=7} -- Kokuangyou no Jutsu
local from11 = {x=1963, y=729, z=7} -- Tsukuyomi World
local to11 = {x=1977, y=743, z=7} -- Tsukuyomi World
local from12 =  {x=1684, y=735, z=7} -- Dai Kamui
local to12 = {x=1686, y=737, z=7} -- Dai Kamui
local from13 =  {x=1732, y=737, z=7} -- Mangekyo Kamui Me
local to13 = {x=1734, y=739, z=7} -- Mangekyo Kamui Me
local from14 =  {x=1841, y=737, z=7} -- Dai Kamui In
local to14 = {x=1843, y=739, z=7} -- Dai Kamui In
local from15 =  {x=2038, y=736, z=6} -- Kotoamatsukami
local to15 = {x=2042, y=740, z=6} -- Kotoamatsukami

if isInRange(getCreaturePosition(cid), from1, to1, from2, to2, from3, to3, from4, to4, from5, to5, from6, to6, from7, to7, from8, to8, from9, to9, from10, to10, from11, to11, from12, to12, from13, to13, from14, to14, from15, to15) then
   doPlayerSendTextMessage(cid, 27, "voce nao pode usar Kurohigi Kiki Sanpatsu aqui!")
   return doSendMagicEffect(getCreaturePosition(cid), 2)
end

      local position1 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y, z=getThingPosition(cid).z, config.duration * 1000, false}
      local position2 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y, z=getThingPosition(cid).z, config.duration * 1000, false}
      local position3 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y, z=getThingPosition(cid).z, config.duration * 1000, false}

  if os.time() - getPlayerStorageValue(cid, 55690) >= config.cooldown then
setPlayerStorageValue(cid, 55690, os.time())
doSendMagicEffect(getThingPosition(cid), config.effect1)
setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
--doCreatureSay(cid,"Kurohigi Kiki Sanpatsu", 19)
addEvent(effect02, 100, position2)
addEvent(effect01, 300, position1)
addEvent(effect01, 600, position1)
addEvent(effect01, 900, position1)
addEvent(effect01, 1100, position1)
addEvent(effect01, 1300, position1)
addEvent(effect01, 1600, position1)
addEvent(effect01, 1900, position1)
addEvent(effect01, 2100, position1)
addEvent(effect01, 2300, position1)
addEvent(effect01, 2600, position1)
addEvent(effect01, 2900, position1)
addEvent(effect01, 3100, position1)
addEvent(effect01, 3300, position1)
addEvent(effect01, 3600, position1)
addEvent(effect01, 3900, position1)
addEvent(effect01, 4100, position1)
addEvent(effect01, 4300, position1)
addEvent(effect01, 4600, position1)
addEvent(effect01, 4900, position1)
addEvent(effect01, 5100, position1)
addEvent(effect01, 5300, position1)
addEvent(effect01, 5600, position1)
addEvent(effect01, 5900, position1)
addEvent(effect01, 6100, position1)
addEvent(effect01, 6300, position1)
addEvent(effect01, 6600, position1)
addEvent(effect01, 6900, position1)
addEvent(effect01, 7100, position1)
addEvent(effect01, 7300, position1)
addEvent(effect01, 7600, position1)
addEvent(effect01, 7900, position1)
addEvent(effect01, 8100, position1)
addEvent(effect01, 8300, position1)
addEvent(effect01, 8600, position1)
addEvent(effect01, 8900, position1)
addEvent(effect01, 9200, position1)
addEvent(effect03, 9800, position3)
addEvent(onCastSpell1, 0, cid, target)
addEvent(onCastSpell2, 10000, cid, target) --- 1 segundo para voltar a andar
doPlayerSendTextMessage(cid, 27, "Voce tem agora ".. config.duration .." segundos de invulnerabilidade.")
else
doPlayerSendCancel(cid, "Sua habilidade esta em cooldown, voce deve esperar "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55690))).." segundos.")
return false
end  
    return true
end