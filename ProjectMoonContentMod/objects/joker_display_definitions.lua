local jd_def = JokerDisplay.Definitions


jd_def["j_pmcmod_oswald"] = {

}

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

jd_def["j_pmcmod_maxim"] = {
    
}

jd_def["j_pmcmod_rudolph"] = {
    
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
                    { ref_table = "card.ability.extra", ref_value = "xchips", retrigger_type = "exp" }
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

jd_def["j_pmcmod_hongLu"] = {
    
}

jd_def["j_pmcmod_heathcliff"] = {
    
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

jd_def["j_pmcmod_angela"] = {
    
}

jd_def["j_pmcmod_michelle"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "xchips", retrigger_type = "exp" }
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

jd_def["j_pmcmod_garion"] = {
    
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

jd_def["j_pmcmod_hermann"] = {
    
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

jd_def["j_pmcmod_aseah"] = {
    
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
                    { ref_table = "card.ability", ref_value = "xmult", retrigger_type = "exp" }
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

jd_def["j_pmcmod_aya"] = {
    
}

jd_def["j_pmcmod_yuri"] = {
    
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

jd_def["j_pmcmod_rim"] = {
    
}

jd_def["j_pmcmod_sanson"] = {
    
}

jd_def["j_pmcmod_effie"] = {
    
}

jd_def["j_pmcmod_saude"] = {
    
}

jd_def["j_pmcmod_aida"] = {
    
}

jd_def["j_pmcmod_sonya"] = {
    
}

jd_def["j_pmcmod_siegfried"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
}

jd_def["j_pmcmod_kromer"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
}

jd_def["j_pmcmod_guido"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT }
}

jd_def["j_pmcmod_papaBongy"] = {
    
}

jd_def["j_pmcmod_dongrang"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xchips", retrigger_type = "exp" }
                }
            }
        }
}

jd_def["j_pmcmod_dongbaek"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        },
    calc_function = function(card)
        local xmult = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:get_id() and scoring_card:get_id() == 9 then
                    local retriggers = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    xmult = xmult + (card.ability.extra.Xmult) * retriggers
                end
            end
        end
        card.joker_display_values.xmult = xmult
        card.joker_display_values.localized_text = "(9s)"
    end
}

jd_def["j_pmcmod_samjo"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS }
}

jd_def["j_pmcmod_shrenne"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT }
}

jd_def["j_pmcmod_alfonso"] = {
    
}

jd_def["j_pmcmod_marile"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT }
}

jd_def["j_pmcmod_ran"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS }
}

jd_def["j_pmcmod_niko"] = {
    
}

jd_def["j_pmcmod_ahab"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
}

jd_def["j_pmcmod_queequeg"] = {
    text = {
            { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
            { text = "x",                              scale = 0.35 },
            { text = "$3",                             colour = G.C.GOLD },
        },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
    calc_function = function(card)
        local count = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if SMODS.has_enhancement(scoring_card, 'm_pmcmod_pallid') then
                    count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    local retriggers = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.localized_text = "(9s)"
    end
}

jd_def["j_pmcmod_starbuck"] = {
    text = {
        { text = " +",                             colour = G.C.MULT },
        { ref_table = "card.joker_display_values", ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
    },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
    calc_function = function(card)
        local mult = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if SMODS.has_enhancement(scoring_card, 'm_pmcmod_pallid') then
                    local retriggers = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    mult = mult + (card.ability.extra.mult) * retriggers
                end
            end
        end
        card.joker_display_values.mult = mult
        card.joker_display_values.localized_text = "(Pallid Cards)"
    end
}

jd_def["j_pmcmod_stubb"] = {
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
    calc_function = function(card)
        card.joker_display_values.localized_text = "(Pallid Cards)"
    end,
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        if held_in_hand then return 0 end
        return JokerDisplay.in_scoring(playing_card, scoring_hand) and
            SMODS.has_enhancement(scoring_card, 'm_pmcmod_pallid') and
            joker_card.ability.extra * JokerDisplay.calculate_joker_triggers(joker_card) or 0
    end
}

jd_def["j_pmcmod_pip"] = {
    text = {
        { text = " +",                             colour = G.C.CHIPS },
        { ref_table = "card.joker_display_values", ref_value = "chips",  colour = G.C.CHIPS,  retrigger_type = "mult" }
    },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
    calc_function = function(card)
        local chips = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if SMODS.has_enhancement(scoring_card, 'm_pmcmod_pallid') then
                    local retriggers = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    chips = chips + (card.ability.extra.chips) * retriggers
                end
            end
        end
        card.joker_display_values.chips = chips
        card.joker_display_values.localized_text = "(Pallid Cards)"
    end
}

jd_def["j_pmcmod_pilot"] = {
    
}

jd_def["j_pmcmod_smee"] = {
    
}

jd_def["j_pmcmod_ricardo"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" },
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        }
}

jd_def["j_pmcmod_catherine"] = {
    
}

jd_def["j_pmcmod_everyCatherine"] = {
    
}

jd_def["j_pmcmod_nelly"] = {
    
}

jd_def["j_pmcmod_erlking"] = {
    
}

jd_def["j_pmcmod_hindley"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS }
}

