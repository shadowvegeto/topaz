-------------------------------------------
-- Magian trials
-------------------------------------------
require("scripts/globals/msg")
require("scripts/globals/zone")

playerTrials = playerTrials or {}

-- packs current trials into params for onTrigger
local function parseParams(player)
    local paramTrials = {}
    for _,v in pairs(readTrials(player)) do
        if v.trial > 0 then table.insert(paramTrials, v.trial) end
    end
    local params = {0,0,0,0,0}
    for i = 1, #paramTrials, 2 do
        params[(i+1)/2] = paramTrials[i] + bit.lshift((paramTrials[i+1] or 0), 16)
    end
    return params, #paramTrials
end

-- creates table to track trial and progress per trial slot
function readTrials(player)
    local activeTrials = playerTrials[player:getID()]
    if activeTrials then
        return activeTrials
    end
    activeTrials = {}
    for i = 1, 10 do
        local trialBits = player:getCharVar("[trial]" .. i)
        local id = bit.rshift(trialBits, 17)
        local pr = bit.band(trialBits, 0x1FFFF)
        activeTrials[i] = { trial = id, progress = pr }
    end
    playerTrials[player:getID()] = activeTrials
    return activeTrials
end

-- trial id and progress
local function getTrial(player, i)
    local activeTrials = readTrials(player)
    local progress = activeTrials[i] and activeTrials[i].progress
    local trial = activeTrials[i] and activeTrials[i].trial
    return trial, progress
end

-- packs trial id and trial progress
local function setTrial(player, slot, trialId, progress)
    local activeTrials = readTrials(player)
    if trialId == activeTrials[slot].trial and progress == activeTrials[slot].progress then
        return
    end
    activeTrials[slot].trial = trialId
    activeTrials[slot].progress = progress or 0
    local trialBits = bit.lshift(trialId,17) + progress
    player:setCharVar("[trial]" .. slot, trialBits)
end

-- finds empty trial slot
local function firstEmptySlot(player)
    local activeTrials = playerTrials[player:getID()] or readTrials(player)
    for i = 1, 10 do
        local trialSlot = activeTrials[i].trial
        if trialSlot == 0 then
        return i
        end
    end
end

-- is player wearing the correct trial weapon?
local function checkEquipment(player, trialId)
    local main = player:getEquippedItem(tpz.slot.MAIN) and player:getEquippedItem(tpz.slot.MAIN):getTrialNumber()
    local off = player:getEquippedItem(tpz.slot.SUB) and player:getEquippedItem(tpz.slot.SUB):getTrialNumber()
    if main == trialId or off == trialId then
        return true
    end
end

-- increments progress if conditions are met
function checkMagianTrial(player, conditions)
    for i, v in pairs(readTrials(player)) do
        local trialId, progress = getTrial(player, i)
        if objectives[trialId] and objectives[trialId](player, conditions) and checkEquipment(player, trialId) then
            local t = GetMagianTrial(trialId)
            if progress >= t.objectiveTotal then
                progress = t.objectiveTotal
            else
                progress = progress + 1
                setTrial(player, i, trialId, progress)
                remainingObjectives = t.objectiveTotal - progress
                if remainingObjectives == 0 then
                    player:messageBasic(tpz.msg.basic.MAGIAN_TRIAL_COMPLETE, trialId) -- trial complete
                else
                    player:messageBasic(tpz.msg.basic.MAGIAN_TRIAL_COMPLETE - 1, trialId, remainingObjectives) -- trial <trialid>: x objectives remain
                end
                break
            end
        end
    end
end

-- builds augment params for required items
local function reqAugmentParams(t)
    local leftAug1 = bit.lshift(t.reqItemAugValue1, 11) + t.reqItemAug1
    local rightAug1 = bit.lshift(t.reqItemAugValue2, 11) + t.reqItemAug2
    local augBits1 = bit.lshift(leftAug1, 16) + rightAug1
    local leftAug2 = bit.lshift(t.reqItemAugValue3, 11) + t.reqItemAug3
    local rightAug2 = bit.lshift(t.reqItemAugValue4, 11) + t.reqItemAug4
    local augBits2 = bit.lshift(leftAug2, 16) + rightAug2
    return augBits1, augBits2
end

