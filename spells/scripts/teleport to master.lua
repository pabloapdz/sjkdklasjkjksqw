function onCastSpell(cid, var)


 local master = cid:getMaster()

 if master == null then
 return false
 end

 if not  master:isPlayer() then
    return false
end

if(master:getPosition().z ~= cid:getPosition().z) then
  cid:teleportTo(master:getPosition())
  cid:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
  return true
  end

  if(master:getPosition():getDistance(cid:getPosition()) >= 14 ) then
  cid:teleportTo(master:getPosition())
  cid:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
  return true
  end

  return false
end