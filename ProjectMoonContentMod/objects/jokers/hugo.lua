SMODS.Joker {
	key = 'hugo',
	name = "Hugo",
	pronouns = "he_him",
	config = { extra = { dollars = 3 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 1,
	cost = 3,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 5 },
	attributes = {'economy', 'selling_card'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.dollars } }
	end,
	calculate = function(self, card, context)
		if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
			return
			{
				dollars = card.ability.extra.dollars
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_fixer'), G.C.BLACK, G.C.WHITE, 1.2 )
 	end,
}