--- STEAMODDED HEADER
--- MOD_NAME: Project Moon Content Mod
--- MOD_ID: ProjectMoonContentMod
--- MOD_AUTHOR: [Kiro]
--- MOD_DESCRIPTION: Adds in new jokers, decks and consumables based on Project Moon properties
--- PREFIX: pmcmod
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]

----------------------------------------------
------------MOD CODE -------------------------



sendDebugMessage("Launching Project Moon Content Mod!", "ProjectMoonContentMod")

SMODS.load_file("localization/en_us.lua")()

SMODS.Atlas {key = "ModdedProjectMoon",	path = "newProjectMoonJokers.png",	px = 71, py = 95}
SMODS.Atlas {key = "ModdedProjectMoonSpectrals",	path = "newProjectMoonSpectrals.png",	px = 71, py = 95}
SMODS.Atlas {key = "ModdedProjectMoonEditions",	path = "newProjectMoonEditions.png",	px = 71, py = 95}

to_big = to_big or function(x)
    return x
end

SMODS.ObjectType({
	key = "Heretics",
	default = "j_four_fingers",
	cards = {
 		["j_four_fingers"] = true,
 		["j_mime"] = true,
		["j_banner"] = true,
		["j_8_ball"] = true,
		["j_fibonacci"] = true,
		["j_scholar"] = true,
		["j_egg"] = true,
		["j_splash"] = true,
		["j_blue_joker"] = true,
		["j_ride_the_bus"] = true,
		["j_square_joker"] = true,
		["j_seance"] = true,
		["j_riff_raff"] = true,
		["j_shortcut"] = true,
		["j_hologram"] = true,
		["j_rocket"] = true,
		["j_fortune_teller"] = true,
		["j_smiley_face"] = true,
		["j_troubadour"] = true,
		["j_certificate"] = true,
		["j_onyx_agate"] = true,
		["j_glass_joker"] = true,
		["j_brainstorm"] = true,
		["j_joker"] = true,
 	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		self:inject_card(G.P_CENTERS.j_four_fingers)
		self:inject_card(G.P_CENTERS.j_mime)
		self:inject_card(G.P_CENTERS.j_banner)
		self:inject_card(G.P_CENTERS.j_8_ball)
		self:inject_card(G.P_CENTERS.j_fibonacci)
		self:inject_card(G.P_CENTERS.j_scholar)
		self:inject_card(G.P_CENTERS.j_egg)
		self:inject_card(G.P_CENTERS.j_splash)
		self:inject_card(G.P_CENTERS.j_blue_joker)
		self:inject_card(G.P_CENTERS.j_ride_the_bus)
		self:inject_card(G.P_CENTERS.j_square)
		self:inject_card(G.P_CENTERS.j_seance)
		self:inject_card(G.P_CENTERS.j_riff_raff)
		self:inject_card(G.P_CENTERS.j_shortcut)
		self:inject_card(G.P_CENTERS.j_hologram)
		self:inject_card(G.P_CENTERS.j_rocket)
		self:inject_card(G.P_CENTERS.j_fortune_teller)
		self:inject_card(G.P_CENTERS.j_smiley)
		self:inject_card(G.P_CENTERS.j_troubadour)
		self:inject_card(G.P_CENTERS.j_certificate)
		self:inject_card(G.P_CENTERS.j_onyx_agate)
		self:inject_card(G.P_CENTERS.j_glass)
		self:inject_card(G.P_CENTERS.j_brainstorm)
		self:inject_card(G.P_CENTERS.j_mystic_summit)
	end,
})


-- BACKS --


-- SILENT DECK

--Dummy joker
SMODS.Joker {
	key = 'silence',
	name = "Time Flowing",
	loc_txt = {
		name = 'Time Flowing',
		text = {
			"Lose the run if the current encounter",
            "is not defeated within {C:mult}30 seconds{}",
		}
	},
	-- This also searches G.GAME.pool_flags to see if Gros Michel went extinct. If so, enables the ability to show up in shop.
	config = { extra = { current_timer = 0, total_timer = 30 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 15 },
	no_collection = true,
	cost = 8,
	eternal_compat = true,
	loc_vars = function (self, info_queue, card)
    local random_mult = tostring(math.floor(self.config.extra.current_timer)) or 1
		main_end = {
			{n=G.UIT.T, config={text = 'Elapsed time: ',colour = G.C.MULT, scale = 0.32}},
			{n=G.UIT.O, config={object = DynaText({string = random_mult, colours = {G.C.RED}, pop_in_rate = 9999999, silent = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
			{n=G.UIT.T, config={text = ' seconds',colour = G.C.MULT, scale = 0.32}} or nil,
		}
    	return {main_end = main_end, vars = { self.config.extra.current_timer, self.config.extra.total_timer }}
	end,
	update = function (self, card, dt)
			if G.GAME.blind and G.GAME.blind.in_blind then
				self.config.extra.current_timer = self.config.extra.current_timer + G.real_dt
				--print("Increment test")
				--card.children.center:set_sprite_pos({x = self.config.extra.current_timer , y = 1})
			end

			if self.config.extra.current_timer < 7 then
				card.children.center:set_sprite_pos({x = 5 , y = 15})
			end

			if self.config.extra.current_timer >= 7 and self.config.extra.current_timer < 14 then
				card.children.center:set_sprite_pos({x = 6 , y = 15})
			end

			if self.config.extra.current_timer >= 14 and self.config.extra.current_timer < 21 then
				card.children.center:set_sprite_pos({x = 7 , y = 15})
			end

			if self.config.extra.current_timer >= 21 and self.config.extra.current_timer < 29 then
				card.children.center:set_sprite_pos({x = 8 , y = 15})
			end

			if self.config.extra.current_timer >= 29 and self.config.extra.current_timer <= 30 then
				card.children.center:set_sprite_pos({x = 9 , y = 15})
			end
			
			if G.shop or not G.GAME.blind.in_blind then
				self.config.extra.current_timer = 0
			end
			if G.GAME.blind and G.GAME.blind.in_blind and self.config.extra.current_timer >= self.config.extra.total_timer then
				self.config.extra.current_timer = 0
				G.E_MANAGER:add_event(Event({
                func = function()
                    G.STATE = G.STATES.GAME_OVER
                    G.STATE_COMPLETE = false
                    print("[DEBUG] game over triggered")
                    return true
                end
            }))
				
			end
	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_silent_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("??????", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}


-- Price of Silence Deck
SMODS.Back {
    key = "silenceDeck",
	atlas = 'ModdedProjectMoonEditions',
	name = "Silent Deck",
	loc_txt = {
		name = 'Silent Deck',
		text = {
			"Starts with an Eternal",
			"{C:attention, T:j_pmcmod_silence}Time Flowing{} page.",
			"{C:blue}+2 hands{}",
			"{C:red}+2 discards{}",
			"{C:inactive}+1 joker slot{}",
		}
	},
    pos = { x = 1, y = 0 },
    config = { hands = 2, discards = 2, joker_slot = 2},
    unlocked = true,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands, self.config.discards, self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_silence", stickers = { "eternal" } })
					return true
				end
			end,
		}))
	end
}

-- SHY DECK

-- Shy Look Dummy Joker
SMODS.Joker {
	key = 'shylook',
	name = "Today's Shy Look",
	loc_txt = {
		name = "Todays Shy Look",
		text = {
			"Changes expressions regularly.",
			"Gives between {X:mult,C:white}X0{} and {X:mult,C:white}X2{} Mult depending on",
			"the expression it's at when a hand is played",
		}
	},
	config = { extra = { randomValue = 4, timer = 0, selectedFace = 0, xmult = 1 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 15 },
	no_collection = true,
	cost = 8,
	eternal_compat = true,
	loc_vars = function (self, info_queue, card)
    	return {vars = { self.config.extra.randomValue, self.config.extra.timer }}
	end,
	update = function (self, card, dt)
			if G.GAME.blind and G.GAME.blind.in_blind then
				self.config.extra.timer = self.config.extra.timer + G.real_dt
				if self.config.extra.timer >= 2 then
					local faceTemp = {0, 1, 2, 3, 4}
					self.config.extra.selectedFace = pseudorandom_element(faceTemp, pseudoseed('shy'))

					if self.config.extra.selectedFace == 0 then
						card.ability.extra.xmult = 2
					end
					if self.config.extra.selectedFace == 1 then
						card.ability.extra.xmult = 1.5
					end
					if self.config.extra.selectedFace == 2 then
						card.ability.extra.xmult = 1
					end
					if self.config.extra.selectedFace == 3 then
						card.ability.extra.xmult = 0.5
					end
					if self.config.extra.selectedFace == 4 then
						card.ability.extra.xmult = 0
					end

					card.children.center:set_sprite_pos({x = self.config.extra.selectedFace , y = 15})
					self.config.extra.timer = 0
				end
			end
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.extra.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
			}
		end
	end,
	in_pool = function(self, args) -- equivalent to `yes_pool_flag = 'vremade_gros_michel_extinct'`
        return G.GAME.pool_flags.fake_shy_look_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("??????", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Today's Shy Look Deck
SMODS.Back {
    key = "todaysShyLookDeck",
	atlas = 'ModdedProjectMoonEditions',
	name = "Shy Deck",
	loc_txt = {
		name = 'Shy Deck',
		text = {
			"Starts with an eternal",
			"{C:attention,T:j_pmcmod_shylook}Today's Shy Look{} page.",
		}
	},
    pos = { x = 0, y = 0 },
    config = { joker_slot = 1},
    unlocked = true,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands, self.config.discards, self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_shylook", stickers = { "eternal" } })
					return true
				end
			end,
		}))
	end
}

-- SERPENT DECK

SMODS.Back {
    key = "serpentDeck",
	atlas = 'ModdedProjectMoonEditions',
	name = "Serpent Deck",
	loc_txt = {
		name = 'Serpent Deck',
		text = {
			"Gets a new bonus with {C:attention}each{}",
			"{C:attention}cleared Act{} (up until Act 10).",
			"Required score scaling is doubled.",
		}
	},
    pos = { x = 2, y = 0 },
    config = { hands = 1},
    unlocked = true,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands } } --Chesed - 1 more hands
    end,
	calculate = function(self, back, context)

        if context.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then

			--Gebura - 1 more discard
            if G.GAME.round_resets.ante == 2 then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
				G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 2
			end

			--Hokma - increased spectral chance
			if G.GAME.round_resets.ante == 3 then
				G.GAME.spectral_rate = 2
			end

			--Netzach - money per remaining discards
			if G.GAME.round_resets.ante == 4 then
				G.GAME.modifiers.money_per_hand = 2
        		G.GAME.modifiers.money_per_discard = 1
			end

			--Binah - reroll cost
			if G.GAME.round_resets.ante == 5 then
				G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - 2
			end

			--Tiphereth - interest cap
			if G.GAME.round_resets.ante == 6 then
				if G.GAME.interest_cap < 50 then
				   G.GAME.interest_cap = 50
				end
				if G.GAME.interest_cap == 50 then
				   G.GAME.interest_cap = 100
				end
				if G.GAME.interest_cap == 100 then
				   G.GAME.interest_cap = 150
				end
			end

			--Hod - hand size
			if G.GAME.round_resets.ante == 7 then
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 1
			end

			--Malkuth - shop limit
			if G.GAME.round_resets.ante == 8 then
				G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
			end

			--Yesod - chance of new edition
			if G.GAME.round_resets.ante == 9 then
				G.GAME.edition_rate = 2
			end

			--Roland - joker slot
			if G.GAME.round_resets.ante == 10 then
				G.jokers.config.card_limit = G.jokers.config.card_limit + 1
			end
        end
    end,
}

------------
-- JOKERS --
------------


-- Michelle
SMODS.Joker {
    key = "michelle",
	name = "Michelle",
	loc_txt = {
		name = 'Michelle',
		text = {
			"Selling another joker during a boss blind",
			"disables its effect. Gain {X:mult,C:white} X#1# {} Mult",
            "for every Reception disabled this way",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
		}
	},
	config = {extra = 0.3, xmult = 1},
    blueprint_compat = true,
    eternal_compat = true,
    rarity = 3,
    cost = 7,
	atlas = 'ModdedProjectMoon',
	pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, card)
        local main_end = nil
        if card.area and (card.area == G.jokers) then
            local disableable = G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.boss))
            main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = disableable and G.C.GREEN or G.C.RED, r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize(disableable and 'k_active' or 'ph_no_boss_active') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.9 } },
                            }
                        }
                    }
                }
            }
        end
        return { main_end = main_end, vars = { card.ability.extra, card.ability.xmult } }
    end,
    calculate = function(self, card, context)
	
		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } },
				Xmult_mod = card.ability.xmult
			}
		end
		
        if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
            if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
			card.ability.xmult = card.ability.xmult + card.ability.extra	
                return {
                    message = localize('ph_boss_disabled'),
                    func = function()
                        G.GAME.blind:disable()
                    end
                }
            end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

