SMODS.Joker {
	key = 'ren',
	name = "Ren",
	pronouns = "he_him",
	config = { extra = { shiomiPresent = false, shiomiPos = nil, renDeathCounter = 0, baseChance = 1, maxChance = 2} },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 6 },
	attributes = {'passive', 'chance', 'poise', 'position', 'scaling'},
    pools =
	{
		["Pinky"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'ren')
        return {vars = { card.ability.extra.renDeathCounter, new_numerator, new_denominator } } 
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.shiomiPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_shiomiYoru" then
						card.ability.extra.shiomiPresent = true
						card.ability.extra.shiomiPos = i
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play then
			if card.ability.extra.shiomiPresent then
				context.other_card:set_ability("m_pmcmod_poise", nil, true)
				card.ability.extra.renDeathCounter = card.ability.extra.renDeathCounter + 1
			else
				if SMODS.pseudorandom_probability(card, 'ren', card.ability.extra.baseChance, card.ability.extra.maxChance, 'ren') then
					context.other_card:set_ability("m_pmcmod_poise", nil, true)
				end
			end

			if card.ability.extra.renDeathCounter >= 5 then
				
				card.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.8, 0.8)
					card:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end
		end

		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	get_weight = function(self, weight)
		local poise_card_tally = 0
		if G.GAME.blind then
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_poise') then poise_card_tally = poise_card_tally + 1 end
				end
			end
		end
    	return weight*(2^(poise_card_tally + 1))
	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_shiomiYoru" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}