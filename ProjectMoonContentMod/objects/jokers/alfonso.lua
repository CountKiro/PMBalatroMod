SMODS.Joker {
	key = 'alfonso',
	name = "Alfonso",
	pronouns = "she_her",
	config = { extra = { dollars = 10, odds = 2 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 3 },
	attributes = {'economy', 'chance'},
    pools =
	{
        ["KCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollars, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.before and context.main_eval and G.GAME.hands[context.scoring_name].level > 1 and not context.blueprint then
			if pseudorandom('alfonso') < G.GAME.probabilities.normal / card.ability.extra.odds then
				if G.GAME.hands[context.scoring_name].level > 1 then
					return {
						level_up = -1,
						dollars = card.ability.extra.dollars
					}
                end
			else
			return{
				dollars = card.ability.extra.dollars
			}
			end
    	end
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 6
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_KCorp'), G.C.GREEN, G.C.BLACK, 1.2 )
 	end

}