--Panther
SMODS.Joker {
	key = 'panther',
	name = "Panther",
	loc_txt = {
		name = 'Panther',
		text = {
			"Gains {C:mult} +#2# {} Mult",
            "for every {C:planet} Sinner {} card sold",
			"{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
		}
	},
	-- This also searches G.GAME.pool_flags to see if Gros Michel went extinct. If so, enables the ability to show up in shop.
	config = { extra = { mult = 0, mult_gain = 5 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 1 },
	cost = 8,
	eternal_compat = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
		
		if context.selling_card and context.card.ability.set == "Planet" and not context.blueprint then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("??????", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

--Lion
SMODS.Joker {
	key = 'lion',
	name = "Lion",
	loc_txt = {
		name = 'Lion',
		text = {
			"Gains {C:chips} +#2# {} Chips",
            "for every {C:planet} Sinner {} card sold",
			"{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
		}
	},
	config = { extra = { chips = 0, chips_gain = 10 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 1 },
	cost = 8,
	eternal_compat = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
		
		if context.selling_card and context.card.ability.set == "Planet" and not context.blueprint then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
			return {
				message = 'Upgraded!',
				colour = G.C.CHIPS,
				card = card
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("??????", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

--Wolf
SMODS.Joker {
	key = 'wolf',
	name = "Wolf",
	loc_txt = {
		name = 'Wolf',
		text = {
			"Gains {X:mult,C:white} X#1# {} Mult",
            "for every {C:planet} Sinner {} card sold",
			"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
		}
	},
	config = {extra = 0.1, xmult = 1},
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 1 },
	cost = 8,
	eternal_compat = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra, card.ability.xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } }
			}
		end
		
		if context.selling_card and context.card.ability.set == "Planet" and not context.blueprint then
                    card.ability.xmult = card.ability.xmult + card.ability.extra	
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("??????", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

--Hopkins
SMODS.Joker {
	key = 'hopkins',
	name = "Hopkins",
	loc_txt = {
		name = 'Hopkins',
		text = {
			"{C:mult}+#1#{} Mult",
			"{C:green}#2# in #3#{} chance this joker destroys",
			"another joker at the end of",
			"the round and leaves",
		}
	},
	no_pool_flag = 'hopkins_extinct',
	config = { extra = { mult = 20, odds = 20 } },
	rarity = 1,
	atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 2 },
	cost = 3,
	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end

		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then

			if pseudorandom('hopkins') < G.GAME.probabilities.normal / card.ability.extra.odds then
				-- This part plays the animation.
				local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= self and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
                end
                local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('hopkins')) or nil

                if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then 
                    joker_to_destroy.getting_sliced = true
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('slice1', 0.96+math.random()*0.08)
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						-- This part destroys the card.
						G.E_MANAGER:add_event(Event({
							joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6),
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				end
				G.GAME.pool_flags.hopkins_extinct = true
				return {
					message = 'Escaped!'
				}
			else
				return {
					message = '...'
				}
			end
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Fixer", G.C.BLACK, G.C.WHITE, 1.2 )
 	end
}

--Aya
SMODS.Joker {
	key = 'aya',
	name = "Aya",
	loc_txt = {
		name = 'Aya',
		text = {
			"{C:chips}+#1#{} Chips",
			"{C:green}#2# in #3#{} chance this joker destroys",
			"itself at the end of the round",
			"and leaves a {C:tarot, T:v_tarot_merchant} Gas Mask {}",
		}
	},

	no_pool_flag = 'aya_extinct',
	config = { extra = { chips = 70, odds = 20, voucher = 'v_tarot_merchant' } },
	rarity = 1,
	atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 2 },
	cost = 3,

	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.voucher } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
	
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then

			if pseudorandom('aya') < G.GAME.probabilities.normal / card.ability.extra.odds then

			
				-- This part plays the animation.
				G.E_MANAGER:add_event(Event({
					func = function()
					G.GAME.used_vouchers[self.config.extra.voucher] = true
					G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
					Card.apply_to_run(nil, G.P_CENTERS['v_tarot_merchant'])
					
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true

						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				G.GAME.pool_flags.aya_extinct = true
				return {
					message = 'Left!'
				}
			else
				return {
					message = 'Safe!'
				}
			end
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Fixer", G.C.BLACK, G.C.WHITE, 1.2 )
 	end
}

--Yuri
SMODS.Joker {
	key = 'yuri',
	name = "Yuri",
	loc_txt = {
		name = 'Yuri',
		text = {
			"{C:green}#1# in #2#{} chance this joker destroys",
			"itself at the end of the round.",
			"If this joker survives {C:red}#3#{} rounds,",
			"sell it to get a {C:money, T:c_soul} Golden Bough {}",
			"Current rounds survived: {C:red}#4#{}",
		}
	},
	no_pool_flag = 'yuri_extinct',
	config = { extra = { odds = 20, rounds = 4, current_rounds = 0, consumables = { 'c_soul' }  } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 2 },
	cost = 3,

	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.rounds, card.ability.extra.current_rounds, card.ability.extra.consumables[1] } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			if pseudorandom('yuri') < G.GAME.probabilities.normal / card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('slice1', 0.96+math.random()*0.08)
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true

						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))

				G.GAME.pool_flags.yuri_extinct = true
				return {
					message = 'Died'
				}
			else			
			card.ability.extra.current_rounds = card.ability.extra.current_rounds + 1	
				if (card.ability.extra.current_rounds == card.ability.extra.rounds) then
					local eval = function(card) return not card.REMOVED end
					juice_card_until(card, eval, true)
				end	
			return {
                message = (card.ability.extra.current_rounds < card.ability.extra.rounds) and
                    (card.ability.extra.current_rounds .. '/' .. card.ability.extra.rounds) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
			end
		end
		
		if context.selling_self and (card.ability.extra.current_rounds >= card.ability.extra.rounds) and not context.blueprint then

                    SMODS.add_card({set = 'Spectral', key = 'c_soul' })
                    return { message = localize('k_duplicated_ex') }
			end
		end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Fixer", G.C.BLACK, G.C.WHITE, 1.2 )
 	end

}

--Demian
SMODS.Joker {
    key = "demian",
	name = "Demian",
	loc_txt = {
		name = 'Demian',
		text = {
            " Gain {X:mult,C:white} X#1# {} Mult for",
            "every {C:spectral}Spectral card{} used",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
		}
	},
    blueprint_compat = true,
    perishable_compat = true,
    rarity = 3,
	atlas = 'ModdedProjectMoon',
    cost = 6,
    pos = { x = 3, y = 1 },
    config = { extra = { Xmult = 1, Xmult_mod = 0.3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult_mod, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Spectral' then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
            }
        end
        if context.joker_main then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("???????", G.C.RED, HEX('40150e'), 1.2 )
 	end
	
}

--Rim
SMODS.Joker {
    key = "rim",
	name = "Rim",
	loc_txt = {
		name = 'Rim',
		text = {
			"Halves all {C:attention}listed",
            "{C:green,E:1,S:1.1}probabilities",
            "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}1 in 6{C:inactive})",
		},
		unlock = {
    		'Score over 100000 chips',
    		'in one hand',
		},
		
	},
    unlocked = false,
    blueprint_compat = false,
    rarity = 2,
	atlas = 'ModdedProjectMoon',
    cost = 4,
    pos = { x = 4, y = 1 },
    add_to_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v / 2
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v* 2
        end
    end,
    locked_loc_vars = function(self, info_queue, card)
        return { vars = { number_format(10000) } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'chip_score' and to_big(args.chips) >= to_big(100000)
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("???????", G.C.RED, HEX('40150e'), 1.2 )
 	end
}

-- Effie
SMODS.Joker {
    key = "effie",
	name = "Effie",
	loc_txt = {
		name = 'Effie',
		text = {
            "Gain{C:mult} +#2# {}Mult if the played hand",
            "is a{C:attention} #3# {}. ",
			"Value resets if the hand played doesn't contain it.",
			"(Poker hand changes after every round) ",
            "{C:inactive}(Currently{C:mult} #1# {C:inactive}Mult)",
		}
	},
    blueprint_compat = true,
    rarity = 1,
	atlas = 'ModdedProjectMoon',
    cost = 4,
    pos = { x = 4, y = 2 },
    config = { extra = { mult = 0, mult_gain = 2, poker_hand = 'Pair', poker_hand_index = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, localize(card.ability.extra.poker_hand, 'poker_hands'), card.ability.extra.poker_hand_index } }
    end,
    calculate = function(self, card, context)

		local _poker_hands = {'High Card', 'Pair', 'Three of a Kind'}
		-- Increments mult if poker hand matches
        if context.joker_main and context.scoring_name == card.ability.extra.poker_hand then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                mult = card.ability.extra.mult,
				message = 'Nice!'
            }
        end
		-- Resets mult if poker hand doesn't match
		if context.joker_main and context.scoring_name ~= card.ability.extra.poker_hand then
			card.ability.extra.mult = 0
            return {
                --message = localize('k_reset')
				mult = card.ability.extra.mult,
				message = '...'
            }
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local _poker_hands = {'High Card','Pair','Three of a Kind'}
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('effie'))
            return {
                message = localize('k_reset')
            }
        end
    end,
    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {'High Card','Pair','Three of a Kind', 'Four of a Kind'}
        card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('effie'))
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("LC Before Team", G.C.BLACK, G.C.RED, 1.2 )
 	end
}
-- Saude
SMODS.Joker {
    key = "saude",
	name = "Saude",
	loc_txt = {
		name = 'Saude',
		text = {
            "Gain{C:chips} +#2# {}Chips if the played hand",
            "contains a{C:attention} #3# {}card. ",
			"Value resets if the hand played doesn't contain it.",
			"(Suit changes after every round) ",
            "{C:inactive}(Currently{C:chips} #1# {C:inactive}Chips)",
		}
	},
    blueprint_compat = true,
    rarity = 1,
	atlas = 'ModdedProjectMoon',
    cost = 4,
    pos = { x = 5, y = 2 },
    config = { extra = { chips = 0, chips_gain = 5, suit = 'Spades', suit_index = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain, card.ability.extra.suit, card.ability.extra.suit_index } }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
		local suits_type = {
                'Hearts',
                'Diamonds',
                'Spades',
                'Clubs'
        }

		local suits = {
			['Hearts'] = 0,
			['Diamonds'] = 0,
			['Spades'] = 0,
			['Clubs'] = 0
		}

		for i = 1, #context.scoring_hand do
                if not SMODS.has_any_suit(context.scoring_hand[i]) then
                    if context.scoring_hand[i]:is_suit('Hearts', true) and suits['Hearts'] == 0 then
                        suits['Hearts'] = suits['Hearts'] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits['Diamonds'] == 0 then
                        suits['Diamonds'] = suits['Diamonds'] + 1
                    elseif context.scoring_hand[i]:is_suit('Spades', true) and suits['Spades'] == 0 then
                        suits['Spades'] = suits['Spades'] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits['Clubs'] == 0 then
                        suits['Clubs'] = suits['Clubs'] + 1
                    end
                end
            end
            for i = 1, #context.scoring_hand do
                if SMODS.has_any_suit(context.scoring_hand[i]) then
                    if context.scoring_hand[i]:is_suit('Hearts') and suits['Hearts'] == 0 then
                        suits['Hearts'] = suits['Hearts'] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits['Diamonds'] == 0 then
                        suits['Diamonds'] = suits['Diamonds'] + 1
                    elseif context.scoring_hand[i]:is_suit('Spades') and suits['Spades'] == 0 then
                        suits['Spades'] = suits['Spades'] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs') and suits['Clubs'] == 0 then
                        suits['Clubs'] = suits['Clubs'] + 1
                    end
                end
            end

			if (card.ability.extra.suit == 'Hearts' and suits['Hearts'] > 0) or
			   (card.ability.extra.suit == 'Diamonds' and suits['Diamonds'] > 0) or
			   (card.ability.extra.suit == 'Spades' and suits['Spades'] > 0) or
			   (card.ability.extra.suit == 'Clubs' and suits['Clubs'] > 0) then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
                return {
                    chips = card.ability.extra.chips,
					message = 'Nice!'
                }
			else
				card.ability.extra.chips = 0
				return {
                    chips = card.ability.extra.chips,
					message = 'Ugh...'
                }
            end

		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local suits_type = {
                'Hearts',
                'Diamonds',
                'Spades',
                'Clubs'
       	 	}
            card.ability.extra.suit = pseudorandom_element(suits_type, pseudoseed('saude'))
            return {
                message = localize('k_reset')
            }
        end

    end,
    set_ability = function(self, card, initial, delay_sprites)
        local suits_type = {
                'Hearts',
                'Diamonds',
                'Spades',
                'Clubs'
        }
        card.ability.extra.suit = pseudorandom_element(suits_type, pseudoseed('saude'))
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("LC Before Team", G.C.BLACK, G.C.RED, 1.2 )
 	end
}

-- Aida
SMODS.Joker {
	key = 'aida',
	name = "Aida",
	loc_txt = {
		name = 'Aida',
		text = {
			"Each hand played grants one of the following effects:",
			"{C:chips} +#1# chips {},{C:chips} +#2# chips {},{C:chips} +#3# chips {},",
            "{C:chips} +#4# chip {},{C:attention} #5# chips{}, or{C:mult} #6# chips {}",
		}
	},
	config = { chipsValue1 = 1000, chipsValue2 = 100, chipsValue3 = 10, chipsValue4 = 1, chipsValue5 = -10, chipsValue6 = -100 },
	rarity = 2,
	atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 2 },
	cost = 4,
	blueprint_compat = true,
	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.chipsValue1, card.ability.chipsValue2, card.ability.chipsValue3, card.ability.chipsValue4, card.ability.chipsValue5, card.ability.chipsValue6 } }
	end,
	calculate = function(self, card, context)
		local choosenValue = math.random(0, 5)

		if context.joker_main then
			if choosenValue == 5 then
			
				return {
					chips = card.ability.chipsValue1,
				}
			end
			if choosenValue == 4 then
			
				return {
					chips = card.ability.chipsValue2,
				}
			end
			if choosenValue == 3 then
			
				return {
					chips = card.ability.chipsValue3,
				}
			end
			if choosenValue == 2 then
			
				return {
					chips = card.ability.chipsValue4,
				}
			end
			if choosenValue == 1 then
				return {
					chips = card.ability.chipsValue5,
				}
			end
			if choosenValue == 0 then
				return {
					chips = card.ability.chipsValue6,
				}
			end
		end

	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Los Mariachis", G.C.YELLOW, G.C.GREEN, 1.2 )
 	end
}

