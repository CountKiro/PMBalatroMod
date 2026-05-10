SMODS.Joker {
    key = "giovanni",
	name = "Giovanni",
	pronouns = "he_him",
	config = {extra = {consumable_amount = 2, mult = 0, chips = 0, current_consumable_count = 0, roundCount = 0, mult_mod = 7, chips_mod = 10}},
	unlocked = false,
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 0 },
	attributes = {'consumable', 'mult', 'chips', 'scaling', 'meltdown', 'gimmick'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_meltdown"}
        return {vars = { card.ability.extra.consumable_amount, card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.current_consumable_count, card.ability.extra.roundCount,
						card.ability.extra.mult_mod, card.ability.extra.chips_mod } }
    end,

    calculate = function(self, card, context)

		--Increments counter when a consumable is used
		if context.using_consumeable and not context.blueprint then
			card.ability.extra.current_consumable_count = card.ability.extra.current_consumable_count + 1
		end

		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

			if card.ability.extra.consumable_amount > card.ability.extra.current_consumable_count then
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
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotNetzach"])
					card:set_eternal(true)
                    return true
                end
            }))
			end

			-- If the amount is reached, reset value, increase requirement and increase mult and chips
			if card.ability.extra.consumable_amount <= card.ability.extra.current_consumable_count then
				card.ability.extra.roundCount = card.ability.extra.roundCount + 1
				card.ability.extra.current_consumable_count = 0
				card.ability.extra.consumable_amount = card.ability.extra.consumable_amount + 2

				card.ability.extra.mult = card.ability.extra.mult + 7
				card.ability.extra.chips = card.ability.extra.chips + 10
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
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahNetzach"])
					card:set_eternal(true)
                    return true
                end
            }))
			end

			
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips,
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	add_to_deck = function(self, card, from_debuff)
        
    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 2
    end
}