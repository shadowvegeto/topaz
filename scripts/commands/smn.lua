require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 15) then
	local stock =
			{
-- af
23389, 1500000,
23456, 1500000,
23523, 1500000,
23590, 1500000,
23657, 1500000,
-- relic
23412, 1500000,
23479, 1500000,
23546, 1500000,
23613, 1500000,
23680, 1500000,
-- empy
26769, 1500000,
26927, 1500000,
27081, 1500000,
27266, 1500000,
27440, 1500000,
			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Summoner to use this command.");
	end
end