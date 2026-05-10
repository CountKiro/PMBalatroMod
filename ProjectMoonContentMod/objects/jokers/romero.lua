SMODS.Joker {
	key = 'romero',
	name = "Romero",
	pronouns = "he_him",
	config = { extra = { mult = 10, mult_mod = 10 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,	
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 5 },
	attributes = {'mult', 'scaling', 'destroy_card'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
	end,
	calculate = function(self, card, context)
		
		
		if context.setting_blind and not G.GAME.last_blind.boss and not card.getting_sliced then
                local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
					for j = 1, #G.P_CENTER_POOLS.Bloodfiends do
						if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and 
						(G.P_CENTER_POOLS.Bloodfiends[j].key == G.jokers.cards[i].config.center.key)and (G.jokers.cards[i].config.center.rarity <= 2)
						then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
					end
                end
                local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('romero')) or nil

                if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
					if card.ability.extra.mult_mod > 10 then
						card.ability.extra.mult_mod = 10
					end
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
					card_eval_status_text((context.blueprint_card or card), 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult_mod}}})
                end
		end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
    end,
	add_to_deck = function(self, card, from_debuff)
        if PMCMOD.config.enable_adaptative_scaling and G.GAME.round_resets.blind_ante > 1 then
			card.ability.extra.mult_mod = card.ability.extra.mult_mod + ((G.GAME.round_resets.blind_ante - 2) * 5)
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_fanghunt'), HEX('383532'), HEX('c4c0bc'), 1.2 )
 	end,
}