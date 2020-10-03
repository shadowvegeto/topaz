--------------------------------------------------------------
-- func: BNETcc Server Shop
-- desc: opens a custom shop anywhere in the world
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

-- Notes:
-- ALWAYS comment your additions!

function onTrigger(player,page)
    player:PrintToPlayer("Welcome to the server shops. Find wares to aid you on your adventure!", 0xF);

    if (page == 0 or page == nil) then
        player:PrintToPlayer("1: HQ Crystal, 2: Food, 3: Meds, 4: Misc", 0xF);
        player:PrintToPlayer("5: Tools 6: Cor Dies 7: Fireworks 8: Event Items", 0xF);
        -- Edit and uncomment next line if you want more pages.
		player:PrintToPlayer("9: More Event Items 10: Ammo 11: Hero Shop", 0xF);
		player:PrintToPlayer("12: Gear Shop 13: Gear Shop 2 14: Gear Shop 3", 0xF);
        -- player:PrintToPlayer("5: ??, 6: ??, 7: ??, 8: ??", 0xF);
        player:PrintToPlayer("!shop <page#>", 0xF);
    elseif (page == 1) then
        local stock_1 =
        {
            4238,   3000,    -- HQ Fire Crystal
            4239,   3000,    -- HQ Ice Crystal
            4240,   3000,    -- HQ Wind Crystal
            4241,   3000,    -- HQ Earth Crystal
            4242,   3000,    -- HQ Lightning Crystal
            4243,   3000,    -- HQ Water Crystal
            4244,   3000,    -- HQ Light Crystal
            4245,   3000     -- HQ Dark Crystal
        };
        tpz.shop.general(player, stock_1);
        player:PrintToPlayer("We stock only the highest quality crystals..", 0xF);

    elseif (page == 2) then
        local stock_2 =
        {
            -- Non Custom "for low lv noobs in exp party" food, same price as AH so non exploitable.
            -- 4376,   108,  -- Meat Jerky
            -- 5721,   500,  -- Crab Sushi
            -- 4271,   2000,  -- Rice Dumpling
            -- 4536,   3133,  -- Blackened Frog
			4271,   2499,   -- Rice Dumpling
            4381,   2100,   -- Meat Mithkabob
            4398,   2100,   -- Fish Mithkabob
            4457,   2100,   -- Eel Kabob
            5166,   2100,   -- Coeurl Sub Sandwich
            4355,   1450,   -- Salmon Sub Sandwich
            5686,   799,    -- Cheese Sandwich
            5561,   799,    -- Moogle Pie
            4270,   999,    -- Sweet Rice Cake
            5944,   2000,   -- Frontier Soda
            5932,   1600,   -- Kitron Juice
            4424,   1100,   -- Melon Juice
            4422,   499,    -- Orange Juice
			6465,   9999,    -- Behemoth Steak+1
			
            --------------------------------------------------
            -- Custom food items
            -- 4258,   32500,  -- Red Drop
            -- 4259,   32500,  -- Clear Drop
            -- 4260,   32500,  -- Green Drop
            -- 4261,   32500,  -- Yellow Drop
            -- 4262,   32500,  -- Purple Drop
            -- 4263,   32500,  -- Blue Drop
            -- 4264,   32500,  -- White Drop
            -- 4265,   4000    -- Black Drop
        };
        tpz.shop.general(player, stock_2);
        player:PrintToPlayer("Welcome foodie! Would you like fries with that?", 0xF);

    elseif (page == 3) then
        local stock_3 =
        {
            4148,   316,     -- Antidote
            4150,   2595,    -- Eye Drops
            4151,   800,     -- Echo drops
            4112,   910,     -- Potion
            4128,   4832,    -- Ether
            4153,   6000,    -- Antacid
			4154,   1000,    -- Holy Water
			4149,   2000,    -- Panacea
            4182,   15000,   -- Instant Reraise
            4165,   5000,    -- Silent Oil
            4164,   5000,    -- Prism Powder
			5362,   2000,    -- Rainbow Powder
            4213,   5000,    -- Icarus Wing
			4202,   25000,   -- Daedalus Wing
            5418,   2000,    -- Tincture
            5328,   2000,    -- Hi-Potion Drop
            5358,   2000,    -- Hi-Ether Drop
            5356,   5000,    -- Remedy Ointment            
            5876,   25000,   -- Petrify Screen
            5877,   25000,   -- Terror Screen
            5878,   25000,   -- Amnesia Screen
            5879,   25000,   -- Doom Screen
            5880,   25000,   -- Poison Screen
        };
        tpz.shop.general(player, stock_3);
        player:PrintToPlayer("Step right up folks! Cures blindness, sore throat, and various poisons!", 0xF);

    elseif (page == 4) then
        local stock_4 =
        {
            15793, 150000, -- Anniversary Ring
            15761,  15000, -- Chariot Band
            15762,  15000, -- Empress Band
            15763,  35000, -- Emperor Band
            16368,  32000, -- Herder's Subligar
            18762,  32000, -- Custodes
            18503,  32000, -- Mammut
            19222,  32000, -- Wurger
            15880,  32000, -- Key Ring Belt
            19223,  24000, -- Attar of Roses
            16007,  24000, -- Protect Earing
            15835,  20000, -- Desperado Ring
            19157,  20000, -- Surviver
            15926,  20000, -- Bronze Bandolier
            19221,  20000, -- Firefly
            15834,  20000, -- Bind Ring
            16279,  20000, -- Pile Chain
			605,    499,   -- Pickaxe
            1021,   499,   -- Hatchet
            1020,   499,   -- Sickle
			1022,   5000,  -- Thief's Tools
        };
        tpz.shop.general(player, stock_4);
        player:PrintToPlayer("Gear Shack, we've got your back.", 0xF);

    elseif (page == 5) then
        local stock_5 =
        {
            5869,   500,    -- Chonofuda
            5312,   500,    -- Hiraishin
            5867,   500,    -- Inoshishinofuda
            5864,   500,    -- Jinko
            5315,   500,    -- Jusatsu
            5863,   500,    -- Kabenro
            5316,   500,    -- Kaginawa
            5310,   500,    -- Kawahori-Ogi
            5318,   500,    -- Kodoku
            5311,   500,    -- Makibishi
            5313,   500,    -- Mizu-Deppo
            5866,   500,    -- Mokukin
            5865,   500,    -- Ryuno
            5317,   500,    -- Sairui-Ran
            5417,   500,    -- Sanjaku-Tenugui
            5314,   500,    -- Shihei
            5868,   500,    -- Shikanofuda
            5319,   500,    -- Shinobi-Tabi
            5734,   500,    -- Soshi
            5309,   500,    -- Tsurara
            5308,   500,    -- Uchitake                       
        };
		
        tpz.shop.general(player, stock_5);
        player:PrintToPlayer("All the Ninja Tools you need for your adventure!", 0xF);

    elseif (page == 6) then
        local stock_6 =
        {
            -- Die's
            5502,   100,    -- Allies' Die
            5505,   100,    -- Avenger's Die
            5486,   100,    -- Bard Die
            5485,   100,    -- Beastmaster Die
            5480,   100,    -- Black Mage Die
            5500,   100,    -- Blitzer's Die
            5492,   100,    -- Blue Mage Die
            5497,   100,    -- Bolter's Die
            5498,   100,    -- Caster's Die
            5504,   100,    -- Companion's Die
            5493,   100,    -- Corsair Die
            5499,   100,    -- Courser's Die
            5495,   100,    -- Dancer Die
            5484,   100,    -- Dark Knight Die
            5490,   100,    -- Dragoon Die
            6368,   100,    -- Geomancer Die
            5503,   100,    -- Miser's Die
            5478,   100,    -- Monk Die
            5489,   100,    -- Ninja Die
            5483,   100,    -- Paladin Die
            5494,   100,    -- Puppetmaster Die
            5487,   100,    -- Ranger Die
            5481,   100,    -- Red Mage Die
            5488,   100,    -- Samurai Die
            5496,   100,    -- Scholar Die
            5491,   100,    -- Summoner Die
            5501,   100,    -- Tactician's Die
            5482,   100,    -- Thief Die
            5477,   100,    -- Warrior Die
            5479,   100     -- White Mage Die
        };
        tpz.shop.general(player, stock_6);
        player:PrintToPlayer("All the corsair dies you need for your adventure!", 0xF);

        elseif (page == 7) then
        local stock_7 =
        {
            4186,   100,    -- Airborne
            5441,   100,    -- Angelwing
            4216,   100,    -- Brilliant Snow
            4167,   100,    -- Cracker
            4250,   100,    -- Crackler
            5361,   100,    -- Datechochin
            -- 5883, 100     -- Falling Star (Not Working)
            4251,   100,    -- Festive Fan
            5725,   100,    -- Goshikitenge
            4184,   100,    -- Kongou Inaho
            4183,   100,    -- Konron Hassen
            4169,   100,    -- Little Comet
            -- 5882, 100,   -- Marine Bliss (Not Working)
            4185,   100,    -- Meifu Goma
            5360,   100,    -- Muteppo
            4256,   100,    -- Ouka Ranman
            4257,   100,    -- Papillion
            5769,   100,    -- Popper (Congrats!)
            -- 4215, 100,   -- Popstar (Not Working)
            -- 5881, 100,   -- Shisai Kaboku (Not Working)
            4217,   100,    -- Sparkling Hand
            4253,   100,    -- Spirit Masque
            4252,   100,    -- Summer Fan
            4168,   100,     -- Twinkle Shower
        };
        tpz.shop.general(player, stock_7);
        player:PrintToPlayer("Illegal fireworks... oh shit run its the fuz!", 0xF);

            elseif (page == 8) then
        local stock_8 =
        {
            -- CHOCOBO SET
            11500,  10000,  -- Chocobo Beret
            27765,  10000,  -- Chocobo Masque
            27911,  10000,  -- Chocobo Suit
            17074,  10000,  -- Chocobo Wand
            10811,  10000,  -- Chocobo Shield
            --MOOGLE SET
            16118,  10000,  -- Moogle Cap,Enchantment Teleport
            10429,  10000,  -- Moogle Masque
            10250,  10000,  -- Moogle Suit, Dispense: Mog Missile
            18401,  10000,  -- Moogle Rod, Enchantment Give Gift
            18842,  10000,  -- Nomad Moogle Rod, Enchantment Give Gift
            16182,  10000,  -- Town Moogle Shield, Enchantment Moogle Japery
            16183,  10000,  -- Nomad Moogle Shield, Enchantment Moogle Japery
            --NOVENNIAL SET
            11853,  10000,  -- Novennial Coat
            11956,  10000,  -- Novennial Hose
            11854,  10000,  -- Novennial Dress
            11957,  10000,  -- Novennial Boots
            --DINNER SET
            11355,  10000,  -- Dinner Jacket
            16378,  10000,  -- Dinner Hose
            --SWIMSUITS
            -- 11265,  10000,  -- HUME M TOP
            -- 11266,  10000,  -- HUME F TOP
            -- 11267,  10000,  -- ELV M TOP
            -- 11268,  10000,  -- ELV F TOP
            -- 11269,  10000,  -- TARU M TOP
            -- 11270,  10000,  -- TARU F TOP
            -- 11271,  10000,  -- MITHRA TOP
            -- 11272,  10000,  -- GALKA TOP
            -- 16321,  10000,  -- HUME M BOTTOM
            -- 16322,  10000,  -- HUME F BOTTOM
            -- 16323,  10000,  -- ELV M BOTTOM
            -- 16324,  10000,  -- ELV F BOTTOM
            -- 16325,  10000,  -- TARU M BOTTOM
            -- 16326,  10000,  -- TARU F BOTTOM
            -- 16327,  10000,  -- MITHRA BOTTOM
            -- 16328,  10000,  -- GALKA BOTTOM
            -- DREAM SET
            18863,  10000,  -- Dream Bell
            15752,  10000,  -- Dream Boots
            15178,  10000,  -- Dream Hat
            10382,  10000,  -- Dream Mittens
            11967,  10000,  -- Dream Pants
            14519,  10000,  -- Dream Robe
            11965,  10000,   -- Dream Trousers
        };
        tpz.shop.general(player, stock_8);
        player:PrintToPlayer("Event Items!", 0xF);
		
		elseif (page == 9) then
        local stock_9 =
        {
            11318,  12500, -- Otokoeshi Yukata
            11319,  12500, -- Ominaeshi Yukata
            11861,  15000, -- Hikogami Yukata
            11862,  15000, -- Himegami Yukata
            13821,  3750,  -- Lord's Yukata
            13822,  3750,  -- Lady's Yukata
            14532,  5000,  -- Otoko Yukata
            14533,  5000,  -- Onago Yukata
            14534,  7500,  -- Otokogimi Yukata
            14535,  7500,  -- Onnagimi Yukata
            28149,  15000, -- Kengyu Hanmomohiki
            28150,  15000, -- Shokujo Hanmomohiki
			14457,  7500,  -- Hume Gilet +1
            15415,  7500,  -- Hume Trunks +1
            14458,  7500,  -- hume top +1
            15416,  7500,  -- hume shorts +1
            14459,  7500,  -- elvaan gilet +1
            15417,  7500,  -- elvaan trunks +1
            14460,  7500,  -- elvaan top +1
            15418,  7500,  -- elvaan shorts +1
            14462,  7500,  -- mithra top +1
            15420,  7500,  -- mithra shorts +1
            14463,  7500,  -- galka gilet +1
            15421,  7500,  -- galka trunks +1
            14461,  7500,  -- tarutaru maillot +1
            15419,  7500,  -- tarutaru trunks +1
            14472,  7500,  -- tarutaru top +1
            15424,  7500,  -- tarutaru shorts +1
			11273,  7500,  -- custom Gilet +1
            16329,  7500,  -- custom Trunks +1
            11274,  7500,  -- custom top +1
            16330,  7500,  -- custom shorts +1
            11275,  7500,  -- magna gilet +1
            16331,  7500,  -- magna trunks +1
            11276,  7500,  -- magna top +1
            16332,  7500,  -- magna shorts +1
            11279,  7500,  -- savage top +1
            16335,  7500,  -- savage shorts +1
            11280,  7500,  -- elder gilet +1
            16336,  7500,  -- elder trunks +1
            11277,  7500,  -- wonder maillot +1
            16333,  7500,  -- wonder trunks +1
            11278,  7500,  -- wonder top +1
            16334,  7500,  -- wonder shorts +1
			10264,  7500,  -- marine Gilet +1
            10338,  7500,  -- marine boxers +1
            10265,  7500,  -- marine top +1
            10339,  7500,  -- marine shorts +1
            10266,  7500,  -- woodsy gilet +1
            10340,  7500,  -- woodsy boxers +1
            10267,  7500,  -- woodsy top +1
            10341,  7500,  -- woodsy shorts +1
            10270,  7500,  -- river top +1
            10344,  7500,  -- river shorts +1
            10271,  7500,  -- dune gilet +1
            10345,  7500,  -- dune boxers +1
            10268,  7500,  -- creek maillot +1
            10342,  7500,  -- creek boxers +1
            10269,  7500,  -- creek top +1
            10343,  7500,  -- creek shorts +1
			27805,  7500,  -- rustic maillot +1
            28088,  7500,  -- rustic trunks +1
            27806,  7500,  -- shoal maillot +1
            28089,  7500,  -- shoal trunks +1
			27292,  7500,  -- swimming togs +1
			26966,  7500,  -- Ta Moko +1
        };
        tpz.shop.general(player, stock_9);
        player:PrintToPlayer("More event items!", 0xF);
		
		elseif (page == 10) then
        local stock_10 =
        {
		-- arrows
4196, 10000,
4219, 10000,
4220, 10000,
4221, 10000,
4223, 10000,
4224, 10000,
4225, 10000,
4226, 10000,
5271, 10000,
5272, 10000,
5273, 10000,
5274, 10000,
5275, 10000,
5276, 10000,
5277, 10000,
5332, 10000,
5333, 10000,
5819, 10000,
5871, 10000,
5872, 10000,
5912, 10000,
15956, 10000,
15957, 10000,
15958, 10000,
-- bolts
4227, 10000,
4228, 10000,
4229, 10000,
5334, 10000,
5335, 10000,
5336, 10000,
5337, 10000,
5338, 10000,
5339, 10000,
5820, 10000,
5821, 10000,
5913, 10000,
-- bullets
5340, 10000,
5341, 10000,
5342, 10000,
5353, 10000,
5359, 10000,
5363, 10000,
5416, 10000,
5822, 10000,
5823, 10000,
5873, 10000,
5914, 10000,
5915, 10000,
-- shuriken
6297, 10000,
6298, 10000,
6299, 10000,
6300, 10000,
6302, 10000,
6447, 10000,
6448, 10000,
        };
        tpz.shop.general(player, stock_10);
        player:PrintToPlayer("Whatever you do, don't take an arrow to the knee..", 0xF);