jd_def["j_pmcmod_linton"] = {
    
}

jd_def["j_pmcmod_josephine"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT }
}

jd_def["j_pmcmod_olga"] = {
    
}

jd_def["j_pmcmod_rain"] = {
    
}

jd_def["j_pmcmod_mika"] = {
    
}

jd_def["j_pmcmod_moses"] = {
    text = {
            {
                border_nodes = {
                    { text = "X" },
                    { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
                }
            }
        },
    calc_function = function(card)
        local xmult = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:get_id() and scoring_card:get_id() == 7 then
                    local retriggers = JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                    xmult = xmult + (card.ability.extra.Xmult) * retriggers
                end
            end
        end
        card.joker_display_values.xmult = xmult
        card.joker_display_values.localized_text = "(7s)"
    end
}

jd_def["j_pmcmod_ezra"] = {
    
}

jd_def["j_pmcmod_santata"] = {
    
}

jd_def["j_pmcmod_crayon"] = {
    
}

jd_def["j_pmcmod_domino"] = {
    
}

jd_def["j_pmcmod_dadQuixote"] = {
    
}

jd_def["j_pmcmod_sancho"] = {
    
}

jd_def["j_pmcmod_dulcinea"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT }
}

jd_def["j_pmcmod_barber"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.CHIPS }
}

jd_def["j_pmcmod_priest"] = {
    
}

jd_def["j_pmcmod_bari"] = {
    
}

jd_def["j_pmcmod_cesara"] = {
    
}

jd_def["j_pmcmod_alessio"] = {
    
}

jd_def["j_pmcmod_jiaXichun"] = {
    
}

jd_def["j_pmcmod_hugo"] = {
    
}

jd_def["j_pmcmod_camille"] = {
    
}

jd_def["j_pmcmod_paula"] = {
    
}

jd_def["j_pmcmod_romero"] = {
    
}

jd_def["j_pmcmod_hanul"] = {
    
}

jd_def["j_pmcmod_caiman"] = {
    
}

jd_def["j_pmcmod_aengDu"] = {
    
}

jd_def["j_pmcmod_jun"] = {
    
}

jd_def["j_pmcmod_herbert"] = {
    
}

jd_def["j_pmcmod_mai"] = {
    
}

jd_def["j_pmcmod_bumble"] = {
    
}

jd_def["j_pmcmod_timeRipper"] = {
    
}

jd_def["j_pmcmod_casetti"] = {
    
}

jd_def["j_pmcmod_sasha"] = {
    
}

jd_def["j_pmcmod_hohenheim"] = {
    
}

jd_def["j_pmcmod_alyssa"] = {
    
}

jd_def["j_pmcmod_marton"] = {
    
}

