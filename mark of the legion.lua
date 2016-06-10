--mark of the legion custom function
function()            
   	if WeakAuras.IsOptionsOpen() then
        	return "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_1:0|t RANGED LEFT |TInterface\\TargetingFrame\\UI-RaidTargetingIcon_1:0|t\n3"
    	end

    	if not Icons then
        Icons = { 
            ["skull"] =
            " \124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_8:12\124t",
            ["cross"] =
            " \124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_7:12\124t",
            ["square"] =
            " \124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_6:12\124t",
            ["moon"] =
            " \124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_5:12\124t",
            ["triangle"] =
            " \124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_4:12\124t",
            ["diamond"] =
            " \124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_3:12\124t",
            ["circle"] =
            " \124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_2:12\124t",
            ["star"]  = 
            " \124TInterface\\TargetingFrame\\UI-RaidTargetingIcon_1:12\124t",       
        };
    	end

    	local index = GetRaidTargetIndex("player")
    	if index==1 then
        	Text = Icons["star"].."  "..Icons["star"]
        	if math.floor(_G["WA_expiration"] - GetTime()) > -0.5 then
            
            	Text = Text.."\n"..math.floor(_G["WA_expiration"] - GetTime() + 0.5)
            
        	end
    	end
    	if index==2 then
        	Text = Icons["circle"].."  "..Icons["circle"]
        	if math.floor(_G["WA_expiration"] - GetTime()) > -0.5 then
            
           		Text = Text.."\n"..math.floor(_G["WA_expiration"] - GetTime() + 0.5)
            
        	end
    	end
    	if index==3 then

        Text = Icons["diamond"].."  "..Icons["diamond"]
        if math.floor(_G["WA_expiration"] - GetTime()) > -0.5 then
            
            Text = Text.."\n"..math.floor(_G["WA_expiration"] - GetTime() + 0.5)
            
        end
    end
    if index==4 then
        Text = Icons["triangle"].."  "..Icons["triangle"]
        if math.floor(_G["WA_expiration"] - GetTime()) > -0.5 then
            
            Text = Text.."\n"..math.floor(_G["WA_expiration"] - GetTime() + 0.5)
            
        end
    end
    if Text == "yellow" then
        Text = "{rt1} SOAK {rt1}"
    end
    if Text == "orange" then
        Text = "{rt2} SOAK {rt2}"
    end
    if Text == "green" then
        Text = "{rt3} SOAK {rt3}"
    end
    if Text == "purple" then
        Text = "{rt4} SOAK {rt4}"
    end
    
    return Text    
end

--trigger missing