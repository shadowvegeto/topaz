require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 4) then
	local stock =
			{
			-- blm af
23378, 1500000,
23445, 1500000,
23512, 1500000,
23579, 1500000,
23646, 1500000,
-- relic
23401, 1500000,
23468, 1500000,
23535, 1500000,
23602, 1500000,
23669, 1500000,
-- empy
26747, 1500000,
26905, 1500000,
27059, 1500000,
27244, 1500000,
27418, 1500000,	
			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Black Mage to use this command.");
	end
end