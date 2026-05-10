SMODS.Joker {
	key = 'marton',
	name = "Marton",
	pronouns = "he_him",
	config = { extra = { chips = 14} },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 8 },
	attributes = {'chips', 'enhancements', 'scaling'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local chipsCardsTally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_bonus') then chipsCardsTally = chipsCardsTally + 1 end
            end
        end
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        return {vars = { card.ability.extra.chips, card.ability.extra.chips * chipsCardsTally } }
	end,
	calculate = function(self, card, context)

		local chipsCardsTally = 0

        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_bonus') then chipsCardsTally = chipsCardsTally + 1 end
            end
        end

		if context.joker_main then
			return {
				chips = card.ability.extra.chips * chipsCardsTally
			}
		end
    end,
	get_weight = function(self, weight)
		local endurance_card_tally = 0
		if G.GAME.blind then
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_bonus') then endurance_card_tally = endurance_card_tally + 1 end
				end
			end
		end
    	return weight*(2^(endurance_card_tally + 1))
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), G.C.BLACK, G.C.RED, 1.2 )
 	end,
}