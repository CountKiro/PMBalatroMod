SMODS.Joker {
	key = 'wei',
	name = "Wei",
	pronouns = "he_him",
	config = { extra = { mostPlayedHand = "", cardsInHand = 0, dollars = 2 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 9, y = 4 },
	attributes = {'economy', 'hand_type'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.dollars, card.ability.extra.mostPlayedHand } }
	end,
	calculate = function(self, card, context)

		if context.after then
			card.ability.extra.cardsInHand = #G.hand.cards
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			local _hand, _tally = nil, 0
			for _, handname in ipairs(G.handlist) do
				if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
					_hand = handname
					_tally = G.GAME.hands[handname].played
				end
			end
			card.ability.extra.mostPlayedHand = _hand
		end
    end,
	calc_dollar_bonus = function(self, card)
        if card.ability.extra.mostPlayedHand ~= "High Card" then
            return (card.ability.extra.cardsInHand * card.ability.extra.dollars)
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_jiaFamily'), HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}