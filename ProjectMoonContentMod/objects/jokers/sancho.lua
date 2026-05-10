SMODS.Joker {
	key = 'sancho',
	name = "Sancho",
	pronouns = "she_her",
	config = { extra = { repetitions = 1, baseChance = 1, maxChance = 2 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 6 },
	attributes = {'retrigger', 'hearts', 'bleed'},
    pools =
	{
		["Bloodfiends"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_bleed
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'sanchoChance')
    	return {vars = { card.ability.extra.repetitions, new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play then
            if context.other_card:is_suit("Hearts") then
				if SMODS.has_enhancement(context.other_card, 'm_pmcmod_bleed') then
					return {
                    	repetitions = card.ability.extra.repetitions
                	}
				else
					if SMODS.pseudorandom_probability(card, 'sancho', card.ability.extra.baseChance, card.ability.extra.maxChance, 'sancho') then
						return {
                    		repetitions = card.ability.extra.repetitions
                		}
					end
				end
                
            end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_lamanchaland'), HEX('400a18'), HEX('c7285f'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_seeing_double" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
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
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then
                return true
            end
        end
        return false
    end,
}