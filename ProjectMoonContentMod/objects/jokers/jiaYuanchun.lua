SMODS.Joker {
	key = 'jiaYuanchun',
	name = "Jia Yuanchun",
	pronouns = "she_her",
	config = { extra = { dollars = 6 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,	
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 6, y = 3 },
	attributes = {'tags', 'economy'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.dollars } }
	end,
	calculate = function(self, card, context)
		
    end,
	calc_dollar_bonus = function(self, card)
        if #G.GAME.tags >= 2 and G.GAME.last_blind and G.GAME.last_blind.boss then
            return ((#G.GAME.tags - 1) *  card.ability.extra.dollars)
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_jiaFamily'), HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}