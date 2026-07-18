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