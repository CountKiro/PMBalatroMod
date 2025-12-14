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

-- Pebble Seal
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


-- Gift Seal
SMODS.Seal {
    key = 'gift',
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 2, y = 3 },
    config = { extra = { mult = 10 } },
    badge_colour = ((HEX("ba1e3a"))),
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            card:set_seal()
            return {
                mult = card.ability.seal.mult
            }
        end
    end
}