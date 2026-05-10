SMODS.Joker {
	key = 'rudolph',
	name = "Rudolph",
	pronouns = "he_him",
	config = { extra = {  } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = false,
	rarity = 3,
	cost = 8,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 9, y = 5 },
	attributes = {'charge'},
	pools =
	{
        ["R Corp"] = true,
 	},
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.e_pmcmod_charge
    	return {vars = {  }}
	end,
	calculate = function(self, card, context)
	
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_RCorp'), HEX('2e2b2b'), HEX('c4560c'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_swashbuckler" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}