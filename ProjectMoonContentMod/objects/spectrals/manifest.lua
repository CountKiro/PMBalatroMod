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
        "j_acrobat",
		"j_half",
		"j_onyx_agate",
		"j_abstract",
		"j_swashbuckler",
		"j_bull",
		"j_constellation",
        "j_seeing_double",
        "j_flower_pot",
        "j_diet_cola",
		"j_hit_the_road",
        "j_midas_mask",}

        card.ability.trueVersions = {"j_pmcmod_oswald",
		"j_pmcmod_angelaLoR",
		"j_pmcmod_kalo",
		"j_pmcmod_katriel",
		"j_pmcmod_denis",
		"j_pmcmod_boris",
		"j_pmcmod_esther",
		"j_pmcmod_gloria",
		"j_pmcmod_hubert",
        "j_pmcmod_kim",
		"j_pmcmod_angelica",
		"j_pmcmod_puppeteer",
		"j_pmcmod_nikolai",
		"j_pmcmod_rudolph",
		"j_pmcmod_maxim",
		"j_pmcmod_yisang",
        "j_pmcmod_donQuixote",
        "j_pmcmod_ryoshu",
        "j_pmcmod_hongLu",
		"j_pmcmod_heathcliff",
        "j_pmcmod_ishmael",}

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