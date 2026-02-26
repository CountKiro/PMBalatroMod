local jd_def = JokerDisplay.Definitions -- You can assign it to a variable to use as shorthand

jd_def["j_pmcmod_lion"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "chips" },
        { text = "x",                              scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "chips" }
            }
        }
    }
}

jd_def["j_pmcmod_shiHuazhen"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = "x",                              scale = 0.35 },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "mult_mod" }
            }
        }
    },
    calc_function = function(card)
        if G.play then
            local my_pos = nil
            local mult = 0

			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
			if my_pos >= 2 then
				return {
					print(string.len(localize{type="name_text", set="Joker", key = G.jokers.cards[my_pos-1].config.center.key} or "")),
					mult = card.ability.extra.mult_mod * (string.len((localize{type="name_text", set="Joker", key = G.jokers.cards[my_pos-1].config.center.key} or "") or 0))
				}
			end
        end
        card.joker_display_values.count = mult
    end
}