elseif (page == 11) then
        local stock_11 =
        {
                272,    20000,    -- Ark Angel HM. Statue
                273,    20000,    -- Ark Angel EV. Statue
                274,    20000,    -- Ark Angel TT. Statue
                275,    20000,    -- Ark Angel MR. Statue
                276,    20000,    -- Ark Angel GK. Statue
                18912,  20000,    -- Ark Saber
                18913,  20000,    -- Ark Sword
                18563,  20000,    -- Ark Scythe
                18545,  20000,    -- Ark Tabar
                18464,  20000,    -- Ark Tachi
                1550,   50000,    -- Ark Pentasphere                
				5717,   1,        -- M&P Doner Kebab
                5639,   5000,     -- M&P Chicken
                5640,   5000,     -- M&P Cracker
                5641,   5000,     -- M&P Dumpling
                265,    10000,    -- Adamantoise Statue
                266,    10000,    -- Behemoth Statue
                267,    10000,    -- Fafnir Statue
                268,    10000,    -- Nomad Moogle Statue
                269,    10000,    -- Shadow Lord Statue
                1255,   500000,   -- Fire Ore
                1256,   500000,   -- Ice Ore
                1257,   500000,   -- Wind Ore
                1258,   500000,   -- Earth Ore
                1259,   500000,   -- Lightning Ore
                1260,   500000,   -- Water Ore
				1261,   500000,   -- Light Ore
				1262,   500000,   -- Dark Ore
        };
        tpz.shop.general(player, stock_11);
        player:PrintToPlayer("Hero Shop..", 0xF);	

        elseif (page == 12) then
        local stock_12 =
        {
        12434 ,1, -- Genbu's Kabuto
        12562 ,1, -- Kirin's Osode
        12690 ,1, -- Seiryu's Kote
        12818 ,1, -- Byakko's Haidate
        12946 ,1, -- Suzaku's Sune-Ate

        16106 ,1, -- Askar Zucchetto
        14568 ,1, -- Askar Korazin
        14983 ,1, -- Askar Manopolas
        15647 ,1, -- Askar Dirs
        15733 ,1, -- Askar Gambieras

        15240 ,1, -- Homam Zucchetto
        14488 ,1, -- Homam Corazza
        14905 ,1, -- Homam Manopolas
        15576 ,1, -- Homam Cosciales
        15661 ,1, -- Homam Gambieras

        12108 ,1, -- Ebon Celata
        12144 ,1, -- Ebon Cuirass
        12180 ,1, -- Ebon Dastanas
        12216 ,1, -- Ebon Cuisses
        12252 ,1, -- Ebon Sabatons

        12111 ,1, -- Ebon Helm
        12147 ,1, -- Ebon Mail
        12183 ,1, -- Ebon Mufflers
        12219 ,1, -- Ebon Breeches
        12255 ,1, -- Ebon Greaves

        12114 ,1, -- Ebon Galea
        12150 ,1, -- Ebon Haubert
        12186 ,1, -- Ebon Moufles
        12222 ,1, -- Ebon Brayettes
        12258 ,1, -- Ebon Sollerets

        12117 ,1, -- Ebon Armet
        12153 ,1, -- Ebon Breastplate
        12189 ,1, -- Ebon Gauntlets
        12225 ,1, -- Ebon Hose
        12261 ,1, -- Ebon Leggings

        12120 ,1, -- Ebon Mask
        12156 ,1, -- Ebon Harness
        12192 ,1, -- Ebon Gloves
        12228 ,1, -- Ebon Brais
        12264 ,1, -- Ebon Boots

        12123 ,1, -- Ebon Visor
        12159 ,1, -- Ebon Jerkin
        12195 ,1, -- Ebon Bracers
        12231 ,1, -- Ebon Braccae
        12267 ,1, -- Ebon Socks

        12126 ,1, -- Shikkoku Hatsuburi
        12162 ,1, -- Shikkoku Togi
        12198 ,1, -- Shikkoku Kote
        12234 ,1, -- Shikkoku Haidate
        12270 ,1, -- Shikkoku Sune-Ate

        12129 ,1, -- Ebon Headgear
        12165 ,1, -- Ebon Vest
        12201 ,1, -- Ebon Wristbands
        12237 ,1, -- Ebon Tights
        12273 ,1, -- Ebon Gaiters

        12132 ,1, -- Ebon Tam
        12168 ,1, -- Ebon Talar
        12204 ,1, -- Ebon Gants
        12240 ,1, -- Ebon Slacks
        12276 ,1, -- Ebon Brogues

        12135 ,1, -- Ebon Hat
        12171 ,1, -- Ebon Coat
        12207 ,1, -- Ebon Cuffs
        12243 ,1, -- Ebon Pants
        12279 ,1, -- Ebon Sabots

        12138 ,1, -- Ebon Caubeen
        12174 ,1, -- Ebon Bliaut
        12210 ,1, -- Ebon Gages
        12246 ,1, -- Ebon Spats
        12282 ,1, -- Ebon Galoshes

        12141 ,1, -- Ebon Beret
        12177 ,1, -- Ebon Frock
        12213 ,1, -- Ebon Mitts
        12249 ,1, -- Ebon Slops
        12285 ,1, -- Ebon Clogs
        };
        tpz.shop.general(player, stock_12);
        player:PrintToPlayer("Gear Shop..", 0xF);

