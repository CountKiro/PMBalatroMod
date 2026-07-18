SMODS.Seal {
    key = 'gift',
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 2, y = 3 },
    config = { extra = { mult = 10 } },
    badge_colour = ((HEX("ba1e3a"))),
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                mult = card.ability.seal.extra.mult,
                card:set_seal()
            }
        end
    end
}