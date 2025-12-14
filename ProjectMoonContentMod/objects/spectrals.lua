---------------
-- SPECTRALS --
---------------

-- Witness
SMODS.Consumable {
    key = 'witness',
	name = "Witness",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 6, y = 5 },
    config = { extra = { destroy = 4}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy } }
    end,
    use = function(self, card, area, copier)
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('card1', percent)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        local faces = {"King", "Queen", "Jack"}
        for i = 1, #G.hand.cards do
            local _rank = pseudorandom_element(faces, 'outcast')
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _card = G.hand.cards[i]
                    assert(SMODS.change_base(_card, "Clubs", _rank))
                    return true
                end
            }))
        end
        for i = 1, #G.hand.cards do
            local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.cards[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.hand:change_size(-2)
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}

-- Outcast
SMODS.Consumable {
    key = 'outcast',
	name = "Outcast",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 7, y = 5 },
    config = { extra = { destroy = 4, hands = -1}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy } }
    end,
    use = function(self, card, area, copier)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands)
        for i = 1, #G.hand.cards do
				local possible_enhancements = {'m_bonus', 'm_mult', 'm_wild', 'm_glass', 'm_steel', 'm_stone', 'm_gold', 'm_lucky'}
                    G.hand.cards[i]:set_ability(pseudorandom_element(possible_enhancements, pseudoseed('hermann')), nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            --scored_card:juice_up()
                            return true
                        end
                    }))
                    G.hand.cards[i]:juice_up(0.3, 0.5)
        end
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and G.GAME.round_resets.hands > 1
    end
}

-- Unloving
SMODS.Consumable {
    key = 'unloving',
	name = "Unloving",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 8, y = 5 },
    config = { extra = { destroy = 4}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy } }
    end,
    use = function(self, card, area, copier)
        local destructable_jokers = {}
        for i = 1, #G.jokers.cards do
                if not G.jokers.cards[i].ability.eternal then 
                    destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] 
                end
        end
        local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('unloving')) or nil

        if joker_to_destroy then
            joker_to_destroy.getting_sliced = true
            G.E_MANAGER:add_event(Event({func = function()
                card:juice_up(0.8, 0.8)
                joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
            return true end }))
        end
        
        local used_tarot = copier or card
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand.cards[i]:set_ability("m_bonus", nil, true)
                    G.hand.cards[i]:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0 and #G.jokers.cards > 0
    end
}

-- Hunt
SMODS.Consumable {
    key = 'hunt',
	name = "Hunt",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 9, y = 5 },
    config = { max_highlighted = 1, mod_conv = 'm_pmcmod_pallid' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end
}

-- Waltz
SMODS.Consumable {
    key = 'waltz',
    set = 'Spectral',
    pos = { x = 5, y = 5 },
    atlas = 'ModdedProjectMoonSpectrals',
    config = { extra = { enhancement = 'm_pmcmod_burn' }, max_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement } } }
    end,
    use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_ability(card.ability.extra.enhancement)
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

-- Bleed
SMODS.Consumable {
    key = 'banquet',
    set = 'Spectral',
    pos = { x = 4, y = 5 },
    atlas = 'ModdedProjectMoonSpectrals',
    config = { extra = { enhancement = 'm_pmcmod_bleed' }, max_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement } } }
    end,
    use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_ability(card.ability.extra.enhancement)
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

-- Binds
SMODS.Consumable {
    key = 'binds',
    set = 'Spectral',
    atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 3, y = 5 },
    config = { extra = { enhancement = 'm_pmcmod_sinking' }, max_highlighted = 2 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.enhancement]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.extra.enhancement } } }
    end,
    use = function(self, card, area, copier)
        local conv_card = G.hand.highlighted[1]
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                conv_card:set_ability(card.ability.extra.enhancement)
                return true
            end
        }))

        delay(0.5)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end
}

