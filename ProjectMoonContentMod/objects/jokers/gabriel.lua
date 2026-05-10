SMODS.Joker {
    key = "gabriel",
	name = "Gabriel",
	pronouns = "he_him",
	config = {extra = {totalSpades = 0, totalClubs = 0, totalHearts = 0, totalDiamonds = 0, mult = 0, chips = 0, roundCount = 0}},
	unlocked = false,
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 0 },
	attributes = {'spades', 'clubs', 'hearts', 'diamonds', 'mult', 'chips', 'scaling', 'meltdown', 'gimmick'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_meltdown"}
        return {vars = { card.ability.extra.totalSpades, card.ability.extra.totalClubs, card.ability.extra.totalHearts, card.ability.extra.totalDiamonds, card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.roundCount  } }
    end,

    calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") and not context.blueprint then
			card.ability.extra.totalSpades = card.ability.extra.totalSpades + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") and not context.blueprint then
			card.ability.extra.totalClubs = card.ability.extra.totalClubs + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and not context.blueprint then
			card.ability.extra.totalHearts = card.ability.extra.totalHearts + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") and not context.blueprint then
			card.ability.extra.totalDiamonds = card.ability.extra.totalDiamonds + 1
		end

		if context.after and context.main_eval and math.abs((card.ability.extra.totalSpades + card.ability.extra.totalClubs) - (card.ability.extra.totalHearts + card.ability.extra.totalDiamonds)) >= 6 and not context.blueprint then
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
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotYesod"])
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
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahYesod"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
		end

		card.ability.extra.chips = (card.ability.extra.totalSpades + card.ability.extra.totalClubs)*3
        card.ability.extra.mult = (card.ability.extra.totalHearts + card.ability.extra.totalDiamonds)

		if context.joker_main then
			return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 2
    end
}