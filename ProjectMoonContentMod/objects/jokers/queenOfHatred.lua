SMODS.Joker {
	key = 'heathcliff',
	name = "Heathcliff",
	pronouns = "he_him",
	config = { extra = { cardsDestroyed = 0, joker_slots = 0, extraJokerSlot = 1 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = false,
	rarity = 3,
	cost = 8,
	atlas = 'ModdedProjectMoon2',
	pos = { x = 6, y = 0 },
	attributes = {'joker', 'joker_slot', 'negative'},
	loc_vars = function (self, info_queue, card)

		local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do 
			if v.set == 'Planet' then 
				planets_used = planets_used + 1 
			end 
		end

    	return {vars = { card.ability.extra.cardsDestroyed, card.ability.extra.joker_slots, card.ability.extra.extraJokerSlot }}
	end,
	calculate = function(self, card, context)

		if context.setting_blind and not context.blueprint then

			local negative_jokers = {}
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
                	if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_negative" and G.jokers.cards[i] ~= card then
					 	negative_jokers[#negative_jokers+1] = G.jokers.cards[i]
					end
				end
			end

			local selected_joker = #negative_jokers > 0 and pseudorandom_element(negative_jokers, pseudoseed('heathcliff')) or nil

			if selected_joker and not (context.blueprint_card or self).getting_sliced then
				selected_joker.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					selected_joker:juice_up(0.8, 0.8)
					selected_joker:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))

				card.ability.extra.cardsDestroyed = card.ability.extra.cardsDestroyed + 1

				if card.ability.extra.cardsDestroyed >= 2 then
					G.jokers:change_size(1)
					card.ability.extra.cardsDestroyed = 0
					card.ability.extra.joker_slots = card.ability.extra.joker_slots + card.ability.extra.extraJokerSlot
				end
			end
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers:change_size(-card.ability.extra.joker_slots)
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
 	end,
	get_weight = function(self, weight)
		local joker_count = 0
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].edition then
				if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_negative" then
					joker_count = joker_count + 1
				end
			end
		end
    	return weight*(2^(#SMODS.find_card('j_pmcmod_catherine')*G.GAME.round_resets.ante * joker_count))
	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_hit_the_road" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}