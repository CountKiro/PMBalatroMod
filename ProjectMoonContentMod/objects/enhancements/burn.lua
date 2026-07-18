SMODS.Enhancement {
    key = "burn",
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 0, y = 2},
    config = { bonus = 0, triggersLeft = 4},
    loc_vars = function(self, info_queue, card)
        local currentBlindCount = 0
        if G.GAME.blind and G.GAME.blind.in_blind then
            currentBlindCount = G.GAME.blind.chips
        end
        return { vars = {(currentBlindCount or 0) * 0.001, card.ability.triggersLeft}}
    end,
    update = function(self, card, dt)
        if G.GAME.blind and G.GAME.blind.in_blind then
            card.ability.bonus = G.GAME.blind.chips * 0.001
            if to_big(card.ability.bonus) >= to_big(9999) then
                card.ability.bonus = 9999
            end
        end
    end,
    calculate = function(self, card, context)
        if context.after then
            card.ability.triggersLeft = card.ability.triggersLeft - 1

            if card.ability.triggersLeft <= 0 then
                card:set_ability("c_base")
            end
        end
    end,
    set_sprites = function(self, card, front)
    G.E_MANAGER:add_event(Event({
      blockable = false,
      func = function()
        card.canvas_text = SMODS.CanvasSprite {
          canvasW = 71, canvasH = 95,
          text_offset = { x = 9, y = 86 },
          text_colour = HEX('260a03'),
          text_width = 15,
          text_height = 10,
          ref_table = card.ability,
          ref_value = "triggersLeft",
          text = "?"
        }
        return true
      end
    }))
    end,
}