SMODS.Joker {
    key = "robotGebura",
	name = "Gebura (Robot)",
	pronouns = "she_her",
	config = {extra = {mult = 0}},
	eternal_compat = true,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 12 },
	attributes = {'mult', 'hands_left'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)

		card.ability.extra.mult = (G.GAME.current_round.hands_played)*10

		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				dollars = -card.ability.extra.mult/2,
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