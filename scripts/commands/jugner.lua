require("scripts/globals/teleports")

cmdprops =
{
    permission = 0,
    parameters = ""
};
	
function onTrigger(player)
		player:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.JUGNER, 0, 4.7)
	return 0
end
