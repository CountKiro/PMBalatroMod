SMODS.Joker {
    key = "siegfried",
	name = "Siegfried",
	pronouns = "he_him",
	config = {extra = 0.2, xmult = 1},
	unlocked = false,
    eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
    rarity = 3,
	cost = 6,
	atlas = 'ModdedProjectMoon',
    pos = { x = 8, y = 2 },
	attributes = {'xmult', 'scaling', 'hands'},
    pools =
	{
        ["KCorp"] = true,
        ["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)

        return { vars = { card.ability.extra, card.ability.xmult } }
    end,
    calculate = function(self, card, context)


		if context.final_scoring_step and hand_chips * mult >= G.GAME.blind.chips and not context.blueprint then
			card.ability.xmult = card.ability.xmult + card.ability.extra
			return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } }
            }
		end
		

		if context.joker_main then
			return {
				xmult = card.ability.xmult
			}
		end

		

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_KCorp'), G.C.GREEN, G.C.BLACK, 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 5
    end
}