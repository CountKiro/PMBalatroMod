SMODS.Seal {
    key = 'sinWrath',
    atlas = "ModdedProjectMoonEditions",
    pos = { x = 6, y = 4 },
    config = {    },
    badge_colour = G.C.RED,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then

            local randomValue = math.random(0, 10)

            local slothCount = 0

            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.seal == "sinSloth" then slothCount = slothCount + 1 end
            end

            local slothCountChips = slothCount * 2
            

            if randomValue <= 6 then
                card.ability.perma_chips = (card.ability.perma_chips or 0) + math.random(0, 8) + slothCountChips
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
            elseif randomValue >=7 and randomValue <= 9 then
                card.ability.perma_mult = (card.ability.perma_mult or 0) + math.random(0, 4) + slothCount
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            else
                card.ability.perma_p_dollars = (card.ability.perma_p_dollars or 0) + 1
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.GOLD
                }
            end

        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end
}