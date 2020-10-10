require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 3) then
	local stock =
			{
-- af
23377, 1500000,
23444, 1500000,
23511, 1500000,
23578, 1500000,
23645, 1500000,
-- relic
23400, 1500000,
23467, 1500000,
23534, 1500000,
23601, 1500000,
23668, 1500000,
-- empy
26745, 1500000,
26903, 1500000,
27057, 1500000,
27242, 1500000,
27416, 1500000,

			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be White Mage to use this command.");
	end
end