SMODS.Joker {
	key = 'sonya',
	name = "Sonya",
	pronouns = "he_him",
	config = { extra = { odds = 100, chips = 77} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 2 },
	attributes = {'chance', 'chips', 'hand_type'},
    pools =
	{
        ["NewLeagueOfNine"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_soul
		return { vars = { card.ability.extra.chips, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands["Flush"]) and not context.blueprint then
			if pseudorandom('sonya') < G.GAME.probabilities.normal / card.ability.extra.odds then
				SMODS.add_card({set = 'Spectral', key = 'c_soul' })
			end
			return {
				chips = card.ability.extra.chips,
			}
		end
	end,
	locked_loc_vars = function(self, info_queue, card)
        return { vars = { number_format(50000), number_format(7) } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'chip_score' and to_big(args.chips) >= to_big(50000) and to_big(args.chips)%to_big(7) == to_big(0)
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_newLeagueOfNine'), HEX('242b45'), HEX('d5001e'), 1.2 )
 	end
}