local bau = peripheral.wrap("minecraft:barrel_1")
local monitor1, monitor2, monitor3 = peripheral.wrap("monitor_0"), peripheral.wrap("monitor_3"),
    peripheral.wrap("monitor_2")
local items = {}
local monitores = { monitor1, monitor2, monitor3 }

monitor1.setTextScale(1)
monitor2.setTextScale(1)
monitor3.setTextScale(1)



local function write(mon, x, y, text)
    mon.setCursorPos(x, y)
    mon.write(text)
end




local function populateTable()
    for k in pairs (items) do
        items [k] = nil
    end


    for i = 1, 27 do
        local item = bau.getItemDetail(i)

        if item ~= nil then
            local exists = false

            -- Verifique se o item jÃ¡ existe na tabela 'items'
            for _, it in ipairs(items) do
                if it.name == item.displayName then
                    -- Se o item jÃ¡ existir, adiciona a quantidade
                    it.qtd = it.qtd + item.count
                    exists = true
                    break
                end
            end

            -- Se o item nÃ£o foi encontrado, adicione-o Ã  tabela 'items'
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




--populateTable()


--for key, value in pairs(items) do
--    print(key)
--    print(value)
--end

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
    populateTable()
    exibirSaporra(items,monitores)
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
