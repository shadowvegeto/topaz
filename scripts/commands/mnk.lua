require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 2) then
	local stock =
			{
-- af
23376, 1500000,
23443, 1500000,
23510, 1500000,
23577, 1500000,
23644, 1500000,
-- relic
23399, 1500000,
23466, 1500000,
23533, 1500000,
23600, 1500000,
23667, 1500000,
-- empy
26743, 1500000,
26901, 1500000,
27055, 1500000,
27240, 1500000,
27414, 1500000,
			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Monk to use this command.");
	end
end