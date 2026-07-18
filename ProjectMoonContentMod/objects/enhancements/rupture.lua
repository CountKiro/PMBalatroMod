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
    end,
    set_sprites = function(self, card, front)
    G.E_MANAGER:add_event(Event({
      blockable = false,
      func = function()
        card.canvas_text = SMODS.CanvasSprite {
          canvasW = 71, canvasH = 95,
          text_offset = { x = 10, y = 86 },
          text_colour = HEX('00f5b4'),
          text_width = 15,
          text_height = 10,
          ref_table = card.ability,
          ref_value = "counter",
          text = "?"
        }
        return true
      end
    }))
    end,
}