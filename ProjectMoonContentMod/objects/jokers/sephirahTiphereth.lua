SMODS.Joker {
    key = "sephirahTiphereth",
	name = "Sephirah Tiphereth",
	pronouns = "she_her",
	config = {extra = {aceMult = 10, aceMult_mod = 10}},
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 8, y = 11 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.aceMult, card.ability.extra.aceMult_mod } }
    end,

    calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.aceMult = card.ability.extra.aceMult + card.ability.extra.aceMult_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end
		if context.individual and context.cardarea == G.play and
            context.other_card:get_id() == 14 then
            return {
                mult = card.ability.extra.aceMult
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