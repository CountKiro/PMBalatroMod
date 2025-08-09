------------
-- JOKERS --
------------

-- Angela
SMODS.Joker {
    key = "angela",
	name = "Angela",
	config = {extra = {current_day = 1}},
	unlocked = false,
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = false,
    rarity = 3,
    cost = 10,
	atlas = 'ModdedProjectMoon',
    pos = { x = 0, y = 0 },
    pools =
	{
 		["Heretics"] = true,
 	},
    set_ability = function(self, card, initial, delay_sprites) card:set_eternal(true) end,
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.current_day } }
    end,
    calculate = function(self, card, context)
		if G.shop then
			card.ability.extra.current_day = G.GAME.round_resets.ante
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

			
			local necessary_blind_reset = G.GAME.round_resets.ante

			if G.GAME.round_resets.ante >= 6 then
        		ease_ante(-necessary_blind_reset)
        		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - necessary_blind_reset

				G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 2

				
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 7
    end
}

-- Michelle
SMODS.Joker {
    key = "michelle",
	name = "Michelle",
	config = {extra = 0.5, xmult = 1},
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pos = { x = 1, y = 0 },
    pools = 
	{
 		["Heretics"] = true,
 	},
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
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and card.ability.xmult >= 4 then
			SMODS.add_card({ key = "j_pmcmod_robotHod", stickers = { "eternal" } })
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
		end
    end,
	
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') >= 1
    end
}

-- Elijah
SMODS.Joker {
    key = "elijah",
	name = "Elijah",
	config = {extra = {mult = 0}},
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pos = { x = 2, y = 0 },
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
		card.ability.extra.mult = (G.GAME.hands["High Card"].level + 
		G.GAME.hands["Pair"].level +
		G.GAME.hands["Three of a Kind"].level +
		G.GAME.hands["Two Pair"].level +
		G.GAME.hands["Full House"].level +
		G.GAME.hands["Straight"].level +
		G.GAME.hands["Flush"].level +
		G.GAME.hands["Straight Flush"].level +
		G.GAME.hands["Four of a Kind"].level +
		G.GAME.hands["Five of a Kind"].level +
		G.GAME.hands["Flush House"].level +
		G.GAME.hands["Flush Five"].level)*2 - 24

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and ((to_big(G.GAME.hands["High Card"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Pair"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Three of a Kind"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Two Pair"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Full House"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Straight"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Flush"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Straight Flush"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Four of a Kind"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Five of a Kind"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Flush House"].level) > to_big(6)) or
		(to_big(G.GAME.hands["Flush Five"].level) > to_big(6))) then
			SMODS.add_card({ key = "j_pmcmod_robotMalkuth", stickers = { "eternal" } })
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
		end

		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 1
    end
}

-- Giovanni
SMODS.Joker {
    key = "giovanni",
	name = "Giovanni",
	config = {extra = {consumable_amount = 2, mult = 0, chips = 0, current_consumable_count = 0}},
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 3, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.consumable_amount, card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.current_consumable_count } }
    end,

    calculate = function(self, card, context)

		--Increments counter when a consumable is used
		if context.using_consumeable and not context.blueprint then
			card.ability.extra.current_consumable_count = card.ability.extra.current_consumable_count + 1
		end

		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

			if card.ability.extra.consumable_amount > card.ability.extra.current_consumable_count then
			SMODS.add_card({ key = "j_pmcmod_robotNetzach", stickers = { "eternal" } })
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))

		end

			-- If the amount is reached, reset value, increase requirement and increase mult and chips
			if card.ability.extra.consumable_amount <= card.ability.extra.current_consumable_count then
				card.ability.extra.current_consumable_count = 0
				card.ability.extra.consumable_amount = card.ability.extra.consumable_amount + 2

				card.ability.extra.mult = card.ability.extra.mult + 7
				card.ability.extra.chips = card.ability.extra.chips + 10
			end
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult }, type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 2
    end
}

-- Gabriel
SMODS.Joker {
    key = "gabriel",
	name = "Gabriel",
	config = {extra = {totalSpades = 0, totalClubs = 0, totalHearts = 0, totalDiamonds = 0, mult = 0, chips = 0}},
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 4, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.totalSpades, card.ability.extra.totalClubs, card.ability.extra.totalHearts, card.ability.extra.totalDiamonds, card.ability.extra.mult, card.ability.extra.chips,  } }
    end,

    calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
			card.ability.extra.totalSpades = card.ability.extra.totalSpades + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
			card.ability.extra.totalClubs = card.ability.extra.totalClubs + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
			card.ability.extra.totalHearts = card.ability.extra.totalHearts + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
			card.ability.extra.totalDiamonds = card.ability.extra.totalDiamonds + 1
		end

		if context.after and context.main_eval and math.abs((card.ability.extra.totalSpades + card.ability.extra.totalClubs) - (card.ability.extra.totalHearts + card.ability.extra.totalDiamonds)) >= 6 then
			SMODS.add_card({ key = "j_pmcmod_robotYesod", stickers = { "eternal" } })
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))

		end

		card.ability.extra.chips = (card.ability.extra.totalSpades + card.ability.extra.totalClubs)*3
        card.ability.extra.mult = (card.ability.extra.totalHearts + card.ability.extra.totalDiamonds)

		if context.joker_main then
			return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 2
    end
}

-- Daniel
SMODS.Joker {
    key = "daniel",
	name = "Daniel",
	config = {extra = {odds_downgrade = 2, odds_upgrade = 6, xmult = 3, xmult_mod = 0.3}},
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 5, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds_downgrade, card.ability.extra.odds_upgrade, card.ability.extra.xmult, card.ability.extra.xmult_mod } } 
    end,

    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
            if (pseudorandom('daniel_upgrade') < G.GAME.probabilities.normal / card.ability.extra.odds_upgrade) then
				card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
				return {
						message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.xmult_mod } },
						colour = G.C.RED
				}
			end
			if (pseudorandom('daniel_downgrade') < G.GAME.probabilities.normal / card.ability.extra.odds_downgrade) then
				card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_mod
				return {
						message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.xmult_mod } },
						colour = G.C.RED
				}
			end
        end
		if context.after and context.main_eval and card.ability.extra.xmult <= 1 then
			SMODS.add_card({ key = "j_pmcmod_robotChesed", stickers = { "eternal" } })
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.3,
				blockable = false,
				func = function()
						G.GAME.joker_buffer = 0
					card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
					play_sound('slice1', 0.96 + math.random() * 0.08)
					return true
				end
			}))
		end
		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
				Xmult_mod = card.ability.xmult
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 4
    end
}

