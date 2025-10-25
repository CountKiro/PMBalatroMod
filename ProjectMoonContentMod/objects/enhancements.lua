SMODS.Enhancement {
    key = "burn",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 0, y = 2},
    config = { bonus = 0},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.percentChips}}
    end,
    update = function(self, card, dt)
        if G.GAME.blind and G.GAME.blind.in_blind then
            card.ability.bonus = G.GAME.blind.chips * 0.001
            if card.ability.bonus >= 9999 then
                card.ability.bonus = 9999
            end
        end
    end
}

SMODS.Enhancement {
    key = "pallid",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 1, y = 2},
    config = { bonus = 0, odds = 5},
    no_rank = false,
    no_suit = false,
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.bonus, (G.GAME.probabilities.normal or 1), card.ability.odds}}
    end,
    calculate = function(self, card, context)
        local ret = {}
        if context.main_scoring and context.cardarea == G.play then
            
            local my_pos = nil
            for i = 1, #context.full_hand do
                if context.full_hand[i] == card then
                    my_pos = i
                    break
                end
            end
            
            
            if pseudorandom('pallidLeft') < G.GAME.probabilities.normal / card.ability.odds then
                if my_pos and context.full_hand[my_pos - 1] and not SMODS.has_enhancement(context.full_hand[my_pos - 1]) then 
					context.full_hand[my_pos - 1]:set_ability('m_pmcmod_pallid', nil, true)
                    play_sound('tarot1')
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.full_hand[my_pos - 1]:juice_up()
                            return true
                        end
                    }))
                    print("Testing left")
			    end
            end

            if pseudorandom('pallidRight') < G.GAME.probabilities.normal / card.ability.odds then
                if my_pos and context.full_hand[my_pos + 1] and not SMODS.has_enhancement(context.full_hand[my_pos + 1]) then 
					context.full_hand[my_pos + 1]:set_ability('m_pmcmod_pallid', nil, true)
                    play_sound('tarot1')
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            context.full_hand[my_pos + 1]:juice_up()
                            return true
                        end
                    }))
                    print("Testing right")
			    end
            end
            ret.chips = -card.base.nominal
        end
        return ret
    end,
}