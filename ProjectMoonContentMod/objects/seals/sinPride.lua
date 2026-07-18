SMODS.Seal {
    key = 'sinPride',
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 0, y = 4 },
    config = {  xmult = 1.4  },
    badge_colour = G.C.RED,
    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then

            local slothCount = 0

            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.seal == "sinSloth" then slothCount = slothCount + 1 end
            end

            return {
                xmult = card.ability.seal.xmult + (slothCount / 10)
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.xmult } }
    end
}