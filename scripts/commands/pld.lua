require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 7) then
	local stock =
			{
-- af
23381, 1500000,
23448, 1500000,
23515, 1500000,
23582, 1500000,
23649, 1500000,
-- relic
23404, 1500000,
23471, 1500000,
23538, 1500000,
23605, 1500000,
23672, 1500000,
-- empy
26753, 1500000,
26911, 1500000,
27065, 1500000,
27250, 1500000,
27424, 1500000,
			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Paladin to use this command.");
	end
end