---------------------------------------------------------------------------------------------------
-- func:  @aspi
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (near Aspi pop).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
            player:setPos('20', '-1', '48', '84', '128');
end