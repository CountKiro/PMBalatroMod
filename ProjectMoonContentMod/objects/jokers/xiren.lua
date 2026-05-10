SMODS.Joker {
	key = 'xiren',
	name = "Xiren",
	pronouns = "she_her",
	config = { extra = { lastPlayedHand = "", mult_mod = 3 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 8, y = 4 },
	attributes = {'mult', 'hand_type'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)

		if context.before and not context.blueprint then
			local _hand, _tally = nil, 0
			for _, handname in ipairs(G.handlist) do
				if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
					_hand = handname
					_tally = G.GAME.hands[handname].played
				end
			end
			card.ability.extra.mostPlayedHand = _hand
		end
		
		if context.joker_main then
			return {
				mult = (G.GAME.hands[card.ability.extra.mostPlayedHand].played - G.GAME.hands[context.scoring_name].played) * card.ability.extra.mult_mod
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_jiaFamily'), HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}