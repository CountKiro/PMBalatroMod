SMODS.Enhancement {
    key = "bleed",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 2, y = 2},
    config = { },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return { vars = {}}
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

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
    end,
    update = function(self, card, dt)
        
    end,
    set_sprites = function(self, card, front)
    G.E_MANAGER:add_event(Event({
      blockable = false,
      func = function()
        card.canvas_text = SMODS.CanvasSprite {
          canvasW = 71, canvasH = 95,
          text_offset = { x = 10, y = 86 },
          text_colour = HEX('ded5d3'),
          text_width = 15,
          text_height = 10,
          ref_table = card.ability,
          ref_value = "perma_mult",
          text = "?"
        }
        return true
      end
    }))
    end,
}