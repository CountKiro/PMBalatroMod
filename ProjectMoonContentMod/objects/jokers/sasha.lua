SMODS.Joker {
	key = 'sasha',
	name = "Sasha",
	pronouns = "she_her",
	config = { extra = { baseChance = 1, maxChance = 2 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 10 },
	attributes = {'chance', 'editions', 'charge'},
    pools =
	{
		["Bloodfiends"] = true,
		["Heretics"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_bleed
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'sashaChance')
    	return {vars = { new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then 
			if SMODS.has_enhancement(context.other_card, 'm_pmcmod_bleed') then
				if SMODS.pseudorandom_probability(card, 'sasha', card.ability.extra.baseChance, card.ability.extra.maxChance, 'sasha') then
					local edition = 'e_pmcmod_charge'
					context.other_card:set_edition(edition, true)
					check_for_unlock({ type = 'have_edition' })
				end
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_multicrack'), HEX('ccc49d'), HEX('c706b0'), 1.2 )
 	end,
	get_weight = function(self, weight)
		local bleed_card_tally = 0
		if G.GAME.blind then
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then bleed_card_tally = bleed_card_tally + 1 end
				end
			end
		end
    	return weight*(2^(bleed_card_tally + 1))
	end,
    check_for_unlock = function(self, args) -- equivalent to `unlock_condition = { type = 'modify_jokers', extra = { polychrome = true, count = 2 } }`
        if args.type == 'modify_deck' then
            local count = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then count = count + 1 end
                if count >= 3 then
                    return true
                end
            end
        end
        return false
    end
}