-- Kali
SMODS.Joker {
    key = "kali",
	name = "Kali",
	config = {extra = {mult = 0}},
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 6, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)

		card.ability.extra.mult = (G.GAME.current_round.hands_played)*25

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and (G.GAME.round_resets.hands - G.GAME.current_round.hands_played) < 1 then
			SMODS.add_card({ key = "j_pmcmod_robotGebura", stickers = { "eternal" } })
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
	
		end
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 5
    end
}

-- Garion
SMODS.Joker {
    key = "garion",
	name = "Garion",
	config = {extra = {xmult = 1, xmult_mod = 0.2}},
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 7, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod } }
    end,

    calculate = function(self, card, context)

		if context.destroying_card and context.cardarea == G.play and #context.full_hand >= 1 and not context.blueprint and G.GAME.current_round.hands_played == 0 then  
				card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod)
                return {
                    remove = true
                }
		end
		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
				Xmult_mod = card.ability.extra.xmult
			}
		end
		if context.after and context.main_eval and (#G.playing_cards) <= (G.GAME.starting_deck_size/2) then
			SMODS.add_card({ key = "j_pmcmod_robotBinah", stickers = { "eternal" } })
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.3,
				blockable = false,
				func = function()
						G.GAME.joker_buffer = 0
					card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
					play_sound('slice1', 0.96 + math.random() * 0.08)
					return true
				end
			}))
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 6
    end
}

-- Lisa
SMODS.Joker {
    key = "lisa",
	name = "Lisa",
	config = {extra = {enochDeathCounter = 0, aceMult = 5, aceMult_mod = 10}},
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 8, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.enochDeathCounter, card.ability.extra.aceMult, card.ability.extra.aceMult_mod } }
    end,

    calculate = function(self, card, context)
		if context.setting_blind then
		local enochPresent = false
		local robotEnochPresent = false

			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_pmcmod_enoch" then
					enochPresent = true
					break
				end
			end

			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_pmcmod_robotEnoch" then
					robotEnochPresent = true
					break
				end
			end
		
			if G.jokers and enochPresent == false and card.ability.extra.enochDeathCounter < 1 then
				SMODS.add_card({ key = "j_pmcmod_enoch" })
			end
			if G.jokers and robotEnochPresent == false and card.ability.extra.enochDeathCounter >= 1 then
				SMODS.add_card({ key = "j_pmcmod_robotEnoch" })
			end
			
		end
		--if context.joker_type_destroyed then
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_enoch" then
			print("Testing destruction")
			card.ability.extra.enochDeathCounter = card.ability.extra.enochDeathCounter + 1
			card.ability.extra.aceMult = card.ability.extra.aceMult + card.ability.extra.aceMult_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_robotEnoch" then
			print("Testing destruction")
			card.ability.extra.enochDeathCounter = card.ability.extra.enochDeathCounter + 1
			card.ability.extra.aceMult = card.ability.extra.aceMult + card.ability.extra.aceMult_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end
		if context.individual and context.cardarea == G.play and
            context.other_card:get_id() == 14 then
            return {
                mult = card.ability.extra.aceMult
            }
        end

		if context.after and context.main_eval and card.ability.extra.enochDeathCounter >= 3 then
			SMODS.add_card({ key = "j_pmcmod_robotTiph", stickers = { "eternal" } })
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))

		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 3
    end
}

-- Enoch
SMODS.Joker {
    key = "enoch",
	name = "Enoch",
	config = {extra = {chips = 0, chip_mod = 5}},
	no_collection = true,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 0,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 9, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
    end,

    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                message_card = card
            }
        end
		if context.end_of_round and card.ability.extra.chips >= 100 then
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
		end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

--Hermann
SMODS.Joker {
    key = "hermann",
	name = "Hermann",
	config = {extra = {odds_seal = 2, odds_edition = 4}},
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
    rarity = 3,
    cost = 9,
	atlas = 'ModdedProjectMoon',
    pos = { x = 0, y = 1 },
    pools = 
	{
 		["NewLeagueOfNine"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds_seal, card.ability.extra.odds_edition } }
    end,
	calculate = function(self, card, context)
		if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
		if context.before and context.main_eval and not context.blueprint and G.GAME.current_round.hands_played == 0 then
			for _, scored_card in ipairs(context.scoring_hand) do
				local possible_enhancements = {'m_bonus', 'm_mult', 'm_wild', 'm_glass', 'm_steel', 'm_stone', 'm_gold', 'm_lucky', 'm_pmcmod_burn'}
				local possible_seals = {"Red", "Purple", "Blue", "Gold", "pmcmod_markofcain"}
				local possible_editions = {'e_foil', 'e_holo', 'e_polychrome'}
                    scored_card:set_ability(pseudorandom_element(possible_enhancements, pseudoseed('hermann')), nil, true)
					if (pseudorandom('hermann_seal') < G.GAME.probabilities.normal / card.ability.extra.odds_seal) then
						scored_card:set_seal(pseudorandom_element(possible_seals, pseudoseed('hermann')), nil, true)
					end

					if (pseudorandom('hermann_edition') < G.GAME.probabilities.normal / card.ability.extra.odds_edition) then
						scored_card:set_edition(pseudorandom_element(possible_editions, pseudoseed('hermann')), nil, true)
					end
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
            end
		end

	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 5
    end
}

