SMODS.Joker {
	key = 'bloodfiend',
	name = "Bloodfiend",
	pronouns = "they_them",
	config = { extra = { mult = 8} },
	eternal_compat = false,
	perishable_compat = true,
    blueprint_compat = true,
    --	no_collection = true,
	rarity = 1,
    cost = 3,
	atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 11 },
	attributes = {'mult', 'generic'},
	pools =
	{
        ["Bloodfiends"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.mult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
	get_weight = function(self, weight)
    	return weight*(2^(#SMODS.find_card('j_pmcmod_romero')*G.GAME.round_resets.ante))
	end,
	in_pool = function(self, args)
		if SMODS.find_card('j_pmcmod_romero') then
			return true
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_lamanchaland'), HEX('bd0d19'), HEX('4f3d2d'), 1.2 )
 	end
}

-- Heretic
SMODS.Joker {
	key = 'heretic',
	name = "Heretic",
	pronouns = "they_them",
	config = { extra = { chips = 15} },
	eternal_compat = false,
	perishable_compat = true,
    blueprint_compat = true,
    --	no_collection = true,
	rarity = 1,
    cost = 3,
	atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 11 },
	attributes = {'chips', 'generic'},
	pools =
	{
        ["Heretics"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.chips}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
	end,
	get_weight = function(self, weight)
    	return weight*(2^(#SMODS.find_card('j_pmcmod_kromer')*G.GAME.round_resets.ante))
	end,
	in_pool = function(self, args)
		if SMODS.find_card('j_pmcmod_kromer') then
			return true
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_unknown'), HEX('bd0d19'), HEX('4f3d2d'), 1.2 )
 	end
}