-- builds augment params for reward items
local function rewardAugmentParams(t)
    local leftAug1 = bit.lshift(t.rewardItemAugValue1, 11) + t.rewardItemAug1
    local rightAug1 = bit.lshift(t.rewardItemAugValue2, 11) + t.rewardItemAug2
    local augBits1 = bit.lshift(leftAug1, 16) + rightAug1
    local leftAug2 = bit.lshift(t.rewardItemAugValue3, 11) + t.rewardItemAug3
    local rightAug2 = bit.lshift(t.rewardItemAugValue4, 11) + t.rewardItemAug4
    local augBits2 = bit.lshift(leftAug2, 16) + rightAug2
    return augBits1, augBits2
end

  -- table of anon functions keyed with trial IDs called by checkMagianTrial
  objectives =
{
  [   2] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17563801 -- Nocuous Weapon
         end,

  [   3] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17227972 or conditions.mob:getID() == 17227992) -- Black Triple Stars
         end,

  [   4] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16793646 -- Serra
         end,

  [   5] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 16822423 or conditions.mob:getID() == 16822427) -- Bugbear Strongman
         end,

  [   6] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17121576 -- La Velue
         end,

  [   7] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17596628 -- Hovering Hotpot
         end,

  [   8] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17191325 or conditions.mob:getID() == 17109384 or conditions.mob:getID() == 17113491) -- Yacumama
         end,

  [   9] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17334552 or conditions.mob:getID() == 17338598) -- Feuerunke
         end,

  [1092] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195484) -- Tammuz
         end,

  [  68] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17195259 -- Tumbling Truffle
         end,

  [  69] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17260907 -- Helldiver
         end,

  [  70] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16785676 -- Orctrap
         end,

  [  71] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16793742 -- Intulo
         end,

  [  72] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17166705 -- Ramponneau
         end,

  [  73] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17272978 -- Keeper of Halidom
         end,

  [  74] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17138077 or conditions.mob:getID() == 17146177) -- Shoggoth
         end,

  [  75] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17166769 or conditions.mob:getID() == 17174908) -- Farruca Fly
         end,

  [1138] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195485) -- Chesma
         end,

  [ 150] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17256563 or conditions.mob:getID() == 17256690) -- Serpopard Ishtar
         end,

  [ 151] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17207476 -- Tottering Toby
         end,

  [ 152] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17228236 -- Drooling Daisy
         end,

  [ 153] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17232079 -- Gargantua
         end,

  [ 154] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16875741 -- Megalobugard
         end,

  [ 155] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17170475 -- Ratatoskr
         end,

  [ 156] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17174909 or conditions.mob:getID() == 17166770) -- Jyeshtha
         end,

  [ 157] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17191326 or conditions.mob:getID() == 17109385 or conditions.mob:getID() == 17113492) -- Capricornus
         end,

  [1200] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195484) -- Tammuz
         end,

  [ 216] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17224019 -- Bloodpool Vorax
         end,

  [ 217] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17199564 -- Golden Bat
         end,

  [ 218] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17293389 -- Slippery Sucker
         end,

  [ 219] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17498301 -- Seww the Squidlimbed
         end,

  [ 220] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17137705 -- Ankabut
         end,

  [ 221] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16879847 -- Okyupete
         end,

  [ 222] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17178923 -- Urd
         end,

  [ 223] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17138078 or conditions.mob:getID() == 17146178) -- Lamprey Lord
         end,

  [1246] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195485) -- Chesma
         end,

  [ 282] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17203585 or conditions.mob:getID() == 17203642) -- Panzer Percival
         end,

  [ 283] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17379450 -- Ge'Dha Evileye
         end,

  [ 284] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17268788 -- Bashe
         end,

  [ 285] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16793742 -- Intulo
         end,

  [ 286] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17166705 -- Ramponneau
         end,

  [ 287] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17272978 -- Keeper of Halidom
         end,

  [ 288] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17138077 or conditions.mob:getID() == 17146177) -- Shoggoth
         end,

  [ 289] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17166769 or conditions.mob:getID() == 17174908) -- Farruca Fly
         end,

  [1293] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195484) -- Tammuz
         end,

  [ 364] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17371515 -- Hoo Mjuu the Torrent
         end,

  [ 365] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17264818 -- Daggerclaw Dracos
         end,

  [ 366] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17498184 -- Namtar
         end,

  [ 367] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17232079 -- Gargantua
         end,

  [ 368] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16875741 -- Megalobugard
         end,

  [ 369] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17170475 -- Ratatoskr
         end,

  [ 370] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17174909 or conditions.mob:getID() == 17166770) -- Jyeshtha
         end,

  [ 371] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17191326 or conditions.mob:getID() == 17109385 or conditions.mob:getID() == 17113492) -- Capricornus
         end,

  [1354] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195485) -- Chesma
         end,

  [ 512] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17555721 -- Barbastelle
         end,

  [ 513] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17571903 -- Ah Puch
         end,

  [ 514] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17567801 -- Donggu
         end,

  [ 515] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 16822423 or conditions.mob:getID() == 16822427) -- Bugbear Strongman
         end,

  [ 516] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17121576 -- La Velue
         end,

  [ 517] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17596628 -- Hovering Hotpot
         end,

  [ 518] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17191325 or conditions.mob:getID() == 17109384 or conditions.mob:getID() == 17113491) -- Yacumama
         end,

  [ 519] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17334552 or conditions.mob:getID() == 17338598) -- Feuerunke
         end,

  [1462] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195484) -- Tammuz
         end,

  [ 430] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17563785 -- Slendlix Spindlethumb
         end,

  [ 431] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17256836 -- Herbage Hunter
         end,

  [ 432] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17232044 -- Kirata
         end,

  [ 433] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16793742 -- Intulo
         end,

  [ 434] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17166705 -- Ramponneau
         end,

  [ 435] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17272978 -- Keeper of Halidom
         end,

  [ 436] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17138077 or conditions.mob:getID() == 17146177) -- Shoggoth
         end,

  [ 437] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17166769 or conditions.mob:getID() == 17174908) -- Farruca Fly
         end,

  [1400] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195485) -- Chesma
         end,

  [ 578] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17363208 -- Zi'Ghi Boneeater
         end,

  [ 579] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17195317 -- Lumbering Lambert
         end,

  [ 580] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17268851 -- Deadly Dodo
         end,

  [ 581] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17232079 -- Gargantua
         end,

  [ 582] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16875741 -- Megalobugard
         end,

  [ 583] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17170475 -- Ratatoskr
         end,

  [ 584] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17174909 or conditions.mob:getID() == 17166770) -- Jyeshtha
         end,

  [ 585] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17191326 or conditions.mob:getID() == 17109385 or conditions.mob:getID() == 17113492) -- Capricornus
         end,

  [1508] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195484) -- Tammuz
         end,

  [ 644] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17371578 -- Vuu Puqu the Beguiler
         end,

  [ 645] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17261003 -- Buburimboo
         end,

  [ 646] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17379564 -- Zo'Khu Blackcloud
         end,

  [ 647] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17498301 -- Seww the Squidlimbed
         end,

  [ 648] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17137705 -- Ankabut
         end,

  [ 649] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16879847 -- Okyupete
         end,

  [ 650] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17178923 -- Urd
         end,

  [ 651] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17138078 or conditions.mob:getID() == 17146178) -- Lamprey Lord
         end,

  [1554] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195485) -- Chesma
         end,

  [ 710] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17219795 or conditions.mob:getID() == 17219933) -- Stray Mary
         end,

  [ 711] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17387567 -- Hawkeyed Dnatbat
         end,

  [ 712] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17244396 -- Dune Widow
         end,

  [ 713] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17498301 -- Seww the Squidlimbed
         end,

  [ 714] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17137705 -- Ankabut
         end,

  [ 715] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16879847 -- Okyupete
         end,

  [ 716] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17178923 -- Urd
         end,

  [ 717] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17138078 or conditions.mob:getID() == 17146178) -- Lamprey Lord
         end,

  [1600] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195485) -- Chesma
         end,

  [ 776] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17559584 -- Teporingo
         end,

  [ 777] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17199438 -- Valkurm Emperor
         end,

  [ 778] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17457236 -- Hyakume
         end,

  [ 779] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17137821 -- Gloomanita
         end,

  [ 780] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17281149 -- Mischievous Micholas
         end,

  [ 781] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17289560 -- Cactuar Cantautor
         end,

  [ 782] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17334553 or conditions.mob:getID() == 17338599) -- Erebus
         end,

  [ 783] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17178924) -- Skuld
         end,

  [1646] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195485) -- Chesma
         end,

  [ 941] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17363258 -- Be'Hya Hundredwall
         end,

  [ 942] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17092898 -- Jolly Green
         end,

  [ 943] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17588278 -- Trembler Tabitha
         end,

  [ 944] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17498301 -- Seww the Squidlimbed
         end,

  [ 945] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17137705 -- Ankabut
         end,

  [ 946] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 16879847 -- Okyupete
         end,

  [ 947] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17178923 -- Urd
         end,

  [ 948] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17138078 or conditions.mob:getID() == 17146178) -- Lamprey Lord
         end,

  [1788] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195485) -- Chesma
         end,

  [ 891] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17571870 -- Desmodont
         end,

  [ 892] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17395816 -- Moo Ouzi the Swiftblade
         end,

  [ 893] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17223797 -- Ni'Zho Bladebender
         end,

  [ 894] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 16822423 or conditions.mob:getID() == 16822427) -- Bugbear Strongman
         end,

  [ 895] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17121576 -- La Velue
         end,

  [ 896] = function (player, conditions)
             return conditions.mob and conditions.mob:getID() == 17596628 -- Hovering Hotpot
         end,

  [ 897] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17191325 or conditions.mob:getID() == 17109384 or conditions.mob:getID() == 17113491) -- Yacumama
         end,

  [ 898] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17334552 or conditions.mob:getID() == 17338598) -- Feuerunke
         end,

  [1758] = function (player, conditions)
             return conditions.mob and (conditions.mob:getID() == 17195484) -- Tammuz
         end,
}
-------------------
-- Magian Orange --
-------------------