--Gubo
SMODS.Joker {
    key = "gubo",
	name = "Gubo",
	config = {extra = {mult = 0, commonMult = 4, uncommonMult = 8, odds = 2, selected_keypage = "", aimingAtJoker = false, joker_to_destroy = {}}},
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
    rarity = 2,
    cost = 9,
	atlas = 'ModdedProjectMoon',
    pos = { x = 1, y = 1 },
    pools = 
	{
 		["NewLeagueOfNine"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, card.ability.extra.commonMult, card.ability.extra.uncommonMult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.selected_keypage } }
    end,
	calculate = function(self, card, context)
		local destructable_jokers = {}
		local aimingAtJoker = false
		if context.setting_blind and not card.getting_sliced and (pseudorandom('gubo') < G.GAME.probabilities.normal / card.ability.extra.odds) then
			print("enteredAimingPhase")
				for i = 1, #G.jokers.cards do
					for j = 1, #G.P_CENTER_POOLS.Sinners do
						if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and 
						(G.P_CENTER_POOLS.Sinners[j].key == G.jokers.cards[i].config.center.key)
						then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
					end
                end
                for i = 1, #G.jokers.cards do
					for j = 1, #G.P_CENTER_POOLS.NewLeagueOfNine do
						if (G.jokers.cards[i] ~= card and (G.jokers.cards[i].config.center.rarity <= 2) and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and
						(G.P_CENTER_POOLS.NewLeagueOfNine[j].key ~= G.jokers.cards[i].config.center.key)) or (G.jokers.cards[i].config.center.key == "j_family") then 
							destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] 
						end
					end
                end
                card.ability.extra.joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('gubo')) or nil
				card.ability.extra.aimingAtJoker = true
				card.ability.extra.selected_keypage = #destructable_jokers > 0 and localize{type="name_text", set="Joker", key = card.ability.extra.joker_to_destroy.config.center.key} or nil
				play_sound('pmcmod_gubo_aim', 0.9, 0.9)
				
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and card.ability.extra.joker_to_destroy then
			
			local sinnerDetected = false
			local keypageStillDetected = false
			local vergiliusDetected = false
			if card.ability.extra.aimingAtJoker then
				for i = 1, #G.jokers.cards do
						if G.jokers.cards[i].config.center.key == card.ability.extra.joker_to_destroy.config.center.key then 
							keypageStillDetected = true 
						end
				end
				if card.ability.extra.joker_to_destroy.config.center.key == "j_family" then
					vergiliusDetected = true
				end
			end

			

			if vergiliusDetected == true then
				G.E_MANAGER:add_event(Event({
					func = function()
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
				G.GAME.pool_flags.gubo_extinct = true
				return {
					message = 'Shit!'
				}
			end
			

			if keypageStillDetected and not vergiliusDetected and card.ability.extra.aimingAtJoker == true and not (context.blueprint_card or self).getting_sliced then
				print("enteredShootingPhase")
				if card.ability.extra.joker_to_destroy.config.center.rarity == 1 then
					for j = 1, #G.P_CENTER_POOLS.Sinners do
						if G.P_CENTER_POOLS.Sinners[j].key == card.ability.extra.joker_to_destroy.config.center.key then
							sinnerDetected = true
						end
					end
					if sinnerDetected == true then
						card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.commonMult * 2)
						sinnerDetected = false
					else
						card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.commonMult)
					end
				end
				if card.ability.extra.joker_to_destroy.config.center.rarity == 2 then
					for j = 1, #G.P_CENTER_POOLS.Sinners do
						if G.P_CENTER_POOLS.Sinners[j].key == card.ability.extra.joker_to_destroy.config.center.key then
							sinnerDetected = true
						end
					end
					if sinnerDetected == true then
						card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.uncommonMult * 2)
						sinnerDetected = false
					else
						card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.uncommonMult)
					end
				end
				card.ability.extra.joker_to_destroy.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.8, 0.8)
					play_sound('pmcmod_gubo_shoot', 0.9, 0.9)
					card.ability.extra.joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
				card_eval_status_text((context.blueprint_card or card), 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.xmult}}})
			end

		end
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 5
    end
}

-- Jia Huan
--[[SMODS.Joker {
    key = "jiahuan",
	name = "Jia Huan",
	config = {extra = {}},
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 3, y = 0 },
    loc_vars = function(self, info_queue, card)
        return {vars = {  } }
    end,

    calculate = function(self, card, context)

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}--]]

--Aseah
SMODS.Joker {
    key = "aseah",
	name = "Aseah",
	config = {extra = {}},
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
    rarity = 2,
    cost = 9,
	atlas = 'ModdedProjectMoon',
    pos = { x = 3, y = 1 },
    pools = 
	{
 		["NewLeagueOfNine"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult } }
    end,
	calculate = function(self, card, context)
			if context.setting_blind and not context.blueprint then
			local my_pos = nil
			local jokerToTheRightIsFromTheLeague = false
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
			for j = 1, #G.P_CENTER_POOLS.NewLeagueOfNine do
				if my_pos and G.jokers.cards[my_pos + 1] and G.jokers.cards[my_pos + 1] ~= card and (G.P_CENTER_POOLS.NewLeagueOfNine[j].key ~= G.jokers.cards[my_pos + 1].config.center.key) then 
					jokerToTheRightIsFromTheLeague = true
				end
			end
			if context.setting_blind and my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].ability.eternal and G.jokers.cards[my_pos + 1].config.center.rarity <= 2 then
				local sliced_card = G.jokers.cards[my_pos + 1]
				local rarity = G.jokers.cards[my_pos + 1].config.center.rarity
                sliced_card.getting_sliced = true
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1
				G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
				if rarity == 1 then
					G.E_MANAGER:add_event(Event({
					func = function()
							SMODS.add_card {
								set = 'Joker',
								rarity = 'Uncommon',
								key_append = 'pmcmod_aseah' -- Optional, useful for manipulating the random seed and checking the source of the creation in in_pool.
							}
							--G.GAME.joker_buffer = 0
						return true
					end
					}))
				end
				if rarity == 2 then
					G.E_MANAGER:add_event(Event({
					func = function()
							SMODS.add_card {
								set = 'Joker',
								rarity = 'Rare',
								key_append = 'pmcmod_aseah' -- Optional, useful for manipulating the random seed and checking the source of the creation in in_pool.
							}
							--G.GAME.joker_buffer = 0
						return true
					end
					}))
				end
			end
		end
    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 5
    end
}

--Panther
SMODS.Joker {
	key = 'panther',
	name = "Panther",
	config = { extra = { mult = 0, mult_gain = 5 } },
	unlocked = false,
    eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 1 },
    pools = 
	{

 	},
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
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_pmcmod_serpent') > 1
    end
}

--Lion
SMODS.Joker {
	key = 'lion',
	name = "Lion",
	config = { extra = { chips = 0, chips_gain = 10 } },
	unlocked = false,
    eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 1 },
    pools = 
	{

 	},
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
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_pmcmod_serpent') > 2
    end
}

--Wolf
SMODS.Joker {
	key = 'wolf',
	name = "Wolf",
	config = {extra = 0.1, xmult = 1},
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 1 },
    pools = 
	{

 	},
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
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_pmcmod_serpent') > 3
    end
}

