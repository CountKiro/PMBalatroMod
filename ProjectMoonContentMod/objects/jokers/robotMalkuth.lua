SMODS.Joker {
    key = "robotMalkuth",
	name = "Malkuth (Robot)",
	pronouns = "she_her",
	config = {extra = {mult = 0, odds = 4}},
	eternal_compat = true,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pos = { x = 2, y = 12 },
	attributes = {'mult', 'chance'},
    pools = 
	{
 		["Heretics"] = true,
 	},
	no_pool_flag = 'robot_extinct',
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)

		if context.before and context.main_eval and G.GAME.hands[context.scoring_name].level > 1 then
			if pseudorandom('malk') < G.GAME.probabilities.normal / card.ability.extra.odds then
				if G.GAME.hands[context.scoring_name].level > 1 then
						return {
							level_up = -1,
						}
				end
			end
    	end

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
		G.GAME.hands["Flush Five"].level) - 12

		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
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