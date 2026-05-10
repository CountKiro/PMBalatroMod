SMODS.Joker {
    key = "robotHokma",
	name = "Hokma (Robot)",
	pronouns = "he_him",
	config = {extra = {xmult = 1,xmult_mod_spectrals = 0.3, xmult_mod_tarot = 0.1, spectralsUsed = 0, tarotUsed = 0}},
	eternal_compat = true,
	perishable_compat = false,
    blueprint_compat = true,
	--no_collection = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 12 },
	attributes = {'xmult', 'spectrals', 'tarot', 'scaling'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.xmult + (card.ability.extra.xmult_mod_spectrals * card.ability.extra.spectralsUsed ) - (card.ability.extra.xmult_mod_tarot * card.ability.extra.tarotUsed ), card.ability.extra.xmult_mod_spectrals, card.ability.extra.xmult_mod_tarot }}
	end,
    calculate = function(self, card, context)

		if context.using_consumeable and (context.consumeable.ability.set == "Tarot" or context.consumeable.ability.set == "Spectral") and not context.blueprint then

			card.ability.extra.tarotUsed = 0
			card.ability.extra.spectralsUsed = 0
			for k, v in pairs(G.GAME.consumeable_usage) do
				if v.set == 'Tarot' then 
					card.ability.extra.tarotUsed = card.ability.extra.tarotUsed + 1 
				end
				if v.set == 'Spectral' then
					card.ability.extra.spectralsUsed = card.ability.extra.spectralsUsed + 1
				end
			end
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod_spectrals * card.ability.extra.spectralsUsed ) - (card.ability.extra.xmult_mod_tarot * card.ability.extra.tarotUsed )
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