SMODS.Joker {
	key = 'esther',
	name = "Esther",
	pronouns = "he_him",
	config = { extra = { xchips = 3 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,	
    blueprint_compat = false,
	rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 4, y = 13 },
	attributes = {'xchips', 'singleton'},
	pools =
	{
        ["Index"] = true,
 	},
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_singleton"}
    	return {vars = { card.ability.extra.xchips }}
	end,
	calculate = function(self, card, context)
		
		if context.individual and context.cardarea == G.play and not context.blueprint then
			local singletonCounter = 0 -- make this into a function
			local singletonSuit = context.other_card.base.suit
			local singletonRank = context.other_card:get_id()

			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if playing_card:get_id() == singletonRank then 
						singletonCounter = singletonCounter + 1
					end
				end
			end

			if singletonCounter == 1 then
				return {
					xchips = card.ability.extra.xchips,
				}
			end
		end
		
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_index'), HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_turtle_bean" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}