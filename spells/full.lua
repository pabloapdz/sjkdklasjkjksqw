local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 8)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -9.0, -2, -9.0, -2)


local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 1232)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)



local function onCastSpell0(parameters)
	doCreatureSetNoMove(parameters.cid, true)
    return true
end

local function onCastSpell1(parameters)
	--doCreatureSetNoMove(parameters.cid, true)
    return doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell2(parameters)
	doCreatureSetNoMove(parameters.cid, false)
    return doCombat(parameters.cid, combat1,positionToVariant(parameters.pos))
end


function onCastSpell(cid, var)
	math.randomseed(os.time())
	math.random(); math.random(); math.random()
	--asdon1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
	--doSendMagicEffect(position1, 29) 
	--addEvent(onCastSpell0, 1, parameters)
	--addEvent(onCastSpell1, 500, parameters)
	--addEvent(onCastSpell2, 1500, parameters)




	
	-- QUADRADO FECHADO (PLAYER)
	asdon1 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	local parameters = { cid = cid, var = var, pos=asdon1}
	addEvent(onCastSpell2, 1500, parameters)
	asdon2 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon2}
	addEvent(onCastSpell2, 1500, parameters)
	asdon3 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon3}
	addEvent(onCastSpell2, 1500, parameters)
	asdon4 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon4}
	addEvent(onCastSpell2, 1500, parameters)
	asdon5 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon5}
	addEvent(onCastSpell2, 1500, parameters)
	asdon6 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon6}
	addEvent(onCastSpell2, 1500, parameters)
	asdon7 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon7}
	addEvent(onCastSpell2, 1500, parameters)
	asdon8 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon8}
	addEvent(onCastSpell2, 1500, parameters)
	asdon9 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon9}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 1
	asdon10 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon10}
	addEvent(onCastSpell2, 1500, parameters)
	asdon11 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon11}
	addEvent(onCastSpell2, 1500, parameters)
	asdon12 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon12}
	addEvent(onCastSpell2, 1500, parameters)
	asdon13 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon13}
	addEvent(onCastSpell2, 1500, parameters)
	asdon14 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon14}
	addEvent(onCastSpell2, 1500, parameters)
	asdon15 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon15}
	addEvent(onCastSpell2, 1500, parameters)
	asdon16 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon16}
	addEvent(onCastSpell2, 1500, parameters)
	asdon17 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon17}
	addEvent(onCastSpell2, 1500, parameters)
	asdon18 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon18}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 1
	asdon19 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon19}
	addEvent(onCastSpell2, 1500, parameters)
	asdon20 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon20}
	addEvent(onCastSpell2, 1500, parameters)
	asdon21 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon21}
	addEvent(onCastSpell2, 1500, parameters)
	asdon22 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon22}
	addEvent(onCastSpell2, 1500, parameters)
	asdon23 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon23}
	addEvent(onCastSpell2, 1500, parameters)
	asdon24 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon24}
	addEvent(onCastSpell2, 1500, parameters)
	asdon25 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon25}
	addEvent(onCastSpell2, 1500, parameters)
	asdon26 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon26}
	addEvent(onCastSpell2, 1500, parameters)
	asdon27 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon27}
	addEvent(onCastSpell2, 1500, parameters)

		-- TESTE AREA 1
	asdon28 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon28}
	addEvent(onCastSpell2, 1500, parameters)
	asdon29 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon29}
	addEvent(onCastSpell2, 1500, parameters)
	asdon30 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon30}
	addEvent(onCastSpell2, 1500, parameters)
	asdon31 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon31}
	addEvent(onCastSpell2, 1500, parameters)
	asdon32 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon32}
	addEvent(onCastSpell2, 1500, parameters)
	asdon33 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon33}
	addEvent(onCastSpell2, 1500, parameters)
	asdon34 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon34}
	addEvent(onCastSpell2, 1500, parameters)
	asdon35 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon35}
	addEvent(onCastSpell2, 1500, parameters)
	asdon36 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon36}
	addEvent(onCastSpell2, 1500, parameters)


	-- TESTE AREA 2
	asdon37 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon37}
	addEvent(onCastSpell2, 1500, parameters)
	asdon38 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon38}
	addEvent(onCastSpell2, 1500, parameters)
	asdon39 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon39}
	addEvent(onCastSpell2, 1500, parameters)
	asdon40 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon40}
	addEvent(onCastSpell2, 1500, parameters)
	asdon41 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon41}
	addEvent(onCastSpell2, 1500, parameters)
	asdon42 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon42}
	addEvent(onCastSpell2, 1500, parameters)
	asdon43 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon43}
	addEvent(onCastSpell2, 1500, parameters)
	asdon44 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon44}
	addEvent(onCastSpell2, 1500, parameters)
	asdon45 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon45}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 3
	asdon46 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon46}
	addEvent(onCastSpell2, 1500, parameters)
	asdon47 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon47}
	addEvent(onCastSpell2, 1500, parameters)
	asdon48 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon48}
	addEvent(onCastSpell2, 1500, parameters)
	asdon49 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon49}
	addEvent(onCastSpell2, 1500, parameters)
	asdon50 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon50}
	addEvent(onCastSpell2, 1500, parameters)
	asdon51 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon51}
	addEvent(onCastSpell2, 1500, parameters)
	asdon52 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon52}
	addEvent(onCastSpell2, 1500, parameters)
	asdon53 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon53}
	addEvent(onCastSpell2, 1500, parameters)
	asdon54 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon54}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 3
	asdon55 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon55}
	addEvent(onCastSpell2, 1500, parameters)
	asdon56 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon56}
	addEvent(onCastSpell2, 1500, parameters)
	asdon57 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon57}
	addEvent(onCastSpell2, 1500, parameters)
	asdon58 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon58}
	addEvent(onCastSpell2, 1500, parameters)
	asdon59 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon59}
	addEvent(onCastSpell2, 1500, parameters)
	asdon60 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon60}
	addEvent(onCastSpell2, 1500, parameters)
	asdon61 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon61}
	addEvent(onCastSpell2, 1500, parameters)
	asdon62 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon62}
	addEvent(onCastSpell2, 1500, parameters)
	asdon63 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=asdon63}
	addEvent(onCastSpell2, 1500, parameters)



		-- QUADRADO FECHADO (PLAYER)
	Basdion1 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	local parameters = { cid = cid, var = var, pos=Basdion1}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion2 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion2}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion3 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion3}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion4 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion4}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion5 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion5}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion6 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion6}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion7 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion7}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion8 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion8}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion9 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion9}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 1
	Basdion10 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion10}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion11 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion11}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion12 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion12}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion13 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion13}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion14 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion14}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion15 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion15}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion16 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion16}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion17 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion17}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion18 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion18}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 1
	Basdion19 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion19}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion20 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion20}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion21 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion21}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion22 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion22}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion23 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion23}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion24 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion24}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion25 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion25}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion26 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion26}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion27 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion27}
	addEvent(onCastSpell2, 1500, parameters)

		-- TESTE AREA 1
	Basdion28 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion28}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion29 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion29}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion30 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion30}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion31 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion31}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion32 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion32}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion33 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion33}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion34 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion34}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion35 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion35}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion36 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion36}
	addEvent(onCastSpell2, 1500, parameters)


	-- TESTE AREA 2
	Basdion37 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion37}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion38 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion38}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion39 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion39}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion40 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion40}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion41 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion41}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion42 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion42}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion43 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion43}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion44 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion44}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion45 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion45}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 3
	Basdion46 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion46}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion47 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion47}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion48 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion48}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion49 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion49}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion50 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion50}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion51 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion51}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion52 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion52}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion53 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion53}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion54 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion54}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 3
	Basdion55 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion55}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion56 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion56}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion57 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion57}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion58 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion58}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion59 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion59}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion60 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion60}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion61 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y+4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion61}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion62 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y+3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion62}
	addEvent(onCastSpell2, 1500, parameters)
	Basdion63 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y+2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=Basdion63}
	addEvent(onCastSpell2, 1500, parameters)



	-- QUADRADO FECHADO (PLAYER)
	B2asdion1 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	local parameters = { cid = cid, var = var, pos=B2asdion1}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion2 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion2}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion3 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion3}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion4 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion4}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion5 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion5}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion6 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion6}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion7 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion7}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion8 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion8}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion9 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion9}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 1
	B2asdion10 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion10}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion11 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion11}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion12 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion12}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion13 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion13}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion14 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion14}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion15 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion15}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion16 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion16}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion17 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion17}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion18 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion18}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 1
	B2asdion19 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion19}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion20 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion20}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion21 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion21}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion22 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion22}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion23 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion23}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion24 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion24}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion25 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion25}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion26 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion26}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion27 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion27}
	addEvent(onCastSpell2, 1500, parameters)

		-- TESTE AREA 1
	B2asdion28 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion28}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion29 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion29}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion30 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion30}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion31 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion31}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion32 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion32}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion33 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion33}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion34 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion34}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion35 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion35}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion36 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion36}
	addEvent(onCastSpell2, 1500, parameters)


	-- TESTE AREA 2
	B2asdion37 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion37}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion38 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion38}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion39 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion39}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion40 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion40}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion41 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion41}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion42 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion42}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion43 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion43}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion44 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion44}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion45 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion45}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 3
	B2asdion46 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion46}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion47 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion47}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion48 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion48}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion49 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion49}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion50 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion50}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion51 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion51}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion52 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion52}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion53 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion53}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion54 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion54}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 3
	B2asdion55 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion55}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion56 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion56}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion57 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion57}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion58 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion58}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion59 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion59}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion60 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion60}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion61 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y+7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion61}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion62 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y+6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion62}
	addEvent(onCastSpell2, 1500, parameters)
	B2asdion63 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y+5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B2asdion63}
	addEvent(onCastSpell2, 1500, parameters)


	-- QUADRADO FECHADO (PLAYER)
	B3asdion1 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	local parameters = { cid = cid, var = var, pos=B3asdion1}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion2 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion2}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion3 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion3}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion4 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion4}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion5 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion5}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion6 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion6}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion7 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion7}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion8 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion8}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion9 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion9}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 1
	B3asdion10 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion10}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion11 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion11}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion12 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion12}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion13 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion13}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion14 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion14}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion15 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion15}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion16 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion16}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion17 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion17}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion18 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion18}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 1
	B3asdion19 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion19}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion20 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion20}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion21 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion21}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion22 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion22}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion23 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion23}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion24 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion24}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion25 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion25}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion26 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion26}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion27 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion27}
	addEvent(onCastSpell2, 1500, parameters)

		-- TESTE AREA 1
	B3asdion28 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion28}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion29 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion29}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion30 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion30}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion31 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion31}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion32 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion32}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion33 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion33}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion34 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion34}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion35 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion35}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion36 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion36}
	addEvent(onCastSpell2, 1500, parameters)


	-- TESTE AREA 2
	B3asdion37 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion37}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion38 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion38}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion39 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion39}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion40 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion40}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion41 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion41}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion42 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion42}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion43 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion43}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion44 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion44}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion45 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion45}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 3
	B3asdion46 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion46}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion47 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion47}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion48 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion48}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion49 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion49}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion50 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion50}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion51 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion51}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion52 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion52}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion53 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion53}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion54 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion54}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 3
	B3asdion55 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion55}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion56 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion56}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion57 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion57}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion58 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion58}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion59 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion59}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion60 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion60}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion61 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y+10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion61}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion62 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y+9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion62}
	addEvent(onCastSpell2, 1500, parameters)
	B3asdion63 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y+8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=B3asdion63}
	addEvent(onCastSpell2, 1500, parameters)


	----------------- PARA CIMA ---------------------------------
	-- QUADRADO FECHADO (PLAYER)
	C1cbasbionn1 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	local parameters = { cid = cid, var = var, pos=C1cbasbionn1}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn2 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn2}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn3 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn3}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn4 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn4}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn5 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn5}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn6 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn6}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn7 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn7}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn8 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn8}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn9 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn9}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 1
	C1cbasbionn10 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn10}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn11 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn11}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn12 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn12}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn13 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn13}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn14 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn14}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn15 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn15}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn16 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn16}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn17 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn17}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn18 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn18}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 1
	C1cbasbionn19 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn19}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn20 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn20}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn21 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn21}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn22 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn22}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn23 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn23}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn24 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn24}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn25 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn25}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn26 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn26}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn27 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn27}
	addEvent(onCastSpell2, 1500, parameters)

		-- TESTE AREA 1
	C1cbasbionn28 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn28}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn29 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn29}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn30 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn30}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn31 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn31}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn32 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn32}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn33 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn33}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn34 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn34}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn35 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn35}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn36 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn36}
	addEvent(onCastSpell2, 1500, parameters)


	-- TESTE AREA 2
	C1cbasbionn37 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn37}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn38 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn38}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn39 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn39}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn40 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn40}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn41 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn41}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn42 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn42}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn43 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn43}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn44 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn44}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn45 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn45}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 3
	C1cbasbionn46 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn46}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn47 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn47}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn48 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn48}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn49 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn49}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn50 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn50}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn51 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn51}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn52 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn52}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn53 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn53}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn54 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn54}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 3
	C1cbasbionn55 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn55}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn56 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn56}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn57 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn57}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn58 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn58}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn59 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn59}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn60 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn60}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn61 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y-4, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn61}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn62 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y-3, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn62}
	addEvent(onCastSpell2, 1500, parameters)
	C1cbasbionn63 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y-2, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C1cbasbionn63}
	addEvent(onCastSpell2, 1500, parameters)


	--------------------------------------------


		-- QUADRADO FECHADO (PLAYER)
	C2cbasbionn1 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	local parameters = { cid = cid, var = var, pos=C2cbasbionn1}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn2 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn2}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn3 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn3}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn4 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn4}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn5 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn5}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn6 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn6}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn7 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn7}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn8 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn8}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn9 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn9}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 1
	C2cbasbionn10 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn10}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn11 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn11}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn12 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn12}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn13 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn13}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn14 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn14}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn15 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn15}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn16 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn16}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn17 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn17}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn18 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn18}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 1
	C2cbasbionn19 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn19}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn20 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn20}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn21 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn21}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn22 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn22}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn23 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn23}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn24 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn24}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn25 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn25}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn26 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn26}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn27 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn27}
	addEvent(onCastSpell2, 1500, parameters)

		-- TESTE AREA 1
	C2cbasbionn28 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn28}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn29 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn29}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn30 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn30}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn31 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn31}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn32 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn32}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn33 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn33}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn34 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn34}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn35 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn35}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn36 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn36}
	addEvent(onCastSpell2, 1500, parameters)


	-- TESTE AREA 2
	C2cbasbionn37 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn37}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn38 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn38}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn39 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn39}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn40 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn40}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn41 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn41}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn42 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn42}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn43 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn43}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn44 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn44}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn45 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn45}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 3
	C2cbasbionn46 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn46}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn47 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn47}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn48 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn48}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn49 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn49}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn50 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn50}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn51 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn51}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn52 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn52}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn53 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn53}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn54 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn54}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 3
	C2cbasbionn55 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn55}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn56 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn56}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn57 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn57}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn58 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn58}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn59 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn59}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn60 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn60}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn61 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y-7, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn61}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn62 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y-6, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn62}
	addEvent(onCastSpell2, 1500, parameters)
	C2cbasbionn63 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y-5, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C2cbasbionn63}
	addEvent(onCastSpell2, 1500, parameters)

	------------------------------------

		-- QUADRADO FECHADO (PLAYER)
	C3cbasbionn1 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	local parameters = { cid = cid, var = var, pos=C3cbasbionn1}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn2 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn2}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn3 = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn3}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn4 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn4}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn5 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn5}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn6 = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn6}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn7 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn7}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn8 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn8}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn9 = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn9}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 1
	C3cbasbionn10 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn10}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn11 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn11}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn12 = {x=getThingPosition(cid).x+10, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn12}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn13 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn13}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn14 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn14}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn15 = {x=getThingPosition(cid).x+9, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn15}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn16 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn16}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn17 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn17}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn18 = {x=getThingPosition(cid).x+8, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn18}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 1
	C3cbasbionn19 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn19}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn20 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn20}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn21 = {x=getThingPosition(cid).x+7, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn21}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn22 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn22}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn23 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn23}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn24 = {x=getThingPosition(cid).x+6, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn24}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn25 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn25}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn26 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn26}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn27 = {x=getThingPosition(cid).x+5, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn27}
	addEvent(onCastSpell2, 1500, parameters)

		-- TESTE AREA 1
	C3cbasbionn28 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn28}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn29 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn29}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn30 = {x=getThingPosition(cid).x+4, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn30}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn31 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn31}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn32 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn32}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn33 = {x=getThingPosition(cid).x+3, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn33}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn34 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn34}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn35 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn35}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn36 = {x=getThingPosition(cid).x+2, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn36}
	addEvent(onCastSpell2, 1500, parameters)


	-- TESTE AREA 2
	C3cbasbionn37 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn37}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn38 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn38}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn39 = {x=getThingPosition(cid).x-4, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn39}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn40 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn40}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn41 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn41}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn42 = {x=getThingPosition(cid).x-3, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn42}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn43 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn43}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn44 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn44}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn45 = {x=getThingPosition(cid).x-2, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn45}
	addEvent(onCastSpell2, 1500, parameters)



	-- TESTE AREA 3
	C3cbasbionn46 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn46}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn47 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn47}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn48 = {x=getThingPosition(cid).x-7, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn48}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn49 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn49}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn50 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn50}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn51 = {x=getThingPosition(cid).x-6, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn51}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn52 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn52}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn53 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn53}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn54 = {x=getThingPosition(cid).x-5, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn54}
	addEvent(onCastSpell2, 1500, parameters)

	-- TESTE AREA 3
	C3cbasbionn55 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn55}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn56 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn56}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn57 = {x=getThingPosition(cid).x-10, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn57}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn58 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn58}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn59 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn59}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn60 = {x=getThingPosition(cid).x-9, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn60}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn61 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y-10, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn61}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn62 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y-9, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn62}
	addEvent(onCastSpell2, 1500, parameters)
	C3cbasbionn63 = {x=getThingPosition(cid).x-8, y=getThingPosition(cid).y-8, z=getThingPosition(cid).z}
	parameters = { cid = cid, var = var, pos=C3cbasbionn63}
	addEvent(onCastSpell2, 1500, parameters)

