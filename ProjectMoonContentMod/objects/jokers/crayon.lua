SMODS.Joker {
    key = "crayon",
	name = "Crayon",
	pronouns = "she_her",
	config = { extra = { baseChance = 1, maxChance = 2, pity = false } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
	atlas = 'ModdedProjectMoon',
    pos = { x = 5, y = 7 },
	attributes = {'chance', 'consumable'},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'crayonChance')
		return { vars = { new_numerator, new_denominator } }
	end,
    calculate = function(self, card, context)
        if context.setting_blind then
			if SMODS.pseudorandom_probability(card, 'crayon', card.ability.extra.baseChance, card.ability.extra.maxChance, 'crayonChance') or card.ability.extra.pity then
				card.ability.extra.pity = false
				if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					local chosenConsumable = math.random(1, 10)
					if chosenConsumable == 1 then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						G.E_MANAGER:add_event(Event({
							func = (function()
								SMODS.add_card {
									set = 'Spectral',
									key_append = 'crayon' -- Optional, useful for manipulating the random seed and checking the source of the creation in `in_pool`.
								}
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
						return {
							message = localize('k_plus_spectral'),
							colour = G.C.SECONDARY_SET.Spectral,
							remove = true
						}
                	end

					if chosenConsumable > 1 and chosenConsumable <= 5 then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						G.E_MANAGER:add_event(Event({
							func = (function()
								SMODS.add_card {
									set = 'Planet',
									key_append = 'crayon' -- Optional, useful for manipulating the random seed and checking the source of the creation in `in_pool`.
								}
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
						return {
							message = localize('k_plus_planet'),
							colour = G.C.SECONDARY_SET.Planet,
							remove = true
						}
					end

					if chosenConsumable > 5 then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						G.E_MANAGER:add_event(Event({
							func = (function()
								SMODS.add_card {
									set = 'Tarot',
									key_append = 'crayon' -- Optional, useful for manipulating the random seed and checking the source of the creation in `in_pool`.
								}
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
						return {
							message = localize('k_plus_tarot'),
							colour = G.C.SECONDARY_SET.Tarot,
							remove = true
						}
					end
				end
			else

				card.ability.extra.pity = true

        	end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_cloud'), HEX('594237'), HEX('c4bfbc'), 1.2 )
 	end
}