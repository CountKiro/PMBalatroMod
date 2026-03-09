local jd_def = JokerDisplay.Definitions



jd_def["j_pmcmod_esther"] = {

}

jd_def["j_pmcmod_gloria"] = {

}

jd_def["j_pmcmod_hubert"] = {

}

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

jd_def["j_pmcmod_kalo"] = {
    text = {
        { text = " +",                             colour = G.C.MULT },
        { ref_table = "card.joker_display_values", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "(" },
            {
                ref_table = "card.joker_display_values",
                ref_value = "localized_text",
            },
            { text = ")" },
        },
    calc_function = function(card)

        local quantityOfThumbMembers = 0

            for i = 1, #G.jokers.cards do
				for j = 1, #G.P_CENTER_POOLS.Thumb do
					if G.jokers.cards[i] ~= card and (G.P_CENTER_POOLS.Thumb[j].key == G.jokers.cards[i].config.center.key)
					then quantityOfThumbMembers = quantityOfThumbMembers + 1 end
				end
			end
            local tempMult = 0
			tempMult = card.ability.extra.quantityOfThumbMembers * card.ability.extra.extraMult
            local mult = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit(card.ability.extra.suit) then
                        mult = mult + card.ability.extra.mult + (tempMult) *
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.mult = mult
            card.joker_display_values.localized_text = localize(card.ability.extra.suit, 'suits_plural')
        end,
        style_function = function(card, text, reminder_text, extra)
            local suit_node = reminder_text and reminder_text.children and reminder_text.children[2]
            if suit_node then suit_node.config.colour = lighten(G.C.SUITS["Diamonds"], 0.35) end
        end
}

jd_def["j_pmcmod_katriel"] = {
    text = {
        { text = " +",                             colour = G.C.MULT },
        { ref_table = "card.joker_display_values", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "(" },
            {
                ref_table = "card.joker_display_values",
                ref_value = "localized_text",
            },
            { text = ")" },
        },
    calc_function = function(card)
            local wildCardsTally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
                end
            end
            local mult = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit(card.ability.extra.suit) then
                        mult = card.ability.extra.mult +
                            (card.ability.extra.extraMult *
                            wildCardsTally) *
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.mult = mult
            card.joker_display_values.localized_text = localize(card.ability.extra.suit, 'suits_plural')
        end,
        style_function = function(card, text, reminder_text, extra)
            local suit_node = reminder_text and reminder_text.children and reminder_text.children[2]
            if suit_node then suit_node.config.colour = lighten(G.C.SUITS["Hearts"], 0.35) end
        end
}

jd_def["j_pmcmod_denis"] = {
    text = {
        { text = " +",                             colour = G.C.MULT },
        { ref_table = "card.joker_display_values", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "(" },
            {
                ref_table = "card.joker_display_values",
                ref_value = "localized_text",
            },
            { text = ")" },
        },
    calc_function = function(card)
            local wildCardsTally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
                end
            end
            local mult = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit(card.ability.extra.suit) then
                        mult = card.ability.extra.mult +
                            (card.ability.extra.extraMult *
                            wildCardsTally) *
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.mult = mult
            card.joker_display_values.localized_text = localize(card.ability.extra.suit, 'suits_plural')
        end,
        style_function = function(card, text, reminder_text, extra)
            local suit_node = reminder_text and reminder_text.children and reminder_text.children[2]
            if suit_node then suit_node.config.colour = lighten(G.C.SUITS["Spades"], 0.35) end
        end
}

jd_def["j_pmcmod_boris"] = {
    text = {
        { text = " +",                             colour = G.C.MULT },
        { ref_table = "card.joker_display_values", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
        reminder_text = {
            { text = "(" },
            {
                ref_table = "card.joker_display_values",
                ref_value = "localized_text",
            },
            { text = ")" },
        },
    calc_function = function(card)
            local wildCardsTally = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
                end
            end
            local mult = 0
            local text, _, scoring_hand = JokerDisplay.evaluate_hand()
            if text ~= 'Unknown' then
                for _, scoring_card in pairs(scoring_hand) do
                    if scoring_card:is_suit(card.ability.extra.suit) then
                        mult = card.ability.extra.mult +
                            (card.ability.extra.extraMult *
                            wildCardsTally) *
                            JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    end
                end
            end
            card.joker_display_values.mult = mult
            card.joker_display_values.localized_text = localize(card.ability.extra.suit, 'suits_plural')
        end,
        style_function = function(card, text, reminder_text, extra)
            local suit_node = reminder_text and reminder_text.children and reminder_text.children[2]
            if suit_node then suit_node.config.colour = lighten(G.C.SUITS["Clubs"], 0.35) end
        end
}

jd_def["j_pmcmod_angelaLoR"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS }
}

jd_def["j_pmcmod_yiSang"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
}

jd_def["j_pmcmod_donQuixote"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS }
}

