local bau = peripheral.wrap("minecraf:barrel_0")
local monitor1,monitor2,monitor3 = peripheral.wrap("monitor_3"), peripheral.wrap("monitor_3"), peripheral.wrap("monitor_2")


local function write(mon)
    mon.clear()
    mon.setCursorPos(1,1)
    mon.write("Marquinho é lindo")
end

write(monitor1)
write(monitor2)
write(monitor3)


for slot,item in pairs(bau.list()) do
    print(("%d x %s in slot %d"):format(item.count,item.name,slot))
end