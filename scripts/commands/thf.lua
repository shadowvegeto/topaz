require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 6) then
	local stock =
			{
-- af
23380, 1500000,
23447, 1500000,
23514, 1500000,
23581, 1500000,
23648, 1500000,
-- relic
23403, 1500000,
23470, 1500000,
23537, 1500000,
23604, 1500000,
23671, 1500000,
-- empy
26751, 1500000,
26909, 1500000,
27063, 1500000,
27248, 1500000,
27422, 1500000,

			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Thief to use this command.");
	end
end