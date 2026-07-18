SMODS.Seal {
    key = 'pebble',
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 1, y = 3 },
    config = { extra = { money = 5 } },
    badge_colour = ((HEX("939694"))),
    get_p_dollars = function(self, card)
        return card.ability.seal.extra.money
    end,
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            card:set_seal()
        end
    end
}