SMODS.Joker {
	key = 'casetti',
	name = "Casetti",
	pronouns = "he_him",
	config = { extra = { mult = 0, mult_mod = 2, suit = "Hearts", baseChance = 1, maxChance = 3 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 6 },
	attributes = {'mult', 'scaling', 'bleed', 'hearts'},
    pools =
	{
		["Bloodfiends"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_bleed
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'casettiChance')
		local bleedCardsTally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then bleedCardsTally = bleedCardsTally + 1 end
            end
        end
        return {vars = {card.ability.extra.mult_mod, card.ability.extra.mult + (bleedCardsTally * card.ability.extra.mult_mod), new_numerator, new_denominator } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
			if SMODS.pseudorandom_probability(card, 'casetti', card.ability.extra.baseChance, card.ability.extra.maxChance, 'casetti') then
				context.other_card:set_ability("m_pmcmod_bleed", nil, true)
			end
			local bleedCardsTally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then bleedCardsTally = bleedCardsTally + 1 end
				end
        	end
			return
			{
				mult = card.ability.extra.mult + (bleedCardsTally * card.ability.extra.mult_mod)
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_lamanchaland'), HEX('400a18'), HEX('c7285f'), 1.2 )
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
                if count >= 5 then
                    return true
                end
            end
        end
        return false
    end
}