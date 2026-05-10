SMODS.Joker {
    key = "daniel",
	name = "Daniel",
	pronouns = "he_him",
	config = {extra = {xchips = 2, xchips_mod = 0.1, roundCount = 0}},
	unlocked = false,
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 0 },
	attributes = {'xchips', 'scaling', 'meltdown', 'gimmick'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_meltdown"}
        return {vars = { card.ability.extra.xchips, card.ability.extra.xchips_mod, card.ability.extra.roundCount } } 
    end,

    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not context.blueprint then
			card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_mod
			return {
					message_card=card,
					message = localize { type = 'variable', key = 'a_xchips', vars = { card.ability.extra.xchips_mod } },
					colour = G.C.RED
			}
        end
		if context.discard and not context.blueprint and not context.other_card.debuff then
            card.ability.extra.xchips = card.ability.extra.xchips - card.ability.extra.xchips_mod
            return {
				message_card=card,
                message = localize { type = 'variable', key = 'a_xchips_minus', vars = { card.ability.extra.xchips_mod } },
                colour = G.C.MULT
            }
        end
		if context.after and context.main_eval and card.ability.extra.xchips <= 1 and not context.blueprint then
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
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotChesed"])
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
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahChesed"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
	end
		if context.joker_main then
			return {
				xchips = card.ability.extra.xchips
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 4
    end
}