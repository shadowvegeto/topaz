require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 9) then
	local stock =
			{
-- af
23383, 1500000,
23450, 1500000,
23517, 1500000,
23584, 1500000,
23651, 1500000,
-- relic
23406, 1500000,
23473, 1500000,
23540, 1500000,
23607, 1500000,
23674, 1500000,
-- empy
26757, 1500000,
26915, 1500000,
27069, 1500000,
27254, 1500000,
27428, 1500000,

			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Beastmaster to use this command.");
	end
end