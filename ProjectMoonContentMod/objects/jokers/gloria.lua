SMODS.Joker {
	key = 'gloria',
	name = "Gloria",
	pronouns = "she_her",
	config = { extra = { dollars = 7 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = false,    
	rarity = 2,
    cost = 6,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 0, y = 2 },
	attributes = {'economy', 'singleton'},
	pools =
	{
        ["Index"] = true,
 	},
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_singleton"}
    	return {vars = { card.ability.extra.dollars }}
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
					dollars = card.ability.extra.dollars,
				}
			end
		end
		
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_index'), HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_troubadour" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}