-- Kromer
SMODS.Joker {
	key = 'kromer',
	name = "Kromer",
	loc_txt = {
		name = 'Kromer',
		text = {
			"When {C:attention}Normal Encounter{} or {C:attention}Risky Encounter{}",
			"is selected, if a heretic joker is presented,",
            " destroy it and gain {X:mult,C:white} X#1# {} Mult",
            "(can only happen once per blind)",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
		}
	},

	config = {extra = 0.5, xmult = 1},
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 2 },
	cost = 4,
	eternal_compat = false,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra, card.ability.xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } },
				Xmult_mod = card.ability.xmult
			}
		end
		
		if context.setting_blind and not card.getting_sliced then
                local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
					for j = 1, #G.P_CENTER_POOLS.Heretics do
						if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and 
						(G.P_CENTER_POOLS.Heretics[j].key == G.jokers.cards[i].config.center.key)
						then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
					end
                end
                local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('kromer')) or nil

                if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
					card.ability.xmult = card.ability.xmult + card.ability.extra
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
					card_eval_status_text((context.blueprint_card or card), 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.xmult}}})
                end
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("N Corp Inquisition", G.C.RED, G.C.WHITE, 1.2 )
 	end
}

--Siegfried
SMODS.Joker {
    key = "siegfried",
	name = "Siegfried",
	loc_txt = {
		name = 'Siegfried',
		text = {
			"Gains {X:mult,C:white} X#1# {} Mult every time a hand scores ",
			"over the target score for the encounter",
            "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
		}
	},
    blueprint_compat = true,
    rarity = 3,
	atlas = 'ModdedProjectMoon',
    cost = 6,
    pos = { x = 8, y = 2 },
    config = {extra = 0.2, xmult = 1},
    loc_vars = function(self, info_queue, card)

        return { vars = { card.ability.extra, card.ability.xmult } }
    end,
    calculate = function(self, card, context)


		if context.final_scoring_step and hand_chips * mult >= G.GAME.blind.chips then
			card.ability.xmult = card.ability.xmult + card.ability.extra
			return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } }
            }
		end
		

		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } },
				Xmult_mod = card.ability.xmult
			}
		end

		

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("K Corp", G.C.GREEN, G.C.BLACK, 1.2 )
 	end
}


