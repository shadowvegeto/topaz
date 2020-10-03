require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 16) then
	local stock =
			{
-- af
23390, 1500000,
23457, 1500000,
23524, 1500000,
23591, 1500000,
23658, 1500000,
-- relic
23413, 1500000,
23480, 1500000,
23547, 1500000,
23614, 1500000,
23681, 1500000,
-- empy
26771, 1500000,
23929, 1500000,
27083, 1500000,
27268, 1500000,
27442, 1500000,
			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Blue Mage to use this command.");
	end
end