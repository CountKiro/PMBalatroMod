SMODS.Joker {
    key = "robotNetzach",
	name = "Netzach (Robot)",
	pronouns = "he_him",
	config = {extra = {consumable_amount = 2, mult = 0, chips = 0, current_consumable_count = 0, priceIncrease = 0}},
	eternal_compat = true,
	perishable_compat = false,
    blueprint_compat = true,
	--no_collection = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 12 },
	attributes = {'mult', 'chips', 'scaling', 'prices', 'consumable'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.consumable_amount, card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.current_consumable_count, card.ability.extra.priceIncrease } }
    end,
    calculate = function(self, card, context)

		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

				card.ability.extra.mult = card.ability.extra.mult + 3
				card.ability.extra.chips = card.ability.extra.chips + 5
				card.ability.extra.priceIncrease = card.ability.extra.priceIncrease + 5
				

		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.priceIncrease
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult }, type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end
}