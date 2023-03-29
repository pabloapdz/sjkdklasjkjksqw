function onCastSpell(cid, var)
	local position1 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
	doSendMagicEffect(position1, 826)
	return true
end