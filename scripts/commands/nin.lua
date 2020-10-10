require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 13) then
	local stock =
			{
-- af
23387, 1500000,
23454, 1500000,
23521, 1500000,
23588, 1500000,
23655, 1500000,
-- relic
23410, 1500000,
23477, 1500000,
23544, 1500000,
23611, 1500000,
23678, 1500000,
-- empy
26765, 1500000,
26923, 1500000,
27077, 1500000,
27262, 1500000,
27436, 1500000,
			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Ninja to use this command.");
	end
end