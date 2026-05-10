SMODS.Joker {
    key = "elijah",
	name = "Elijah",
	pronouns = "she_her",
	config = {extra = {mult = 0, roundCount = 0}},
	unlocked = true,
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pos = { x = 2, y = 0 },
	attributes = {'mult', 'meltdown', 'gimmick'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_meltdown"}
        return {vars = { card.ability.extra.mult, card.ability.extra.roundCount } }
    end,
    calculate = function(self, card, context)
		card.ability.extra.mult = (G.GAME.hands["High Card"].level + 
		G.GAME.hands["Pair"].level +
		G.GAME.hands["Three of a Kind"].level +
		G.GAME.hands["Two Pair"].level +
		G.GAME.hands["Full House"].level +
		G.GAME.hands["Straight"].level +
		G.GAME.hands["Flush"].level +
		G.GAME.hands["Straight Flush"].level +
		G.GAME.hands["Four of a Kind"].level +
		G.GAME.hands["Five of a Kind"].level +
		G.GAME.hands["Flush House"].level +
		G.GAME.hands["Flush Five"].level)*2 - 24

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
		
			if	((to_big(G.GAME.hands["High Card"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Pair"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Three of a Kind"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Two Pair"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Full House"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Straight"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Flush"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Straight Flush"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Four of a Kind"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Five of a Kind"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Flush House"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Flush Five"].level) > to_big(3))) then

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
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotMalkuth"])
					card:set_eternal(true)
                    return true
                end
            }))
			
			else
				card.ability.extra.roundCount = card.ability.extra.roundCount + 1
			end

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
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahMalkuth"])
					card:set_eternal(true)
                    return true
                end
            }))
			end

		end

		if context.joker_main then
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
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 1
    end
}