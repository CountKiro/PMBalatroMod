SMODS.Joker {
	key = 'jun',
	name = "Jun",
	pronouns = "he_him",
	config = { extra = {xmult = 2.5} },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 7 },
	attributes = {'xmult', 'hands'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and G.GAME.current_round.hands_played == 0 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_kurokumo'), HEX('292a2e'), HEX('6f7178'), 1.2 )
 	end,
}