elseif (page == 13) then
        local stock_13 =
        {
        12109 ,1, -- Furia Celata
        12145 ,1, -- Furia Cuirass
        12181 ,1, -- Furia Dastanas
        12217 ,1, -- Furia Cuisses
        12253 ,1, -- Furia Sabatons

        12112 ,1, -- Furia Helm
        12148 ,1, -- Furia Mail
        12184 ,1, -- Furia Mufflers
        12220 ,1, -- Furia Breeches
        12256 ,1, -- Furia Greaves

        12115 ,1, -- Furia Galea
        12151 ,1, -- Furia Haubert
        12187 ,1, -- Furia Moufles
        12223 ,1, -- Furia Brayettes
        12259 ,1, -- Furia Sollerets

        12118 ,1, -- Furia Armet
        12154 ,1, -- Furia Breastplate
        12190 ,1, -- Furia Gauntlets
        12226 ,1, -- Furia Hose
        12262 ,1, -- Furia Leggings

        12121 ,1, -- Furia Mask
        12157 ,1, -- Furia Harness
        12193 ,1, -- Furia Gloves
        12229 ,1, -- Furia Brais
        12265 ,1, -- Furia Boots

        12124 ,1, -- Furia Visor
        12160 ,1, -- Furia Jerkin
        12196 ,1, -- Furia Bracers
        12232 ,1, -- Furia Braccae
        12268 ,1, -- Furia Socks

        12127 ,1, -- Shinku Hatsuburi
        12163 ,1, -- Shinku Togi
        12199 ,1, -- Shinku Kote
        12235 ,1, -- Shinku Haidate
        12271 ,1, -- Shinku Sune-Ate

        12130 ,1, -- Furia Headgear
        12166 ,1, -- Furia Vest
        12202 ,1, -- Furia Wristbands
        12238 ,1, -- Furia Tights
        12274 ,1, -- Furia Gaiters

		12133 ,1, -- Furia Tam
		12169 ,1, -- Furia Talar
		12205 ,1, -- Furia Gants
		12241 ,1, -- Furia Slacks
		12277 ,1, -- Furia Brogues

		12136 ,1, -- Furia Hat
		12172 ,1, -- Furia Coat
		12208 ,1, -- Furia Cuffs
		12244 ,1, -- Furia Pants
		12280 ,1, -- Furia Sabots

		12139 ,1, -- Furia Caubeen
		12175 ,1, -- Furia Bliaut
		12211 ,1, -- Furia Gages
		12247 ,1, -- Furia Spats
		12283 ,1, -- Furia Galoshes

		12142 ,1, -- Furia Beret
		12178 ,1, -- Furia Frock
		12214 ,1, -- Furia Mitts
		12250 ,1, -- Furia Slops
		12286 ,1, -- Furia Clogs
        };
        tpz.shop.general(player, stock_13);
        player:PrintToPlayer("Gear Shop 2..", 0xF);

