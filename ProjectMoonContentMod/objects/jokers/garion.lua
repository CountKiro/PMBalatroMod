SMODS.Joker {
    key = "garion",
	name = "Garion",
	pronouns = "she_her",
	config = {extra = {xmult = 1, xmult_mod = 0.2, roundCount = 0}},
	unlocked = false,
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = false,    
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 0 },
	attributes = {'xmult', 'scaling', 'destroy_card', 'meltdown', 'gimmick'},
    pools = 
	{
 		["Heretics"] = true,
 	},    
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_meltdown"}
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod, card.ability.extra.roundCount } }
    end,

    calculate = function(self, card, context)

		if context.destroying_card and context.cardarea == G.play and #context.full_hand >= 1 and not context.blueprint and G.GAME.current_round.hands_played == 0 then  
				card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod)
                return {
                    remove = true
                }
		end
		if context.joker_main and not context.blueprint then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
				Xmult_mod = card.ability.extra.xmult
			}
		end
		if context.after and context.main_eval and (#G.playing_cards) <= (G.GAME.starting_deck_size/2) and not context.blueprint then
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotBinah"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.roundCount = card.ability.extra.roundCount + 1
				if card.ability.extra.roundCount >= 4 then
					local percent = 1.15
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.15,
					func = function()
						card:flip()
						play_sound('card1', percent)
						card:juice_up(0.3, 0.3)
						return true
					end,
				}))

				G.E_MANAGER:add_event(Event({
					delay = 0.5,
					func = function()
						card:set_ability(G.P_CENTERS["j_pmcmod_sephirahBinah"])
						return true
					end
				}))
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_head'), HEX('242424'), HEX('e0c02f'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 6
    end
}