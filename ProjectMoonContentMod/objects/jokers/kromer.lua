SMODS.Joker {
	key = 'kromer',
	name = "Kromer",
	pronouns = "she_her",
	config = {extra = 0.5, xmult = 1},
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 2 },
	attributes = {'xmult', 'scaling', 'destroy_card'},
    pools =
	{
        ["NCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra, card.ability.xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } },
				Xmult_mod = card.ability.xmult
			}
		end
		
		if context.setting_blind and not G.GAME.last_blind.boss and not card.getting_sliced and not context.blueprint then
                local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
					for j = 1, #G.P_CENTER_POOLS.Heretics do
						if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and 
						(G.P_CENTER_POOLS.Heretics[j].key == G.jokers.cards[i].config.center.key)
						then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
					end
                end
                local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('kromer')) or nil

                if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
					card.ability.xmult = card.ability.xmult + card.ability.extra
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('pmcmod_kromerWhistle', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
					card_eval_status_text((context.blueprint_card or card), 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.xmult}}})
                end
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_NCorpInquisition'), G.C.RED, G.C.WHITE, 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 3
    end
}