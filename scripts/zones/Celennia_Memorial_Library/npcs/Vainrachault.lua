local ID = require("scripts/zones/Celennia_Memorial_Library/IDs")

function onTrigger(player, npc, trade)						
						
		local count = trade:getItemCount();
		local prize = trade:getItem(0);
		local a1 = 0;
		local a2 = 0;
		local a3 = 0;
		local a4 = 0;
		local v1 = 0;
		local v2 = 0;
		local v3 = 0;
		local v4 = 0;
		
	if trade:getItem(0) == 16869 then 	
    elseif trade:getItem(1) == 4096 then   
         a1 = 1080
         v1 = 31
    elseif trade:getItem(2) == 4097 then  
         a2 = 326
         v2 = 31
    elseif trade:getItem(3) == 4098 then  
         a3 = 353
         v3 = 31
    elseif trade:getItem(4) == 4099 then  
         a4 = 44
         v4 = 31
    end	
	         
   if(player:getFreeSlotsCount() >= 1) then
      player:tradeComplete();
      player:addItem(prize,1,a1,v1,a2,v2,a3,v3,a4,v4);
      player:messageSpecial(ITEM_OBTAINED,prize);
   else
      player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,prize);
   end
end;