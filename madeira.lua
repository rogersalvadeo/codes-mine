local bau = peripheral.wrap("minecraft:chest_1")
local barril = peripheral.wrap("minecraft:barrel_5")
 
 
local slot1 = true
local slot2 = true
local slot3 = true
 
 
local function check()
 
    slot1 = barril.getItemDetail(1) == nil
    slot2 = barril.getItemDetail(2) == nil
    slot3 = barril.getItemDetail(3) == nil
end
check()
 
function pegaMadeira()
for slot,item in pairs(bau.list()) do
    local it = bau.getItemDetail(slot)
    check()
    if (slot1 or slot2 or slot3) and it.displayName == "Oak Log" and item.count == 64 then
        bau.pushItems(peripheral.getName(barril),slot)
    end
    
end 
end
 
   
      
while true do
    
    pegaMadeira()
    sleep(600)
    
   end   
