require("scripts/globals/zone")
require("scripts/globals/status")
require("scripts/globals/teleports")
require("scripts/globals/keyitems")

cmdprops =
{
    permission = 0,
    parameters = "s"
}

function error(player, msg)
    player:PrintToPlayer(msg)
    player:PrintToPlayer("!teleport <location>")
end

function onTrigger(player, zoneString)
    if zoneString == nil then
        error(player, "You must provide a teleport location")
        return
    end

    if zoneString:lower() == 'dem' then
        player:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.DEM, 0, 4.7)
    elseif zoneString:lower() == 'mea' then
        player:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.MEA, 0, 4.7)
    elseif zoneString:lower() == 'holla' then
        player:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.HOLLA, 0, 4.7)
    elseif zoneString:lower() == 'yhoat' then
        player:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.YHOAT, 0, 4.7)
    elseif zoneString:lower() == 'altep' then
        player:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.ALTEP, 0, 4.7)
    elseif zoneString:lower() == 'vahzl' then
        player:addStatusEffectEx(tpz.effect.TELEPORT, 0, tpz.teleport.id.VAHZL, 0, 4.7)
    end
end