--Hopkins
SMODS.Joker {
	key = 'hopkins',
	name = "Hopkins",
	config = { extra = { mult = 20, odds = 20 } },
    eternal_compat = false,
	blueprint_compat = true,
	perishable_compat = false,
	rarity = 1,
    cost = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 2 },
    pools = 
	{

 	},
    no_pool_flag = 'hopkins_extinct',
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
	config = { extra = { chips = 70, odds = 20, voucher = 'v_tarot_merchant' } },
    eternal_compat = false,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 1,
    cost = 4,
	atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 2 },
    pools = 
	{

 	},
    no_pool_flag = 'aya_extinct',
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
					G.GAME.used_vouchers[card.ability.extra.voucher] = true
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
	config = { extra = { odds = 20, rounds = 4, current_rounds = 0, consumables = { 'c_soul' }  } },
    eternal_compat = false,
	blueprint_compat = true,
	perishable_compat = false,
	rarity = 3,
	cost = 10,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 2 },
    pools =
	{

 	},
    no_pool_flag = 'yuri_extinct',
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
    config = { extra = { Xmult = 1, Xmult_mod = 0.3 } },
	unlocked = false,
	eternal_compat = true,
    blueprint_compat = true,
    perishable_compat = true,
    rarity = 3,
    cost = 8,
    atlas = 'ModdedProjectMoon',
    pos = { x = 4, y = 1 },
    pools =
	{
        ["DemiansGroup"] = true,
 	},
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
	,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 4
    end
	
}

--Rim
SMODS.Joker {
    key = "rim",
	name = "Rim",
    unlocked = false,
    blueprint_compat = false,
	perishable_compat = true,
    rarity = 2,
	atlas = 'ModdedProjectMoon',
    cost = 6,
    pos = { x = 5, y = 1 },
    pools = 
	{
 		["Heretics"] = true,
        ["DemiansGroup"] = true,
 	},
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
        return { vars = { number_format(100000) } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'chip_score' and to_big(args.chips) >= to_big(100000)
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("???????", G.C.RED, HEX('40150e'), 1.2 )
 	end
}

-- Sanson
SMODS.Joker {
	key = 'sanson',
	config = { extra = { Xmult = 1.15 } },
	rarity = 2,
	atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 1 },
	cost = 6,
	eternal_compat = false,
	blueprint_compat = false,
	perishable_compat = true,
    pools =
	{
        ["Bloodfiend"] = true,
        ["DemiansGroup"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
	end,
	calculate = function(self, card, context)
        if context.hand_drawn then
			local any_forced = nil
			for _, playing_card in ipairs(G.hand.cards) do
				if playing_card.ability.forced_selection then
					any_forced = true
				end
			end
			if not any_forced then
				G.hand:unhighlight_all()
				local forced_card = pseudorandom_element(G.hand.cards, 'vremade_cerulean_bell')
				forced_card.ability.forced_selection = true
				G.hand:add_to_highlighted(forced_card)
			end
		end
		if context.modify_hand then
                mult = math.max(math.floor(mult * 2), 1)
                hand_chips = math.max(math.floor(hand_chips * 2), 0)
                update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
        end
    end
}

-- Effie
SMODS.Joker {
    key = "effie",
	name = "Effie",
	config = { extra = { mult = 0, mult_gain = 2, poker_hand = 'Pair', poker_hand_index = 0 } },
    eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
    rarity = 1,
    cost = 4,
    atlas = 'ModdedProjectMoon',
    pos = { x = 4, y = 2 },
    pools = 
	{
 		["Heretics"] = true,
 	},
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
	config = { extra = { chips = 0, chips_gain = 5, suit = 'Spades', suit_index = 0 } },
    eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
    rarity = 1,
    cost = 4,
    atlas = 'ModdedProjectMoon',
    pos = { x = 5, y = 2 },
    pools =
	{

 	},
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
    config = { chipsValue1 = 1000, chipsValue2 = 100, chipsValue3 = 10, chipsValue4 = 1, chipsValue5 = -10, chipsValue6 = -100 },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 2 },
    pools =
	{

 	},
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

--Sonya
SMODS.Joker {
	key = 'sonya',
	name = "Sonya",
	unlocked = false,
	config = { extra = { odds = 100, chips = 77} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 2 },
    pools =
	{
        ["NewLeagueOfNine"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands["Flush"]) then
			if pseudorandom('sonya') < G.GAME.probabilities.normal / card.ability.extra.odds then
				SMODS.add_card({set = 'Spectral', key = 'c_soul' })
			end
			return {
				chips = card.ability.extra.chips,
				message = 'Test'
			}
		end
	end,
	locked_loc_vars = function(self, info_queue, card)
        return { vars = { number_format(50000), number_format(7) } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'chip_score' and to_big(args.chips) >= to_big(50000) and to_big(args.chips)%to_big(7) == to_big(0)
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("????", G.C.YELLOW, G.C.GREEN, 1.2 )
 	end
}

-- Kromer
SMODS.Joker {
	key = 'kromer',
	name = "Kromer",
	config = {extra = 0.5, xmult = 1},
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 2 },
    pools =
	{
        ["NCorp"] = true,
 	},
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
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 3
    end
}

--Siegfried
SMODS.Joker {
    key = "siegfried",
	name = "Siegfried",
	config = {extra = 0.2, xmult = 1},
	unlocked = false,
    eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
    rarity = 3,
	atlas = 'ModdedProjectMoon',
    cost = 6,
    pos = { x = 8, y = 2 },
    pools =
	{
        ["KCorp"] = true,
        ["Heretics"] = true,
 	},
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
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 5
    end
}

--Guido
SMODS.Joker {
    key = "guido",
	name = "Guido",
	config = { extra = { mult = 3 }},
	unlocked = false,
    eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'ModdedProjectMoon',
    pos = { x = 9, y = 2 },
    pools =
	{
        ["NCorp"] = true,
 	},
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
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 1
    end
	
}

-- Papa Bongy
SMODS.Joker {
	key = 'papaBongy',
	name = "Papa Bongy",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	config = { extra = { chips = 0, mult = 0, xmult = 1, dollars = 0, totalChickensSpawned = 0, chips_mod = 10, mult_mod = 5, xmult_mod = 0.1, dollars_mod = 1 } },
	rarity = 3,
	cost = 9,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 14 },
    pools =
	{
        ["KCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xmult, card.ability.extra.dollars, card.ability.extra.chips_mod, card.ability.extra.mult_mod,
		card.ability.extra.xmult_mod, card.ability.extra.dollars_mod, card.ability.extra.totalChickensSpawned } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
		local chickenPresent = false
		local possibleSpawns = {'j_pmcmod_chickenA', 'j_pmcmod_chickenB', 'j_pmcmod_chickenC', 'j_pmcmod_chickenD'}
		for i = 1, #G.jokers.cards do
			for j = 1, #G.P_CENTER_POOLS.HellsKitchen do
				if G.jokers.cards[i] ~= card and (G.P_CENTER_POOLS.HellsKitchen[j].key == G.jokers.cards[i].config.center.key) then 
					chickenPresent = true
					break
				end
			end
        end

		if G.jokers and chickenPresent == false then
			local totalChickensThatCanSpawn = G.jokers.config.card_limit - #G.jokers.cards
			if totalChickensThatCanSpawn == 1 then 
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				card.ability.extra.totalChickensSpawned = card.ability.extra.totalChickensSpawned + 1
			end
			if totalChickensThatCanSpawn == 2 then 
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				card.ability.extra.totalChickensSpawned = card.ability.extra.totalChickensSpawned + 2
			end
			if totalChickensThatCanSpawn == 3 then 
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				card.ability.extra.totalChickensSpawned = card.ability.extra.totalChickensSpawned + 3
			end
			if totalChickensThatCanSpawn == 4 then 
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				SMODS.add_card({ key = pseudorandom_element(possibleSpawns, 'bongy') })
				card.ability.extra.totalChickensSpawned = card.ability.extra.totalChickensSpawned + 4
			end
				return true
			end
		end

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenA" then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenB" then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
			return {
				message = 'Upgraded!',
				colour = G.C.CHIPS,
				card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenC" then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenD" then
			card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_mod
			return {
				message = 'Upgraded!',
				colour = G.C.MONEY,
				card = card
			}
		end

		if context.joker_main then
			return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
				xmult  = card.ability.extra.xmult,
				--message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.xmult } }
            }
		end
    end,
	calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 2
    end
}

-- Dongrang
SMODS.Joker {
	key = 'dongrang',
	name = "Dongrang",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	config = { extra = { xmult = 1, xmult_gain = 1 } },
	rarity = 3,
	cost = 9,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 3 },
    pools =
	{
        ["KCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)

		if card.edition then
			if card.edition.key == 'e_polychrome' then
				tempKey = self.key..'_alt'
				card.children.center:set_sprite_pos({x = 0 , y = 11})
			else 
				tempKey = self.key
				card.children.center:set_sprite_pos({x = 0 , y = 3})
			end
		else
			tempKey = self.key
			card.children.center:set_sprite_pos({x = 0 , y = 3})
		end

		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain },key = tempKey, }
		
	end,
	calculate = function(self, card, context)

		local joker_count = 0
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
                	if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_polychrome" then
					 	joker_count = joker_count + 1
					end
				end
			end
		card.ability.extra.xmult = 1 + joker_count

		if context.joker_main then
			return {
				mult = card.ability.extra.xmult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.xmult } }
			}
		end

		if context.end_of_round and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and context.main_eval and not context.blueprint then
            local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

			if (#editionless_jokers > 0) then
				local eligible_card = pseudorandom_element(editionless_jokers, 'dongrang')
				local edition = 'e_polychrome'
				eligible_card:set_edition(edition, true)
				check_for_unlock({ type = 'have_edition' })
			end

		end

    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 4
    end
}

