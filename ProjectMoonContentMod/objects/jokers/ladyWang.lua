SMODS.Joker {
	key = 'ladyWang',
	name = "ladyWang",
	pronouns = "she_her",
	config = { extra = { mult = 6 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 3 },
	attributes = {'mult', 'six'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { 6 + 3 * (G.GAME.round_resets.ante or 1) } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:get_id() == 6 then
            return {
                mult = card.ability.extra.mult + (3 * (G.GAME.round_resets.ante or 0))
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_wangFamily'), HEX("525252"), HEX('c2c2c2'), 1.2 )
 	end,
}