--Guido
SMODS.Joker {
    key = "guido",
	name = "Guido",
	loc_txt = {
		name = 'Guido',
		text = {
			"When {C:attention}Normal Encounter{} or {C:attention}Risky Encounter{}",
			"is selected, adds a random card with a red seal.",
            "Gains {C:mult}+#1#{} Mult for every red seal in deck",
            "{C:inactive}(Currently {C:mult} +#2# {C:inactive} Mult)",
		}
	},
    blueprint_compat = true,
    rarity = 2,
	atlas = 'ModdedProjectMoon',
    cost = 6,
    pos = { x = 9, y = 2 },
    config = { extra = { mult = 3 }},
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.red_seal

        local red_seal_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.seal == "Red" then red_seal_tally = red_seal_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * red_seal_tally } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local red_seal_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.seal == "Red" then red_seal_tally = red_seal_tally + 1 end
            end
            return {
                mult = card.ability.extra.mult * red_seal_tally
            }
        end
		if context.first_hand_drawn then
            local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('guido')),
                center = G.P_CENTERS.c_base
            }, G.discard, true, nil, { G.C.SECONDARY_SET.Enhanced }, true)
            _card:set_seal('Red', true)
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:emplace(_card)
                            _card:start_materialize()
                            G.GAME.blind:debuff_card(_card)
                            G.hand:sort()
                            if context.blueprint_card then
                                context.blueprint_card:juice_up()
                            else
                                card:juice_up()
                            end
                            return true
                        end
                    }))
                    SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
                end
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if playing_card.seal == "Red" then
                return true
            end
        end
        return false
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("N Corp Inquisition", G.C.RED, G.C.WHITE, 1.2 )
 	end
	
}

---------------
-- SPECTRALS --
---------------

-- Witness

SMODS.Consumable {
    key = 'witness',
	name = "Witness",
	loc_txt = {
		name = 'Witness',
		text = {
			"Destroys 4 random cards",
            "and gives you 1 Sinner card,",
            "1 Tarot card and 1 Spectral card",
			"(all negative)",
		}
	},
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
}


