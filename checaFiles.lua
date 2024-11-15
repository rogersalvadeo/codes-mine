local bau = peripheral.wrap("minecratf:barrel_0")
local monitor1,monitor2,monitor3 = peripheral.wrap("monitor_3"), peripheral.wrap("monitor_3"), peripheral.wrap("monitor_2")


local function write(mon,x,y,text)
    mon.clear()
    mon.setCursorPos(x,y)
    mon.write(text)
end


--teste

write(monitor1,1,1,"marquinhos eh lindo")
write(monitor2,1,1,"marquinhos eh lindo")
write(monitor3,1,1,"marquinhos eh lindo")


local i = 1

for slot,item in pairs(bau.list()) do
    print(("%d x %s in slot %d"):format(item.count,item.name,slot))
    if slot<5 then
        write(monitor1,1,slot,item.name)
    elseif slot<9 then
        write(monitor2,1,slot-4,item.name)
    elseif slot<11 then
        write(monitor3,1,slot-8,item.name)
    end                            
end