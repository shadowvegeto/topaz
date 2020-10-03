require("scripts/globals/status")

---------------------------------------------------------------------------------------------------
-- func: regen/refresh server wide. 
-- auth: <Unknown> :: Modded by Tagban, Kyau
-- desc: Gives the players certain effects
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
    local LvL = player:getMainLvl();
    
    
    -- remove current buff versions
    if (player:hasStatusEffect(tpz.effect.REGEN)) then
        player:delStatusEffect(tpz.effect.REGEN);
    end
    if (player:hasStatusEffect(tpz.effect.PROTECT)) then
        player:delStatusEffect(tpz.effect.PROTECT);
    end
    if (player:hasStatusEffect(tpz.effect.SHELL)) then
        player:delStatusEffect(tpz.effect.SHELL);
    end
    if (player:hasStatusEffect(tpz.effect.HASTE)) then
        player:delStatusEffect(tpz.effect.HASTE);
    end
    if (player:hasStatusEffect(tpz.effect.REGAIN)) then
        player:delStatusEffect(tpz.effect.REGAIN);
    end
    if (player:hasStatusEffect(tpz.effect.REFRESH)) then
        player:delStatusEffect(tpz.effect.REFRESH);
    end
    if (player:hasStatusEffect(tpz.effect.RERAISE)) then
        player:delStatusEffect(tpz.effect.RERAISE);
    end

    if (LvL <= 30) then
        -- protect 1
        player:addStatusEffect(tpz.effect.PROTECT,15,0,0);
        -- shell 1
        player:addStatusEffect(tpz.effect.SHELL,9,0,0);
        -- regen
        player:addStatusEffect(tpz.effect.REGEN,5,0,0);
		-- regain
		player:addStatusEffect(tpz.effect.REGAIN,10,1,0);
        -- haste
        player:addStatusEffect(tpz.effect.HASTE,150,0,0);
        -- refresh
        player:addStatusEffect(tpz.effect.REFRESH,3,0,0);
		-- reraise
        player:addStatusEffect(tpz.effect.RERAISE,1,0,0);
    elseif (LvL > 30 and LvL <= 50) then
        -- protect 2
        player:addStatusEffect(tpz.effect.PROTECT,40,0,0);
        -- shell 2
        player:addStatusEffect(tpz.effect.SHELL,14,0,0);
        -- regen
        player:addStatusEffect(tpz.effect.REGEN,10,0,0);
		-- regain
		player:addStatusEffect(tpz.effect.REGAIN,10,1,0);
        -- haste
        player:addStatusEffect(tpz.effect.HASTE,150,0,0);
        -- refresh
        player:addStatusEffect(tpz.effect.REFRESH,4,0,0);
		-- reraise
        player:addStatusEffect(tpz.effect.RERAISE,2,0,0);
    elseif (LvL > 50 and LvL <= 65) then
        -- protect 3
        player:addStatusEffect(tpz.effect.PROTECT,75,0,0);
        -- shell 3
        player:addStatusEffect(tpz.effect.SHELL,19,0,0);
        -- regen
        player:addStatusEffect(tpz.effect.REGEN,15,0,0);
		-- regain
		player:addStatusEffect(tpz.effect.REGAIN,10,1,0);
        -- haste
        player:addStatusEffect(tpz.effect.HASTE,150,0,0);
        -- refresh
        player:addStatusEffect(tpz.effect.REFRESH,5,0,0);
		-- reraise
        player:addStatusEffect(tpz.effect.RERAISE,3,0,0);
    elseif (LvL > 65 and LvL <= 99) then
        -- protect 4
        player:addStatusEffect(tpz.effect.PROTECT,120,0,0);
        -- shell 4
        player:addStatusEffect(tpz.effect.SHELL,22,0,0);
        -- regen
        player:addStatusEffect(tpz.effect.REGEN,20,0,0);
		-- regain
		player:addStatusEffect(tpz.effect.REGAIN,10,1,0);
        -- haste
        player:addStatusEffect(tpz.effect.HASTE,150,0,0);
        -- refresh 2
        player:addStatusEffect(tpz.effect.REFRESH,8,0,0);
		-- reraise
        player:addStatusEffect(tpz.effect.RERAISE,3,0,0);
    else
        -- protect 4
        player:addStatusEffect(tpz.effect.PROTECT,120,0,0);
        -- shell 4
        player:addStatusEffect(tpz.effect.SHELL,22,0,0);
        -- regen
        player:addStatusEffect(tpz.effect.REGEN,25,0,0);
		-- regain
		player:addStatusEffect(tpz.effect.REGAIN,10,1,0);
        -- haste 2
        player:addStatusEffect(tpz.effect.HASTE,307,0,0);
        -- refresh 2
        player:addStatusEffect(tpz.effect.REFRESH,12,0,0);
		-- reraise
        player:addStatusEffect(tpz.effect.RERAISE,3,0,0);
    end
    --player:addStatusEffect(tpz.effect.REFRESH,25,0,0);

    --player:addStatusEffect(tpz.effect.REFRESH,25,0,0);
    --player:addStatusEffect(tpz.effect.REGEN,28,0,0);
    --player:addStatusEffect(tpz.effect.REGAIN,15,1,0);
    --player:addStatusEffect(tpz.effect.PROTECT,50,0,0);
    --player:addStatusEffect(tpz.effect.SHELL,36,0,0);
    --player:addStatusEffect(tpz.effect.HASTE,92,0,0); 
end