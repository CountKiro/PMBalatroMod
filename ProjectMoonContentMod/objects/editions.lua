SMODS.Edition {
    key = 'charge',
    shader = 'voucher',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = { count = 0 },
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    sound = { sound = "negative", per = 1.5, vol = 0.4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.count } }
    end,
    get_weight = function(self)
        return self.weight
    end,
    calculate = function(self, card, context)
--        if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then

        if context.retrigger_joker_check and context.other_card == card and card.edition.count >= 4 then
            return {
                repetitions = 1
            }
        end
        if context.post_joker then

            local rudolphPresent = false

            for i=1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.key == "j_pmcmod_robotEnoch" then
                    rudolphPresent = true
                    break
                end
            end

            card.edition.count = card.edition.count + 1
                if rudolphPresent then 
                    card.edition.count = card.edition.count + 1
                end
            if card.edition.count >= 5 then
                card.edition.count = 0
            end
        end
    end
}