-- Dongbaek
SMODS.Joker {
	key = 'dongbaek',
	name = 'Dongbaek',
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	config = { extra = { Xmult = 1.15 } },
	rarity = 2,
	cost = 9,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 9 then
                return {
                    Xmult = card.ability.extra.Xmult,
                }
            end
        end
    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 3
    end
}

-- Samjo
SMODS.Joker {
	key = 'samjo',
	name = "Samjo",
	unlocked = false,
	config = { chips = 20 },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 3 },
    pools =
	{
        ["KCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.chips } }
	end,
	calculate = function(self, card, context)
		local joker_count = 0
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
                	if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_polychrome" then
					 	joker_count = joker_count + 1
					end
				end
			end
		card.ability.chips = 20 + (20*joker_count)

		if context.joker_main then
			return {
				chips = card.ability.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.chips } }
			}
		end
    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 1
    end
}

-- Shrenne
SMODS.Joker {
	key = 'shrenne',
	name = "Shrenne",
	config = { extra = { mult = 0 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 3 },
    pools =
	{
        ["KCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
        if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
		if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
                    card.ability.extra.mult = card.ability.extra.mult + (context.card.sell_cost/2)
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
    end
}

-- Alfonso
SMODS.Joker {
	key = 'alfonso',
	name = "Alfonso",
	config = { extra = { dollars = 10, odds = 2 } },
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 3 },
    pools =
	{
        ["KCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollars, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.before and context.main_eval and G.GAME.hands[context.scoring_name].level > 1 then
			if pseudorandom('alfonso') < G.GAME.probabilities.normal / card.ability.extra.odds then
				if G.GAME.hands[context.scoring_name].level > 1 then
                        return {
                            level_up = -1,
							dollars = card.ability.extra.dollars
                        }
                    end
			else
			return{
				dollars = card.ability.extra.dollars
			}
			end
    	end
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 6
    end

}

-- Marile
SMODS.Joker {
	key = 'marile',
	name = "Marile",
	config = { extra = { mult = 50, mult_base = 50 } },
	eternal_compat = false,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		if G.GAME.blind and G.GAME.blind.in_blind then
		local enhanced_card_tally = 0
		local enhanced_joker_tally = 0
			for _, playing_card in pairs(G.playing_cards or {}) do
				if next(SMODS.get_enhancements(playing_card)) then 
					enhanced_card_tally = enhanced_card_tally + 1 
				end
			end
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
					if G.jokers.cards[i].ability.set == 'Joker' then
						enhanced_joker_tally = enhanced_joker_tally + 1
					end
				end
			end
		card.ability.extra.mult = card.ability.extra.mult_base - (enhanced_joker_tally * 10) - (enhanced_card_tally * 2)
		end
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_base} }
	end,
	calculate = function(self, card, context)
		if context.joker_main and card.ability.extra.mult > 0 then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end

		if context.joker_main and card.ability.extra.mult <= 0 then
		G.E_MANAGER:add_event(Event({
					func = function()

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
		end
    end
}

-- Ran
SMODS.Joker {
	key = 'ran',
	name = "Ran",
	config = { extra = { chips = 100, chips_base = 100 } },
	eternal_compat = false,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		if G.GAME.blind and G.GAME.blind.in_blind then
		local enhanced_card_tally = 0
		local enhanced_joker_tally = 0
			for _, playing_card in pairs(G.playing_cards or {}) do
				if next(SMODS.get_enhancements(playing_card)) then 
					enhanced_card_tally = enhanced_card_tally + 1 
				end
			end
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
					if G.jokers.cards[i].ability.set == 'Joker' then
						enhanced_joker_tally = enhanced_joker_tally + 1
					end
				end
			end
		card.ability.extra.chips = card.ability.extra.chips_base - (enhanced_joker_tally * 20) - (enhanced_card_tally * 5)
		end
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_base} }
	end,
	calculate = function(self, card, context)
		if context.joker_main and card.ability.extra.chips >= 0 then
			return {
				chips = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
		if context.joker_main and card.ability.extra.chips <= 0 then
		G.E_MANAGER:add_event(Event({
					func = function()
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
		end
    end
}

-- Niko
SMODS.Joker {
	key = 'niko',
	name = "Niko",
	config = { extra = { mult = 0} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
		card.ability.extra.mult = #G.hand.cards * 3
			return {
					mult_mod = card.ability.extra.mult,
					message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
    end
}



------------------
-- DUMMY JOKERS --
------------------

-- Robot Hod
SMODS.Joker {
    key = "robotHod",
	name = "Hod (Robot)",
	config = {extra = 0.1, xmult = 2},
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pos = { x = 1, y = 12 },
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return { main_end = main_end, vars = { card.ability.extra, card.ability.xmult } }
    end,
    calculate = function(self, card, context)
		local selectedJoker
		local possibleDebuffs = {}
		if context.setting_blind then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					possibleDebuffs[i] = G.jokers.cards[i]
				end
			end
			selectedJoker  = pseudorandom_element(possibleDebuffs, pseudoseed('hod'))
			SMODS.debuff_card(selectedJoker, true, "hod")
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					SMODS.debuff_card(G.jokers.cards[i], "reset", "hod")
				end
			end
		end

		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } },
				Xmult_mod = card.ability.xmult
			}
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

-- Robot Malkuth
SMODS.Joker {
    key = "robotMalkuth",
	name = "Malkuth (Robot)",
	config = {extra = {mult = 0, odds = 4}},
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pos = { x = 2, y = 12 },
    pools = 
	{
 		["Heretics"] = true,
 	},
	no_pool_flag = 'robot_extinct',
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)

		if context.before and context.main_eval and G.GAME.hands[context.scoring_name].level > 1 then
			if pseudorandom('malk') < G.GAME.probabilities.normal / card.ability.extra.odds then
				if G.GAME.hands[context.scoring_name].level > 1 then
						return {
							level_up = -1,
						}
				end
			end
    	end

		card.ability.extra.mult = (G.GAME.hands["High Card"].level + 
		G.GAME.hands["Pair"].level +
		G.GAME.hands["Three of a Kind"].level +
		G.GAME.hands["Two Pair"].level +
		G.GAME.hands["Full House"].level +
		G.GAME.hands["Straight"].level +
		G.GAME.hands["Flush"].level +
		G.GAME.hands["Straight Flush"].level +
		G.GAME.hands["Four of a Kind"].level +
		G.GAME.hands["Five of a Kind"].level +
		G.GAME.hands["Flush House"].level +
		G.GAME.hands["Flush Five"].level) - 12

		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

-- Robot Netzach
SMODS.Joker {
    key = "robotNetzach",
	name = "Netzach (Robot)",
	config = {extra = {consumable_amount = 2, mult = 0, chips = 0, current_consumable_count = 0, priceIncrease = 0}},
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = false,
	--no_collection = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 3, y = 12 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.consumable_amount, card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.current_consumable_count, card.ability.extra.priceIncrease } }
    end,
    calculate = function(self, card, context)

		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

				card.ability.extra.mult = card.ability.extra.mult + 3
				card.ability.extra.chips = card.ability.extra.chips + 5
				card.ability.extra.priceIncrease = card.ability.extra.priceIncrease + 5
				

		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.priceIncrease
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult }, type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

-- Robot Yesod
SMODS.Joker {
	key = 'robotYesod',
	name = "Yesod (Robot)",
	config = {extra = {totalSpades = 0, totalClubs = 0, totalHearts = 0, totalDiamonds = 0, mult = 0, chips = 0, odds = 10}},
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 12 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.totalSpades, card.ability.extra.totalClubs, card.ability.extra.totalHearts, card.ability.extra.totalDiamonds, card.ability.extra.mult, card.ability.extra.chips, (G.GAME.probabilities.normal or 1), card.ability.extra.odds  } }
    end,

    calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
			card.ability.extra.totalSpades = card.ability.extra.totalSpades + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
			card.ability.extra.totalClubs = card.ability.extra.totalClubs + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
			card.ability.extra.totalHearts = card.ability.extra.totalHearts + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
			card.ability.extra.totalDiamonds = card.ability.extra.totalDiamonds + 1
		end

		card.ability.extra.chips = (card.ability.extra.totalSpades + card.ability.extra.totalClubs)
        card.ability.extra.mult = (card.ability.extra.totalHearts + card.ability.extra.totalDiamonds)/2

		if context.before and context.main_eval and pseudorandom('alfonso') < G.GAME.probabilities.normal / card.ability.extra.odds then

			local currentJokers = {}
					for i = 1, #G.jokers.cards do
							if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal then 
								currentJokers[#currentJokers+1] = G.jokers.cards[i] 
							end
					end
					local selectedJoker = #currentJokers > 0 and pseudorandom_element(currentJokers, pseudoseed('yesod')) or nil

					if selectedJoker then
						selectedJoker:juice_up()
						SMODS.Stickers["perishable"]:apply(selectedJoker, true)
					end

		

		end

		if context.joker_main then
			return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

-- Robot Chesed
SMODS.Joker {
    key = "robotChesed",
	name = "Chesed (Robot)",
	config = {extra = {odds_upgrade = 8, xmult = 1, xmult_mod = 0.1}},
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 5, y = 12 },
    loc_vars = function(self, info_queue, card)
        return {vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds_upgrade, card.ability.extra.xmult, card.ability.extra.xmult_mod } } 
    end,
    calculate = function(self, card, context)

		if context.before and context.main_eval and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.vampired then
                    enhanced[#enhanced + 1] = scored_card
                    scored_card.vampired = true
                    scored_card:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card.vampired = nil
                            return true
                        end
                    }))
                end
            end
        end

		if context.individual and context.cardarea == G.play then
            if (pseudorandom('daniel_upgrade') < G.GAME.probabilities.normal / card.ability.extra.odds_upgrade) then
				card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
				return {
						message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.xmult_mod } },
						colour = G.C.RED
				}
			end
        end
		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
				Xmult_mod = card.ability.extra.xmult
			}
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

