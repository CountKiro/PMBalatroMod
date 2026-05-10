SMODS.Joker {
	key = 'aengDu',
	name = "Aeng Du",
	pronouns = "she_her",
	config = { extra = {xmult = 2 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 7 },
	attributes = {'xmult', 'hands'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and G.GAME.current_round.hands_played >= 1 and G.GAME.current_round.hands_left >= 1 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_blade'), HEX('26292e'), HEX('a81338'), 1.2 )
 	end,
}