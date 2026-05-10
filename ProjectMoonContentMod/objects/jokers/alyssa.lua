SMODS.Joker {
	key = 'alyssa',
	name = "Alyssa",
	pronouns = "she_her",
	config = { extra = { mult = 8} },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 8 },
	attributes = {'mult', 'enhancements', 'scaling'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local multCardsTally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_mult') then multCardsTally = multCardsTally + 1 end
            end
        end
		info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        return {vars = { card.ability.extra.mult, card.ability.extra.mult * multCardsTally } }
	end,
	calculate = function(self, card, context)

		local multCardsTally = 0

        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_mult') then multCardsTally = multCardsTally + 1 end
            end
        end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult * multCardsTally
			}
		end
    end,
	get_weight = function(self, weight)
		local strength_card_tally = 0
		if G.GAME.blind then
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_mult') then strength_card_tally = strength_card_tally + 1 end
				end
			end
		end
    	return weight*(2^(strength_card_tally + 1))
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), G.C.BLACK, G.C.RED, 1.2 )
 	end,
}