-- Robot Gebura
SMODS.Joker {
    key = "robotGebura",
	name = "Gebura (Robot)",
	config = {extra = {mult = 0}},
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 6, y = 12 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)

		card.ability.extra.mult = (G.GAME.current_round.hands_played)*10

		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				dollars = -card.ability.extra.mult/2,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

-- Robot Binah
SMODS.Joker {
    key = "robotBinah",
	name = "Binah (Robot)",
	config = {extra = {xmult = 1, xmult_mod = 0.1}},
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = false,
	--no_collection = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 7, y = 12 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod } }
    end,

    calculate = function(self, card, context)

		card.ability.extra.xmult = 1 + (G.GAME.starting_deck_size - #G.playing_cards) * card.ability.extra.xmult_mod
		
		if context.first_hand_drawn then
            local _card = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('binah')),
                center = G.P_CENTERS.c_base
            }, G.discard, true, nil, { G.C.SECONDARY_SET.Enhanced }, true)
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

		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
				Xmult_mod = card.ability.extra.xmult
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

-- Robot Tiph
SMODS.Joker {
    key = "robotTiph",
	name = "Tiph A (Robot)",
	config = {extra = {enochDeathCounter = 0, aceMult = 5, aceMult_mod = 3, aceChip = -10}},
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
	--no_collection = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 8, y = 12 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.enochDeathCounter, card.ability.extra.aceMult, card.ability.extra.aceMult_mod, card.ability.extra.aceChip } }
    end,

    calculate = function(self, card, context)
		if context.setting_blind then
		local robotEnochPresent = false

			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].config.center.key == "j_pmcmod_robotEnoch" then
					robotEnochPresent = true
					break
				end
			end
		
			if G.jokers and robotEnochPresent == false and card.ability.extra.enochDeathCounter >= 1 then
				SMODS.add_card({ key = "j_pmcmod_robotEnoch" })
			end
			
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_robotEnoch" then
			print("Testing destruction")
			card.ability.extra.enochDeathCounter = card.ability.extra.enochDeathCounter + 1
			card.ability.extra.aceMult = card.ability.extra.aceMult + card.ability.extra.aceMult_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end
		if context.individual and context.cardarea == G.play and
            context.other_card:get_id() == 14 then
            return {
                mult = card.ability.extra.aceMult,
				chips = card.ability.extra.aceChip
            }
        end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