function magianOrangeOnTrigger(player, npc)
    local activeTrials = readTrials(player)
    local p, t = parseParams(player)

    if player:getMainLvl() < 75 then
        player:startEvent(10121) -- can't take a trial before lvl 75

    elseif (player:hasKeyItem(tpz.ki.MAGIAN_TRIAL_LOG) == false) then
        player:startEvent(10122) -- player can start magian for the first time

    else
        player:startEvent(10123,p[1],p[2],p[3],p[4],p[5],0,0,t) -- standard dialogue
    end
end

-- set of non-weapon type items that can take trials
local typeExceptions =
{
  [16191] = true,
  [16192] = true,
  [16193] = true,
  [16194] = true,
  [11926] = true,
  [16199] = true,
  [16200] = true,
  [16198] = true,
  [16197] = true,
  [16196] = true,
  [16195] = true,
  [15070] = true,
  [11927] = true,
  [18573] = true,
  [18571] = true,
  [18574] = true,
  [18575] = true,
  [18576] = true,
  [18839] = true,
  [18342] = true,
  [18572] = true,
  [18577] = true,
  [18578] = true,
  [18579] = true,
  [18580] = true,
  [18840] = true
}

function magianOrangeOnTrade(player,npc,trade)
    local itemId = trade:getItemId()
    local item = trade:getItem()
    local matchId = item:getMatchingTrials()
    local trialId = item:getTrialNumber()
    local t = GetMagianTrial(trialId)
    local zoneid = player:getZoneID()
    local msg = zones[zoneid].text
    local _, pt = parseParams(player)

    player:setLocalVar("storeItemId", itemId)

    -- item traded isn't a weapon
    if (not typeExceptions[itemId] and not item:isType(tpz.itemType.WEAPON)) then
        player:messageSpecial(msg.ITEM_NOT_WEAPON_MAGIAN)
        return

    -- player can only keep 10 trials at once
    elseif pt >= 10 and trialId == 0 then
        player:startEvent(10124,0,0,0,0,0,0,0,-255)
        return

    elseif trialId ~= 0 then
        for i, v in pairs(readTrials(player)) do
            if v.trial == trialId then
                player:setLocalVar("storeTrialId", trialId)
                player:tradeComplete()

                if v.progress >= t.objectiveTotal then
                    player:startEvent(10129,0,0,0,t.rewardItem,0,0,0,itemId) -- completes trial

                else
                    player:startEvent(10125,trialId,itemId,0,0,v,0,0,-2) -- checks status of trial
                end
                return
            end
        end
            -- item has trial, player does not
            player:setLocalVar("storeTrialId", trialId)
            player:startEvent(10125,trialId,t.reqItem,0,0,0,0,0,-3)
            player:tradeComplete()
            return

    elseif next(matchId) then
        player:setLocalVar("storeTrialId", matchId[1])
        player:tradeComplete()
        player:startEvent(10124,matchId[1],matchId[2],matchId[3],matchId[4],0,itemId) -- starts trial
        return
    else
        player:setLocalVar("invalidItem", 1)
        player:startEvent(10124,0,0,0,0,0,0,0,-1) -- invalid weapon
    end