doSendMagicEffect(asdon1,1232)
doSendMagicEffect(asdon2,1232)
doSendMagicEffect(asdon3,1232)
doSendMagicEffect(asdon4,1232)
doSendMagicEffect(asdon5,1232)
doSendMagicEffect(asdon6,1232)
doSendMagicEffect(asdon7,1232)
doSendMagicEffect(asdon8,1232)
doSendMagicEffect(asdon9,1232)
doSendMagicEffect(asdon10,1232)
doSendMagicEffect(asdon11,1232)
doSendMagicEffect(asdon12,1232)
doSendMagicEffect(asdon13,1232)
doSendMagicEffect(asdon14,1232)
doSendMagicEffect(asdon15,1232)
doSendMagicEffect(asdon16,1232)
doSendMagicEffect(asdon17,1232)
doSendMagicEffect(asdon18,1232)
doSendMagicEffect(asdon19,1232)
doSendMagicEffect(asdon20,1232)
doSendMagicEffect(asdon21,1232)
doSendMagicEffect(asdon22,1232)
doSendMagicEffect(asdon23,1232)
doSendMagicEffect(asdon24,1232)
doSendMagicEffect(asdon25,1232)
doSendMagicEffect(asdon26,1232)
doSendMagicEffect(asdon27,1232)
doSendMagicEffect(asdon28,1232)
doSendMagicEffect(asdon29,1232)
doSendMagicEffect(asdon30,1232)
doSendMagicEffect(asdon31,1232)
doSendMagicEffect(asdon32,1232)
doSendMagicEffect(asdon33,1232)
doSendMagicEffect(asdon34,1232)
doSendMagicEffect(asdon35,1232)
doSendMagicEffect(asdon36,1232)
doSendMagicEffect(asdon37,1232)
doSendMagicEffect(asdon38,1232)
doSendMagicEffect(asdon39,1232)
doSendMagicEffect(asdon40,1232)
doSendMagicEffect(asdon41,1232)
doSendMagicEffect(asdon42,1232)
doSendMagicEffect(asdon43,1232)
doSendMagicEffect(asdon44,1232)
doSendMagicEffect(asdon45,1232)
doSendMagicEffect(asdon46,1232)
doSendMagicEffect(asdon47,1232)
doSendMagicEffect(asdon48,1232)
doSendMagicEffect(asdon49,1232)
doSendMagicEffect(asdon50,1232)
doSendMagicEffect(asdon51,1232)
doSendMagicEffect(asdon52,1232)
doSendMagicEffect(asdon53,1232)
doSendMagicEffect(asdon54,1232)
doSendMagicEffect(asdon55,1232)
doSendMagicEffect(asdon56,1232)
doSendMagicEffect(asdon57,1232)
doSendMagicEffect(asdon58,1232)
doSendMagicEffect(asdon59,1232)
doSendMagicEffect(asdon60,1232)
doSendMagicEffect(asdon61,1232)
doSendMagicEffect(asdon62,1232)
doSendMagicEffect(asdon63,1232)
------------------------------------------
doSendMagicEffect(Basdion1,1232)
doSendMagicEffect(Basdion2,1232)
doSendMagicEffect(Basdion3,1232)
doSendMagicEffect(Basdion4,1232)
doSendMagicEffect(Basdion5,1232)
doSendMagicEffect(Basdion6,1232)
doSendMagicEffect(Basdion7,1232)
doSendMagicEffect(Basdion8,1232)
doSendMagicEffect(Basdion9,1232)
doSendMagicEffect(Basdion10,1232)
doSendMagicEffect(Basdion11,1232)
doSendMagicEffect(Basdion12,1232)
doSendMagicEffect(Basdion13,1232)
doSendMagicEffect(Basdion14,1232)
doSendMagicEffect(Basdion15,1232)
doSendMagicEffect(Basdion16,1232)
doSendMagicEffect(Basdion17,1232)
doSendMagicEffect(Basdion18,1232)
doSendMagicEffect(Basdion19,1232)
doSendMagicEffect(Basdion20,1232)
doSendMagicEffect(Basdion21,1232)
doSendMagicEffect(Basdion22,1232)
doSendMagicEffect(Basdion23,1232)
doSendMagicEffect(Basdion24,1232)
doSendMagicEffect(Basdion25,1232)
doSendMagicEffect(Basdion26,1232)
doSendMagicEffect(Basdion27,1232)
doSendMagicEffect(Basdion28,1232)
doSendMagicEffect(Basdion29,1232)
doSendMagicEffect(Basdion30,1232)
doSendMagicEffect(Basdion31,1232)
doSendMagicEffect(Basdion32,1232)
doSendMagicEffect(Basdion33,1232)
doSendMagicEffect(Basdion34,1232)
doSendMagicEffect(Basdion35,1232)
doSendMagicEffect(Basdion36,1232)
doSendMagicEffect(Basdion37,1232)
doSendMagicEffect(Basdion38,1232)
doSendMagicEffect(Basdion39,1232)
doSendMagicEffect(Basdion40,1232)
doSendMagicEffect(Basdion41,1232)
doSendMagicEffect(Basdion42,1232)
doSendMagicEffect(Basdion43,1232)
doSendMagicEffect(Basdion44,1232)
doSendMagicEffect(Basdion45,1232)
doSendMagicEffect(Basdion46,1232)
doSendMagicEffect(Basdion47,1232)
doSendMagicEffect(Basdion48,1232)
doSendMagicEffect(Basdion49,1232)
doSendMagicEffect(Basdion50,1232)
doSendMagicEffect(Basdion51,1232)
doSendMagicEffect(Basdion52,1232)
doSendMagicEffect(Basdion53,1232)
doSendMagicEffect(Basdion54,1232)
doSendMagicEffect(Basdion55,1232)
doSendMagicEffect(Basdion56,1232)
doSendMagicEffect(Basdion57,1232)
doSendMagicEffect(Basdion58,1232)
doSendMagicEffect(Basdion59,1232)
doSendMagicEffect(Basdion60,1232)
doSendMagicEffect(Basdion61,1232)
doSendMagicEffect(Basdion62,1232)
doSendMagicEffect(Basdion63,1232)
--------------------------------------------------------
doSendMagicEffect(B2asdion1,1232)
doSendMagicEffect(B2asdion2,1232)
doSendMagicEffect(B2asdion3,1232)
doSendMagicEffect(B2asdion4,1232)
doSendMagicEffect(B2asdion5,1232)
doSendMagicEffect(B2asdion6,1232)
doSendMagicEffect(B2asdion7,1232)
doSendMagicEffect(B2asdion8,1232)
doSendMagicEffect(B2asdion9,1232)
doSendMagicEffect(B2asdion10,1232)
doSendMagicEffect(B2asdion11,1232)
doSendMagicEffect(B2asdion12,1232)
doSendMagicEffect(B2asdion13,1232)
doSendMagicEffect(B2asdion14,1232)
doSendMagicEffect(B2asdion15,1232)
doSendMagicEffect(B2asdion16,1232)
doSendMagicEffect(B2asdion17,1232)
doSendMagicEffect(B2asdion18,1232)
doSendMagicEffect(B2asdion19,1232)
doSendMagicEffect(B2asdion20,1232)
doSendMagicEffect(B2asdion21,1232)
doSendMagicEffect(B2asdion22,1232)
doSendMagicEffect(B2asdion23,1232)
doSendMagicEffect(B2asdion24,1232)
doSendMagicEffect(B2asdion25,1232)
doSendMagicEffect(B2asdion26,1232)
doSendMagicEffect(B2asdion27,1232)
doSendMagicEffect(B2asdion28,1232)
doSendMagicEffect(B2asdion29,1232)
doSendMagicEffect(B2asdion30,1232)
doSendMagicEffect(B2asdion31,1232)
doSendMagicEffect(B2asdion32,1232)
doSendMagicEffect(B2asdion33,1232)
doSendMagicEffect(B2asdion34,1232)
doSendMagicEffect(B2asdion35,1232)
doSendMagicEffect(B2asdion36,1232)
doSendMagicEffect(B2asdion37,1232)
doSendMagicEffect(B2asdion38,1232)
doSendMagicEffect(B2asdion39,1232)
doSendMagicEffect(B2asdion40,1232)
doSendMagicEffect(B2asdion41,1232)
doSendMagicEffect(B2asdion42,1232)
doSendMagicEffect(B2asdion43,1232)
doSendMagicEffect(B2asdion44,1232)
doSendMagicEffect(B2asdion45,1232)
doSendMagicEffect(B2asdion46,1232)
doSendMagicEffect(B2asdion47,1232)
doSendMagicEffect(B2asdion48,1232)
doSendMagicEffect(B2asdion49,1232)
doSendMagicEffect(B2asdion50,1232)
doSendMagicEffect(B2asdion51,1232)
doSendMagicEffect(B2asdion52,1232)
doSendMagicEffect(B2asdion53,1232)
doSendMagicEffect(B2asdion54,1232)
doSendMagicEffect(B2asdion55,1232)
doSendMagicEffect(B2asdion56,1232)
doSendMagicEffect(B2asdion57,1232)
doSendMagicEffect(B2asdion58,1232)
doSendMagicEffect(B2asdion59,1232)
doSendMagicEffect(B2asdion60,1232)
doSendMagicEffect(B2asdion61,1232)
doSendMagicEffect(B2asdion62,1232)
doSendMagicEffect(B2asdion63,1232)
-----------------------------------------------------------------
doSendMagicEffect(B3asdion1,1232)
doSendMagicEffect(B3asdion2,1232)
doSendMagicEffect(B3asdion3,1232)
doSendMagicEffect(B3asdion4,1232)
doSendMagicEffect(B3asdion5,1232)
doSendMagicEffect(B3asdion6,1232)
doSendMagicEffect(B3asdion7,1232)
doSendMagicEffect(B3asdion8,1232)
doSendMagicEffect(B3asdion9,1232)
doSendMagicEffect(B3asdion10,1232)
doSendMagicEffect(B3asdion11,1232)
doSendMagicEffect(B3asdion12,1232)
doSendMagicEffect(B3asdion13,1232)
doSendMagicEffect(B3asdion14,1232)
doSendMagicEffect(B3asdion15,1232)
doSendMagicEffect(B3asdion16,1232)
doSendMagicEffect(B3asdion17,1232)
doSendMagicEffect(B3asdion18,1232)
doSendMagicEffect(B3asdion19,1232)
doSendMagicEffect(B3asdion20,1232)
doSendMagicEffect(B3asdion21,1232)
doSendMagicEffect(B3asdion22,1232)
doSendMagicEffect(B3asdion23,1232)
doSendMagicEffect(B3asdion24,1232)
doSendMagicEffect(B3asdion25,1232)
doSendMagicEffect(B3asdion26,1232)
doSendMagicEffect(B3asdion27,1232)
doSendMagicEffect(B3asdion28,1232)
doSendMagicEffect(B3asdion29,1232)
doSendMagicEffect(B3asdion30,1232)
doSendMagicEffect(B3asdion31,1232)
doSendMagicEffect(B3asdion32,1232)
doSendMagicEffect(B3asdion33,1232)
doSendMagicEffect(B3asdion34,1232)
doSendMagicEffect(B3asdion35,1232)
doSendMagicEffect(B3asdion36,1232)
doSendMagicEffect(B3asdion37,1232)
doSendMagicEffect(B3asdion38,1232)
doSendMagicEffect(B3asdion39,1232)
doSendMagicEffect(B3asdion40,1232)
doSendMagicEffect(B3asdion41,1232)
doSendMagicEffect(B3asdion42,1232)
doSendMagicEffect(B3asdion43,1232)
doSendMagicEffect(B3asdion44,1232)
doSendMagicEffect(B3asdion45,1232)
doSendMagicEffect(B3asdion46,1232)
doSendMagicEffect(B3asdion47,1232)
doSendMagicEffect(B3asdion48,1232)
doSendMagicEffect(B3asdion49,1232)
doSendMagicEffect(B3asdion50,1232)
doSendMagicEffect(B3asdion51,1232)
doSendMagicEffect(B3asdion52,1232)
doSendMagicEffect(B3asdion53,1232)
doSendMagicEffect(B3asdion54,1232)
doSendMagicEffect(B3asdion55,1232)
doSendMagicEffect(B3asdion56,1232)
doSendMagicEffect(B3asdion57,1232)
doSendMagicEffect(B3asdion58,1232)
doSendMagicEffect(B3asdion59,1232)
doSendMagicEffect(B3asdion60,1232)
doSendMagicEffect(B3asdion61,1232)
doSendMagicEffect(B3asdion62,1232)
doSendMagicEffect(B3asdion63,1232)
------------------------------------------- CIMA

