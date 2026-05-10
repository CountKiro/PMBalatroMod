SMODS.Joker {
	key = 'zilu',
	name = "Zilu",
	pronouns = "she_her",
	config = { extra = { } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,	
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 1, y = 5 },
	attributes = {'rupture', 'passive'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_heishou'), HEX("362e29"), HEX('948e1c'), 1.2 )
 	end,
}