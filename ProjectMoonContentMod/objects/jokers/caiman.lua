SMODS.Joker {
	key = 'caiman',
	name = "Caiman",
	pronouns = "she_her",
	config = { extra = {baseChance = 1, maxChance = 4 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 6 },
	attributes = {'planet', 'chance'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'caimanChance')
    	return {vars = { new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		if context.using_consumeable and context.consumeable.ability.set == "Planet" and not context.blueprint then
			if SMODS.pseudorandom_probability(card, 'caiman', card.ability.extra.baseChance, card.ability.extra.maxChance, 'caiman') then
				G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            	G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Planet',
								key = context.consumeable.config.center.key,
                                key_append = 'caiman'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_planet'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), G.C.BLACK, G.C.RED, 1.2 )
 	end,
}