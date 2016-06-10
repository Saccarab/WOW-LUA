--zakuun marker custom function

function()
    local raid_mark = GetRaidTargetIndex("target")
    local mark = "No Mark"
    if UnitExists("target") == true then
        if raid_mark == 1 then
            mark = "Star"
        elseif raid_mark == 2 then
            mark = "Circle"
        elseif raid_mark == 3 then
            mark = "Diamond"
        elseif raid_mark == 4 then
            mark = "Triangle"
        elseif raid_mark == 5 then
            mark = "Moon"
        elseif raid_mark == 6 then
            mark = "Square"
        elseif raid_mark == 7 then
            mark = "Cross"
        elseif raid_mark == 8 then
            mark = "Skull"
        elseif raid_mark == nil then
            mark = "No Mark"
        end
        return mark
    end
end    


-- trigger
function()
    local raid_mark = GetRaidTargetIndex("player")
    if raid_mark ~= nil then 
        return true
    end

--untrigger

function()
    
    return true

end

