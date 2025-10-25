---------------
-- SPECTRALS --
---------------

-- Witness
SMODS.Consumable {
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
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        local faces = {"King", "Queen", "Jack"}
        for i = 1, #G.hand.cards do
            local _rank = pseudorandom_element(faces, 'outcast')
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    assert(SMODS.change_base(_card, "Clubs", _rank))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

-- Outcast
SMODS.Consumable {
    key = 'outcast',
	name = "Outcast",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 7, y = 5 },
    config = { extra = { destroy = 4}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy } }
    end,
    use = function(self, card, area, copier)
        G.hand:change_size(-1)
        for i = 1, #G.hand.cards do
				local possible_enhancements = {'m_bonus', 'm_mult', 'm_wild', 'm_glass', 'm_steel', 'm_stone', 'm_gold', 'm_lucky'}
                    G.hand.cards[i]:set_ability(pseudorandom_element(possible_enhancements, pseudoseed('hermann')), nil, true)
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
        return G.hand and #G.hand.cards > 0
    end
}

-- Unloving
SMODS.Consumable {
    key = 'unloving',
	name = "Unloving",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 8, y = 5 },
    config = { extra = { destroy = 4}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy } }
    end,
    use = function(self, card, area, copier)
        local destructable_jokers = {}
        for i = 1, #G.jokers.cards do
                if not G.jokers.cards[i].ability.eternal then 
                    destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] 
                end
        end
        local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('unloving')) or nil

        if joker_to_destroy then
            joker_to_destroy.getting_sliced = true
            G.E_MANAGER:add_event(Event({func = function()
                card:juice_up(0.8, 0.8)
                joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
            return true end }))
        end
        
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand.cards[i]:set_ability("m_bonus", nil, true)
                    G.hand.cards[i]:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and #G.jokers.cards > 0
    end
}

-- Hunt
SMODS.Consumable {
    key = 'hunt',
	name = "Hunt",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 9, y = 5 },
    config = { max_highlighted = 1, mod_conv = 'm_pmcmod_pallid' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}

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

