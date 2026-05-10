SMODS.Joker {
	key = 'ravi',
	name = "Ravi",
	pronouns = "he_him",
	config = { extra = {chips = 0, chips_mod = 10, baseChance = 1, maxChance = 9 } },
	unlocked = true,
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 3,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 6 },
	attributes = {'chips', 'destroy_itself', 'chance'},
    pools =
	{
		["Limbus"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'ravi')
        return {vars = { card.ability.extra.chips, card.ability.extra.chips_mod, new_numerator, new_denominator } } 
	end,
	calculate = function(self, card, context)


		if context.joker_type_destroyed and context.card == card and not context.blueprint  then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod

			if SMODS.pseudorandom_probability(card, 'ravi', card.ability.extra.baseChance, card.ability.extra.maxChance, 'ravi') then
				
			card.getting_sliced = true
			G.E_MANAGER:add_event(Event({func = function()
				card:juice_up(0.8, 0.8)
				card:start_dissolve({G.C.RED}, nil, 1.6)
			return true end }))

			else

				SMODS.debuff_card(card, true, "ravi")
				return{
					no_destroy = true
				}

			end

			
			
		end
		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			SMODS.debuff_card(card, "reset", "ravi")
		end

		
		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), G.C.BLACK, G.C.RED, 1.2 )
 	end,
}