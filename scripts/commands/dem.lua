cmdprops =
{
    permission = 0,
    parameters = ""
};
    require("scripts/globals/teleports")
	require("scripts/globals/zone")	
	require("scripts/globals/spell_data")
	
function onTrigger(player)
    player:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_DEM,0,1);
end;
