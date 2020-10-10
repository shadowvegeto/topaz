---------------------------------------------------------------------------------------------------
-- func: !tele <destination> <player>
-- desc: Warps GM or target player to Tele Crags and select other locations...
---------------------------------------------------------------------------------------------------
    require("scripts/globals/status")
    require("scripts/globals/teleports")
	require("scripts/globals/zone")	
	require("scripts/globals/spell_data")

cmdprops =

{
    -- Using lv 0 so players can use, KI check still happens below
    permission = 0,
    parameters = ""
}

	function onTrigger(player, tele)    
	if (tele == nil) then
        player:PrintToPlayer("You must enter a valid Teleport location.")
        player:PrintToPlayer("!tele <destination>")
        return		
    end	
        -- Parse the Teleports
        elseif (tele == "dem" or tele == "Dem") then
				-- targ:injectActionPacket(4, 122, 0, 0, 0)
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_DEM, 0, 1)				
            end			
			
        elseif (tele == "holla" or tele == "Holla" or tele == "hol" or tele == "Hol") then
            -- if (targ:hasKeyItem(HOLLA_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket(4, 122, 0, 0, 0)
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_HOLLA, 0, 1)
            end
        elseif (tele == "mea" or tele == "Mea") then
            -- if (targ:hasKeyItem(MEA_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket(4, 122, 0, 0, 0)
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_MEA, 0, 1)
            end
        elseif (tele == "vahzl" or tele == "Vahzl" or tele == "vahz" or tele == "Vahz" or tele == "vah" or tele == "Vah") then
            -- if (targ:hasKeyItem(VAHZL_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket(4, 122, 0, 0, 0)
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_VAHZL, 0, 1)
            end
        elseif (tele == "yhoat" or tele == "Yhoat" or tele == "yho" or tele == "Yho") then
            -- if (targ:hasKeyItem(YHOATOR_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket(4, 122, 0, 0, 0)
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_YHOAT, 0, 1)
            end
        elseif (tele == "altep" or tele == "Altep" or tele == "altepa" or tele == "Altepa" or tele == "alt" or tele == "Alt") then
            -- if (targ:hasKeyItem(ALTEPA_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket(4, 122, 0, 0, 0)
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, TELEPORT_ALTEP, 0, 1)
            end
        elseif (tele == "jugner" or tele == "Jugner") then
            -- if (targ:hasKeyItem(JUGNER_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket(4, 122, 0, 0, 0)
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, RECALL_JUGNER, 0, 1)
            end
        elseif (tele == "pashh" or tele == "Pashh" or tele == "pashow" or tele == "Pashow") then
            -- if (targ:hasKeyItem(PASHHOW_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket(4, 122, 0, 0, 0)
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, RECALL_PASHH, 0, 1)
            end
        elseif (tele == "meriph" or tele == "Meriph" or tele == "meriphataud" or tele == "Meriphataud") then
            -- if (targ:hasKeyItem(MERIPHATAUD_GATE_CRYSTAL) or gmlvl >= 1) then
                targ:injectActionPacket(4, 122, 0, 0, 0)
                targ:addStatusEffectEx(EFFECT_TELEPORT, 0, RECALL_MERIPH, 0, 1)
            end

        -- Begin GM onry destinations section.
		elseif (tele == "jeuno" or tele == "Jeuno") then
            -- if (gmlvl >= 1) then
                targ:setPos(20.3042, -1.0000, 52.8226, 0x0E, 245)
			end
        elseif (tele == "rulude" or tele == "ru'lude") then
            -- if (gmlvl >= 1) then
                targ:setPos(0.1326, 3.0000, -4.1359, 192, 243)
            end
        elseif (tele == "Kazham" or tele == "kazham" or tele == "kaz" or tele == "Kaz") then
            -- if (gmlvl >= 1) then
                targ:setPos(-29, -2, -14, 62, 250)
            end
        elseif (tele == "Laypoint" or tele == "laypoint" or tele == "Wajaom" or tele == "wajaom") then
            -- if (gmlvl >= 1) then
                targ:setPos(-200.116, -10, 79.879, 213, 51)
            end
        elseif (tele == "Whitegate" or tele == "whitegate" or tele == "wg") then
            -- if (gmlvl >= 1) then
                targ:setPos(-20.9166, 0.0000, -19.1654, 192, 0x32)
            end
        elseif (tele == "Sky" or tele == "sky") then
            -- if (gmlvl >= 1) then
                targ:setPos(-134.145, -32.328, -205.947, 215, 130)
            end
        elseif (tele == "Kirin" or tele == "kirin") then
            -- if (gmlvl >= 1) then
                targ:setPos(-79, 32, -1, 192, 178)
            end
        -- End of GM onry section.

        else
            player:PrintToPlayer(string.format("Invalid Tele location '%s' given.", tele))
            player:PrintToPlayer("!tele <destination> <player>")
        end
    else
        player:PrintToPlayer(string.format("Player named '%s' not found!", target))
        player:PrintToPlayer("!tele <destination>")
    end

end