SMODS.Joker {
	key = 'albina',
	name = "Albina",
	pronouns = "she_her",
	config = { extra = {callistoPresent = false, callistoPos = nil, albinaDeathCounter = 0, baseChance = 1, maxChance = 2, type = "Pair" } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 6 },
	attributes = {'generation', 'chance', 'destroy_itself', 'modify_card', 'position'},
    pools =
	{
		["Ring"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'ren')
        return {vars = { card.ability.extra.albinaDeathCounter, localize(card.ability.extra.type, 'poker_hands'), new_numerator, new_denominator } }
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.callistoPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_callisto" then
						card.ability.extra.callistoPresent = true
						card.ability.extra.callistoPos = i
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and #context.scoring_hand == 2 then
			if context.other_card == context.scoring_hand[1] then
				if card.ability.extra.callistoPresent then
					context.other_card:set_ability("m_mult", nil, true)
					card.ability.extra.albinaDeathCounter = card.ability.extra.albinaDeathCounter + 1
				else
					if SMODS.pseudorandom_probability(card, 'albina', card.ability.extra.baseChance, card.ability.extra.maxChance, 'albina') then
						context.other_card:set_ability("m_mult", nil, true)
					end
				end
			end

			if context.other_card == context.scoring_hand[2] then
				if card.ability.extra.callistoPresent then
					context.other_card:set_ability("m_bonus", nil, true)
					card.ability.extra.albinaDeathCounter = card.ability.extra.albinaDeathCounter + 1
				else
					if SMODS.pseudorandom_probability(card, 'albina', card.ability.extra.baseChance, card.ability.extra.maxChance, 'albina') then
						context.other_card:set_ability("m_bonus", nil, true)
					end
				end
			end

			if card.ability.extra.albinaDeathCounter >= 6 then
				
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
    	return weight*(2^(#SMODS.find_card('j_pmcmod_callisto')*G.GAME.round_resets.ante))
	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_callisto" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}