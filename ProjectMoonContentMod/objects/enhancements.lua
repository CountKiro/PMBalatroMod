-- Bleed
SMODS.Enhancement {
    key = "bleed",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 2, y = 2},
    config = { triggersLeft = 5},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return { vars = {card.ability.triggersLeft}}
    end,
    calculate = function(self, card, context)

        if context.main_scoring and context.cardarea == G.play then

            local bleedCounting = 0
            local tremorCounting = 0

            for i = 1, #G.play.cards do
                if SMODS.has_enhancement(G.play.cards[i], 'm_pmcmod_bleed') then
                    bleedCounting = bleedCounting + 1
                end
            end

            for i = 1, #G.play.cards do
                if SMODS.has_enhancement(G.play.cards[i], 'm_pmcmod_tremor') then
                    tremorCounting = tremorCounting + 1
                end
            end

        --if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_pmcmod_bleed') then
            card.ability.perma_mult = (card.ability.perma_mult or 0) + (bleedCounting * (1 + tremorCounting))
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

-- Sinking
SMODS.Enhancement {
    key = "sinking",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 3, y = 2},
    config = { reduction = 0.05},
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.triggersLeft}}
    end,
    calculate = function(self, card, context)

        local tremorCounting = 0

        for i = 1, #G.play.cards do
            if SMODS.has_enhancement(G.play.cards[i], 'm_pmcmod_tremor') then
                tremorCounting = tremorCounting + 1
            end
        end

        if context.main_scoring and context.cardarea == G.play then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.blind.chips = G.GAME.blind.chips - math.floor(G.GAME.blind.chips * card.ability.reduction * (1 + tremorCounting))
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

-- Rupture
SMODS.Enhancement {
    key = "rupture",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 4, y = 2},
    config = { counter = 0, bonus = 0},
    loc_vars = function(self, info_queue, card)
        
        return { vars = {card.ability.counter}}
    end,
    calculate = function(self, card, context)

        local tremorCounting = 0

        for i = 1, #G.play.cards do
            if SMODS.has_enhancement(G.play.cards[i], 'm_pmcmod_tremor') then
                tremorCounting = tremorCounting + 1
            end
        end

        if context.main_scoring and context.cardarea == G.play then

            local ziluPresent = false

            for i=1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.key == "j_pmcmod_zilu" then
                    ziluPresent = true
                    break
                end
            end

            if ziluPresent then

                if card:is_face() then
                    card.ability.counter = card.ability.counter + (4 * (1 + tremorCounting))
                else
                    card.ability.counter = card.ability.counter + (8 * (1 + tremorCounting))
                end
            else
                if card:is_face() then
                    card.ability.counter = card.ability.counter + (2 * (1 + tremorCounting))
                else
                    card.ability.counter = card.ability.counter + (4 * (1 + tremorCounting))
                end
            end

            if card.ability.counter > 99 then
                card.ability.counter = 99
            end

        end
    end,
    update = function(self, card, dt)
        card.ability.bonus = card.ability.counter * 2
    end
}

-- Poise
SMODS.Enhancement {
    key = "poise",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 5, y = 2},
    config = { counter = 0, baseChance = 1, maxChance = 10, maxChanceShiomi = 2, extra = {xmult = 2}},
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.counter, card.ability.maxChance, 'poise')
        local new_numeratorShiomi, new_denominatorShiomi = SMODS.get_probability_vars(card, card.ability.baseChance, card.ability.maxChanceShiomi, 'shiomi')
        return {vars = { card.ability.extra.xmult, card.ability.counter, new_numerator, new_denominator, new_numeratorShiomi, new_denominatorShiomi } }
    end,
    calculate = function(self, card, context)

        local tremorCounting = 0

        for i = 1, #G.play.cards do
            if SMODS.has_enhancement(G.play.cards[i], 'm_pmcmod_tremor') then
                tremorCounting = tremorCounting + 1
            end
        end

        if context.main_scoring and context.cardarea == G.play then
            local ret = {}
            local shiomiPresent = false
            local renPresent = false

            for i=1, #G.jokers.cards do

                if G.jokers.cards[i].config.center.key == "j_pmcmod_shiomiYoru" then
                    shiomiPresent = true
                    break
                end

            end

            if shiomiPresent then
                if SMODS.pseudorandom_probability(card, 'shiomi', card.ability.baseChance, card.ability.maxChanceShiomi, 'shiomi') then
                    card.ability.counter = card.ability.counter + (2 * (1 + tremorCounting))
                end
            else
                card.ability.counter = card.ability.counter + (1 * (1 + tremorCounting))
            end

            if SMODS.pseudorandom_probability(card, 'poise', card.ability.counter, card.ability.maxChance, 'poise') then
                ret.xmult = card.ability.extra.xmult
                card.poise_trigger = true
                card.ability.counter = 1
            end

            G.E_MANAGER:add_event(Event {
                func = function()
                    card.poise_trigger = true
                    return true
                end
            })

            return ret

        end

        
    end,
    update = function(self, card, dt)
        
    end
}


-- Burn
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
            if to_big(card.ability.bonus) >= to_big(9999) then
                card.ability.bonus = 9999
            end
        end
    end
}

-- Tremor
SMODS.Enhancement {
    key = "tremor",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 6, y = 2},
    config = { bonus = 0},
    loc_vars = function(self, info_queue, card)

        return { vars = {}}
    end,
    update = function(self, card, dt)

    end
}



-- Pallid
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