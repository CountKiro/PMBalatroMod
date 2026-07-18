SMODS.Consumable {
    key = 'outcast',
	name = "Outcast",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 7, y = 5 },
    config = { extra = { destroy = 4, hands = -1}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy } }
    end,
    use = function(self, card, area, copier)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands)
        for i = 1, #G.hand.cards do
				local possible_enhancements = {'m_bonus', 'm_mult', 'm_wild', 'm_glass', 'm_steel', 'm_stone', 'm_gold', 'm_lucky'}
                    G.hand.cards[i]:set_ability(pseudorandom_element(possible_enhancements, pseudoseed('outcast')), nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            --scored_card:juice_up()
                            return true
                        end
                    }))
                    G.hand.cards[i]:juice_up(0.3, 0.5)
        end
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and G.GAME.round_resets.hands > 1
    end
}