end

--[[
     - 00000 - 00000000000 - 00000 - 00000000000 -
       aug1     aug1 id      aug2     aug2 id
      value                 value
                                                  ]]--

function magianOrangeEventUpdate(player,itemId,csid,option)
    local optionMod = bit.band(option, 0xFF)

    -- 10123 = trigger, 10124 = initial trade, 10125 = in-progress trade
    if (csid == 10123 or csid == 10124 or csid == 10125) and optionMod == 1 then
        local trialId = bit.rshift(option, 16)
        local t = GetMagianTrial(trialId)
        local a1, a2 = reqAugmentParams(t)
        player:updateEvent(2,a1,a2,t.reqItem,0,0,t.trialTarget)
    end

    if (csid == 10123 or csid == 10124 or csid == 10125) and optionMod == 2 then
        local trialId = bit.rshift(option, 16)
        local t = GetMagianTrial(trialId)

        for i = 1, 10 do
            tr, pr = getTrial(player, i)
            if tr == trialId then
                progress = pr
                break
            end
        end
        player:updateEvent(t.objectiveTotal,0,progress,0,0,t.element)
    end

    if (csid == 10123 or csid == 10124 or csid == 10125) and optionMod == 3 then
        local trialId = bit.rshift(option, 16)
        local t = GetMagianTrial(trialId)
        local a1, a2 = rewardAugmentParams(t)
        player:updateEvent(2,a1,a2,t.rewardItem,0,t.objectiveItem)
    end

    if (csid == 10123 or csid == 10124 or csid == 10125) and optionMod == 4 then
        local trialId = bit.rshift(option, 16)
        local t = GetMagianTrial(trialId)
        player:updateEvent(t.resultTrial1,t.resultTrial2,t.resultTrial3,t.resultTrial4,t.prevTrial,t.objectiveItem)
    end

    -- lists trials to abandon
    if csid == 10123 and optionMod == 5 then
        local p, t = parseParams(player)
        player:updateEvent(p[1],p[2],p[3],p[4],p[5],0,0,t)
    end

    -- abandon trial through menu
    if csid == 10123 and optionMod == 6 then
        local trialId = bit.rshift(option, 8)
        for i = 1, 10 do
            local tr, _ = getTrial(player, i)
            if tr == trialId then
                player:updateEvent(0,0,0,0,0,i)
                setTrial(player, i, 0, 0)
                break
            end
        end
    end

    -- checks if trial is already in progress
    if csid == 10124 and optionMod == 7 then
        local trialId = bit.rshift(option, 8)
        local t = GetMagianTrial(trialId)
        local a1, a2 = reqAugmentParams(t)
        for i = 1, 10 do
            local tr, _ = getTrial(player, i)
            if tr == trialId then
                player:updateEvent(0,0,0,0,0,0,0,-1)
                return
            end
        end
        player:updateEvent(2,a1,a2,t.reqItem)
    end

    -- checks if item's level will increase
    if csid == 10124 and optionMod == 13 then
        local trialId = bit.rshift(option, 8)
        local t = GetMagianTrial(trialId)
        local reqItem = GetItem(t.reqItem)
        local rewardItem = GetItem(t.rewardItem)
        if reqItem:getReqLvl() < rewardItem:getReqLvl() then
            player:updateEvent(1)
        else
            player:updateEvent(0)
        end
    end

    rareItems =
    {
      [16192] = true,
      [18574] = true,
      [19397] = true,
      [19398] = true,
      [19399] = true,
      [19400] = true,
      [19401] = true,
      [19402] = true,
      [19403] = true,
      [19404] = true,
      [19405] = true,
      [19406] = true,
      [19407] = true,
      [19408] = true,
      [19409] = true,
      [19410] = true,
    }

    -- checks if player already owns reward item (if it's rare)
    if csid == 10124 and optionMod == 14 then
        local trialId = bit.rshift(option, 8)
        local t = GetMagianTrial(trialId)
        if (player:hasItem(t.rewardItem) and rareItems[t.rewardItem] == true) then
            player:updateEvent(1)
        else
            player:updateEvent(0)
        end
    end

    -- abandoning trial through trade
    if csid == 10125 and (optionMod == 8 or optionMod == 11) then
        local trialId = bit.rshift(option, 8)
        local t = GetMagianTrial(trialId)
        player:updateEvent(0,0,0,t.reqItem)
    end
end

function magianOrangeOnEventFinish(player,itemId,csid,option)
    local optionMod = bit.band(option, 0xFF)
    local zoneid = player:getZoneID()
    local msg = zones[zoneid].text

    if csid == 10122 and optionMod == 1 then
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,tpz.ki.MAGIAN_TRIAL_LOG)
        player:addKeyItem(tpz.ki.MAGIAN_TRIAL_LOG)

    -- starts a trial
    elseif csid == 10124 and optionMod == 7 then
        local trialId = bit.rshift(option, 8)
        local t = GetMagianTrial(trialId)
        player:addItem(t.reqItem,1,t.reqItemAug1,t.reqItemAugValue1,t.reqItemAug2,t.reqItemAugValue2,t.reqItemAug3,t.reqItemAugValue3,t.reqItemAug4,t.reqItemAugValue4,trialId)
        player:messageSpecial(msg.RETURN_MAGIAN_ITEM, t.reqItem)
        setTrial(player, firstEmptySlot(player), trialId, 0)
        player:setLocalVar("storeTrialId", 0)
        player:setLocalVar("storeItemId", 0)

    -- returns item to player
   elseif csid == 10125 and (optionMod == 0 or optionMod == 4) then
        local trialId = player:getLocalVar("storeTrialId")
        local t = GetMagianTrial(trialId)
        player:addItem(t.reqItem,1,t.reqItemAug1,t.reqItemAugValue1,t.reqItemAug2,t.reqItemAugValue2,t.reqItemAug3,t.reqItemAugValue3,t.reqItemAug4,t.reqItemAugValue4,trialId)
        player:messageSpecial(msg.RETURN_MAGIAN_ITEM, t.reqItem)
        player:setLocalVar("storeTrialId", 0)

    elseif csid == 10124 and (optionMod == 0 or option == -1) then
        local trialId = player:getLocalVar("storeTrialId")
        local itemId = player:getLocalVar("storeItemId")
        local t = GetMagianTrial(trialId)
        if player:getLocalVar("invalidItem") ~= 1 then
            player:addItem(t.reqItem,1,t.reqItemAug1,t.reqItemAugValue1,t.reqItemAug2,t.reqItemAugValue2,t.reqItemAug3,t.reqItemAugValue3,t.reqItemAug4,t.reqItemAugValue4)
        end
        player:messageSpecial(msg.RETURN_MAGIAN_ITEM, itemId)
        player:setLocalVar("invalidItem", 0)
        player:setLocalVar("storeTrialId", 0)
        player:setLocalVar("storeItemId", 0)


    -- gives back item after removing trial id
    elseif csid == 10125 and (optionMod == 8 or optionMod == 11) then
        local trialId = bit.rshift(option, 8)
        local t = GetMagianTrial(trialId)
        for i = 1, 10 do
            local tr, _ = getTrial(player, i)
            if tr == trialId then
                setTrial(player, i, 0, 0)
                break
            end
        end
        player:addItem(t.reqItem,1,t.reqItemAug1,t.reqItemAugValue1,t.reqItemAug2,t.reqItemAugValue2,t.reqItemAug3,t.reqItemAugValue3,t.reqItemAug4,t.reqItemAugValue4)
        player:messageSpecial(msg.RETURN_MAGIAN_ITEM, t.reqItem)

    -- finishes a trial
    elseif csid == 10129 and optionMod == 0 then
        local trialId = player:getLocalVar("storeTrialId")
        local t = GetMagianTrial(trialId)
        for i = 1, 10 do
            local tr, _ = getTrial(player, i)
            if tr == trialId then
                setTrial(player, i, 0, 0)
                break
            end
        end
        player:addItem(t.rewardItem,1,t.rewardItemAug1,t.rewardItemAugValue1,t.rewardItemAug2,t.rewardItemAugValue2,t.rewardItemAug3,t.rewardItemAugValue3,t.rewardItemAug4,t.rewardItemAugValue4)
        player:messageSpecial(msg.ITEM_OBTAINED, t.rewardItem)
        player:setLocalVar("storeTrialId", 0)
    end
end

-------------------
-- Magian Green  --
-------------------

function magianGreenEventUpdate(player,itemId,csid,option)
end

-------------------
-- Magian Blue   --
-------------------

function magianBlueEventUpdate(player,itemId,csid,option)
end
