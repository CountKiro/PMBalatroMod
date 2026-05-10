SMODS.Joker {
	key = 'angelica',
	name = "Angelica",
	pronouns = "she_her",
	config = { extra = { mult = 100 } },
	eternal_compat = false,
	perishable_compat = true,
    blueprint_compat = false,
	rarity = 3,
    cost = 12,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 7, y = 0 },
	attributes = {'mult'},
	pools =
	{
        ["Index"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.mult }}
	end,
	calculate = function(self, card, context)
		if context.joker_main and not context.blueprint then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_charles'), HEX('3d3d3d'), HEX('b5b5b5'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_half" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}