elseif (page == 14) then
        local stock_14 =
        {
    12110 ,1, -- Ebur Celata
	12146 ,1, -- Ebur Cuirass
	12182 ,1, -- Ebur Dastanas
	12218 ,1, -- Ebur Cuisses
	12254 ,1, -- Ebur Sabatons

	12113 ,1, -- Ebur Helm
	12149 ,1, -- Ebur Mail
	12185 ,1, -- Ebur Mufflers
	12221 ,1, -- Ebur Breeches
	12257 ,1, -- Ebur Greaves

	12116 ,1, -- Ebur Galea
	12152 ,1, -- Ebur Haubert
	12188 ,1, -- Ebur Moufles
	12224 ,1, -- Ebur Brayettes
	12260 ,1, -- Ebur Sollerets

	12119 ,1, -- Ebur Armet
	12155 ,1, -- Ebur Breastplate
	12191 ,1, -- Ebur Gauntlets
	12227 ,1, -- Ebur Hose
	12263 ,1, -- Ebur Leggings

	12122 ,1, -- Ebur Mask
	12158 ,1, -- Ebur Harness
	12194 ,1, -- Ebur Gloves
	12230 ,1, -- Ebur Brais
	12266 ,1, -- Ebur Boots

	12125 ,1, -- Ebur Visor
	12161 ,1, -- Ebur Jerkin
	12197 ,1, -- Ebur Bracers
	12233 ,1, -- Ebur Braccae
	12269 ,1, -- Ebur Socks

	12128 ,1, -- Ginhaku Hatsuburi
	12164 ,1, -- Ginhaku Togi
	12200 ,1, -- Ginhaku Kote
	12236 ,1, -- Ginhaku Haidate
	12272 ,1, -- Ginhaku Sune-Ate

	12131 ,1, -- Ebur Headgear
	12167 ,1, -- Ebur Vest
	12203 ,1, -- Ebur Wristbands
	12239 ,1, -- Ebur Tights
	12275 ,1, -- Ebur Gaiters

	12134 ,1, -- Ebur Tam
	12170 ,1, -- Ebur Talar
	12206 ,1, -- Ebur Gants
	12242 ,1, -- Ebur Slacks
	12278 ,1, -- Ebur Brogues

	12137 ,1, -- Ebur Hat
	12173 ,1, -- Ebur Coat
	12209 ,1, -- Ebur Cuffs
	12245 ,1, -- Ebur Pants
	12281 ,1, -- Ebur Sabots

	12140 ,1, -- Ebur Caubeen
	12176 ,1, -- Ebur Bliaut
	12212 ,1, -- Ebur Gages
	12248 ,1, -- Ebur Spats
	12284 ,1, -- Ebur Galoshes

	12143 ,1, -- Ebur Beret
	12179 ,1, -- Ebur Frock
	12215 ,1, -- Ebur Mitts
	12251 ,1, -- Ebur Slops
	12287 ,1, -- Ebur Clogs
        };
        tpz.shop.general(player, stock_14);
        player:PrintToPlayer("Gear Shop 3", 0xF);		

    else
        player:PrintToPlayer( string.format( "Page %i not found.", page ) );
    end
end