jd_def["j_pmcmod_johann"] = {
    
}

jd_def["j_pmcmod_qingTao"] = {
    
}

jd_def["j_pmcmod_shanSan"] = {
    
}

jd_def["j_pmcmod_werner"] = {
    
}

jd_def["j_pmcmod_jumsoon"] = {
    
}

jd_def["j_pmcmod_garnet"] = {
    
}

jd_def["j_pmcmod_catt"] = {
    
}

jd_def["j_pmcmod_jiaMu"] = {
    
}

jd_def["j_pmcmod_jiaQiu"] = {
    
}

jd_def["j_pmcmod_linDaiyu"] = {
    
}

jd_def["j_pmcmod_xueBaochai"] = {
    
}

jd_def["j_pmcmod_xianrenA"] = {
    
}

jd_def["j_pmcmod_xianrenB"] = {
    
}

jd_def["j_pmcmod_xianrenC"] = {
    
}

jd_def["j_pmcmod_xianrenD"] = {
    
}

jd_def["j_pmcmod_xianrenE"] = {
    
}

jd_def["j_pmcmod_xianrenF"] = {
    
}

jd_def["j_pmcmod_ladyWang"] = {
    
}

jd_def["j_pmcmod_jiaZheng"] = {
    
}

jd_def["j_pmcmod_jiaYuanchun"] = {
    
}

jd_def["j_pmcmod_jiaHuanChild"] = {
    
}

jd_def["j_pmcmod_xuePan"] = {
    
}

jd_def["j_pmcmod_wangZhao"] = {
    
}

jd_def["j_pmcmod_wangDawei"] = {
    
}

jd_def["j_pmcmod_wangQingshan"] = {
    
}

jd_def["j_pmcmod_wangRen"] = {
    
}

jd_def["j_pmcmod_shiYihua"] = {
    
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

jd_def["j_pmcmod_shiSijing"] = {
    
}

jd_def["j_pmcmod_kongSihui"] = {
    
}

jd_def["j_pmcmod_kongYoujin"] = {
    
}

jd_def["j_pmcmod_xiren"] = {
    
}

jd_def["j_pmcmod_wei"] = {
    
}

jd_def["j_pmcmod_zigong"] = {
    
}

jd_def["j_pmcmod_zilu"] = {
    text = {
        { text = "Double Rupture Stacks",                             colour = G.C.GREEN },
    },
}

jd_def["j_pmcmod_nightDrifter"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "minXMult", retrigger_type = "exp" }
            }
        },
        { text = " ~ ",                             colour = G.C.MULT },
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "maxXMult", retrigger_type = "exp" }
            }
        },
    },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        { text = "Consumables used: (" },
            { ref_table = "card.ability.extra", ref_value = "currentConsumableCount" },
            { text = "/" },
            { text = "" },
            { text = ")" },
    },
}

jd_def["j_pmcmod_leiHeng"] = {
    
}

jd_def["j_pmcmod_valencina"] = {

}

jd_def["j_pmcmod_rien"] = {
    
}

jd_def["j_pmcmod_matthias"] = {
    
}

jd_def["j_pmcmod_callisto"] = {
    
}

jd_def["j_pmcmod_shiomiYoru"] = {
    
}

jd_def["j_pmcmod_lucio"] = {
    
}

jd_def["j_pmcmod_sora"] = {
    
}

jd_def["j_pmcmod_kira"] = {
    
}

jd_def["j_pmcmod_albina"] = {
    
}

jd_def["j_pmcmod_ren"] = {
    
}

jd_def["j_pmcmod_ravi"] = {
    
}

jd_def["j_pmcmod_jamila"] = {
    
}

jd_def["j_pmcmod_aCertainSinclair"] = {
    
}

jd_def["j_pmcmod_arayaKid"] = {
    
}

jd_def["j_pmcmod_arayaTeen"] = {
    
}

jd_def["j_pmcmod_arayaYA"] = {
    
}

