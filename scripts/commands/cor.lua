require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 17) then
	local stock =
			{
-- af
23391, 1500000,
23458, 1500000,
23525, 1500000,
23592, 1500000,
23659, 1500000,
-- relic
23414, 1500000,
23481, 1500000,
23548, 1500000,
23615, 1500000,
23682, 1500000,
-- empy
26773, 1500000,
26931, 1500000,
27085, 1500000,
27270, 1500000,
27444, 1500000,
			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Corsair to use this command.");
	end
end