-- Robot Enoch
SMODS.Joker {
    key = "robotEnoch",
	name = "Tiph B (Robot)",
	config = {extra = {chips = 0, chip_mod = 10}},
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
	no_collection = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pools = 
	{
 		["Heretics"] = true,
 	},
    pos = { x = 9, y = 12 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips, card.ability.extra.chip_mod } }
    end,

    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod

            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                message_card = card
            }
        end

		if context.end_of_round and card.ability.extra.chips >= 100 then
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
		end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end
}

--Time Flowing
SMODS.Joker {
	key = 'silence',
	name = "Time Flowing",
	-- This also searches G.GAME.pool_flags to see if Gros Michel went extinct. If so, enables the ability to show up in shop.
	config = { extra = { current_timer = 0, total_timer = 30 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 15 },
	no_collection = true,
	cost = 8,
	eternal_compat = true,
	loc_vars = function (self, info_queue, card)
    local random_mult = tostring(math.floor(card.ability.extra.current_timer)) or 1
		main_end = {
			{n=G.UIT.T, config={text = 'Elapsed time: ',colour = G.C.MULT, scale = 0.32}},
			{n=G.UIT.O, config={object = DynaText({string = random_mult, colours = {G.C.RED}, pop_in_rate = 9999999, silent = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
			{n=G.UIT.T, config={text = ' seconds',colour = G.C.MULT, scale = 0.32}} or nil,
		}
    	return {main_end = main_end, vars = { card.ability.extra.current_timer, card.ability.extra.total_timer }}
	end,
	update = function (self, card, dt)
			if G.GAME.blind and G.GAME.blind.in_blind then
				card.ability.extra.current_timer = card.ability.extra.current_timer + G.real_dt
				--print("Increment test")
				--card.children.center:set_sprite_pos({x = card.ability.extra.current_timer , y = 1})
			end

			if card.ability.extra.current_timer < 7 then
				card.children.center:set_sprite_pos({x = 5 , y = 15})
			end

			if card.ability.extra.current_timer >= 7 and card.ability.extra.current_timer < 14 then
				card.children.center:set_sprite_pos({x = 6 , y = 15})
			end

			if card.ability.extra.current_timer >= 14 and card.ability.extra.current_timer < 21 then
				card.children.center:set_sprite_pos({x = 7 , y = 15})
			end

			if card.ability.extra.current_timer >= 21 and card.ability.extra.current_timer < 29 then
				card.children.center:set_sprite_pos({x = 8 , y = 15})
			end

			if card.ability.extra.current_timer >= 29 and card.ability.extra.current_timer <= 30 then
				card.children.center:set_sprite_pos({x = 9 , y = 15})
			end
			
			if G.shop or not G.GAME.blind.in_blind then
				card.ability.extra.current_timer = 0
			end
			if G.GAME.blind and G.GAME.blind.in_blind and card.ability.extra.current_timer >= card.ability.extra.total_timer then
				card.ability.extra.current_timer = 0
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



-- Shy Look Dummy Joker
SMODS.Joker {
	key = 'shylook',
	name = "Today's Shy Look",
	config = { extra = { randomValue = 4, timer = 0, selectedFace = 0, xmult = 1 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 15 },
	no_collection = true,
	cost = 8,
	eternal_compat = true,
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.randomValue, card.ability.extra.timer }}
	end,
	update = function (self, card, dt)
			if G.GAME.blind and G.GAME.blind.in_blind then
				card.ability.extra.timer = card.ability.extra.timer + G.real_dt
				if card.ability.extra.timer >= 2 then
					local faceTemp = {0, 1, 2, 3, 4}
					card.ability.extra.selectedFace = pseudorandom_element(faceTemp, pseudoseed('shy'))

					if card.ability.extra.selectedFace == 0 then
						card.ability.extra.xmult = 2
					end
					if card.ability.extra.selectedFace == 1 then
						card.ability.extra.xmult = 1.5
					end
					if card.ability.extra.selectedFace == 2 then
						card.ability.extra.xmult = 1
					end
					if card.ability.extra.selectedFace == 3 then
						card.ability.extra.xmult = 0.5
					end
					if card.ability.extra.selectedFace == 4 then
						card.ability.extra.xmult = 0
					end

					card.children.center:set_sprite_pos({x = card.ability.extra.selectedFace , y = 15})
					card.ability.extra.timer = 0
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

-- Queen of Hatred
SMODS.Joker {
	key = 'queenOfHatred',
	name = "Queen of Hatred",
	config = { extra = { discardedCount = 0, playedCount = 0, xmult = 0.5, retrigger = 1, chips = 100, debuffs = 1, transformationCount = 0, currentCount = 0, enableTransform = false } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 13 },
	no_collection = true,
	cost = 8,
	eternal_compat = true,
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.discardedCount, card.ability.extra.playedCount, card.ability.extra.xmult, card.ability.extra.retrigger, card.ability.extra.chips, card.ability.extra.debuffs, 
		card.ability.extra.transformationCount, card.ability.extra.currentCount, card.ability.extra.enableTransform }}
	end,
	calculate = function(self, card, context)

		local allowDebuffs
		local allowXMult
		local allowRetrigger
		local allowChips
		local enableTransform

		card.ability.extra.currentCount = math.abs(card.ability.extra.playedCount - card.ability.extra.discardedCount)

		if card.ability.extra.currentCount <= 4  and not enableTransform == true then
			allowDebuffs = false
			allowXMult = false
			allowRetrigger = true
			allowChips = true
			card.children.center:set_sprite_pos({x = 0, y = 13})
		end

		if card.ability.extra.currentCount <= 7 and card.ability.extra.currentCount > 4 and not enableTransform == true then
			allowDebuffs = false
			allowXMult = false
			allowRetrigger = false
			allowChips = true
			card.children.center:set_sprite_pos({x = 1, y = 13})
		end

		if card.ability.extra.currentCount < 10 and card.ability.extra.currentCount > 7 and not enableTransform == true then
			allowDebuffs = false
			allowXMult = false
			allowRetrigger = false
			allowChips = false
			card.children.center:set_sprite_pos({x = 2, y = 13})
		end

		if card.ability.extra.currentCount >= 10 and card.ability.extra.currentCount < 14 and not enableTransform == true then
			allowDebuffs = false
			allowXMult = true
			allowRetrigger = false
			allowChips = false
			card.children.center:set_sprite_pos({x = 3, y = 13})
		end

		if card.ability.extra.currentCount >= 14 and not enableTransform then
			allowDebuffs = true
			allowXMult = true
			allowRetrigger = false
			allowChips = false
			enableTransform = true
			card.children.center:set_sprite_pos({x = 4, y = 13})
		end

		if context.discard and not context.blueprint and not enableTransform then
			card.ability.extra.discardedCount = card.ability.extra.discardedCount + 1
		end

		if context.before and context.scoring_hand and not enableTransform then
			card.ability.extra.playedCount = card.ability.extra.playedCount + #context.scoring_hand
		end


		if context.joker_main and allowXMult == true then
			return {
				Xmult_mod = card.ability.extra.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
			}
		end

		if context.joker_main and allowChips == true then
			return {
				chips = card.ability.extra.chips,
			}
		end

		if context.retrigger_joker_check and allowRetrigger == true then
			return {repetitions = 1} 
		end

		if context.setting_blind and allowDebuffs then
			card.ability.extra.transformationCount = card.ability.extra.transformationCount + 1
			--print("transform count")
			--card.children.center:set_sprite_pos({x = 0, y = 0})
			--enableTransform = true
			if card.ability.extra.transformationCount > 2 then
				card.ability.extra.transformationCount = 0
				--print("transform reset")
				enableTransform = false
				card.ability.extra.currentCount = 0
				card.ability.extra.playedCount = 5
				card.ability.extra.discardedCount = 5
				card.children.center:set_sprite_pos({x = 1, y = 0})
				for i = 0, #G.jokers.cards do
					if G.jokers.cards[i] ~= card then
						SMODS.debuff_card(G.jokers.cards[i], "reset", "queen")
					end
				end
				
			end
			local possibleDebuffs = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					possibleDebuffs[i] = G.jokers.cards[i]
				end
			end
			local selectedJoker = pseudorandom_element(possibleDebuffs, pseudoseed('queen'))
			SMODS.debuff_card(selectedJoker, true, "queen")
		end

	end,
	in_pool = function(self, args) -- equivalent to `yes_pool_flag = 'vremade_gros_michel_extinct'`
        return G.GAME.pool_flags.fake_queen_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("??????", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Bongy A
SMODS.Joker {
	key = 'chickenA',
	name = "Chicken A",
	config = { extra = { roundsCompleted = 0 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 14 },
	no_collection = true,
	cost = 0,
	pools =
	{
        ["HellsKitchen"] = true,
 	},
	eternal_compat = true,
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.roundsCompleted }}
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			card.ability.extra.roundsCompleted = card.ability.extra.roundsCompleted + 1
		end

		if context.end_of_round and card.ability.extra.roundsCompleted >= 3 then
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
		end
	end,
	in_pool = function(self, args) -- equivalent to `yes_pool_flag = 'vremade_gros_michel_extinct'`
        return G.GAME.pool_flags.fake_bongy_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Food...?", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Bongy B
SMODS.Joker {
	key = 'chickenB',
	name = "Chicken B",
	config = { extra = { handsUsed = 0 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 14 },
	no_collection = true,
	cost = 0,
	pools =
	{
        ["HellsKitchen"] = true,
 	},
	eternal_compat = true,
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.handsUsed }}
	end,
	calculate = function(self, card, context)
		if context.before and context.main_eval then
			card.ability.extra.handsUsed = card.ability.extra.handsUsed + 1
		end

		if context.end_of_round and card.ability.extra.handsUsed >= 5 then
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
		end
	end,
	in_pool = function(self, args) -- equivalent to `yes_pool_flag = 'vremade_gros_michel_extinct'`
        return G.GAME.pool_flags.fake_bongy_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Food...?", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Bongy C
SMODS.Joker {
	key = 'chickenC',
	name = "Chicken C",
	config = { extra = { discardsUsed = 0 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 14 },
	no_collection = true,
	cost = 0,
	pools =
	{
        ["HellsKitchen"] = true,
 	},
	eternal_compat = true,
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.discardsUsed }}
	end,
	calculate = function(self, card, context)

		if context.discard and not context.blueprint then
			card.ability.extra.discardsUsed = card.ability.extra.discardsUsed + 1
		end

		if context.end_of_round and card.ability.extra.discardsUsed >= 20 then
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
		end
	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_bongy_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Food...?", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Bongy D
SMODS.Joker {
	key = 'chickenD',
	name = "Chicken D",
	config = { extra = { boostersOpened = 0 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 14 },
	no_collection = true,
	cost = 0,
	pools =
	{
        ["HellsKitchen"] = true,
 	},
	eternal_compat = true,
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.boostersOpened }}
	end,
	calculate = function(self, card, context)
		
		if context.open_booster then
			card.ability.extra.boostersOpened = card.ability.extra.boostersOpened + 1
		end

		if context.end_of_round and card.ability.extra.boostersOpened >= 3 then
			card.getting_sliced = true
			G.GAME.joker_buffer = G.GAME.joker_buffer - 1
			G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
		end
	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_bongy_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Food...?", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}