--Manifest
SMODS.Consumable {
    key = 'manifest',
    set = 'Spectral',
    atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 2, y = 5 },
    config = { max_highlighted = 1, aspects = {}, trueVersions = {}  },
    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,
    use = function(self, card, area, copier)
        local card_pos = nil
		local validCard = false
		local trueCard = nil
        local aspectCard = nil

        card.ability.aspects = {"j_joker",
		"j_riff_raff",
		"j_greedy_joker",
		"j_lusty_joker",
		"j_wrathful_joker",
		"j_gluttenous_joker",
		"j_turtle_bean",
		"j_troubadour",
		"j_juggler",
		"j_half",
		"j_onyx_agate",
		"j_abstract",
		"j_swashbuckler",
		"j_bull",
		"j_constellation",
		"j_midas_mask",
		"j_hit_the_road",}

        card.ability.trueVersions = {"j_pmcmod_oswald",
		"j_pmcmod_angelaLoR",
		"j_pmcmod_kalo",
		"j_pmcmod_katriel",
		"j_pmcmod_denis",
		"j_pmcmod_boris",
		"j_pmcmod_esther",
		"j_pmcmod_gloria",
		"j_pmcmod_rubert",
		"j_pmcmod_angelica",
		"j_pmcmod_puppeteer",
		"j_pmcmod_nikolai",
		"j_pmcmod_rudolph",
		"j_pmcmod_maxim",
		"j_pmcmod_yisang",
		"j_pmcmod_ishmael",
		"j_pmcmod_heathcliff",}

		for i=1, #card.ability.aspects do
			if G.jokers.highlighted[1].config.center.key == card.ability.aspects[i] then
				card_pos = i
				validCard = true
                aspectCard = card.ability.aspects[card_pos]
				trueCard = card.ability.trueVersions[card_pos]
				break
			end
		end

		if validCard then

			if G.P_CENTERS[trueCard].unlocked then
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.15,
					func = function()
						G.jokers.highlighted[1]:flip()
						play_sound('card1', percent)
						G.jokers.highlighted[1]:juice_up(0.3, 0.3)
						return true
					end,
				}))

				G.E_MANAGER:add_event(Event({
					delay = 0.15,
					func = function()
						G.jokers.highlighted[1]:set_ability(G.P_CENTERS[trueCard])
						return true
					end
				}))

                G.E_MANAGER:add_event(Event({
					delay = 0.50,
					func = function()
                        G.jokers.highlighted[1]:flip()
						return true
					end
				}))
			else
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.4,
					func = function()
						attention_text({
							text = "Locked",
							scale = 1.3,
							hold = 1.4,
							major = card,
							backdrop_colour = G.C.SECONDARY_SET.Tarot,
							align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
								'tm' or 'cm',
							offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
							silent = true
						})
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.06 * G.SETTINGS.GAMESPEED,
							blockable = false,
							blocking = false,
							func = function()
								play_sound('tarot2', 0.76, 0.4)
								return true
							end
						}))
						play_sound('tarot2', 1, 0.4)
						G.jokers.highlighted[1]:juice_up(0.3, 0.5)
						return true
					end
            	}))
			end

		else
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
					attention_text({
						text = "Invalid",
						scale = 1.3,
						hold = 1.4,
						major = card,
						backdrop_colour = G.C.SECONDARY_SET.Tarot,
						align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
							'tm' or 'cm',
						offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
						silent = true
					})
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.06 * G.SETTINGS.GAMESPEED,
						blockable = false,
						blocking = false,
						func = function()
							play_sound('tarot2', 0.76, 0.4)
							return true
						end
					}))
					play_sound('tarot2', 1, 0.4)
					G.jokers.highlighted[1]:juice_up(0.3, 0.5)
					return true
				end
			}))
		end

		
        
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            card.children.center:draw_shader('booster', nil, card.ARGS.send_to_shader)
        end
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.highlighted <= card.ability.max_highlighted and #G.jokers.highlighted > 0

    end
}

-- Old Witness effect
--[[SMODS.Consumable {
    key = 'witness',
	name = "Witness",
    set = 'Spectral',
	atlas = 'ModdedProjectMoonSpectrals',
    pos = { x = 6, y = 5 },
    config = { extra = { destroy = 4}},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destroy } }
    end,
    use = function(self, card, area, copier)
        local destroyed_cards = {}
        local temp_hand = {}
        
        for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
        table.sort(temp_hand,
            function(a, b)
                return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
            end
        )

        pseudoshuffle(temp_hand, pseudoseed('witness'))

        for i = 1, card.ability.extra.destroy do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
		G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                SMODS.destroy_cards(destroyed_cards)
                return true
            end
        }))
        delay(0.5)
        SMODS.add_card({ set = 'Spectral', edition = "e_negative", area = G.consumeables })
		delay(0.3)
		SMODS.add_card({ set = 'Tarot', edition = "e_negative", area = G.consumeables })
		delay(0.3)
		SMODS.add_card({ set = 'Planet', edition = "e_negative", area = G.consumeables })
        delay(0.3)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.cards > 0
    end
}]]--

