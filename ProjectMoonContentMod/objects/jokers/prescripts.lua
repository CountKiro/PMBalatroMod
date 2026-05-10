-- Prescript 1
SMODS.Joker {
	key = 'prescript1',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false, faces = 5} },
	--no_collection = true,    
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)

		local status = nil

		if card.ability.extra.prescriptFullfilled then
			status = localize('pmcmod_prescriptFulfilled')
		else
			status = localize('pmcmod_prescriptInProgress')
		end
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end


		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end


		return { main_end = main_end, vars = {  } }
	end,
	calculate = function(self, card, context)

		if context.discard and context.other_card == context.full_hand[#context.full_hand] then
            local face_cards = 0
            for _, discarded_card in ipairs(context.full_hand) do
                if discarded_card:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards >= card.ability.extra.faces then
                card.ability.extra.prescriptFullfilled = true
            end
        end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.

				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript1Extinct = true
				
				if card.ability.extra.prescriptFullfilled then
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				else
					card.prescriptFullfilled = false
					ease_dollars(-G.GAME.dollars, true)
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Prescript 2
SMODS.Joker {
	key = 'prescript2',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false, jokerSelected = false, selectedJoker = "", selectedJokerName = ""} },
	--no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end

		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end

		return { main_end = main_end, vars = { card.ability.extra.prescriptFullfilled, card.ability.extra.selectedJokerName } }
	end,
	calculate = function(self, card, context)

		local selectableJokers = {}

		if context.setting_blind and (card.ability.extra.jokerSelected == false or not card.ability.extra.selectedJoker.config) then
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal
					then selectableJokers[#selectableJokers+1] = G.jokers.cards[i].config.center.key end
                end
                card.ability.extra.selectedJoker = #selectableJokers > 0 and pseudorandom_element(selectableJokers, pseudoseed('prescript')) or nil
				if #selectableJokers > 0 then
					card.ability.extra.jokerSelected = true
				end
				card.ability.extra.selectedJokerName = #selectableJokers > 0 and localize{type="name_text", set="Joker", key = card.ability.extra.selectedJoker} or nil
		end

		if context.selling_card and context.card.ability.set == "Joker" and card.ability.extra.selectedJoker then
			if context.card.config.center.key == card.ability.extra.selectedJoker and not context.blueprint then
				card.ability.extra.prescriptFullfilled = true
			end
		end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript2Extinct = true

				if card.ability.extra.prescriptFullfilled == true then
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				else
					ease_dollars(-G.GAME.dollars, true)
					card.prescriptFullfilled = false
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

local function reset_prescript_3()
    G.GAME.current_round.reset_prescript_3 = { rank = 'Ace' }
    local valid_ranks = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(playing_card) then
            valid_ranks[#valid_ranks + 1] = playing_card
        end
    end
    local cardRank = pseudorandom_element(valid_ranks, 'pmcmod_prescript3' .. G.GAME.round_resets.ante)
    if cardRank then
        G.GAME.current_round.reset_prescript_3.rank = cardRank.base.value
		G.GAME.current_round.reset_prescript_3.id = cardRank.base.id
    end
end

-- Prescript 3
SMODS.Joker {
	key = 'prescript3',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false, selectedRank = "", prescriptFailed = false} },
	--no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}
		local cardRank = G.GAME.current_round.reset_prescript_3 or { rank = 'Ace'}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFailed == true then
			tempText = localize('pmcmod_prescriptFailed')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		end

		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end

		return { main_end = main_end, vars = { card.ability.extra.prescriptFullfilled, localize(cardRank.rank, 'ranks'), card.ability.extra.prescriptFailed } }
	end,
	calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and  context.other_card:get_id() == G.GAME.current_round.reset_prescript_3.id then
            card.ability.extra.prescriptFailed = true
        end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript3Extinct = true

				if card.ability.extra.prescriptFailed == true then
					ease_dollars(-G.GAME.dollars, true)
					card.prescriptFullfilled = false
				else
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Prescript 4
SMODS.Joker {
	key = 'prescript4',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false} },
	--no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end


		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end

		return { main_end = main_end, vars = { card.ability.extra.prescriptFullfilled } }
	end,
	calculate = function(self, card, context)


		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint and G.SETTINGS.GAMESPEED == 1 then
			card.ability.extra.prescriptFullfilled = true
		end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript4Extinct = true

				if card.ability.extra.prescriptFullfilled == true then
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				else
					card.prescriptFullfilled = false
					ease_dollars(-G.GAME.dollars, true)
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Prescript 5
SMODS.Joker {
	key = 'prescript5',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false} },
	--no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end


		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end

		return { main_end = main_end, vars = { card.ability.extra.prescriptFullfilled } }
	end,
	calculate = function(self, card, context)


		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then

			if G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0  then
				card.ability.extra.prescriptFailed = false
			else
				card.ability.extra.prescriptFailed = true
			end

			
		end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript4Extinct = true

				if card.ability.extra.prescriptFailed == true then
					card.prescriptFullfilled = false
					ease_dollars(-G.GAME.dollars, true)
				else
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Prescript 6
SMODS.Joker {
	key = 'prescript6',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false, boosterSkipCount = 0} },
	--no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end


		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end

		return { main_end = main_end, vars = { card.ability.extra.prescriptFullfilled, card.ability.extra.boosterSkipCount } }
	end,
	calculate = function(self, card, context)


		if context.skipping_booster and not context.blueprint then

			card.ability.extra.boosterSkipCount = card.ability.extra.boosterSkipCount + 1

			if card.ability.extra.boosterSkipCount >= 3 then
				card.ability.extra.prescriptFullfilled = true
			end
		end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				else
					card.prescriptFullfilled = false
					ease_dollars(-G.GAME.dollars, true)
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Prescript 7
SMODS.Joker {
	key = 'prescript7',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false} },
	--no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end


		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end

		return { main_end = main_end, vars = { card.ability.extra.prescriptFullfilled} }
	end,
	calculate = function(self, card, context)


		if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
			if context.card.config.center.rarity >= 2 then
				card.ability.extra.prescriptFullfilled = true
            end
        end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				else
					card.prescriptFullfilled = false
					ease_dollars(-G.GAME.dollars, true)
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Prescript 8
SMODS.Joker {
	key = 'prescript8',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false} },
	--no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end


		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end

		return { main_end = main_end, vars = { card.ability.extra.prescriptFullfilled } }
	end,
	calculate = function(self, card, context)


		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and (G.GAME.round_resets.hands - G.GAME.current_round.hands_played) < 1 then
				card.ability.extra.prescriptFullfilled = true
        end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				else
					card.prescriptFullfilled = false
					ease_dollars(-G.GAME.dollars, true)
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Prescript 9
SMODS.Joker {
	key = 'prescript9',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false} },
	--no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end


		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end

		return { main_end = main_end, vars = { card.ability.extra.prescriptFullfilled } }
	end,
	calculate = function(self, card, context)

		if context.debuffed_hand or context.joker_main then
            if G.GAME.blind.triggered then
                card.ability.extra.prescriptFullfilled = true
            end
        end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				else
					card.prescriptFullfilled = false
					ease_dollars(-G.GAME.dollars, true)
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Prescript 10
SMODS.Joker {
	key = 'prescript10',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false, current_consumable_count = 0} },
	--no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end


		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end

		return { main_end = main_end, vars = { card.ability.extra.prescriptFullfilled, card.ability.extra.current_consumable_count } }
	end,
	calculate = function(self, card, context)

		if context.using_consumeable and not context.blueprint then
			card.ability.extra.current_consumable_count = card.ability.extra.current_consumable_count + 1
			if card.ability.extra.current_consumable_count >= 3 then
				card.ability.extra.prescriptFullfilled = true
			end
		end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				else
					card.prescriptFullfilled = false
					ease_dollars(-G.GAME.dollars, true)
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Prescript 11
SMODS.Joker {
	key = 'prescript11',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false} },
	--no_collection = true,    
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
	attributes = {'prescript', 'gimmick'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_prescript"}

		local main_end = nil
		local statusColour = G.C.RED
		local tempText = ""

		if card.ability.extra.prescriptFullfilled == false then
			tempText = localize('pmcmod_prescriptInProgress')
			statusColour = G.C.GOLD
		else
			tempText = localize('pmcmod_prescriptFulfilled')
			statusColour = G.C.BLUE
		end


		if card.area and (card.area == G.jokers) then
			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = {
						{
							n = G.UIT.C,
							config = { ref_table = card, align = "m", colour = statusColour, r = 0.05, padding = 0.06 },
							nodes = {
								{ n = G.UIT.T, config = { text = tempText, colour = G.C.WHITE, scale = 0.32 * 0.9 } },
							}
						}
					}
				}
			}
		end

		return { main_end = main_end, vars = { card.ability.extra.prescriptFullfilled } }
	end,
	calculate = function(self, card, context)

		local firstNumberOK = false
		local secondNumberOK = false
		local thirdNumberOK = false
		local fourthNumberOK = false
		local fifthNumberOK = false

		if context.joker_main then
