SMODS.Enhancement {
    key = "bleed",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 2, y = 2},
    config = { triggersLeft = 5},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.triggersLeft}}
    end,
    calculate = function(self, card, context)

        if context.main_scoring and context.cardarea == G.play then

            local bleedCounting = 0

            for i = 1, #G.play.cards do
                if SMODS.has_enhancement(G.play.cards[i], 'm_pmcmod_bleed') then
                    bleedCounting = bleedCounting + 1
                end
            end

        --if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_pmcmod_bleed') then
            card.ability.perma_mult = (card.ability.perma_mult or 0) + bleedCounting
            card.ability.triggersLeft = card.ability.triggersLeft - 1

            if card.ability.triggersLeft <= 0 then
                card:set_ability("c_base")
            end

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
    end,
    update = function(self, card, dt)
        
    end
}

SMODS.Enhancement {
    key = "sinking",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 3, y = 2},
    config = { reduction = 0.05},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.triggersLeft}}
    end,
    calculate = function(self, card, context)


        if context.main_scoring and context.cardarea == G.play then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.blind.chips = G.GAME.blind.chips - math.floor(G.GAME.blind.chips * card.ability.reduction)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
				G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
				G.HUD_blind:recalculate() 
				G.hand_text_area.blind_chips:juice_up()
			return true end }))
		end

    end,
    update = function(self, card, dt)
        
    end
}

SMODS.Enhancement {
    key = "burn",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 0, y = 2},
    config = { bonus = 0},
    loc_vars = function(self, info_queue, card)
        local currentBlindCount = 0
        if G.GAME.blind and G.GAME.blind.in_blind then
            currentBlindCount = G.GAME.blind.chips
        end
        return { vars = {(currentBlindCount or 0) * 0.001}}
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