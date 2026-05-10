SMODS.Joker {
    key = "saude",
	name = "Saude",
	pronouns = "she_her",
	config = { extra = { chips = 0, chips_gain = 5, suit = 'Spades', suit_index = 0 } },
    eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
    rarity = 1,
    cost = 4,
    atlas = 'ModdedProjectMoon',
    pos = { x = 5, y = 2 },
	attributes = {'chips', 'scaling', 'spades'},
    pools =
	{

 	},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain, localize(card.ability.extra.suit, 'suits_plural'), card.ability.extra.suit_index } }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
		local suits_type = {
                'Hearts',
                'Diamonds',
                'Spades',
                'Clubs'
        }

		local suits = {
			['Hearts'] = 0,
			['Diamonds'] = 0,
			['Spades'] = 0,
			['Clubs'] = 0
		}

		for i = 1, #context.scoring_hand do
                if not SMODS.has_any_suit(context.scoring_hand[i]) then
                    if context.scoring_hand[i]:is_suit('Hearts', true) and suits['Hearts'] == 0 then
                        suits['Hearts'] = suits['Hearts'] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits['Diamonds'] == 0 then
                        suits['Diamonds'] = suits['Diamonds'] + 1
                    elseif context.scoring_hand[i]:is_suit('Spades', true) and suits['Spades'] == 0 then
                        suits['Spades'] = suits['Spades'] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits['Clubs'] == 0 then
                        suits['Clubs'] = suits['Clubs'] + 1
                    end
                end
            end
            for i = 1, #context.scoring_hand do
                if SMODS.has_any_suit(context.scoring_hand[i]) then
                    if context.scoring_hand[i]:is_suit('Hearts') and suits['Hearts'] == 0 then
                        suits['Hearts'] = suits['Hearts'] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits['Diamonds'] == 0 then
                        suits['Diamonds'] = suits['Diamonds'] + 1
                    elseif context.scoring_hand[i]:is_suit('Spades') and suits['Spades'] == 0 then
                        suits['Spades'] = suits['Spades'] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs') and suits['Clubs'] == 0 then
                        suits['Clubs'] = suits['Clubs'] + 1
                    end
                end
            end

			if (card.ability.extra.suit == 'Hearts' and suits['Hearts'] > 0) or
			   (card.ability.extra.suit == 'Diamonds' and suits['Diamonds'] > 0) or
			   (card.ability.extra.suit == 'Spades' and suits['Spades'] > 0) or
			   (card.ability.extra.suit == 'Clubs' and suits['Clubs'] > 0) then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
                return {
                    chips = card.ability.extra.chips,
					message = 'Nice!'
                }
			else
				card.ability.extra.chips = 0
				return {
                    chips = card.ability.extra.chips,
					message = 'Ugh...'
                }
            end

		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local suits_type = {
                'Hearts',
                'Diamonds',
                'Spades',
                'Clubs'
       	 	}
            card.ability.extra.suit = pseudorandom_element(suits_type, pseudoseed('saude'))
            return {
                message = localize('k_reset')
            }
        end

    end,
    set_ability = function(self, card, initial, delay_sprites)
        local suits_type = {
                'Hearts',
                'Diamonds',
                'Spades',
                'Clubs'
        }
        card.ability.extra.suit = pseudorandom_element(suits_type, pseudoseed('saude'))
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), G.C.BLACK, G.C.RED, 1.2 )
 	end
}