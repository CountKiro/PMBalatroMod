SMODS.Joker {
    key = "sephirahHokma",
	name = "Sephirah Hokma",
	pronouns = "he_him",
	config = {extra = {xmult = 1, xmult_mod = 0.3, consumablesUsed = 0}},
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 11 },
	attributes = {'xmult', 'spectral', 'tarot', 'consumable'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.xmult + (card.ability.extra.xmult_mod * card.ability.extra.consumablesUsed ), card.ability.extra.xmult_mod }}
	end,
    calculate = function(self, card, context)

		if context.using_consumeable and (context.consumeable.ability.set == "Tarot" or context.consumeable.ability.set == "Spectral") and not context.blueprint then

			card.ability.extra.consumablesUsed = 0
			for k, v in pairs(G.GAME.consumeable_usage) do
				if v.set == 'Tarot' then 
					card.ability.extra.consumablesUsed = card.ability.extra.consumablesUsed + 1 
				end
				if v.set == 'Spectral' then
					card.ability.extra.consumablesUsed = card.ability.extra.consumablesUsed + 1
				end
			end
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod * card.ability.extra.consumablesUsed)
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}