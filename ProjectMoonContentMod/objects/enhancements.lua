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
        end
    end
}