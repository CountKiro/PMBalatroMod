SMODS.Joker {
	key = 'shrenne',
	name = "Shrenne",
	pronouns = "she_her",
	config = { extra = { mult = 0 } },
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 3 },
	attributes = {'mult', 'scaling', 'selling_card'},
    pools =
	{
        ["KCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
        if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
		if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
                    card.ability.extra.mult = card.ability.extra.mult + (context.card.sell_cost/2)
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_KCorp'), G.C.GREEN, G.C.BLACK, 1.2 )
 	end
}