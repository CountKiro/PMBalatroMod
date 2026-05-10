SMODS.Joker {
    key = "kali",
	name = "Kali",
	pronouns = "she_her",
	config = {extra = {mult = 0, roundCount = 0}},
	unlocked = false,
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	attributes = {'mult', 'hands', 'meltdown', 'gimmick'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 6, y = 0 },
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_meltdown"}
        return {vars = { card.ability.extra.mult, card.ability.extra.roundCount } }
    end,
    calculate = function(self, card, context)

		card.ability.extra.mult = (G.GAME.current_round.hands_played)*25

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and (G.GAME.round_resets.hands - G.GAME.current_round.hands_played) < 1 then
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
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotGebura"])
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
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahGebura"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
	end
		if context.joker_main and not context.blueprint then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 5
    end
}