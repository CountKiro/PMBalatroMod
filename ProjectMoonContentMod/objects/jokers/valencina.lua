SMODS.Joker {
	key = 'valencina',
	name = "Valencina",
	pronouns = "she_her",
	config = { extra = { currentPosition = 1, lucioDeathCounter = 0, lucioPresent = false, lucioPos = nil } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 5 },
	attributes = {'tremor', 'ammo', 'modify_card', 'position'},
    pools =
	{
		["Heretics"] = true,
		["Thumb"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.lucioDeathCounter } }
	end,
	calculate = function(self, card, context)

		if context.before then
			card.ability.extra.lucioPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_lucio" then
						card.ability.extra.lucioPresent = true
						card.ability.extra.lucioPos = i
						break
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and (context.other_card == context.scoring_hand[1]) and #context.scoring_hand >= 2 then
			context.other_card:set_ability("m_pmcmod_tremor", nil, true)
		end

		if context.individual and context.cardarea == G.play and (context.other_card == context.scoring_hand[#context.scoring_hand]) and #context.scoring_hand > 2 and card.ability.extra.lucioPresent then
			context.other_card:set_ability("m_pmcmod_tremor", nil, true)

			card.ability.extra.lucioDeathCounter = card.ability.extra.lucioDeathCounter + 1

			if card.ability.extra.lucioDeathCounter >= 5 then
				G.GAME.banned_keys["j_pmcmod_lucio"] = true
				local lucio = G.jokers.cards[card.ability.extra.lucioPos]
				lucio.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.8, 0.8)
					lucio:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end

		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	get_weight = function(self, weight)
    	return weight*(2^(#SMODS.find_card('j_pmcmod_lucio')*G.GAME.round_resets.ante))
	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_flower_pot" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}