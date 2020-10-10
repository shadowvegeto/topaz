<<<<<<< HEAD
=======
require("scripts/globals/teleports")

>>>>>>> 4b7b14ae234ece9589a715ea29e1923ad02383cc
cmdprops =
{
    permission = 0,
    parameters = ""
};
<<<<<<< HEAD
    require("scripts/globals/teleports")
	require("scripts/globals/zone")	
	require("scripts/globals/spell_data")
	
function onTrigger(player)
    player:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_DEM,0,1);
end;
=======
	
function onTrigger(player)
		player:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.DEM, 0, 4.7)
	return 0
end
>>>>>>> 4b7b14ae234ece9589a715ea29e1923ad02383cc
