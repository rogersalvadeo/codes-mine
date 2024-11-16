local bau = peripheral.wrap("minecraft:barrel_0")
local monitor1, monitor2, monitor3 = peripheral.wrap("monitor_3"), peripheral.wrap("monitor_3"),
    peripheral.wrap("monitor_2")
local items = {}



local function write(mon, x, y, text)
    mon.setCursorPos(x, y)
    mon.write(text)
end

local function populateTable()
    for i = 1, 27 do
        local item = bau.getItemDetail(i)
        
        if item ~= nil then
            local exists = false
            
            -- Verifique se o item já existe na tabela 'items'
            for _, it in ipairs(items) do
                if it.name == item.displayName then
                    -- Se o item já existir, adiciona a quantidade
                    it.qtd = it.qtd + item.count
                    exists = true
                    break
                end
            end
            
            -- Se o item não foi encontrado, adicione-o à tabela 'items'
            if not exists then
                local it = {
                    name = item.displayName,
                    qtd = item.count
                }
                table.insert(items, it)
            end
        end
    end
end
write(monitor1, 1, 1, "marquinhos eh lindo")
write(monitor2, 1, 1, "marquinhos eh lindo")
write(monitor3, 1, 1, "marquinhos eh lindo")


local i = 1

populateTable()


for key, value in pairs(items) do
    print(key)
    print(value)
end


for slot, item in pairs(bau.list()) do
    --print(("%d x %s in slot %d"):format(item.count, item.name, slot))
    --if slot < 5 then
    --    write(monitor1, 1, slot, item.name)
    --elseif slot < 9 then
    --    write(monitor2, 1, slot - 4, item.name)
    --elseif slot < 11 then
    --    write(monitor3, 1, slot - 8, item.name)
    --end
end
