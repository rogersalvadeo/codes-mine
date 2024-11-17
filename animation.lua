-- Assuming 'content' contains the parsed animation data

local bot = peripheral.wrap("animatronic_0")
local bot2 = peripheral.wrap("animatronic_1")


local parsed = {
    format_version = "1.8.0",
    animations = {
      ["animation.template"] = {
        bones = {
          head = {
            rotation = {
              ["0.0417"] = { 0, 0, 0 },
              ["0.0"] = { 0, 45, 0 },
              ["1.0"] = { 0, -45, 0 }
            },
          },
        },
        animation_length = 1
      }
    }
}
-- Create a table to hold the baked animations
local animations = {
    ["animation.template"] = {
      head = {
        [1] = { 0, 45, 0 },
        [2] = { 0, 0, 0 },
        [3] = { 0, -45, 0 }
      }
    }
}

-- Loop through each animation entry in parsed data
for name, data in pairs(parsed.animations) do
    local baked = {} -- Create a table to hold the baked animation data for this entry

    -- Loop through each bone in the animation data
    for part, rots in pairs(data.bones) do
        baked[part] = {} -- Create a table to hold the baked bone rotation data

        -- Check if the rotation data is a single set of rotations or a series
        if type(rots.rotation[1]) == "number" then
            baked[part][1] = rots.rotation -- If single, add it as-is
        else
            local indexes = {}

            -- Collect and sort the frame indexes
            for index, rot in pairs(rots.rotation) do
                table.insert(indexes, index)
            end
            table.sort(indexes, function(a, b) return tonumber(a) < tonumber(b) end)

            -- Reorganize the rotation data using the sorted indexes
            for new_index, real_index in ipairs(indexes) do
                baked[part][new_index] = rots.rotation[real_index]
            end
        end
    end

    -- Add the baked animation data to the animations table
    animations[name] = baked
end

-- At this point, the 'animations' table contains the transformed animation data


bot.setFace("happy")
bot2.setFace("happy")

while true do

bot.setHeadRot(0,0,-22.5)
bot.setLeftArmRot(0,0,-135)
bot2.setHeadRot(0,0,22.5)
bot2.setRightArmRot(0,0,135)
bot.push()
bot2.push()
sleep(0.5)
bot.setHeadRot(0,0,0)
bot.setLeftArmRot(0,0,-105)
bot2.setHeadRot(0,0,0)
bot2.setRightArmRot(0,0,105)
bot.push()
bot2.push()
sleep(0.25)
bot.setHeadRot(0,0,22.5)
bot.setLeftArmRot(0,0,-167)
bot2.setHeadRot(0,0,-22.5)
bot2.setRightArmRot(0,0,167)
bot.push()
bot2.push()
sleep(0.5)
--bot.setHeadRot(0,0,

end
