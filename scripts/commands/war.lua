require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 1) then
	local stock =
			{
-- af
23375, 1500000,
23442, 1500000,
23509, 1500000,
23576, 1500000,
23643, 1500000,
-- relic
23398, 1500000,
23465, 1500000,
23532, 1500000,
23599, 1500000,
23666, 1500000,
-- empy
26741, 1500000,
26899, 1500000,
27053, 1500000,
27238, 1500000,
27412, 1500000,
			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Warrior to use this command.");
	end
end