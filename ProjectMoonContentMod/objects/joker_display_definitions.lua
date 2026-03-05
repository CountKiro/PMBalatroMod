local jd_def = JokerDisplay.Definitions

jd_def["j_pmcmod_kim"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
            }
        }
    },
    calc_function = function(card)
        card.joker_display_values.x_mult = ((G.GAME.current_round.hands_left == 1 and not next(G.play.cards)) or
                (G.GAME.current_round.hands_left == 0 and next(G.play.cards))) and
            card.ability.extra.xmult or
            1
    end
}

jd_def["j_pmcmod_angelica"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT }
}

jd_def["j_pmcmod_puppeteer"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT }
}

jd_def["j_pmcmod_nikolai"] = {
    text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        calc_function = function(card)
            card.joker_display_values.mult = (G.jokers and G.jokers.cards and #card.ability.extra.savedJokers or 0) * card.ability.extra.mult_mod
        end
}

jd_def["j_pmcmod_panther"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT }
}

jd_def["j_pmcmod_lion"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS }
}

jd_def["j_pmcmod_wolf"] = {
    text = {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability", ref_value = "xmult", retrigger_type = "exp" }
            }
        }
}

jd_def["j_pmcmod_demian"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" }
                }
            }
        }
}

jd_def["j_pmcmod_shiHuazhen"] = {
    text = {
            { text = "+" },
            { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
        },
    text_config = { colour = G.C.MULT },
        calc_function = function(card)
            local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
                if my_pos >= 2 then
                    --card.joker_display_values.mult = card.ability.extra.mult_mod * (string.len((localize{type="name_text", set="Joker", key = G.jokers.cards[my_pos-1].config.center.key} or "") or 0))
                    card.joker_display_values.mult = (G.jokers and G.jokers.cards and (string.len((localize{type="name_text", set="Joker", key = G.jokers.cards[my_pos-1].config.center.key} or ""))) or 0) * card.ability.extra.mult_mod
                else
                    card.joker_display_values.mult = 0
                end
        end
}