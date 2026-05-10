SMODS.Joker {
    key = "effie",
	name = "Effie",
	pronouns = "he_him",
	config = { extra = { mult = 0, mult_gain = 2, poker_hand = 'Pair', poker_hand_index = 0 } },
    eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
    rarity = 1,
    cost = 4,
    atlas = 'ModdedProjectMoon',
    pos = { x = 4, y = 2 },
	attributes = {'mult', 'scaling', 'hand_type'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, localize(card.ability.extra.poker_hand, 'poker_hands'), card.ability.extra.poker_hand_index } }
    end,
    calculate = function(self, card, context)

		local _poker_hands = {'High Card', 'Pair', 'Three of a Kind'}
		-- Increments mult if poker hand matches
        if context.joker_main and context.scoring_name == card.ability.extra.poker_hand then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                mult = card.ability.extra.mult,
				message = 'Nice!'
            }
        end
		-- Resets mult if poker hand doesn't match
		if context.joker_main and context.scoring_name ~= card.ability.extra.poker_hand then
			card.ability.extra.mult = 0
            return {
				mult = card.ability.extra.mult,
				message = '...'
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local _poker_hands = {'High Card','Pair','Three of a Kind'}
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('effie'))
            return {
                message = localize('k_reset')
            }
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {'High Card','Pair','Three of a Kind', 'Four of a Kind'}
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('effie'))
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), G.C.BLACK, G.C.RED, 1.2 )
 	end
}