doSendMagicEffect(C1cbasbionn1,1232)
doSendMagicEffect(C1cbasbionn2,1232)
doSendMagicEffect(C1cbasbionn3,1232)
doSendMagicEffect(C1cbasbionn4,1232)
doSendMagicEffect(C1cbasbionn5,1232)
doSendMagicEffect(C1cbasbionn6,1232)
doSendMagicEffect(C1cbasbionn7,1232)
doSendMagicEffect(C1cbasbionn8,1232)
doSendMagicEffect(C1cbasbionn9,1232)
doSendMagicEffect(C1cbasbionn10,1232)
doSendMagicEffect(C1cbasbionn11,1232)
doSendMagicEffect(C1cbasbionn12,1232)
doSendMagicEffect(C1cbasbionn13,1232)
doSendMagicEffect(C1cbasbionn14,1232)
doSendMagicEffect(C1cbasbionn15,1232)
doSendMagicEffect(C1cbasbionn16,1232)
doSendMagicEffect(C1cbasbionn17,1232)
doSendMagicEffect(C1cbasbionn18,1232)
doSendMagicEffect(C1cbasbionn19,1232)
doSendMagicEffect(C1cbasbionn20,1232)
doSendMagicEffect(C1cbasbionn21,1232)
doSendMagicEffect(C1cbasbionn22,1232)
doSendMagicEffect(C1cbasbionn23,1232)
doSendMagicEffect(C1cbasbionn24,1232)
doSendMagicEffect(C1cbasbionn25,1232)
doSendMagicEffect(C1cbasbionn26,1232)
doSendMagicEffect(C1cbasbionn27,1232)
doSendMagicEffect(C1cbasbionn28,1232)
doSendMagicEffect(C1cbasbionn29,1232)
doSendMagicEffect(C1cbasbionn30,1232)
doSendMagicEffect(C1cbasbionn31,1232)
doSendMagicEffect(C1cbasbionn32,1232)
doSendMagicEffect(C1cbasbionn33,1232)
doSendMagicEffect(C1cbasbionn34,1232)
doSendMagicEffect(C1cbasbionn35,1232)
doSendMagicEffect(C1cbasbionn36,1232)
doSendMagicEffect(C1cbasbionn37,1232)
doSendMagicEffect(C1cbasbionn38,1232)
doSendMagicEffect(C1cbasbionn39,1232)
doSendMagicEffect(C1cbasbionn40,1232)
doSendMagicEffect(C1cbasbionn41,1232)
doSendMagicEffect(C1cbasbionn42,1232)
doSendMagicEffect(C1cbasbionn43,1232)
doSendMagicEffect(C1cbasbionn44,1232)
doSendMagicEffect(C1cbasbionn45,1232)
doSendMagicEffect(C1cbasbionn46,1232)
doSendMagicEffect(C1cbasbionn47,1232)
doSendMagicEffect(C1cbasbionn48,1232)
doSendMagicEffect(C1cbasbionn49,1232)
doSendMagicEffect(C1cbasbionn50,1232)
doSendMagicEffect(C1cbasbionn51,1232)
doSendMagicEffect(C1cbasbionn52,1232)
doSendMagicEffect(C1cbasbionn53,1232)
doSendMagicEffect(C1cbasbionn54,1232)
doSendMagicEffect(C1cbasbionn55,1232)
doSendMagicEffect(C1cbasbionn56,1232)
doSendMagicEffect(C1cbasbionn57,1232)
doSendMagicEffect(C1cbasbionn58,1232)
doSendMagicEffect(C1cbasbionn59,1232)
doSendMagicEffect(C1cbasbionn60,1232)
doSendMagicEffect(C1cbasbionn61,1232)
doSendMagicEffect(C1cbasbionn62,1232)
doSendMagicEffect(C1cbasbionn63,1232)
-----------------------------------------------------
doSendMagicEffect(C2cbasbionn1,1232)
doSendMagicEffect(C2cbasbionn2,1232)
doSendMagicEffect(C2cbasbionn3,1232)
doSendMagicEffect(C2cbasbionn4,1232)
doSendMagicEffect(C2cbasbionn5,1232)
doSendMagicEffect(C2cbasbionn6,1232)
doSendMagicEffect(C2cbasbionn7,1232)
doSendMagicEffect(C2cbasbionn8,1232)
doSendMagicEffect(C2cbasbionn9,1232)
doSendMagicEffect(C2cbasbionn10,1232)
doSendMagicEffect(C2cbasbionn11,1232)
doSendMagicEffect(C2cbasbionn12,1232)
doSendMagicEffect(C2cbasbionn13,1232)
doSendMagicEffect(C2cbasbionn14,1232)
doSendMagicEffect(C2cbasbionn15,1232)
doSendMagicEffect(C2cbasbionn16,1232)
doSendMagicEffect(C2cbasbionn17,1232)
doSendMagicEffect(C2cbasbionn18,1232)
doSendMagicEffect(C2cbasbionn19,1232)
doSendMagicEffect(C2cbasbionn20,1232)
doSendMagicEffect(C2cbasbionn21,1232)
doSendMagicEffect(C2cbasbionn22,1232)
doSendMagicEffect(C2cbasbionn23,1232)
doSendMagicEffect(C2cbasbionn24,1232)
doSendMagicEffect(C2cbasbionn25,1232)
doSendMagicEffect(C2cbasbionn26,1232)
doSendMagicEffect(C2cbasbionn27,1232)
doSendMagicEffect(C2cbasbionn28,1232)
doSendMagicEffect(C2cbasbionn29,1232)
doSendMagicEffect(C2cbasbionn30,1232)
doSendMagicEffect(C2cbasbionn31,1232)
doSendMagicEffect(C2cbasbionn32,1232)
doSendMagicEffect(C2cbasbionn33,1232)
doSendMagicEffect(C2cbasbionn34,1232)
doSendMagicEffect(C2cbasbionn35,1232)
doSendMagicEffect(C2cbasbionn36,1232)
doSendMagicEffect(C2cbasbionn37,1232)
doSendMagicEffect(C2cbasbionn38,1232)
doSendMagicEffect(C2cbasbionn39,1232)
doSendMagicEffect(C2cbasbionn40,1232)
doSendMagicEffect(C2cbasbionn41,1232)
doSendMagicEffect(C2cbasbionn42,1232)
doSendMagicEffect(C2cbasbionn43,1232)
doSendMagicEffect(C2cbasbionn44,1232)
doSendMagicEffect(C2cbasbionn45,1232)
doSendMagicEffect(C2cbasbionn46,1232)
doSendMagicEffect(C2cbasbionn47,1232)
doSendMagicEffect(C2cbasbionn48,1232)
doSendMagicEffect(C2cbasbionn49,1232)
doSendMagicEffect(C2cbasbionn50,1232)
doSendMagicEffect(C2cbasbionn51,1232)
doSendMagicEffect(C2cbasbionn52,1232)
doSendMagicEffect(C2cbasbionn53,1232)
doSendMagicEffect(C2cbasbionn54,1232)
doSendMagicEffect(C2cbasbionn55,1232)
doSendMagicEffect(C2cbasbionn56,1232)
doSendMagicEffect(C2cbasbionn57,1232)
doSendMagicEffect(C2cbasbionn58,1232)
doSendMagicEffect(C2cbasbionn59,1232)
doSendMagicEffect(C2cbasbionn60,1232)
doSendMagicEffect(C2cbasbionn61,1232)
doSendMagicEffect(C2cbasbionn62,1232)
doSendMagicEffect(C2cbasbionn63,1232)
-------------------------------------------------------
doSendMagicEffect(C3cbasbionn1,1232)
doSendMagicEffect(C3cbasbionn2,1232)
doSendMagicEffect(C3cbasbionn3,1232)
doSendMagicEffect(C3cbasbionn4,1232)
doSendMagicEffect(C3cbasbionn5,1232)
doSendMagicEffect(C3cbasbionn6,1232)
doSendMagicEffect(C3cbasbionn7,1232)
doSendMagicEffect(C3cbasbionn8,1232)
doSendMagicEffect(C3cbasbionn9,1232)
doSendMagicEffect(C3cbasbionn10,1232)
doSendMagicEffect(C3cbasbionn11,1232)
doSendMagicEffect(C3cbasbionn12,1232)
doSendMagicEffect(C3cbasbionn13,1232)
doSendMagicEffect(C3cbasbionn14,1232)
doSendMagicEffect(C3cbasbionn15,1232)
doSendMagicEffect(C3cbasbionn16,1232)
doSendMagicEffect(C3cbasbionn17,1232)
doSendMagicEffect(C3cbasbionn18,1232)
doSendMagicEffect(C3cbasbionn19,1232)
doSendMagicEffect(C3cbasbionn20,1232)
doSendMagicEffect(C3cbasbionn21,1232)
doSendMagicEffect(C3cbasbionn22,1232)
doSendMagicEffect(C3cbasbionn23,1232)
doSendMagicEffect(C3cbasbionn24,1232)
doSendMagicEffect(C3cbasbionn25,1232)
doSendMagicEffect(C3cbasbionn26,1232)
doSendMagicEffect(C3cbasbionn27,1232)
doSendMagicEffect(C3cbasbionn28,1232)
doSendMagicEffect(C3cbasbionn29,1232)
doSendMagicEffect(C3cbasbionn30,1232)
doSendMagicEffect(C3cbasbionn31,1232)
doSendMagicEffect(C3cbasbionn32,1232)
doSendMagicEffect(C3cbasbionn33,1232)
doSendMagicEffect(C3cbasbionn34,1232)
doSendMagicEffect(C3cbasbionn35,1232)
doSendMagicEffect(C3cbasbionn36,1232)
doSendMagicEffect(C3cbasbionn37,1232)
doSendMagicEffect(C3cbasbionn38,1232)
doSendMagicEffect(C3cbasbionn39,1232)
doSendMagicEffect(C3cbasbionn40,1232)
doSendMagicEffect(C3cbasbionn41,1232)
doSendMagicEffect(C3cbasbionn42,1232)
doSendMagicEffect(C3cbasbionn43,1232)
doSendMagicEffect(C3cbasbionn44,1232)
doSendMagicEffect(C3cbasbionn45,1232)
doSendMagicEffect(C3cbasbionn46,1232)
doSendMagicEffect(C3cbasbionn47,1232)
doSendMagicEffect(C3cbasbionn48,1232)
doSendMagicEffect(C3cbasbionn49,1232)
doSendMagicEffect(C3cbasbionn50,1232)
doSendMagicEffect(C3cbasbionn51,1232)
doSendMagicEffect(C3cbasbionn52,1232)
doSendMagicEffect(C3cbasbionn53,1232)
doSendMagicEffect(C3cbasbionn54,1232)
doSendMagicEffect(C3cbasbionn55,1232)
doSendMagicEffect(C3cbasbionn56,1232)
doSendMagicEffect(C3cbasbionn57,1232)
doSendMagicEffect(C3cbasbionn58,1232)
doSendMagicEffect(C3cbasbionn59,1232)
doSendMagicEffect(C3cbasbionn60,1232)
doSendMagicEffect(C3cbasbionn61,1232)
doSendMagicEffect(C3cbasbionn62,1232)
doSendMagicEffect(C3cbasbionn63,1232)




--return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
--return doCombat(cid, combat1, var)
return true
end
