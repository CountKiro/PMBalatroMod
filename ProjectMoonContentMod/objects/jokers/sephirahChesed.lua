SMODS.Joker {
    key = "sephirahChesed",
	name = "Sephirah Chesed",
	pronouns = "he_him",
	config = {extra = {xchips = 2, xchips_mod = 0.1, baseChance = 1, maxChance = 2}},
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 11 },
	attributes = {'xchips', 'chance', 'scaling'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'chesed')
        return {vars = { card.ability.extra.xchips, card.ability.extra.xchips_mod, new_numerator, new_denominator } } 
    end,

    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.pseudorandom_probability(card, 'chesed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'chesed') then
				card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_mod
				return {
						message = localize { type = 'variable', key = 'a_xchips', vars = { card.ability.extra.xchips_mod } },
						colour = G.C.RED
				}
			end
        end

		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xchips', vars = { card.ability.extra.xchips } },
				xchips = card.ability.xchips
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}