jd_def["j_pmcmod_ryoshu"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
}

jd_def["j_pmcmod_ishmael"] = {
    text = {
            { text = "+", colour = G.C.MULT },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" },
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        },
}

jd_def["j_pmcmod_michelle"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
}

jd_def["j_pmcmod_elijah"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT }
}

jd_def["j_pmcmod_giovanni"] = {
    text = {
            { text = "+",                              colour = G.C.CHIPS },
            { ref_table = "card.ability.extra", ref_value = "chips", colour = G.C.CHIPS, retrigger_type = "mult" },
            { text = " +",                             colour = G.C.MULT },
            { ref_table = "card.ability.extra", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
        },
}

jd_def["j_pmcmod_gabriel"] = {
    text = {
            { text = "+",                              colour = G.C.CHIPS },
            { ref_table = "card.ability.extra", ref_value = "chips", colour = G.C.CHIPS, retrigger_type = "mult" },
            { text = " +",                             colour = G.C.MULT },
            { ref_table = "card.ability.extra", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
        },
}

jd_def["j_pmcmod_daniel"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
}

jd_def["j_pmcmod_kali"] = {
    
}

jd_def["j_pmcmod_benjamin"] = {
    
}

jd_def["j_pmcmod_kali"] = {
    
}

jd_def["j_pmcmod_lisa"] = {
    text = {
        { text = " +",                             colour = G.C.MULT },
        { ref_table = "card.joker_display_values", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
    },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        { text = "Enouch death: (" },
            { ref_table = "card.ability.extra", ref_value = "enochDeathCounter" },
            { text = "/" },
            { text = "3" },
            { text = ")" },
        { text = "Act count: ()" },
            { ref_table = "card.ability.extra", ref_value = "roundCount" },
            { text = "/" },
            { text = "4" },
            { text = ")" },
    },
    calc_function = function(card)
        local mult = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:get_id() and scoring_card:get_id() == 14 then
                    local retriggers = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    mult = mult + (card.ability.extra.aceMult) * retriggers
                end
            end
        end
        card.joker_display_values.mult = mult
        card.joker_display_values.localized_text = "(" .. localize("k_aces") .. ")"
    end
}

jd_def["j_pmcmod_enoch"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS }
}

jd_def["j_pmcmod_gubo"] = {
    text = {
            { text = "+", colour = G.C.CHIPS },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
    reminder_text = {
        { text = "Target: " },
        { ref_table = "card.ability.extra", ref_value = "selected_keypage" },
    },
}

jd_def["j_pmcmod_jiaHuan"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT }
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
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
}

--[[jd_def["j_pmcmod_hopkins"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT },
        extra = {
            {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "odds" },
                { text = ")" },
            }
        },
        extra_config = { colour = G.C.GREEN, scale = 0.3 },
        calc_function = function(card)
            local numerator, denominator = 1, card.ability.extra.odds
            if SMODS then numerator, denominator = SMODS.get_probability_vars(card, numerator, denominator, 'hopkins') end
            card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { numerator, denominator } }
        end
}--]]

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
            { text = "X" },
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
                    print(my_pos)
                end
                if my_pos >= 2 then
                    --card.joker_display_values.mult = card.ability.extra.mult_mod * (string.len((localize{type="name_text", set="Joker", key = G.jokers.cards[my_pos-1].config.center.key} or "") or 0))
                    card.joker_display_values.mult = (G.jokers and G.jokers.cards and (string.len((localize{type="name_text", set="Joker", key = G.jokers.cards[my_pos-1].config.center.key} or ""))) or 0) * card.ability.extra.mult_mod
                else
                    card.joker_display_values.mult = 0
                end
        end
}