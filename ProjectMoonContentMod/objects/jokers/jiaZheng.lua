SMODS.Joker {
	key = 'jiaZheng',
	name = "Jia Zheng",
	pronouns = "he_him",
	config = { extra = { chips = 16 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 3 },
	attributes = {'chips', 'six'},
    pools =
	{
        
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { 10 + 5 * (G.GAME.round_resets.ante or 1) } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:get_id() == 6 then
            return {
                chips = card.ability.extra.chips + (5 * (G.GAME.round_resets.ante or 0))
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_jiaFamily'), HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}