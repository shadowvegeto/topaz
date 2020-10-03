require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 12) then
	local stock =
			{
-- af
23386, 1500000,
23453, 1500000,
23520, 1500000,
23587, 1500000,
23654, 1500000,
-- relic
23409, 1500000,
23476, 1500000,
23543, 1500000,
23610, 1500000,
23677, 1500000,
-- empy
26763, 1500000,
26921, 1500000,
27075, 1500000,
27260, 1500000,
27434, 1500000,
			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Samurai to use this command.");
	end
end