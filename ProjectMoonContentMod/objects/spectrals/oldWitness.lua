-- Old Witness effect
--[[SMODS.Consumable {
    key = 'witness',
	name = "Witness",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 6, y = 5 },
    config = { extra = { destroy = 4}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy } }
    end,
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local temp_hand = {}
        
        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )

        pseudoshuffle(temp_hand, pseudoseed('witness'))

        for i = 1, card.ability.extra.destroy do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
		G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                SMODS.destroy_cards(destroyed_cards)
                return true
            end
        }))
        delay(0.5)
        SMODS.add_card({ set = 'Spectral', edition = "e_negative", area = G.consumeables })
		delay(0.3)
		SMODS.add_card({ set = 'Tarot', edition = "e_negative", area = G.consumeables })
		delay(0.3)
		SMODS.add_card({ set = 'Planet', edition = "e_negative", area = G.consumeables })
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}]]--