------------
-- JOKERS --
------------

SMODS.Seal {
    key = 'markofcain',
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 0, y = 3 },
    config = {  xmult = 1.2  },
    badge_colour = G.C.RED,
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_mult = card.ability.seal.xmult
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.xmult } }
    end
}