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