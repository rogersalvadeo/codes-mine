local vault = peripheral.wrap("create:item_vault_1")
 
local items = {}
local monitor1, monitor2, monitor3 = peripheral.wrap("monitor_0"), peripheral.wrap("monitor_3"),peripheral.wrap("monitor_2")
local monitores = { monitor1, monitor2, monitor3 }

monitor1.setTextScale(1)
monitor2.setTextScale(1)
monitor3.setTextScale(1)


function update(item)
 
    for key,value in pairs(items) do
        if value.name==item.name then
            value.qtd = value.qtd+item.qtd
        end
    
    end
 
end
 
function insert(item)
--    print("insert")
--    print(item.name)
--    print(item.qtd)
 
    table.insert(items,item)
end
 
 
function contains(str,list) 
    local exist = false
    for key,value in pairs(list) do
        if value.name==str then
            exist = true
            break
        end
    end
    
    return exist
end
 
function populaLista()
 
    for k in pairs(items) do 
        items[k] = nil
    end
 
 
    for slot,item in pairs(vault.list()) do
        local it = vault.getItemDetail(slot)
        local food = {}
        
        food.name = it.displayName
        food.qtd = item.count
        if contains(food.name,items) then
            update(food)                  
        else
            insert(food)
        end
    end
end
 

populaLista()
 
 
--for key,value in pairs(items) do
--    print(value.name)
--    print(value.qtd)
--end
 





local function write(mon, x, y, text)
    mon.setCursorPos(x, y)
    mon.write(text)
end





local function exibirSaporra(lista, monitores)
    monitor1.clear()
    monitor2.clear()
    monitor3.clear()


    local max = 4
    local index = 1

    for i = 1, #lista, max do
        if index > #monitores then
            print("ja foi")
            break
        end

        local monitor = monitores[index]
        for j = 0, max - 1 do
            local itemIndex = i+j
            if lista[itemIndex] then
                write(monitor,1,j+1,string.format("%s - %d",lista[itemIndex].name,lista[itemIndex].qtd))
            end
        end
        index=index+1
    end
end






while true do
    --populaLista()
    
    local success, response = pcall(function()
        populaLista()
    end)
    
        
    exibirSaporra(items,monitores)
    sleep(1)
end
