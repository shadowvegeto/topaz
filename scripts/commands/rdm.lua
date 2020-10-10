require("scripts/globals/status")

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player, stock)
	local mJob = player:getMainJob();
	if (mJob == 5) then
	local stock =
			{
-- af
23379, 1500000,
23446, 1500000,
23513, 1500000,
23580, 1500000,
23647, 1500000,
-- relic
23402, 1500000,
23469, 1500000,
23536, 1500000,
23603, 1500000,
23670, 1500000,
-- empy
26749, 1500000,
26907, 1500000,
27061, 1500000,
27246, 1500000,
27420, 1500000,

			};
	tpz.shop.general(player, stock);
	player:PrintToPlayer("Artifact, Relic, and Empyrean armor.", 0xF);
	else
	player:PrintToPlayer("You're main job must be Red Mage to use this command.");
	end
end