jd_def["j_pmcmod_arayaAdult"] = {
    
}

jd_def["j_pmcmod_vermillionCross"] = {
    
}

jd_def["j_pmcmod_indigoElder"] = {
    
}

jd_def["j_pmcmod_yellowHarpoon"] = {
    
}

jd_def["j_pmcmod_sephirahHod"] = {
    
}

jd_def["j_pmcmod_sephirahMalkuth"] = {
    
}

jd_def["j_pmcmod_sephirahNetzach"] = {
    
}

jd_def["j_pmcmod_sephirahYesod"] = {
    
}

jd_def["j_pmcmod_sephirahChesed"] = {
    
}

jd_def["j_pmcmod_sephirahGebura"] = {
    
}

jd_def["j_pmcmod_sephirahHokma"] = {
    
}

jd_def["j_pmcmod_sephirahBinah"] = {
    
}

jd_def["j_pmcmod_sephirahTiphereth"] = {
    
}

jd_def["j_pmcmod_robotHod"] = {
    
}

jd_def["j_pmcmod_robotMalkuth"] = {
    
}

jd_def["j_pmcmod_robotNetzach"] = {
    
}

jd_def["j_pmcmod_robotYesod"] = {
    
}

jd_def["j_pmcmod_robotChesed"] = {
    
}

jd_def["j_pmcmod_robotGebura"] = {
    
}

jd_def["j_pmcmod_robotHokma"] = {
    
}

jd_def["j_pmcmod_robotBinah"] = {
    
}

jd_def["j_pmcmod_robotTiph"] = {
    
}

jd_def["j_pmcmod_robotEnoch"] = {
    
}

jd_def["j_pmcmod_silence"] = {
    
}

jd_def["j_pmcmod_shylook"] = {
    
}

jd_def["j_pmcmod_queenOfHatred"] = {
    
}

jd_def["j_pmcmod_chickenA"] = {
    
}

jd_def["j_pmcmod_chickenB"] = {
    
}

jd_def["j_pmcmod_chickenC"] = {
    
}

jd_def["j_pmcmod_chickenD"] = {
    
}

jd_def["j_pmcmod_puppetA"] = {
    
}

jd_def["j_pmcmod_puppetB"] = {
    
}

jd_def["j_pmcmod_puppetC"] = {
    
}

jd_def["j_pmcmod_puppetAngelica"] = {
    
}

jd_def["j_pmcmod_voiceOfTheCity"] = {
    
}

jd_def["j_pmcmod_prescript1"] = {
    reminder_text = {
        {
            ref_table = "card.joker_display_values",
            ref_value = "localized_text",
        },
    },
    calc_function = function(card)
        local tempText = ""
        local statusColour = "G.C.GOLD"

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end

        card.joker_display_values.localized_text = tempText
        card.joker_display_values.statusColour = statusColour
    end
    
}

jd_def["j_pmcmod_prescript2"] = {
    
}

jd_def["j_pmcmod_prescript3"] = {
    
}

jd_def["j_pmcmod_prescript4"] = {
    
}

jd_def["j_pmcmod_prescript5"] = {
    
}

jd_def["j_pmcmod_prescript6"] = {
    
}

jd_def["j_pmcmod_prescript7"] = {
    
}

jd_def["j_pmcmod_prescript8"] = {
    
}

jd_def["j_pmcmod_prescript9"] = {
    
}

jd_def["j_pmcmod_prescript10"] = {
    
}

jd_def["j_pmcmod_prescript11"] = {
    
}

jd_def["j_pmcmod_childrenOfTheGalaxy"] = {
    
}

jd_def["j_pmcmod_laetitia"] = {
    
}

jd_def["j_pmcmod_censored"] = {
    
}

jd_def["j_pmcmod_bloodfiend"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.MULT }
}

jd_def["j_pmcmod_heretic"] = {
    text = {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" }
        },
        text_config = { colour = G.C.CHIPS }
}