--			print("Prescript condition ok")
			if #G.play.cards == 5 then
--				print("Prescript 5 cards ok")
				for i = 1, #G.play.cards do
					if G.play.cards[i].base.nominal == 2 then
--						print("First number ok")
						firstNumberOK = true
					end

					if G.play.cards[i].base.nominal == 7 then
--						print("First number ok")
						secondNumberOK = true
					end

					if G.play.cards[i].base.nominal == 11 then
--						print("First number ok")
						thirdNumberOK = true
					end

					if G.play.cards[i].base.nominal == 8 then
--						print("First number ok")
						fourthNumberOK = true
					end

					if G.play.cards[i].base.nominal == 2 then
--						print("First number ok")
						fifthNumberOK = true
					end

				end

				if firstNumberOK == true and secondNumberOK == true and thirdNumberOK == true and fourthNumberOK == true and fifthNumberOK == true then
--					print("All numbers ok")
					card.ability.extra.prescriptFullfilled = true
				end

			end

		end
		
		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
				card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
						play_sound('tarot1', 0.9, 0.9)
                        card:juice_up(0.8, 0.8)
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					card.prescriptFullfilled = true
					return{
						dollars = 15
					}
				else
					card.prescriptFullfilled = false
					ease_dollars(-G.GAME.dollars, true)
				end
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

function SMODS.current_mod.reset_game_globals(run_start)
    reset_prescript_3()
end

---------------------
