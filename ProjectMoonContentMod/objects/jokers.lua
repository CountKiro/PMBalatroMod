local function Shuffle(t)
	local s = {}
	for i = 1, #t do s[i] = t[i] end
	for i = #t, 2, -1 do
		local j = math.random(i)
		s[i], s[j] = s[j], s[i]
	end
	return s
end

-----------------
-- TRUE JOKERS --
-----------------


-- True Oswald
SMODS.Joker {
	key = 'oswald',
	name = "Oswald",
	pronouns = "he_him",
	unlocked = false,
	blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
	config = { extra = { lastEffect = "None" } },
	rarity = 3,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 0, y = 0 },
	cost = 8,
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.lastEffect }}
	end,
	update = function (self, card, dt)

	end,
	calculate = function(self, card, context)
		
		if context.joker_main and not context.blueprint then

			local chosenEffect = math.random(1, 18)

			if chosenEffect == 1 then
				card.ability.extra.lastEffect = "+ Chips"
				return {
					chips = math.random(1, 100),
				}
			end
			if chosenEffect == 2 then
				card.ability.extra.lastEffect = "+ Mult"
				return {
					mult = math.random(1, 100),
				}
			end
			if chosenEffect == 3 then
				card.ability.extra.lastEffect = "Xmult"
				return {
					xmult = math.random(1, 20),
				}
			end
			if chosenEffect == 4 then
				card.ability.extra.lastEffect = "XMult"
				return {
					xmult = math.random(1, 3),
				}
			end
			if chosenEffect == 5 then
				card.ability.extra.lastEffect = "Invert Mult"
				return {
					xmult = -1,
				}
			end
			if chosenEffect == 6 then
				card.ability.extra.lastEffect = "Divides Mult"
				return {
					xmult = math.random(0.5, 1.0),
				}
			end
			if chosenEffect == 7 then
				card.ability.extra.lastEffect = "- Chips"
				return {
					chips = -math.random(1, 100),
				}
			end
			if chosenEffect == 8 then
				card.ability.extra.lastEffect = "- Mult"
				return {
					mult = -math.random(1, 30),
				}
			end
			if chosenEffect == 9 then
				card.ability.extra.lastEffect = "+ $"
				return {
					dollars = math.random(1, 10)
				}
			end
			if chosenEffect == 10 then
				card.ability.extra.lastEffect = "+ $"
				return {
					dollars = math.random(10, 50)
				}
			end
			if chosenEffect == 11 then
				card.ability.extra.lastEffect = "- $"
				return {
					dollars = -math.random(1, 20)
				}
			end
			if chosenEffect == 12 then
				card.ability.extra.lastEffect = "Spawns perishable Keypage"
				return {
					SMODS.add_card {set = 'Joker', key_append = 'oswald', stickers = {"perishable"}, force_stickers = true}
				}
			end
			if chosenEffect == 13 then
				card.ability.extra.lastEffect = "Spawns rental Keypage"
				return {
					SMODS.add_card {set = 'Joker', key_append = 'oswald', stickers = {"rental"}, force_stickers = true}
				}
			end
			if chosenEffect == 14 then
				card.ability.extra.lastEffect = "Spawns eternal Keypage"
				return {
					SMODS.add_card {set = 'Joker', key_append = 'oswald', stickers = {"eternal"}, force_stickers = true}
				}
			end
			if chosenEffect == 15 then
				card.ability.extra.lastEffect = "Spawns Keypage"
				return {
					SMODS.add_card {set = 'Joker', key_append = 'oswald'}
				}
			end
			if chosenEffect == 16 then
				card.ability.extra.lastEffect = "Spawns Tarot Card"
				return {
					SMODS.add_card {set = 'Tarot', key_append = 'oswald'}
				}
			end
			if chosenEffect == 17 then
				card.ability.extra.lastEffect = "Spawns Spectral card"
				return {
					SMODS.add_card {set = 'Spectral', key_append = 'oswald'}
				}
			end
			if chosenEffect == 18 then
				card.ability.extra.lastEffect = "Destroys a Keypage"

				if card.getting_sliced then
					local destructable_jokers = {}
					for i = 1, #G.jokers.cards do
							if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced
							then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
					end
					local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('oswald')) or nil

					if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
						joker_to_destroy.getting_sliced = true
						G.E_MANAGER:add_event(Event({func = function()
							card:juice_up(0.8, 0.8)
							joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
						return true end }))
					end
				end
			end
        end
	end,
	in_pool = function(self, args) 

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The 8 o’Clock Circus", HEX('851734'), HEX('e8e6e3'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_joker" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Esther
SMODS.Joker {
	key = 'esther',
	name = "Esther",
	pronouns = "he_him",
	config = { extra = { xmult = 3 } },
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
	unlocked = false,
	rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 4, y = 13 },
	pools =
	{
        ["Index"] = true,
 	},
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_singleton"}
    	return {vars = { card.ability.extra.xmult }}
	end,
	calculate = function(self, card, context)
		
		if context.individual and context.cardarea == G.play and not context.blueprint then
			local singletonCounter = 0 -- make this into a function
			local singletonSuit = context.other_card.base.suit
			local singletonRank = context.other_card:get_id()

			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if playing_card:get_id() == singletonRank then 
						singletonCounter = singletonCounter + 1
					end
				end
			end

			if singletonCounter == 1 then
				return {
					xmult = card.ability.extra.xmult,
				}
			end
		end
		
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('The Index', HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_turtle_bean" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Gloria
SMODS.Joker {
	key = 'gloria',
	name = "Gloria",
	pronouns = "she_her",
	config = { extra = { dollars = 7 } },
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
	unlocked = false,
	rarity = 2,
    cost = 6,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 0, y = 2 },
	pools =
	{
        ["Index"] = true,
 	},
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_singleton"}
    	return {vars = { card.ability.extra.dollars }}
	end,
	calculate = function(self, card, context)
		
		if context.individual and context.cardarea == G.play and not context.blueprint then
			local singletonCounter = 0 -- make this into a function
			local singletonSuit = context.other_card.base.suit
			local singletonRank = context.other_card:get_id()

			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if playing_card:get_id() == singletonRank then 
						singletonCounter = singletonCounter + 1
					end
				end
			end

			if singletonCounter == 1 then
				return {
					dollars = card.ability.extra.dollars,
				}
			end
		end
		
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('The Index', HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_troubadour" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Hubert
SMODS.Joker {
	key = 'hubert',
	name = "Hubert",
	pronouns = "he_him",
	config = { extra = { retrigger = 2 } },
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
	unlocked = false,
	rarity = 2,
    cost = 6,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 0, y = 1 },
	pools =
	{
        ["Index"] = true,
 	},
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_singleton"}
    	return {vars = { card.ability.extra.retrigger }}
	end,
	calculate = function(self, card, context)
		
		if context.repetition and context.cardarea == G.play and not context.blueprint then
			local singletonCounter = 0 -- make this into a function
			local singletonSuit = context.other_card.base.suit
			local singletonRank = context.other_card:get_id()

			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if playing_card:get_id() == singletonRank then 
						singletonCounter = singletonCounter + 1
					end
				end
			end

			if singletonCounter == 1 then
				return {
					repetitions = card.ability.extra.retrigger,
				}
			end
		end
		
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('The Index', HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_juggler" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Kim
SMODS.Joker {
	key = 'kim',
	name = "Kim",
	pronouns = "he_him",
	config = { extra = {xmult = 3, xmult_mod = 0.1} },
	no_collection = false,
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoonTrue',
	pos = { x = 2, y = 1 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,
	calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and context.other_card.poise_trigger and not context.blueprint then

            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                message_card = card
            }
        end

		if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return {
                xmult = card.ability.extra.xmult
            }
        end

    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Angelica
SMODS.Joker {
	key = 'angelica',
	name = "Angelica",
	pronouns = "she_her",
	config = { extra = { mult = 100 } },
    blueprint_compat = false,
    eternal_compat = false,
	perishable_compat = true,
	rarity = 3,
    cost = 12,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 7, y = 0 },
	pools =
	{
        ["Index"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.mult }}
	end,
	calculate = function(self, card, context)
		if context.joker_main and not context.blueprint then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Charles' Office", HEX('3d3d3d'), HEX('b5b5b5'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_half" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Puppeteer
SMODS.Joker {
	key = 'puppeteer',
	name = "Puppeteer",
	pronouns = "he_him",
	config = { extra = { mult = 0 } },
    unlocked = false,
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = true,
	rarity = 3,
    cost = 10,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 2, y = 8 },
	pools =
	{
        
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.mult }}
	end,
	calculate = function(self, card, context)

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_puppetA" and not context.blueprint then
--			print("Testing destruction")
--			print(context.card.config.center.key)
			card.ability.extra.mult = card.ability.extra.mult + 7.5
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_puppetB" and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + 15
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_puppetC" and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + 25
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end

		if context.setting_blind and not context.blueprint then

			if context.setting_blind then

				local acceptableJokers = {}
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] ~= card and not G.jokers.cards[i].getting_sliced and not
					(G.jokers.cards[i].config.center.key == "j_pmcmod_puppetA") and not
					(G.jokers.cards[i].config.center.key == "j_pmcmod_puppetB") and not
					(G.jokers.cards[i].config.center.key == "j_pmcmod_puppetC") and not
					(G.jokers.cards[i].config.center.key == "j_pmcmod_puppetAngelica")
					then acceptableJokers[#acceptableJokers+1] = G.jokers.cards[i] end
				end

				local joker_to_transform = #acceptableJokers > 0 and pseudorandom_element(acceptableJokers, pseudoseed('puppeteer')) or nil

				if #acceptableJokers > 0 then
					G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.15,
						func = function()
							joker_to_transform:flip()
							play_sound('card1', percent)
							joker_to_transform:juice_up(0.3, 0.3)
							return true
						end,
					}))

					if joker_to_transform.config.center.key == "j_pmcmod_angelica" or joker_to_transform.config.center.key == "j_half" then
					G.E_MANAGER:add_event(Event({
						delay = 0.5,
						func = function()
							joker_to_transform:set_ability(G.P_CENTERS["j_pmcmod_puppetAngelica"])
							return true
						end
					}))
					elseif joker_to_transform.config.center.rarity == 1 then
						G.E_MANAGER:add_event(Event({
							delay = 0.5,
							func = function()
								joker_to_transform:set_ability(G.P_CENTERS["j_pmcmod_puppetA"])
								return true
							end
						}))
					elseif joker_to_transform.config.center.rarity == 2 then
						G.E_MANAGER:add_event(Event({
							delay = 0.5,
							func = function()
								joker_to_transform:set_ability(G.P_CENTERS["j_pmcmod_puppetB"])
								return true
							end
						}))
					elseif joker_to_transform.config.center.rarity == 3 then
						G.E_MANAGER:add_event(Event({
							delay = 0.5,
							func = function()
								joker_to_transform:set_ability(G.P_CENTERS["j_pmcmod_puppetC"])
								return true
							end
						}))
					end
				end
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Puppets", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_onyx_agate" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Nikolai -- Gotta figure out a way to show that the hightlight card was claimed or not
SMODS.Joker {
	key = 'nikolai',
	name = "Nikolai",
	pronouns = "she_her",
	config = { extra = { mult = 0, mult_mod = 5, savedJokers = {} } },
	rarity = 3,
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = true,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 3, y = 3 },
	cost = 8,
	pools =
	{
        ["R Corp"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.mult, card.ability.extra.mult_mod }}
	end,
	calculate = function(self, card, context)
		
        if context.buying_card and context.card.ability.set == "Joker" and not context.blueprint then

            local cardAlreadySaved = false

            if #card.ability.extra.savedJokers >=1 then
                for i=1, #card.ability.extra.savedJokers do
                   if card.ability.extra.savedJokers[i] == context.card.config.center.key then
                        cardAlreadySaved = true
                    break
                   else
                        cardAlreadySaved = false
                   end
                end
            end

            if cardAlreadySaved == false then
                card.ability.extra.savedJokers[#card.ability.extra.savedJokers + 1] = context.card.config.center.key
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            end

        end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
		
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("R Corp", HEX('2e2b2b'), HEX('c4560c'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_abstract" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Maxim
SMODS.Joker {
	key = 'maxim',
	name = "Maxim",
	pronouns = "he_him",
	config = { extra = { chargeCount = 0, dollars = 10, repetitions = 1 } },
	rarity = 2,
	unlocked = false,
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 7, y = 14 },
	cost = 6,
	pools =
	{
        ["R Corp"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.chargeCount, card.ability.extra.dollars }}
	end,
	calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play and not context.blueprint then

			if context.other_card:is_face() then
				card.ability.extra.chargeCount = card.ability.extra.chargeCount + 5

				if card.ability.extra.chargeCount >= 100 then
					card.ability.extra.chargeCount = 100
				end

			end
        end

		if context.repetition and context.cardarea == G.play and not context.blueprint then
			if card.ability.extra.chargeCount >= (context.other_card.base.nominal * 2) and not context.other_card:is_face() then
					card.ability.extra.chargeCount = card.ability.extra.chargeCount - (context.other_card.base.nominal * 2)
					return {
						repetitions = card.ability.extra.repetitions
					}
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
        return card.ability.extra.chargeCount >= 90 and card.ability.extra.dollars
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("R Corp", HEX('2e2b2b'), HEX('c4560c'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_bull" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Rudolph
SMODS.Joker {
	key = 'rudolph',
	name = "Rudolph",
	pronouns = "he_him",
	config = { extra = {  } },
	rarity = 3,
	unlocked = false,
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 9, y = 5 },
	cost = 8,
	pools =
	{
        ["R Corp"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = {  }}
	end,
	calculate = function(self, card, context)
	
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("R Corp", HEX('2e2b2b'), HEX('c4560c'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_swashbuckler" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- True Kalo
SMODS.Joker {
    key = "kalo",
	name = "Kalo",
	pronouns = "he_him",
	unlocked = false,
	config = {extra = { mult = 10, extraMult = 5, suit = 'Diamonds', odds = 5, extraMultValue = 0, quantityOfThumbMembers = 0 }},
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = true,
    rarity = 3,
    cost = 10,
	atlas = 'ModdedProjectMoonTrue',
    pos = { x = 6, y = 1 },
    pools =
	{
 		["Thumb"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return {vars = { card.ability.extra.mult + card.ability.extra.extraMultValue, card.ability.extra.extraMult, card.ability.extra.suit, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)


		if context.setting_blind and not context.blueprint then
			for i = 1, #G.jokers.cards do
				for j = 1, #G.P_CENTER_POOLS.Thumb do
					if G.jokers.cards[i] ~= card and (G.P_CENTER_POOLS.Thumb[j].key == G.jokers.cards[i].config.center.key)
					then card.ability.extra.quantityOfThumbMembers = card.ability.extra.quantityOfThumbMembers + 1 end
				end
			end
			card.ability.extra.extraMultValue = card.ability.extra.quantityOfThumbMembers * card.ability.extra.extraMult
		end


		if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
			if pseudorandom('kalo') < G.GAME.probabilities.normal / card.ability.extra.odds then
				local _card = context.other_card
					G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.1,
					func = function()
						_card:juice_up()
						_card:set_ability(G.P_CENTERS['m_wild'])
						return true
					end
				}))
			end
            return {
                mult = card.ability.extra.mult + card.ability.extra.extraMultValue
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Thumb", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_greedy_joker" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- True Katriel
SMODS.Joker {
    key = "katriel",
	name = "Katriel",
	pronouns = "she_her",
	unlocked = false,
	config = {extra = { mult = 5, extraMult = 1, suit = 'Hearts' }},
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = true,
    rarity = 2,
    cost = 5,
	atlas = 'ModdedProjectMoonTrue',
    pos = { x = 7, y = 1 },
    pools =
	{
 		["Thumb"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		local wildCardsTally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
            end
        end
		info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return {vars = { card.ability.extra.mult, card.ability.extra.mult + card.ability.extra.extraMult * wildCardsTally, card.ability.extra.suit } }
    end,
    calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
			local wildCardsTally = 0
			for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
            end
            return {
                mult = card.ability.extra.mult + card.ability.extra.extraMult * wildCardsTally
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Thumb", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_lusty_joker" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- True Denis
SMODS.Joker {
    key = "denis",
	name = "Denis",
	pronouns = "he_him",
	unlocked = false,
	config = {extra = { mult = 5, extraMult = 1, suit = 'Spades' }},
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = true,
    rarity = 2,
    cost = 5,
	atlas = 'ModdedProjectMoonTrue',
    pos = { x = 8, y = 1 },
    pools =
	{
 		["Thumb"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		local wildCardsTally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
            end
        end
		info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return {vars = { card.ability.extra.mult, card.ability.extra.mult + card.ability.extra.extraMult * wildCardsTally, card.ability.extra.suit } }
    end,
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
			local wildCardsTally = 0
			for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
            end
            return {
                mult = card.ability.extra.mult + card.ability.extra.extraMult * wildCardsTally
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Thumb", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_wrathful_joker" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- True Boris
SMODS.Joker {
    key = "boris",
	name = "Boris",
	pronouns = "he_him",
	unlocked = false,
	config = {extra = { mult = 5, extraMult = 1, suit = 'Clubs' }},
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = true,
    rarity = 2,
    cost = 5,
	atlas = 'ModdedProjectMoonTrue',
    pos = { x = 9, y = 1 },
    pools =
	{
 		["Thumb"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		local wildCardsTally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
            end
        end
		info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        return {vars = { card.ability.extra.mult, card.ability.extra.mult + card.ability.extra.extraMult * wildCardsTally, card.ability.extra.suit } }
    end,
    calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
			local wildCardsTally = 0
			for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_wild') then wildCardsTally = wildCardsTally + 1 end
            end
            return {
                mult = card.ability.extra.mult + card.ability.extra.extraMult * wildCardsTally
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Thumb", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_gluttenous_joker" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- True Angela
SMODS.Joker {
	key = 'angelaLoR',
	name = "Angela",
	pronouns = "she_her",
	unlocked = false,
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
	config = { extra = { creates = 5, chips = 0, chips_mod = 15} },
	rarity = 3,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 1, y = 12 },
	cost = 8,
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.creates, card.ability.extra.chips, card.ability.extra.chips_mod}}
	end,
	update = function (self, card, dt)

	end,
	calculate = function(self, card, context)
		if context.setting_blind and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit and not context.blueprint then
            local jokers_to_create = math.min(card.ability.extra.creates,
                G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
            G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _ = 1, jokers_to_create do
                        SMODS.add_card {
                            set = 'Joker',
                            key_append = 'vremade_riff_raff',
							stickers = {"perishable"},
							force_stickers = true
                        }
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
        end
		if G.shop and not card.getting_sliced then
--			print("Testing angela entering shop perished")
			local destructable_jokers  = {}
			for i=1, #G.jokers.cards do
--				print("Testing angela entered for loop 1")
				if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced then
--					print("Testing angela condition 1 for loop 1")
					if G.jokers.cards[i].ability.perish_tally then
--						print("Testing angela condition 2 for loop 1")
						if G.jokers.cards[i].ability.perish_tally == 0 then
							destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i]
--							print("Testing angela counting perished")
						end
					end
				end
			end
			for i=1, #destructable_jokers do
--				print("Testing angela condition 2")
				if destructable_jokers[i] and not (context.blueprint_card or self).getting_sliced then
					card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
                    destructable_jokers[i].getting_sliced = true
--					print("Testing angela destroying perished")
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        destructable_jokers[i]:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
                end
			end
		end
		if context.joker_main then
			return
			{
				chips = card.ability.extra.chips
			}
		end
	end,
	in_pool = function(self, args) 

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('The Library', HEX('998350'), HEX('0cf07e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_riff_raff" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Angelica
SMODS.Joker {
	key = 'angelica',
	name = "Angelica",
	pronouns = "she_her",
	config = { extra = { mult = 100 } },
	unlocked = false,
    blueprint_compat = false,
    eternal_compat = false,
	perishable_compat = true,
	rarity = 3,
    cost = 12,
	atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 14 },
	pools =
	{
        ["Index"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.mult }}
	end,
	calculate = function(self, card, context)
		if context.joker_main and not context.blueprint then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Charles Office", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Yi Sang
SMODS.Joker {
	key = 'yisang',
	name = "Yi Sang",
	pronouns = "he_him",
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = true,
	config = { extra = { xmult = 1, xmult_mod = 0.3, xmult_bonus = 0.1 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 0 },
	cost = 8,
	loc_vars = function (self, info_queue, card)

		local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do 
			if v.set == 'Planet' then 
				planets_used = planets_used + 1 
			end 
		end

    	return {vars = { card.ability.extra.xmult + card.ability.extra.xmult_mod*planets_used, card.ability.extra.xmult_mod, card.ability.extra.xmult_bonus }}
	end,
	calculate = function(self, card, context)
		local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do 
			if v.set == 'Planet' then 
				planets_used = planets_used + 1 
			end 
		end

		if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' and not context.blueprint then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_bonus
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult_bonus } }
            }
        end

		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult + (planets_used * card.ability.extra.xmult_mod)
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_constellation" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- True Ishmael
SMODS.Joker {
	key = 'ishmael',
	name = "Ishmael",
	pronouns = "she_her",
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = true,
	perishable_compat = true,
	config = { extra = { mult = 0, mult_mod = 10, xmult = 1, xmult_mod = 5, baseChance = 1, maxChance = 3} },
	rarity = 3,
	atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 0 },
	cost = 8,
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_pallid
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'ishamelChance')
    	return {vars = { card.ability.extra.xmult, card.ability.extra.mult, card.ability.extra.mult_mod, new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		
		if context.before and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.vampired then
					if SMODS.has_enhancement(scored_card, "m_pmcmod_pallid") then
						if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'ishmaelChance') then
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
            end

            if #enhanced > 0 then
                -- See note about SMODS Scaling Manipulation on the wiki
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod * #enhanced
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                    colour = G.C.MULT
                }
            end
        end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			local pallidTally = 0
			local ahabDetected = false
			local joker_to_destroy
			for _, playing_card in ipairs(G.playing_cards or {}) do
				if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then
					pallidTally = pallidTally + 1
				end
			end

			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and G.jokers.cards[i].config.center.key == "j_pmcmod_ahab" then 
					ahabDetected = true
					joker_to_destroy = G.jokers.cards[i]
				end
            end

			if pallidTally <= 0  and ahabDetected then
				if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
					card.ability.extra.xmult = card.ability.extra.xmult + 2
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
					card_eval_status_text((context.blueprint_card or card), 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.xmult}}})
                end
			end
		end

		if context.joker_main then
			return
			{
				mult = card.ability.extra.mult,
				xmult = card.ability.extra.xmult
			}
		end
	end,
	in_pool = function(self, args)
		local pallidTally = 0
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then
                pallidTally = pallidTally + 1
            end
        end

		if pallidTally >= 10 then
			return true
		else
        	return false
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_midas_mask" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Ryoshu
SMODS.Joker {
	key = 'ryoshu',
	name = "Ryoshu",
	pronouns = "she_her",
	config = { extra = {xmult = 1, xmult_mod = 0.1} },
	no_collection = false,
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoonTrue',
	pos = { x = 0, y = 6 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,
	calculate = function(self, card, context)

		if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
			local keypageKey = context.card.config.center.key
			G.GAME.banned_keys[keypageKey] = true
        end

    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Hong Lu
SMODS.Joker {
	key = 'hongLu',
	name = "Hong Lu",
	pronouns = "he_him",
	config = { extra = {
		yiSangBonusApplied = false, 
		faustBonusApplied = false, 
		donQuixoteBonusApplied = false, 
		ryoshuBonusApplied = false,
		meursaultBonusApplied = false,
		heathcliffBonusApplied = false,
		ishmaelBonusApplied = false,
		rodionBonusApplied = false,
		sinclairBonusApplied = false,
		outisBonusApplied = false,
		gregorBonusApplied = false,
		baseChanceYiSang = 1,
		maxChanceYiSang = 2,
		baseChanceFaust = 1,
		maxChanceFaust = 4,
		donQuixotePermaMult = 1,
		ryoshuXMult = 1.1,
		meursaultPermaChips = 2,
		heathcliffMult = 20,
		ishmaelChips = 40,
		rodionDollars = 5,
		sinclairHand = 1,
		outisDiscard = 1,
		gregorHandSize = 1} },
	no_collection = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoonTrue',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local new_numeratorYiSang, new_denominatorYiSang = SMODS.get_probability_vars(card, card.ability.extra.baseChanceYiSang, card.ability.extra.maxChanceYiSang, 'HLYiSangChance')
		local new_numeratorFaust, new_denominatorFaust = SMODS.get_probability_vars(card, card.ability.extra.baseChanceFaust, card.ability.extra.maxChanceFaust, 'HLFaustChance')
    	return {vars = { card.ability.extra.baseChanceYiSang, card.ability.extra.maxChanceYiSang, card.ability.extra.baseChanceFaust, card.ability.extra.maxChanceFaust,new_numeratorYiSang, new_denominatorYiSang, new_numeratorFaust, new_denominatorFaust}}
	end,
	calculate = function(self, card, context)

		local yiSangPresent = false  --ok
		local faustPresent = false  --ok
		local donQuixotePresent = false  --ok
		local ryoshuPresent = false -- ok
		local meursaultPresent = false --ok
		local heathcliffPresent = false --ok
		local ishmaelPresent = false  --ok
		local sinclairPresent = false  --ok
		local outisPresent = false  --ok
		local gregorPresent = false  --ok

		for i=1, #G.jokers.cards do

				if G.jokers.cards[i].config.center.key == "j_pmcmod_yiSang" or G.jokers.cards[i].config.center.key == "j_constellation" then
					yiSangPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_oops" then
					faustPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_pmcmod_donQuixote" or G.jokers.cards[i].config.center.key == "j_seeing_double" then
					donQuixotePresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_pmcmod_ryoshu" or G.jokers.cards[i].config.center.key == "j_flower_pot" then
					ryoshuPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_baron" then
					meursaultPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_pmcmod_heathcliff" or G.jokers.cards[i].config.center.key == "j_hit_the_road" then
					heathcliffPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_pmcmod_ishmael" or G.jokers.cards[i].config.center.key == "j_midas_mask" then
					ishmaelPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_bootstraps" then
					rodionPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_idol" then
					sinclairPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_hanging_chad" then
					outisPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_ring_master" then
					gregorPresent = true
				end

		end


		if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] and yiSangPresent and
			SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChanceYiSang, card.ability.extra.maxChanceYiSang, 'HLYiSangChance') then
			return {
				repetitions = 1
			}
		end

		if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[#context.scoring_hand] and faustPresent and
			SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChanceFaust, card.ability.extra.maxChanceFaust, 'HLYiSangChance') then
			return {
				repetitions = 1
			}
		end

		if context.individual and context.cardarea == G.play and not context.blueprint then
			if donQuixotePresent then
				context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.donQuixotePermaMult
				local cardToJuiceUp = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						cardToJuiceUp:juice_up()
						return true
					end
				}))
			end

			if meursaultPresent then
				context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +  card.ability.extra.meursaultPermaChips
				local cardToJuiceUp = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						cardToJuiceUp:juice_up()
						return true
					end
				}))
			end

			local ret = {}

            if ryoshuPresent then
                ret.xmult = card.ability.extra.ryoshuXMult
            end


			return ret


		end

		if context.setting_blind and not context.blueprint then

			if sinclairPresent and not card.ability.extra.sinclairBonusApplied then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.sinclairHand
				card.ability.extra.sinclairBonusApplied = true
			end

			if card.ability.extra.sinclairBonusApplied and not sinclairPresent then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.sinclairHand
				card.ability.extra.sinclairBonusApplied = false
			end

			if outisPresent and not card.ability.extra.outisBonusApplied then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.outisDiscard
				card.ability.extra.sinclairBonusApplied = true
			end

			if card.ability.extra.outisBonusApplied and not outisPresent then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.outisDiscard
				card.ability.extra.sinclairBonusApplied = false
			end

			if gregorPresent and not card.ability.extra.gregorBonusApplied then
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + card.ability.extra.gregorHandSize
				card.ability.extra.gregorBonusApplied = true
			end

			if card.ability.extra.gregorBonusApplied and not gregorPresent then
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size - card.ability.extra.gregorHandSize
				card.ability.extra.gregorBonusApplied = false
			end


		end

		if context.joker_main then

			local ret = {}

			if heathcliffPresent then
				ret.mult = card.ability.extra.heathcliffMult
			end

			if heathcliffPresent then
				ret.chips = card.ability.extra.ishmaelChips
			end

			return ret

		end




    end,
	calc_dollar_bonus = function(self, card)

		for i=1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.key == "j_bootstraps" then
				return card.ability.extra.rodionDollars
			end
		end
            
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}






-- Heathcliff
SMODS.Joker {
	key = 'heathcliff',
	name = "Heathcliff",
	pronouns = "he_him",
	config = { extra = { cardsDestroyed = 0, joker_slots = 0 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 0 },
	cost = 8,
	unlocked = false,
    blueprint_compat = false,
    eternal_compat = true,
	perishable_compat = true,
	loc_vars = function (self, info_queue, card)

		local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do 
			if v.set == 'Planet' then 
				planets_used = planets_used + 1 
			end 
		end

    	return {vars = { card.ability.extra.cardsDestroyed, card.ability.extra.joker_slots }}
	end,
	calculate = function(self, card, context)

		if context.setting_blind and not context.blueprint then

			local negative_jokers = {}
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
                	if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_negative" and G.jokers.cards[i] ~= card then
					 	negative_jokers[#negative_jokers+1] = G.jokers.cards[i]
					end
				end
			end

			local selected_joker = #negative_jokers > 0 and pseudorandom_element(negative_jokers, pseudoseed('heathcliff')) or nil

			if selected_joker and not (context.blueprint_card or self).getting_sliced then
				selected_joker.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					selected_joker:juice_up(0.8, 0.8)
					selected_joker:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))

				card.ability.extra.cardsDestroyed = card.ability.extra.cardsDestroyed + 1

				if card.ability.extra.cardsDestroyed >= 2 then
					G.jokers:change_size(1)
					card.ability.extra.cardsDestroyed = 0
					card.ability.extra.joker_slots = card.ability.extra.joker_slots + 1
				end
			end
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		G.jokers:change_size(-card.ability.extra.joker_slots)
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_hit_the_road" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Don Quixote
SMODS.Joker {
	key = 'donQuixote',
	name = "Don Quixote",
	pronouns = "she_her",
	unlocked = false,
	config = { extra = { chips = 0 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 6, y = 0 },
    pools =
	{
		["Bloodfiends"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return {vars = { card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card.ability.perma_mult > 0 and not context.blueprint then
			card.ability.extra.chips = card.ability.extra.chips + context.other_card.ability.perma_mult * 3
			context.other_card.ability.perma_mult = 0
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
				message_card = card
            }
        end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Limbus Company', HEX('63160e'), HEX('eba313'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_seeing_double" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

------------
-- JOKERS --
------------

-- Angela
SMODS.Joker {
    key = "angela",
	name = "Angela",
	pronouns = "she_her",
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
	pronouns = "she_her",
	config = {extra = 0.5, xmult = 1, roundCount = 0},
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
        return { main_end = main_end, vars = { card.ability.extra, card.ability.xmult, card.ability.roundCount } }
    end,
    calculate = function(self, card, context)


		if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss and not context.blueprint then
			if context.press_play then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        for i = 1, #G.play.cards do
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.play.cards[i]:juice_up()
                                    return true
                                end,
                            }))
                            ease_dollars(-4)
                            delay(0.23)
                        end
                        return true
                    end
                }))
			end
		end

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
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and (card.ability.xmult >= 3 or G.GAME.dollars <= 0) then
--			SMODS.add_card({ key = "j_pmcmod_robotHod", stickers = { "eternal" } })
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotHod"])
					card:set_eternal(true)
                    return true
                end
            }))
			
			
			--[[card.getting_sliced = true
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
						}))]]--
		end
		if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint and card.ability.xmult < 3 then
			card.ability.roundCount = card.ability.roundCount + 1
			if card.ability.roundCount >= 4 then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))
			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahHod"])
                    return true
                end
            }))
			end
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
	pronouns = "she_her",
	config = {extra = {mult = 0, roundCount = 0}},
	unlocked = true,
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
        return {vars = { card.ability.extra.mult, card.ability.extra.roundCount } }
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

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
		
			if	((to_big(G.GAME.hands["High Card"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Pair"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Three of a Kind"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Two Pair"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Full House"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Straight"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Flush"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Straight Flush"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Four of a Kind"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Five of a Kind"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Flush House"].level) > to_big(3)) or
			(to_big(G.GAME.hands["Flush Five"].level) > to_big(3))) then

			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotMalkuth"])
					card:set_eternal(true)
                    return true
                end
            }))
			
			else
				card.ability.extra.roundCount = card.ability.extra.roundCount + 1
			end

			if card.ability.extra.roundCount >= 4 then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahMalkuth"])
					card:set_eternal(true)
                    return true
                end
            }))
			end

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
	pronouns = "he_him",
	config = {extra = {consumable_amount = 2, mult = 0, chips = 0, current_consumable_count = 0, roundCount = 0}},
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
        return {vars = { card.ability.extra.consumable_amount, card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.current_consumable_count, card.ability.extra.roundCount } }
    end,

    calculate = function(self, card, context)

		--Increments counter when a consumable is used
		if context.using_consumeable and not context.blueprint then
			card.ability.extra.current_consumable_count = card.ability.extra.current_consumable_count + 1
		end

		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

			if card.ability.extra.consumable_amount > card.ability.extra.current_consumable_count then
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotNetzach"])
					card:set_eternal(true)
                    return true
                end
            }))
			end

			-- If the amount is reached, reset value, increase requirement and increase mult and chips
			if card.ability.extra.consumable_amount <= card.ability.extra.current_consumable_count then
				card.ability.extra.roundCount = card.ability.extra.roundCount + 1
				card.ability.extra.current_consumable_count = 0
				card.ability.extra.consumable_amount = card.ability.extra.consumable_amount + 2

				card.ability.extra.mult = card.ability.extra.mult + 7
				card.ability.extra.chips = card.ability.extra.chips + 10
			end
			
			if card.ability.extra.roundCount >= 4 then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahNetzach"])
					card:set_eternal(true)
                    return true
                end
            }))
			end

			
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				chips = card.ability.extra.chips,
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
	pronouns = "he_him",
	config = {extra = {totalSpades = 0, totalClubs = 0, totalHearts = 0, totalDiamonds = 0, mult = 0, chips = 0, roundCount = 0}},
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
        return {vars = { card.ability.extra.totalSpades, card.ability.extra.totalClubs, card.ability.extra.totalHearts, card.ability.extra.totalDiamonds, card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.roundCount  } }
    end,

    calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") and not context.blueprint then
			card.ability.extra.totalSpades = card.ability.extra.totalSpades + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") and not context.blueprint then
			card.ability.extra.totalClubs = card.ability.extra.totalClubs + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and not context.blueprint then
			card.ability.extra.totalHearts = card.ability.extra.totalHearts + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") and not context.blueprint then
			card.ability.extra.totalDiamonds = card.ability.extra.totalDiamonds + 1
		end

		if context.after and context.main_eval and math.abs((card.ability.extra.totalSpades + card.ability.extra.totalClubs) - (card.ability.extra.totalHearts + card.ability.extra.totalDiamonds)) >= 6 and not context.blueprint then
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotYesod"])
					card:set_eternal(true)
                    return true
                end
            }))

		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.roundCount = card.ability.extra.roundCount + 1
			if card.ability.extra.roundCount >= 4 then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahYesod"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
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
	pronouns = "he_him",
	config = {extra = {xmult = 2, xmult_mod = 0.1, roundCount = 0}},
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
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod, card.ability.extra.roundCount } } 
    end,

    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not context.blueprint then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
			return {
					message_card=card,
					message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult_mod } },
					colour = G.C.RED
			}
        end
		if context.discard and not context.blueprint and not context.other_card.debuff then
            card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.xmult_mod
            return {
				message_card=card,
                message = localize { type = 'variable', key = 'a_xmult_minus', vars = { card.ability.extra.xmult_mod } },
                colour = G.C.MULT
            }
        end
		if context.after and context.main_eval and card.ability.extra.xmult <= 1 and not context.blueprint then
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotChesed"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.roundCount = card.ability.extra.roundCount + 1
			if card.ability.extra.roundCount >= 4 then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahChesed"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
	end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
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
	pronouns = "she_her",
	config = {extra = {mult = 0, roundCount = 0}},
	unlocked = false,
    blueprint_compat = false,
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
        return {vars = { card.ability.extra.mult, card.ability.extra.roundCount } }
    end,
    calculate = function(self, card, context)

		card.ability.extra.mult = (G.GAME.current_round.hands_played)*25

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and (G.GAME.round_resets.hands - G.GAME.current_round.hands_played) < 1 then
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotGebura"])
					card:set_eternal(true)
                    return true
                end
            }))
	
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.roundCount = card.ability.extra.roundCount + 1
			if card.ability.extra.roundCount >= 4 then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_sephirahGebura"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
	end
		if context.joker_main and not context.blueprint then
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

-- Benjamin
SMODS.Joker {
    key = "benjamin",
	name = "Benjamin",
	pronouns = "he_him",
	config = {extra = {current_timer = 0, total_timer = 0, xmult = 1, xmult_mod = 0.2, consumablesUsed = 0, lastConsumable = "", roundCount = 0}},
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
    pos = { x = 9, y = 11 },
    loc_vars = function (self, info_queue, card)
    local random_mult = tostring(math.floor(card.ability.extra.total_timer)) or 1
		main_end = {
			{n=G.UIT.T, config={text = 'Elapsed time: ',colour = G.C.MULT, scale = 0.32}},
			{n=G.UIT.O, config={object = DynaText({string = random_mult, colours = {G.C.RED}, pop_in_rate = 9999999, silent = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
			{n=G.UIT.T, config={text = ' seconds',colour = G.C.MULT, scale = 0.32}} or nil,
		}
    	return {main_end = main_end, vars = { card.ability.extra.current_timer, card.ability.extra.total_timer, card.ability.extra.xmult + (card.ability.extra.xmult_mod * card.ability.extra.consumablesUsed), card.ability.extra.xmult_mod, card.ability.extra.roundCount }}
	end,
	update = function (self, card, dt)
			if G.GAME.blind and G.GAME.blind.in_blind then
				card.ability.extra.current_timer = card.ability.extra.current_timer + G.real_dt
			end
	end,
    calculate = function(self, card, context)

		if context.using_consumeable and (context.consumeable.ability.set == "Tarot" or context.consumeable.ability.set == "Spectral") and not context.blueprint then

			card.ability.extra.consumablesUsed = 0
			for k, v in pairs(G.GAME.consumeable_usage) do
				if v.set == 'Tarot' then 
					card.ability.extra.consumablesUsed = card.ability.extra.consumablesUsed + 1 
				end
				if v.set == 'Spectral' then
					card.ability.extra.consumablesUsed = card.ability.extra.consumablesUsed + 1
				end
			end
		end

		if context.after and context.main_eval and not context.blueprint then
			card.ability.extra.total_timer = card.ability.extra.total_timer + card.ability.extra.current_timer
			card.ability.extra.current_timer = 0
		end

		if context.after and context.main_eval and card.ability.extra.total_timer >= 666 and not context.blueprint then
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotHokma"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.roundCount = card.ability.extra.roundCount + 1
				if card.ability.extra.roundCount >= 4 then
					local percent = 1.15
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.15,
					func = function()
						card:flip()
						play_sound('card1', percent)
						card:juice_up(0.3, 0.3)
						return true
					end,
				}))

				G.E_MANAGER:add_event(Event({
					delay = 0.5,
					func = function()
						card:set_ability(G.P_CENTERS["j_pmcmod_sephirahHokma"])
						card:set_eternal(true)
						return true
					end
				}))
			end
		end
		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
				xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod * card.ability.extra.consumablesUsed)
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 6
    end
}

-- Garion
SMODS.Joker {
    key = "garion",
	name = "Garion",
	pronouns = "she_her",
	config = {extra = {xmult = 1, xmult_mod = 0.2, roundCount = 0}},
	unlocked = false,
    blueprint_compat = false,
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
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod, card.ability.extra.roundCount } }
    end,

    calculate = function(self, card, context)

		if context.destroying_card and context.cardarea == G.play and #context.full_hand >= 1 and not context.blueprint and G.GAME.current_round.hands_played == 0 then  
				card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod)
                return {
                    remove = true
                }
		end
		if context.joker_main and not context.blueprint then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
				Xmult_mod = card.ability.extra.xmult
			}
		end
		if context.after and context.main_eval and (#G.playing_cards) <= (G.GAME.starting_deck_size/2) and not context.blueprint then
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotBinah"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.roundCount = card.ability.extra.roundCount + 1
				if card.ability.extra.roundCount >= 4 then
					local percent = 1.15
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.15,
					func = function()
						card:flip()
						play_sound('card1', percent)
						card:juice_up(0.3, 0.3)
						return true
					end,
				}))

				G.E_MANAGER:add_event(Event({
					delay = 0.5,
					func = function()
						card:set_ability(G.P_CENTERS["j_pmcmod_sephirahBinah"])
						return true
					end
				}))
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('The Head', HEX('242424'), HEX('e0c02f'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_anaglyph') > 6
    end
}

-- Lisa
SMODS.Joker {
    key = "lisa",
	name = "Lisa",
	pronouns = "she_her",
	config = {extra = {enochDeathCounter = 0, aceMult = 5, aceMult_mod = 10, roundCount = 0}},
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
        return {vars = { card.ability.extra.enochDeathCounter, card.ability.extra.aceMult, card.ability.extra.aceMult_mod, card.ability.extra.roundCount } }
    end,

    calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint  then
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
				SMODS.add_card({ key = "j_pmcmod_enoch", stickers = {"eternal"}, force_stickers = true })
			end
			if G.jokers and robotEnochPresent == false and card.ability.extra.enochDeathCounter >= 1 then
				SMODS.add_card({ key = "j_pmcmod_robotEnoch", stickers = {"eternal"}, force_stickers = true })
			end
			
		end
		--if context.joker_type_destroyed then
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_enoch" and not context.blueprint  then
--			print("Testing destruction")
			card.ability.extra.enochDeathCounter = card.ability.extra.enochDeathCounter + 1
			card.ability.extra.aceMult = card.ability.extra.aceMult + card.ability.extra.aceMult_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				message_card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_robotEnoch" and not context.blueprint  then
--			print("Testing destruction")
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

		if context.after and context.main_eval and card.ability.extra.enochDeathCounter >= 3 and not context.blueprint  then
			local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_robotTiph"])
					card:set_eternal(true)
                    return true
                end
            }))
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.roundCount = card.ability.extra.roundCount + 1
				if card.ability.extra.roundCount >= 4 then
					local percent = 1.15
				G.E_MANAGER:add_event(Event({
					trigger = 'after',
					delay = 0.15,
					func = function()
						card:flip()
						play_sound('card1', percent)
						card:juice_up(0.3, 0.3)
						return true
					end,
				}))

				G.E_MANAGER:add_event(Event({
					delay = 0.5,
					func = function()
						card:set_ability(G.P_CENTERS["j_pmcmod_sephirahTiphereth"])
						card:set_eternal(true)
						return true
					end
				}))
			end
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
	pronouns = "he_him",
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
		if context.end_of_round and card.ability.extra.chips >= 100 and not context.blueprint then
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

--Hermann
SMODS.Joker {
    key = "hermann",
	name = "Hermann",
	pronouns = "she_her",
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("New League of Nine Littérateurs", HEX('242b45'), HEX('d5001e'), 1.2 )
 	end
}

--Gubo
SMODS.Joker {
    key = "gubo",
	name = "Gubo",
	pronouns = "he_him",
	config = {extra = {mult = 0, commonMult = 4, uncommonMult = 8, odds = 2, selected_keypage = "", aimingAtJoker = false, joker_to_destroy = {}}},
    blueprint_compat = true,
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
		if context.setting_blind and not card.getting_sliced and (pseudorandom('gubo') < G.GAME.probabilities.normal / card.ability.extra.odds) and not context.blueprint then
--			print("enteredAimingPhase")
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
--				print("enteredShootingPhase")
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
			end

		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 5
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("New League of Nine Littérateurs", HEX('242b45'), HEX('d5001e'), 1.2 )
 	end
}

-- Jia Huan
SMODS.Joker {
	key = 'jiaHuan',
	name = "Jia Huan",
	pronouns = "he_him",
	config = { extra = {mult = 0} },
	no_collection = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 1 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)

		
		if context.modify_hand and not context.blueprint and G.GAME.current_round.hands_played == 0 then

			card.ability.extra.mult = card.ability.extra.mult + mult

        end

		if context.before and context.main_eval and G.GAME.hands[context.scoring_name].level > 1 and not context.blueprint and G.GAME.current_round.hands_played == 0 then
			return {
				level_up = -(G.GAME.hands[context.scoring_name].level - 1),
			}
    	end

		if context.joker_main then
			return{
				mult = card.ability.extra.mult
			}
		end

    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

--Aseah
SMODS.Joker {
    key = "aseah",
	name = "Aseah",
	pronouns = "he_him",
	config = {extra = {baseChance = 1, maxChance = 2}},
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
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'everyCatherineChance')
        return {vars = { new_numerator, new_denominator } }
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
			if context.setting_blind and my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].ability.eternal and G.jokers.cards[my_pos + 1].config.center.rarity <= 2 and not context.blueprint then
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
					if SMODS.pseudorandom_probability(card, 'aseah', card.ability.extra.baseChance, card.ability.extra.maxChance, 'aseahChance') then
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
					else
						G.E_MANAGER:add_event(Event({
						func = function()
								SMODS.add_card {
									set = 'Joker',
									rarity = 'Common',
									key_append = 'pmcmod_aseah' -- Optional, useful for manipulating the random seed and checking the source of the creation in in_pool.
								}
								--G.GAME.joker_buffer = 0
							return true
						end
						}))
					end
				end
				if rarity == 2 then
					if SMODS.pseudorandom_probability(card, 'aseah', card.ability.extra.baseChance, card.ability.extra.maxChance, 'aseahChance') then
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
					else
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
				end
			end
		end
    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 5
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("New League of Nine Littérateurs", HEX('242b45'), HEX('d5001e'), 1.2 )
 	end
}

--Panther
SMODS.Joker {
	key = 'panther',
	name = "Panther",
	pronouns = "he_him",
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
	pronouns = "she_her",
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
	pronouns = "she_her",
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
	pronouns = "he_him",
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
	pronouns = "she_her",
	config = { extra = { chips = 70, odds = 20, voucher = 'v_tarot_merchant' } },
    eternal_compat = false,
	blueprint_compat = true,
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
		info_queue[#info_queue + 1] = G.P_CENTERS.v_tarot_merchant
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
	pronouns = "she_her",
	config = { extra = { odds = 13, rounds = 4, current_rounds = 0, consumables = { 'c_soul' }  } },
    eternal_compat = false,
	blueprint_compat = false,
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
		info_queue[#info_queue + 1] = G.P_CENTERS.c_soul
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
	pronouns = "he_him",
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
 		badges[#badges+1] = create_badge("Sovereigns of a Star", HEX('d61f11'), HEX('470d09'), 1.2 )
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
	pronouns = "he_him",
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
 		badges[#badges+1] = create_badge("Sovereigns of a Star", HEX('d61f11'), HEX('470d09'), 1.2 )
 	end
}

-- Sanson
SMODS.Joker {
	key = 'sanson',
	name = 'Sanson',
	pronouns = "he_him",
	config = { extra = { multiplied_value = 3 } },
	rarity = 2,
	atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 1 },
	cost = 6,
	eternal_compat = false,
	blueprint_compat = false,
	perishable_compat = true,
    pools =
	{
        ["Bloodfiends"] = true,
        ["DemiansGroup"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.multiplied_value } }
	end,
	calculate = function(self, card, context)
        if context.hand_drawn and not context.blueprint then
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
		if context.modify_hand and not context.blueprint then
                mult = math.max(math.floor(mult * card.ability.extra.multiplied_value), 1)
                hand_chips = math.max(math.floor(hand_chips * card.ability.extra.multiplied_value), 0)
                update_hand_text({ sound = 'chips2', modded = true }, { chips = hand_chips, mult = mult })
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Sovereigns of a Star", HEX('d61f11'), HEX('470d09'), 1.2 )
 	end
}

-- Effie
SMODS.Joker {
    key = "effie",
	name = "Effie",
	pronouns = "he_him",
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
 		badges[#badges+1] = create_badge("Limbus Company", G.C.BLACK, G.C.RED, 1.2 )
 	end
}

-- Saude
SMODS.Joker {
    key = "saude",
	name = "Saude",
	pronouns = "she_her",
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
 		badges[#badges+1] = create_badge("Limbus Company", G.C.BLACK, G.C.RED, 1.2 )
 	end
}

-- Aida
SMODS.Joker {
	key = 'aida',
	name = "Aida",
	pronouns = "she_her",
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
	pronouns = "he_him",
	unlocked = false,
	config = { extra = { odds = 100, chips = 77} },
	eternal_compat = true,
	blueprint_compat = false,
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
		info_queue[#info_queue + 1] = G.P_CENTERS.c_soul
		return { vars = { card.ability.extra.chips, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands["Flush"]) and not context.blueprint then
			if pseudorandom('sonya') < G.GAME.probabilities.normal / card.ability.extra.odds then
				SMODS.add_card({set = 'Spectral', key = 'c_soul' })
			end
			return {
				chips = card.ability.extra.chips,
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
 		badges[#badges+1] = create_badge("New League of Nine Littérateurs", HEX('242b45'), HEX('d5001e'), 1.2 )
 	end
}

-- Kromer
SMODS.Joker {
	key = 'kromer',
	name = "Kromer",
	pronouns = "she_her",
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
		
		if context.setting_blind and not G.GAME.last_blind and not G.GAME.last_blind.boss and not card.getting_sliced and not context.blueprint then
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
	pronouns = "he_him",
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


		if context.final_scoring_step and hand_chips * mult >= G.GAME.blind.chips and not context.blueprint then
			card.ability.xmult = card.ability.xmult + card.ability.extra
			return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } }
            }
		end
		

		if context.joker_main then
			return {
				xmult = card.ability.xmult
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
	pronouns = "he_him",
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
		if context.first_hand_drawn and not context.blueprint then
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
	pronouns = "he_him",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = false,
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
		if context.setting_blind and not context.blueprint then
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

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenA" and not context.blueprint then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenB" and not context.blueprint then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
			return {
				message = 'Upgraded!',
				colour = G.C.CHIPS,
				card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenC" and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_chickenD" and not context.blueprint then
			card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_mod
			return {
				message = 'Upgraded!',
				colour = G.C.MONEY,
				card = card
			}
		end

		if context.joker_main and not context.blueprint then
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Citizen', HEX('828282'), HEX('ebebeb'), 1.2 )
 	end
}

-- Dongrang
SMODS.Joker {
	key = 'dongrang',
	name = "Dongrang",
	pronouns = "he_him",
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
				card.children.center:set_sprite_pos({x = 0 , y = 10})
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
				xmult = card.ability.extra.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("K Corp", G.C.GREEN, G.C.BLACK, 1.2 )
 	end
}

-- Dongbaek
SMODS.Joker {
	key = 'dongbaek',
	name = 'Dongbaek',
	pronouns = "she_her",
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Technology Liberation Alliance", HEX('c28f29'), HEX('992118'), 1.2 )
 	end
}

-- Samjo
SMODS.Joker {
	key = 'samjo',
	name = "Samjo",
	pronouns = "he_him",
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("K Corp", G.C.GREEN, G.C.BLACK, 1.2 )
 	end
}

-- Shrenne
SMODS.Joker {
	key = 'shrenne',
	name = "Shrenne",
	pronouns = "she_her",
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
				mult = card.ability.extra.mult,
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("K Corp", G.C.GREEN, G.C.BLACK, 1.2 )
 	end
}

-- Alfonso
SMODS.Joker {
	key = 'alfonso',
	name = "Alfonso",
	pronouns = "she_her",
	config = { extra = { dollars = 10, odds = 2 } },
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = false,
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
		if context.before and context.main_eval and G.GAME.hands[context.scoring_name].level > 1 and not context.blueprint then
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("K Corp", G.C.GREEN, G.C.BLACK, 1.2 )
 	end

}

-- Marile
SMODS.Joker {
	key = 'marile',
	name = "Marile",
	pronouns = "he_him",
	config = { extra = { mult = 40, mult_base = 40 } },
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
		card.ability.extra.mult = card.ability.extra.mult_base - (enhanced_joker_tally * 8) - (enhanced_card_tally * 2)
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Technology Liberation Alliance", HEX('c28f29'), HEX('992118'), 1.2 )
 	end
}

-- Ran
SMODS.Joker {
	key = 'ran',
	name = "Ran",
	pronouns = "she_her",
	config = { extra = { chips = 120, chips_base = 120 } },
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
		card.ability.extra.chips = card.ability.extra.chips_base - (enhanced_joker_tally * 24) - (enhanced_card_tally * 5)
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Technology Liberation Alliance", HEX('c28f29'), HEX('992118'), 1.2 )
 	end
}

-- Niko
SMODS.Joker {
	key = 'niko',
	name = "Niko",
	pronouns = "he_him",
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Rosespanner Workshop", HEX('380e21'), HEX('ed2680'), 1.2 )
 	end
}

-- Ahab
SMODS.Joker {
	key = 'ahab',
	name = "Ahab",
	pronouns = "she_her",
	config = { extra = { xmult = 1, xmult_mod = 0.05} },
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 3 },
    pools =
	{
		["Heretics"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		local pallid_card_tally = 0
		if G.playing_cards then
			for _, playing_card in ipairs(G.playing_cards) do
				if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
			end
		end

		if pallid_card_tally >= 5 then
			tempKey = self.key..'_alt'
			card.children.center:set_sprite_pos({x = 1 , y = 10})
		else 
			tempKey = self.key
			card.children.center:set_sprite_pos({x = 8 , y = 3})
		end
		
		info_queue[#info_queue + 1] = G.P_CENTERS.c_pmcmod_hunt

        local pallid_card_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.xmult_mod, 1 + (card.ability.extra.xmult_mod * pallid_card_tally), key = tempKey } }
    end,
    calculate = function(self, card, context)
		if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Spectral',
								key = "c_pmcmod_hunt",
                                key_append = 'hunt'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_spectral'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true
        end

        if context.joker_main then
            local pallid_card_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
				end
			end
            return {
                Xmult = 1 + (card.ability.extra.xmult_mod * pallid_card_tally),
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("New League of Nine Littérateurs", HEX('242b45'), HEX('d5001e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_midas_mask" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Queequeg
SMODS.Joker {
	key = 'queequeg',
	name = "Queequeg",
	pronouns = "she_her",
	config = { extra = { dollars = 1} },
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_pallid
		local pallid_card_tally = 0
		if G.playing_cards then
			for _, playing_card in ipairs(G.playing_cards) do
				if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
			end
		end

		if pallid_card_tally >= 5 then
			tempKey = self.key..'_alt'
			card.children.center:set_sprite_pos({x = 2 , y = 10})
		else 
			tempKey = self.key
			card.children.center:set_sprite_pos({x = 9 , y = 3})
		end
		return { vars = { card.ability.extra.mult, key = tempKey  } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_pmcmod_pallid') then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then
                return true
            end
        end
        return false
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Pequod", HEX('c9c9c9'), HEX('c20a0a'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_ahab" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Starbuck
SMODS.Joker {
	key = 'starbuck',
	name = "Starbuck",
	pronouns = "he_him",
	config = { extra = { mult = 7} },
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_pallid
		local pallid_card_tally = 0
		if G.playing_cards then
			for _, playing_card in ipairs(G.playing_cards) do
				if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
			end
		end

		if pallid_card_tally >= 5 then
			tempKey = self.key..'_alt'
			card.children.center:set_sprite_pos({x = 3 , y = 10})
		else 
			tempKey = self.key
			card.children.center:set_sprite_pos({x = 0 , y = 4})
		end
		return { vars = { card.ability.extra.mult, key = tempKey  } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_pmcmod_pallid') then
			return {
                mult = card.ability.extra.mult
            }
        end
    end,
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then
                return true
            end
        end
        return false
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Pequod", HEX('c9c9c9'), HEX('c20a0a'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_ahab" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Stubb
SMODS.Joker {
	key = 'stubb',
	name = "Stubb",
	pronouns = "he_him",
	config = { extra = { repetitions = 2, odds = 2} },
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_pallid
		return { vars = { card.ability.extra.repetitions, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play and pseudorandom('stubb') < G.GAME.probabilities.normal / card.ability.extra.odds then
            if SMODS.has_enhancement(context.other_card, 'm_pmcmod_pallid') then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end,
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then
                return true
            end
        end
        return false
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Pequod", HEX('c9c9c9'), HEX('c20a0a'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_ahab" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Pip
SMODS.Joker {
	key = 'pip',
	name = "Pip",
	pronouns = "he_him",
	config = { extra = { chips = 13} },
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_pallid
		local pallid_card_tally = 0
		if G.playing_cards then
			for _, playing_card in ipairs(G.playing_cards) do
				if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then pallid_card_tally = pallid_card_tally + 1 end
			end
		end

		if pallid_card_tally >= 5 then
			tempKey = self.key..'_alt'
			card.children.center:set_sprite_pos({x = 4 , y = 10})
		else 
			tempKey = self.key
			card.children.center:set_sprite_pos({x = 2 , y = 4})
		end
		return { vars = { card.ability.extra.chips, key = tempKey  } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_pmcmod_pallid') then
			return {
                chips = card.ability.extra.chips
            }
        end
    end,
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then
                return true
            end
        end
        return false
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Pequod", HEX('c9c9c9'), HEX('c20a0a'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_ahab" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Pilot
SMODS.Joker {
	key = 'pilot',
	name = "Pilot",
	pronouns = "he_him",
	config = { extra = { mult = 0} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Planet',
                                key_append = 'pilot'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_planet'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Limbus Company", G.C.BLACK, G.C.RED, 1.2 )
 	end
}

-- Smee
SMODS.Joker {
	key = 'smee',
	name = "Smee",
	pronouns = "she_her",
	config = { extra = { type = 'Flush'} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { localize(card.ability.extra.type, 'poker_hands') } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = context.full_hand[3].base.nominal * 3
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Twinhook Pirates", HEX('c20a0a'), HEX('e3a81e'), 1.2 )
 	end
}

-- Ricardo
SMODS.Joker {
	key = 'ricardo',
	name = "Ricardo",
	pronouns = "he_him",
	unlocked = false,
	config = { extra = { mult = 10, multBase = 10, mult_mod = 10, canSpawnDummy = true, xmult = 1} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.multBase, card.ability.extra.mult_mod, card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			for i=1, #ProjectMoonMod.dummyJoker.cards do
				if ProjectMoonMod.dummyJoker.cards[1].config.center.key == "j_pmcmod_dummyRicardo" then
					card.ability.extra.canSpawnDummy = false
					card.ability.extra.mult = card.ability.extra.multBase + ProjectMoonMod.dummyJoker.cards[i].ability.extra.ricardoDefeatCounter * card.ability.extra.mult_mod
					break
				end
			end
			if ProjectMoonMod.dummyJoker and card.ability.extra.canSpawnDummy  == true then
				SMODS.add_card({ key = "j_pmcmod_dummyRicardo", area = ProjectMoonMod.dummyJoker })
			end
		end

		if G.GAME.used_vouchers.v_grabber then
			card.ability.extra.xmult = 2
		end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				xmult= card.ability.extra.xmult
			}
		end	
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Middle", HEX('5b0b75'), HEX('e3a81e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_smee" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}


-- Catherine
SMODS.Joker {
	key = 'catherine',
	name = "Catherine",
	pronouns = "she_her",
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
			if G.GAME.pool_flags.clearAllCathy then
				tempKey = self.key..'_alt'
				card.children.center:set_sprite_pos({x = 5 , y = 10})
			else 
				tempKey = self.key
				card.children.center:set_sprite_pos({x = 6 , y = 4})
			end
		return { vars = { key = tempKey  } }
	end,
	calculate = function(self, card, context)

		local heathcliffPresent = false

		for i=1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.key == "j_hit_the_road" or G.jokers.cards[i].config.center.key == "j_pmcmod_heathcliff" then
				heathcliffPresent = true
				break
			end
		end

		if context.selling_self and heathcliffPresent then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    SMODS.add_card({ key = "j_pmcmod_everyCatherine" })
					SMODS.add_card({ key = "j_pmcmod_erlking" })
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
        end

		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Wuthering Heights", HEX('3d2920'), HEX('998277'), 1.2 )
 	end
}

-- Every Catherine
SMODS.Joker {
	key = 'everyCatherine',
	name = "Every Catherine",
	pronouns = "she_her",
	config = { extra = { baseChance = 0, maxChance = 4} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 4 },
	soul_pos = {
        x = 7, y = 9,
--        draw = function(card, scale_mod, rotate_mod)
--            card.hover_tilt = card.hover_tilt * 1.5
--            card.children.floating_sprite:draw_shader('hologram', nil, card.ARGS.send_to_shader, nil,
--            card.children.center, 2 * scale_mod, 2 * rotate_mod)
--            card.hover_tilt = card.hover_tilt / 1.5
--        end
    },
	set_ability = function(self, card, initial, delay_sprites) card:set_edition("e_negative", true) end,
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'everyCatherineChance')
		return { vars = { new_numerator, new_denominator } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

			if (#editionless_jokers > 0) then
				local eligible_card = pseudorandom_element(editionless_jokers, 'everyCatherine')
				local edition = 'e_negative'
				eligible_card:set_edition(edition, true)
				check_for_unlock({ type = 'have_edition' })
			end
			if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'everyCatherineChance') then
				G.GAME.pool_flags.clearAllCathy = true
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
				G.GAME.pool_flags.everyCatherineExtinct = true
			else
				card.ability.extra.baseChance = card.ability.extra.baseChance + 1
			end
			
		end
		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("         ", HEX('3d2920'), HEX('998277'), 1.2 )
 	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Nelly
SMODS.Joker {
	key = 'nelly',
	name = "Nelly",
	pronouns = "she_her",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 5 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			G.E_MANAGER:add_event(Event({
                func = function()
                        SMODS.add_card {set = 'Joker', key_append = 'nelly', edition = 'e_negative', stickers = {"perishable"}, force_stickers = true}	
                    return true
                end
            }))
            return {
                message = localize('k_plus_joker'),
                colour = G.C.BLUE,
            }
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Wuthering Heights", HEX('3d2920'), HEX('998277'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_erlking" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Erlking
SMODS.Joker {
	key = 'erlking',
	name = "Erlking",
	pronouns = "he_him",
	config = { extra = { xmult = 1, catherineDestroyed = 0} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		local joker_count = 0
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].edition then
				if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_negative" then
					joker_count = joker_count + 1
				end
			end
		end

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_everyCatherine" then
			card.ability.extra.catherineDestroyed = 1
		end
		card.ability.extra.xmult = 1 + joker_count + card.ability.extra.catherineDestroyed

		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Wild Hunt", HEX('40342d'), HEX('7a369c'), 1.2 )
 	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Hindley
SMODS.Joker {
	key = 'hindley',
	name = "Hindley",
	pronouns = "he_him",
	unlocked = false,
	config = { extra = { chips = 20} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 5 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local joker_count = 0
		if G.GAME.blind then
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
                	if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_negative" then
					 	joker_count = joker_count + 1
					end
				end
			end
		end
		return { vars = { card.ability.extra.chips + (20*joker_count) } }
	end,
	calculate = function(self, card, context)
		local joker_count = 0
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
                	if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_negative" then
					 	joker_count = joker_count + 1
					end
				end
			end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips + (20*joker_count)
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Wuthering Heights", HEX('3d2920'), HEX('998277'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_nelly" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Linton
SMODS.Joker {
	key = 'linton',
	name = "Linton",
	pronouns = "he_him",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 5 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = { key = 'tag_negative', set = 'Tag' }
        return { vars = { localize { type = 'name_text', set = 'Tag', key = 'tag_negative' } } }
	end,
	calculate = function(self, card, context)
		if context.selling_self then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_negative'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Wuthering Heights", HEX('3d2920'), HEX('998277'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_nelly" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Josephine
SMODS.Joker {
	key = 'josephine',
	name = "Josephine",
	pronouns = "she_her",
	unlocked = false,
	config = { extra = { mult = 8} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 5 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local joker_count = 0
		if G.GAME.blind then
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
                	if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_negative" then
					 	joker_count = joker_count + 1
					end
				end
			end
		end
		return { vars = { card.ability.extra.mult + (8*joker_count) } }
	end,
	calculate = function(self, card, context)
		local joker_count = 0
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
                	if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_negative" then
					 	joker_count = joker_count + 1
					end
				end
			end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult + (8*joker_count)
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Wuthering Heights", HEX('3d2920'), HEX('998277'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_nelly" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Olga
SMODS.Joker {
	key = 'olga',
	name = "Olga",
	pronouns = "she_her",
	unlocked = false,
	config = { extra = { xmult = 1, xmult_mod = 0.1} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 7 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)	
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod } }
	end,
	calculate = function(self, card, context)
		if context.discard and not context.blueprint and not context.other_card.debuff and card.ability.extra.xmult < 3 then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
				card.ability.extra.xmult = 1
				return {message = localize('k_reset')}
				
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end	
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Molar Boatworks', HEX('595447'), HEX('c9c9c9'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_drunkard" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Rain
SMODS.Joker {
	key = 'rain',
	name = "Rain",
	pronouns = "he_him",
	unlocked = false,
	config = { extra = { chips = 0, chips_mod = 2} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 7 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_mod } }
	end,
	calculate = function(self, card, context)
		if context.discard and not context.blueprint and not context.other_card.debuff and card.ability.extra.chips < 60 then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
				card.ability.extra.chips = 0
				return {message = localize('k_reset')}
				
		end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
			}
		end	
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Molar Boatworks', HEX('595447'), HEX('c9c9c9'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_merry_andy" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Mika
SMODS.Joker {
	key = 'mika',
	name = "Mika",
	pronouns = "she_her",
	unlocked = false,
	config = { extra = { mult = 0, mult_mod = 1} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 7 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
	end,
	calculate = function(self, card, context)
		if context.discard and not context.blueprint and not context.other_card.debuff and card.ability.extra.mult < 30 then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.mult
            }
        end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
				card.ability.extra.mult = 0
				return {message = localize('k_reset')}
				
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
			}
		end	
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Molar Boatworks', HEX('595447'), HEX('c9c9c9'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_faceless" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Moses
SMODS.Joker {
	key = 'moses',
	name = 'Moses',
	pronouns = "she_her",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	config = { extra = { Xmult = 1.25 } },
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 6 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.Xmult } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 7 then
                return {
                    Xmult = card.ability.extra.Xmult,
                }
            end
        end
    end,
	check_for_unlock = function(self, args)
        return args.type == 'chip_score' and to_big(args.chips) >= to_big(100000) and to_big(args.chips)%to_big(7) == to_big(0)
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Seven Association', HEX('234a39'), HEX('b59c36'), 1.2 )
 	end
	
}

-- Ezra
SMODS.Joker {
    key = "ezra",
    name = "Ezra",
	pronouns = "she_her",
	unlocked = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'ModdedProjectMoon',
    pos = { x = 2, y = 6 },
    config = { extra = { repetitions = 1 } },
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 7 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end,
	check_for_unlock = function(self, args)
        return args.type == 'chip_score' and to_big(args.chips) >= to_big(100000) and to_big(args.chips)%to_big(7) == to_big(0)
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Seven Association', HEX('234a39'), HEX('b59c36'), 1.2 )
 	end
}

-- Santata
SMODS.Joker {
    key = "santata",
	pronouns = "it_its",
    unlocked = false,
    blueprint_compat = false,
	eternal_compat = true,
    perishable_compat = true,
    rarity = 3,
    cost = 10,
	atlas = 'ModdedProjectMoon',
    pos = { x = 4, y = 7 },
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
	check_for_unlock = function(self, args)
        return (args.type == 'continue_game') and (os.date("%m/%d") == "12/25")
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Santata's Workshop", HEX('6e0920'), HEX('12c424'), 1.2 )
 	end
}

-- Crayon
SMODS.Joker {
    key = "crayon",
	name = "Crayon",
	pronouns = "she_her",
	unlocked = true,
    blueprint_compat = false,
	eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    cost = 4,
	atlas = 'ModdedProjectMoon',
    pos = { x = 5, y = 7 },
	config = { extra = { baseChance = 1, maxChance = 4 } },
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'crayonChance')
		return { vars = { new_numerator, new_denominator } }
	end,
    calculate = function(self, card, context)
        if context.setting_blind then
			if SMODS.pseudorandom_probability(card, 'crayon', card.ability.extra.baseChance, card.ability.extra.maxChance, 'crayonChance') then
				if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					local chosenConsumable = math.random(1, 10)
					if chosenConsumable == 1 then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						G.E_MANAGER:add_event(Event({
							func = (function()
								SMODS.add_card {
									set = 'Spectral',
									key_append = 'crayon' -- Optional, useful for manipulating the random seed and checking the source of the creation in `in_pool`.
								}
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
						return {
							message = localize('k_plus_spectral'),
							colour = G.C.SECONDARY_SET.Spectral,
							remove = true
						}
                	end

					if chosenConsumable > 1 and chosenConsumable <= 5 then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						G.E_MANAGER:add_event(Event({
							func = (function()
								SMODS.add_card {
									set = 'Planet',
									key_append = 'crayon' -- Optional, useful for manipulating the random seed and checking the source of the creation in `in_pool`.
								}
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
						return {
							message = localize('k_plus_planet'),
							colour = G.C.SECONDARY_SET.Planet,
							remove = true
						}
					end

					if chosenConsumable > 5 then
						G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
						G.E_MANAGER:add_event(Event({
							func = (function()
								SMODS.add_card {
									set = 'Tarot',
									key_append = 'crayon' -- Optional, useful for manipulating the random seed and checking the source of the creation in `in_pool`.
								}
								G.GAME.consumeable_buffer = 0
								return true
							end)
						}))
						return {
							message = localize('k_plus_tarot'),
							colour = G.C.SECONDARY_SET.Tarot,
							remove = true
						}
					end
				end
        	end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Cloud Town", HEX('594237'), HEX('c4bfbc'), 1.2 )
 	end
}

-- Domino
SMODS.Joker {
    key = "domino",
	name = "Domino",
	pronouns = "he_him",
    unlocked = true,
    blueprint_compat = false,
	eternal_compat = true,
    perishable_compat = true,
    rarity = 1,
    cost = 4,
	atlas = 'ModdedProjectMoon',
    pos = { x = 6, y = 7 },
	config = { extra = { baseChance = 1, maxChance = 4 } },
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'dominoChance')
		info_queue[#info_queue + 1] = { key = 'tag_coupon', set = 'Tag' }
		return { vars = { localize { type = 'name_text', set = 'Tag', key = 'tag_coupon' } , new_numerator, new_denominator } }
	end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			if SMODS.pseudorandom_probability(card, 'domino', card.ability.extra.baseChance, card.ability.extra.maxChance, 'dominoChance') then
				G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_coupon'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Cloud Town", HEX('594237'), HEX('c4bfbc'), 1.2 )
 	end
}

-- Don Quixote (Dad)
SMODS.Joker {
	key = 'dadQuixote',
	name = "Don Quixote",
	pronouns = "he_him",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 6 },
	config = { extra = { mult = 0 } },
    pools =
	{
        ["Bloodfiends"] = true,
 	},
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
    	return {vars = { card.ability.extra.mult }}
	end,
	calculate = function(self, card, context)
		
		local accumulatedMult = 0

		if G.playing_cards then
			for _, playing_card in ipairs(G.playing_cards) do
				accumulatedMult = accumulatedMult + playing_card.ability.perma_mult
			end
		end

		card.ability.extra.mult = accumulatedMult

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('La Manchaland', HEX('400a18'), HEX('c7285f'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_seeing_double" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Sancho
SMODS.Joker {
	key = 'sancho',
	name = "Sancho",
	pronouns = "she_her",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 6 },
	config = { extra = { repetitions = 1, baseChance = 1, maxChance = 2 } },
    pools =
	{
		["Bloodfiends"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'sanchoChance')
    	return {vars = { card.ability.extra.repetitions, new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play then
            if context.other_card:is_suit("Hearts") then
				if SMODS.has_enhancement(context.other_card, 'm_pmcmod_bleed') then
					return {
                    	repetitions = card.ability.extra.repetitions
                	}
				else
					if SMODS.pseudorandom_probability(card, 'sancho', card.ability.extra.baseChance, card.ability.extra.maxChance, 'sancho') then
						return {
                    		repetitions = card.ability.extra.repetitions
                		}
					end
				end
                
            end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('La Manchaland', HEX('400a18'), HEX('c7285f'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_seeing_double" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

-- Dulcinea
SMODS.Joker {
	key = 'dulcinea',
	name = "Dulcinea",
	pronouns = "she_her",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 6 },
	config = { extra = { mult = 0, mult_mod = 2 } },
    pools =
	{
		["Bloodfiends"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if (SMODS.has_enhancement(context.other_card, 'm_pmcmod_bleed') or context.other_card:is_suit("Hearts")) then		

				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod

				return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_mod } },
                    colour = G.C.CHIPS
                }

			else
				if card.ability.extra.mult >= 0 then
					card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_mod
					
					return {
						message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.mult_mod } },
						colour = G.C.CHIPS
                	}
				end

				if  card.ability.extra.mult < 0 then
					card.ability.extra.mult = 0
				end
			end
        end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('La Manchaland', HEX('400a18'), HEX('c7285f'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_sancho" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Barber
SMODS.Joker {
	key = 'barber',
	name = "Barber",
	pronouns = "she_her",
	unlocked = false,	
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 6 },
	config = { extra = {chips = 0, chips_mod = 4 } },
    pools =
	{
		["Bloodfiends"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips, card.ability.extra.chips_mod } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if (SMODS.has_enhancement(context.other_card, 'm_pmcmod_bleed') or context.other_card:is_suit("Hearts")) then		

				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod

			else
				if card.ability.extra.chips >= 0 then
					card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_mod
				end

				if  card.ability.extra.chips < 0 then
					card.ability.extra.chips = 0
				end
			end
        end

		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('La Manchaland', HEX('400a18'), HEX('c7285f'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_dulcinea" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Priest
SMODS.Joker {
	key = 'priest',
	name = "Priest",
	pronouns = "he_him",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 6 },
	config = { extra = { xmult = 1.25 } },
    pools =
	{
		["Bloodfiends"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)

		if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:is_suit("Hearts") then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('La Manchaland', HEX('400a18'), HEX('c7285f'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_barber" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Bari
SMODS.Joker {
	key = 'bari',
	name = "Bari",
	pronouns = "she_her",
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 5 },
	config = { extra = { xmult = 1.2 } },
    pools =
	{
		
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_steel') then
                return {
                    xmult = card.ability.extra.xmult,
                }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Fixer", G.C.BLACK, G.C.WHITE, 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_angelaLoR" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Cesara
SMODS.Joker {
	key = 'cesara',
	name = "Cesara",
	pronouns = "she_her",
	unlocked = true,
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	config = { extra = { currentPosition = 0 } },
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 5 },
    pools =
	{
		
 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and next(context.poker_hands["Flush"]) and not context.blueprint then
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end

			card.ability.extra.currentPosition = my_pos

			if card.ability.extra.currentPosition == 1 then

				local currentCard = context.other_card
				
				G.E_MANAGER:add_event(Event({
				func = function()
					assert(SMODS.modify_rank(currentCard, 1))
					return true
				end
				}))

			end

		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('P Corp', HEX('dbd7c5'), HEX('eb8117'), 1.2 )
 	end,
}

-- Alessio
SMODS.Joker {
	key = 'alessio',
	name = "Alessio",
	pronouns = "he_him",
	unlocked = true,
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 5 },
	config = { extra = { } },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.poker_hands and next(context.poker_hands["Flush"]) and not context.blueprint then
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
			card.ability.extra.curentPosition = my_pos

			if card.ability.extra.curentPosition == 1 then

				local currentCard = context.other_card

				if context.other_card:is_suit("Hearts") then
				G.E_MANAGER:add_event(Event({
					func = function()
						assert(SMODS.change_base(currentCard, "Diamonds"))
						return true
					end
				}))
				elseif context.other_card:is_suit("Diamonds") then
					G.E_MANAGER:add_event(Event({
						func = function()
							assert(SMODS.change_base(currentCard, "Spades"))
							return true
						end
					}))
				elseif context.other_card:is_suit("Spades") then
					G.E_MANAGER:add_event(Event({
						func = function()
							assert(SMODS.change_base(currentCard, "Clubs"))
							return true
						end
					}))
				elseif context.other_card:is_suit("Clubs") then
					G.E_MANAGER:add_event(Event({
						func = function()
							assert(SMODS.change_base(currentCard, "Hearts"))
							return true
						end
					}))
				end
			end

		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('P Corp', HEX('dbd7c5'), HEX('eb8117'), 1.2 )
 	end,
}

-- Jia Xichun
SMODS.Joker {
	key = 'jiaXichun',
	name = "Jia Xichun",
	pronouns = "she_her",
	unlocked = true,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 5 },
	config = { extra = { } },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = {  } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

			local tag_pool = get_current_pool('Tag')
			local selected_tag = pseudorandom_element(tag_pool, 'modprefix_seed')
			local it = 1
			while selected_tag == 'UNAVAILABLE' do
				it = it + 1
				selected_tag = pseudorandom_element(tag_pool, 'modprefix_seed_resample'..it)
			end
			
				G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag(selected_tag, false, 'Small'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Hongyuan', HEX('ad886f'), HEX('e3deda'), 1.2 )
 	end,
}

-- Hugo
SMODS.Joker {
	key = 'hugo',
	name = "Hugo",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { dollars = 3 } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 1,
	cost = 3,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 5 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.dollars } }
	end,
	calculate = function(self, card, context)
		if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
			return
			{
				dollars = card.ability.extra.dollars
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Fixer", G.C.BLACK, G.C.WHITE, 1.2 )
 	end,
}

-- Camille
SMODS.Joker {
	key = 'camille',
	name = "Camille",
	pronouns = "he_him",
	unlocked = false,
	config = { extra = { mult = 0} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
		
		if context.setting_blind and not context.blueprint then

			local moneyToSubtract = math.floor(G.GAME.dollars / 20)

			ease_dollars(-moneyToSubtract)

			card.ability.extra.mult = card.ability.extra.mult + moneyToSubtract
			return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
		end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Cinq Association', HEX('1a2040'), HEX('bdc1db'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'money' and to_big(G.GAME.dollars) >= to_big(600)
    end
}

-- Paula
SMODS.Joker {
	key = 'paula',
	name = "Paula",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { currentScale = 0} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 6 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		
    end,
	add_to_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.scaling and G.GAME.modifiers.scaling >= 2 then
			card.ability.extra.currentScale = G.GAME.modifiers.scaling
			G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) - 1
		end
    end,
    remove_from_deck = function(self, card, from_debuff)
		if G.GAME.modifiers.scaling and G.GAME.modifiers.scaling >= 1 then
            G.GAME.modifiers.scaling = card.ability.extra.currentScale
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Zwei Association', HEX('23306e'), HEX('ab851d'), 1.2 )
 	end,
}

-- Romero
SMODS.Joker {
	key = 'romero',
	name = "Romero",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { mult = 10, mult_mod = 10 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 5 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
	end,
	calculate = function(self, card, context)
		
		
		if context.setting_blind and not G.GAME.last_blind.boss and not card.getting_sliced then
                local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
					for j = 1, #G.P_CENTER_POOLS.Bloodfiends do
						if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and 
						(G.P_CENTER_POOLS.Bloodfiends[j].key == G.jokers.cards[i].config.center.key)and (G.jokers.cards[i].config.center.rarity <= 2)
						then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
					end
                end
                local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('romero')) or nil

                if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
					card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
					card_eval_status_text((context.blueprint_card or card), 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult_mod}}})
                end
		end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Fanghunt Office', HEX('383532'), HEX('c4c0bc'), 1.2 )
 	end,
}

-- Han-ul
SMODS.Joker {
	key = 'hanul',
	name = "Han-ul",
	pronouns = "she_her",
	unlocked = false,
	config = { extra = { type = 'Flush' } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 8 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { localize(card.ability.extra.type, 'poker_hands') } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
			local accumulatedValue = 0
			local averageValue
			for i = 1, #G.play.cards do
				accumulatedValue = accumulatedValue + G.play.cards[i].base.nominal
			end

			averageValue = math.floor(accumulatedValue / #G.play.cards)

			return
			{
				dollars = averageValue;
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Hana Association', HEX('e3e3e3'), HEX('8a6d15'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_no_hand' and G.GAME.hands['Flush'].played == 0
    end
}

-- Caiman
SMODS.Joker {
	key = 'caiman',
	name = "Caiman",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = {baseChance = 1, maxChance = 6 } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 6 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'caimanChance')
    	return {vars = { new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		if context.using_consumeable and context.consumeable.ability.set == "Planet" and not context.blueprint then
			if SMODS.pseudorandom_probability(card, 'caiman', card.ability.extra.baseChance, card.ability.extra.maxChance, 'caiman') then
				G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            	G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card {
                                set = 'Planet',
								key = context.consumeable.config.center.key,
                                key_append = 'caiman'
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_planet'), colour = G.C.PURPLE },
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Limbus Company", G.C.BLACK, G.C.RED, 1.2 )
 	end,
}

-- Aeng Du
SMODS.Joker {
	key = 'aengDu',
	name = "Aeng Du",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = {xmult = 2 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 7 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and G.GAME.current_round.hands_played >= 1 and G.GAME.current_round.hands_left >= 1 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Blade Lineage', HEX('26292e'), HEX('a81338'), 1.2 )
 	end,
}

-- Jun
SMODS.Joker {
	key = 'jun',
	name = "Jun",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = {xmult = 3} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 7 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and G.GAME.current_round.hands_played == 0 then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Kurokumo Clan', HEX('292a2e'), HEX('6f7178'), 1.2 )
 	end,
}

-- Herbert
SMODS.Joker {
	key = 'herbert',
	name = "Herbert",
	pronouns = "he_him",
	unlocked = false,
	config = { extra = {baseChance = 1, maxChance = 3 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 7 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'herbertChance')
    	return {vars = { new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		if context.buying_card and (context.card.ability.set == "Joker" or context.card.ability.set == "Planet" or context.card.ability.set == "Tarot" or context.card.ability.set == "Spectral" or context.card.ability.set == "Voucher") then

			if SMODS.pseudorandom_probability(card, 'herbert', card.ability.extra.baseChance, card.ability.extra.maxChance, 'herbert') then
				ease_dollars(context.card.cost)
			end
		end
		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('T Corp', HEX('382d21'), HEX('a3802e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'money' and to_big(G.GAME.dollars) >= to_big(200)
    end
}

-- Mai
SMODS.Joker {
	key = 'mai',
	name = "Mai",
	pronouns = "she_her",
	unlocked = false,
	config = { extra = { xmult } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 8 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		local selectedJoker
		local possibleDebuffs = {}
		if context.setting_blind and #G.jokers.cards > 1 then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					possibleDebuffs[i] = G.jokers.cards[i]
				end
			end
			selectedJoker  = pseudorandom_element(possibleDebuffs, pseudoseed('mai'))
			SMODS.debuff_card(selectedJoker, true, "mai")
			card.ability.extra.xmult = 1.5 + selectedJoker.config.center.rarity * 0.5
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					SMODS.debuff_card(G.jokers.cards[i], "reset", "mai")
				end
			end
		end

		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('T Corp', HEX('382d21'), HEX('a3802e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'money' and to_big(G.GAME.dollars) >= to_big(200)
    end
}

-- Bumble
SMODS.Joker {
	key = 'bumble',
	name = "Bumble",
	pronouns = "he_him",
	unlocked = false,
	config = { extra = { } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 8 },
    pools =
	{
		
 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if G.GAME.blind and not G.GAME.blind.disabled then
			if context.press_play then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        for i = 1, #G.play.cards do
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.play.cards[i]:juice_up()
                                    return true
                                end,
                            }))
                            ease_dollars(-1)
                            delay(0.23)
                        end
                        return true
                    end
                }))
			end
		end
    end,
	add_to_deck = function(self, card, from_debuff)
        G.GAME.interest_cap = G.GAME.interest_cap + 60
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.interest_cap = G.GAME.interest_cap - 60
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('T Corp', HEX('382d21'), HEX('a3802e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'money' and to_big(G.GAME.dollars) >= to_big(200)
    end
}

-- Time Ripper
SMODS.Joker {
	key = 'timeRipper',
	name = "Time Ripper",
	pronouns = "they_them",
	unlocked = false,
	config = { extra = {charges = 0 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 7 },
    pools =
	{
		["Heretics"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.charges } }
	end,
	calculate = function(self, card, context)
		if context.selling_card and context.card.ability.set == "Joker" and card.ability.extra.charges <= 3 and not context.blueprint then
			if G.GAME.round_resets.ante >= card.ability.extra.charges + 1 then
				card.ability.extra.charges = card.ability.extra.charges + 1
			end
        end

		if context.selling_self and card.ability.extra.charges >=1 and not context.blueprint then

        		ease_ante(-card.ability.extra.charges)
        		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.charges
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('T Corp', HEX('382d21'), HEX('a3802e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_herbert" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

-- Casetti
SMODS.Joker {
	key = 'casetti',
	name = "Casetti",
	pronouns = "he_him",
	unlocked = false,
	config = { extra = { mult = 0, mult_mod = 2, suit = "Hearts", baseChance = 1, maxChance = 3 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 6 },
    pools =
	{
		["Bloodfiends"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'casettiChance')
		local bleedCardsTally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then bleedCardsTally = bleedCardsTally + 1 end
            end
        end
        return {vars = {card.ability.extra.mult_mod, card.ability.extra.mult + (bleedCardsTally * card.ability.extra.mult_mod), new_numerator, new_denominator } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
			if SMODS.pseudorandom_probability(card, 'casetti', card.ability.extra.baseChance, card.ability.extra.maxChance, 'casetti') then
				context.other_card:set_ability("m_pmcmod_bleed", nil, true)
			end
			local bleedCardsTally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then bleedCardsTally = bleedCardsTally + 1 end
				end
        	end
			return
			{
				mult = card.ability.extra.mult + (bleedCardsTally * card.ability.extra.mult_mod)
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('La Manchaland', HEX('400a18'), HEX('c7285f'), 1.2 )
 	end,
    check_for_unlock = function(self, args) -- equivalent to `unlock_condition = { type = 'modify_jokers', extra = { polychrome = true, count = 2 } }`
        if args.type == 'modify_deck' then
            local count = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then count = count + 1 end
                if count >= 5 then
                    return true
                end
            end
        end
        return false
    end
}

-- Sasha
SMODS.Joker {
	key = 'sasha',
	name = "Sasha",
	pronouns = "she_her",
	unlocked = false,
	config = { extra = { baseChance = 1, maxChance = 2 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 10 },
    pools =
	{
		["Bloodfiends"] = true,
		["Heretics"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'sashaChance')
    	return {vars = { new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then 
			if SMODS.has_enhancement(context.other_card, 'm_pmcmod_bleed') then
				if SMODS.pseudorandom_probability(card, 'sasha', card.ability.extra.baseChance, card.ability.extra.maxChance, 'sasha') then
					local edition = 'e_negative'
					context.other_card:set_edition(edition, true)
					check_for_unlock({ type = 'have_edition' })
				end
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Multicrack Office', HEX('ccc49d'), HEX('c706b0'), 1.2 )
 	end,
    check_for_unlock = function(self, args) -- equivalent to `unlock_condition = { type = 'modify_jokers', extra = { polychrome = true, count = 2 } }`
        if args.type == 'modify_deck' then
            local count = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then count = count + 1 end
                if count >= 3 then
                    return true
                end
            end
        end
        return false
    end
}

-- Hohenheim
SMODS.Joker {
	key = 'hohenheim',
	name = "Hohenheim",
	pronouns = "he_him",
	unlocked = true,
	config = { cardsDestroyed = {}, extra = {  } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 10 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
    	return {vars = { }}
	end,
	calculate = function(self, card, context)
		
		if context.joker_type_destroyed then
			if context.card.config.center.key == "j_pmcmod_johann" then
--				print("COMPILING FAILURE")
			else
--				print("COMPILED SUCCESSFULLY")
				card.ability.cardsDestroyed[#card.ability.cardsDestroyed + 1] = context.card.config.center.key
			end
		end

		if #card.ability.cardsDestroyed > 0 and context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
					local joker_to_revive = pseudorandom_element(card.ability.cardsDestroyed, pseudoseed('hohenheim'))
					G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            		G.E_MANAGER:add_event(Event({
						func = function()
--							print(joker_to_revive)
								SMODS.add_card {
									set = 'Joker',
									key_append = "hohenheim",
									key = joker_to_revive,
									edition = 'e_negative',
									stickers = {"perishable"},
									force_stickers = true
								}
								G.GAME.joker_buffer = 0
							return true
						end
					}))
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Limbus Company", G.C.BLACK, G.C.RED, 1.2 )
 	end,
}

-- Alyssa
SMODS.Joker {
	key = 'alyssa',
	name = "Alyssa",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { mult = 4} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 8 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local multCardsTally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_mult') then multCardsTally = multCardsTally + 1 end
            end
        end
		info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        return {vars = { card.ability.extra.mult, card.ability.extra.mult * multCardsTally } }
	end,
	calculate = function(self, card, context)

		local multCardsTally = 0

        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_mult') then multCardsTally = multCardsTally + 1 end
            end
        end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult * multCardsTally
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Limbus Company", G.C.BLACK, G.C.RED, 1.2 )
 	end,
}

-- Marton
SMODS.Joker {
	key = 'marton',
	name = "Marton",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { chips = 8} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 8 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local chipsCardsTally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_bonus') then chipsCardsTally = chipsCardsTally + 1 end
            end
        end
		info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        return {vars = { card.ability.extra.chips, card.ability.extra.chips * chipsCardsTally } }
	end,
	calculate = function(self, card, context)

		local chipsCardsTally = 0

        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_mult') then chipsCardsTally = chipsCardsTally + 1 end
            end
        end

		if context.joker_main then
			return {
				chips = card.ability.extra.chips * chipsCardsTally
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Limbus Company", G.C.BLACK, G.C.RED, 1.2 )
 	end,
}

-- Johann
SMODS.Joker {
	key = 'johann',
	name = "Johann",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 10 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.joker_type_destroyed then
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
			return{
				no_destroy = true
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}


-- SWEEPERS --
--------------

-- Qing Tao
SMODS.Joker {
	key = 'qingTao',
	name = "Qing Tao",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { type = "Three of a Kind", baseChance = 1, maxChance = 3, counter = 0 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 0, y = 2 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'qingTao')
        return {vars = { localize(card.ability.extra.type, 'poker_hands'), new_numerator, new_denominator } } 
	end,
	calculate = function(self, card, context)
		 if context.destroy_card and context.cardarea == G.play and not context.blueprint and next(context.poker_hands[card.ability.extra.type]) and G.GAME.current_round.hands_played == 0 and #context.full_hand == 3 then
			if SMODS.pseudorandom_probability(card, 'qingTao', card.ability.extra.baseChance, card.ability.extra.maxChance, 'shanSan') then
				card.ability.extra.counter = card.ability.extra.counter + 1
				return {
                    remove = true
                }
			end
        end

		if context.after then
			if card.ability.extra.counter == 0 then
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

				G.GAME.pool_flags.qingTao_extinct = true
				return {
					message = 'Died'
				}
			else
				card.ability.extra.counter = 0
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Citizen', HEX('828282'), HEX('ebebeb'), 1.2 )
 	end,
}

--Shan San
SMODS.Joker {
	key = 'shanSan',
	name = "Shan San",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { type = "Three of a Kind", dollars = 3, baseChance = 1, maxChance = 3, counter = 0 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 1, y = 2 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'shanSan')
        return {vars = { localize(card.ability.extra.type, 'poker_hands'), card.ability.extra.dollars, new_numerator, new_denominator } } 
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and next(context.poker_hands[card.ability.extra.type]) then
			if SMODS.pseudorandom_probability(card, 'shanSan', card.ability.extra.baseChance, card.ability.extra.maxChance, 'shanSan') then
				card.ability.extra.counter = card.ability.extra.counter + 1
				return {
					dollars = card.ability.extra.dollars
				}
			end
        end

		if context.after then
			if card.ability.extra.counter == 0 then
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

				G.GAME.pool_flags.shanSan_extinct = true
				return {
					message = 'Died'
				}
			else
				card.ability.extra.counter = 0
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Tri-axe Office', HEX('828282'), HEX('ebebeb'), 1.2 )
 	end,
}

-- LEVIATHAN --
---------------

--Jumsoon
SMODS.Joker {
	key = 'jumsoon',
	name = "Jumsoon",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { type = "Full House" } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 2 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { localize(card.ability.extra.type, 'poker_hands') } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and not context.blueprint and next(context.poker_hands[card.ability.extra.type]) and G.GAME.current_round.hands_played == 0 then

			local my_pos = nil

			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					my_pos = i
					break
				end
			end

			for i = 1, (my_pos - 1) do

				G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 0.15,
						func = function()
							G.jokers.cards[i]:flip()
							play_sound('card1', percent)
							G.jokers.cards[i]:juice_up(0.3, 0.3)
							return true
						end,
					}))
					

				local rarity = G.jokers.cards[i].config.center.rarity
				
				if rarity <= 3 then
						G.E_MANAGER:add_event(Event({
						delay = 0.5,
						func = function()
							G.jokers.cards[i]:set_ability(pseudorandom_element(G.P_JOKER_RARITY_POOLS[rarity], 'seed').key)
							return true
						end
					}))
				end
			
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("The Ring", HEX('474747'), HEX('c4c4c4'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_garnet" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

--Garnet
SMODS.Joker {
	key = 'garnet',
	name = "Garnet",
	pronouns = "he_him",
	unlocked = true,
	config = { availableJokers = {}, selectedJoker = "None", extra = {} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 2 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local keyToLocalize = "j_pmcmod_garnet"
		if ProjectMoonMod.garnetJoker then
			if #ProjectMoonMod.garnetJoker.cards >= 1 then
				keyToLocalize = ProjectMoonMod.garnetJoker.cards[1].config.center.key
			else
				keyToLocalize = "j_pmcmod_garnet"
			end
		end
        return {vars = { localize{type="name_text", set="Joker", key = (keyToLocalize)} } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			card.ability.availableJokers = {}
			card.ability.selectedJoker = "None"
			for i = 1, #G.P_CENTER_POOLS["Joker"] do
				if G.P_CENTER_POOLS["Joker"][i] ~= card and G.P_CENTER_POOLS["Joker"][i].blueprint_compat and G.P_CENTER_POOLS["Joker"][i].unlocked then
					card.ability.availableJokers[#card.ability.availableJokers+1] = G.P_CENTER_POOLS["Joker"][i]
				end
			end
			card.ability.selectedJoker = #card.ability.availableJokers > 0 and pseudorandom_element(card.ability.availableJokers, pseudoseed('garnet')) or nil
			if #ProjectMoonMod.garnetJoker.cards >=1 then
				G.E_MANAGER:add_event(Event({func = function()
							card:juice_up(0.8, 0.8)
							ProjectMoonMod.garnetJoker.cards[1]:start_dissolve({G.C.RED}, nil, 1.6)
						return true end }))
			end
			local jokerKey = card.ability.selectedJoker.key
			SMODS.add_card({ key = jokerKey, area = ProjectMoonMod.garnetJoker })
			
			
		end

		local ret = SMODS.blueprint_effect(card, ProjectMoonMod.garnetJoker.cards[1], context)
		if ret then
			ret.colour = G.C.BLUE
		end
		return ret
        
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Fixer", G.C.BLACK, G.C.WHITE, 1.2 )
 	end,
	check_for_unlock = function(self, args)
        if args.type == 'discard_custom' then
            local eval = evaluate_poker_hand(args.cards)
            if next(eval['Flush House']) then
                local min = 10
                for j = 1, #args.cards do
                    if args.cards[j]:get_id() < min then min = args.cards[j]:get_id() end
                end
                if min == 10 then
                    return true
                end
            end
        end
        return false
    end
}

-- WONDERLAB --
---------------

--Catt
SMODS.Joker {
	key = 'catt',
	name = "Catt",
	pronouns = "she_her",
	unlocked = false,
	config = { extra = {exhausted = false, rarity = 2, rarityName = "Hardcover"} },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 3,
	cost = 12,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 2 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		if card.ability.extra.rarity == 2 then
			card.ability.extra.rarityName = "Hardcover"
		elseif card.ability.extra.rarity == 3 then
			card.ability.extra.rarityName = "Limited"
		else
			card.ability.extra.rarityName = "Objet D'Art"
		end

        return {vars = { card.ability.extra.rarityName, card.ability.extra.exhausted } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss then
				card.ability.extra.exhausted = false
		end

		if context.end_of_round and context.game_over and context.main_eval and card.ability.extra.exhausted == false then
			local destructable_jokers = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and G.jokers.cards[i].config.center.rarity == card.ability.extra.rarity then
					destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i]
				end
			end
			local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('catt')) or nil
			if joker_to_destroy then
				card.ability.extra.exhausted = true
				if card.ability.extra.rarity <= 3 then
					card.ability.extra.rarity = card.ability.extra.rarity + 1
				end
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
                        play_sound('tarot1')
                        joker_to_destroy:start_dissolve()
                        return true
                    end
                }))
                return {
                    message = localize('k_saved_ex'),
                    saved = 'pmcmod_ph_catt', --kiro -- check this later
                    colour = G.C.RED
                }
			end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_mr_bones" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}


-- CANTO VIII --
----------------

--Jia Mu
SMODS.Joker {
	key = 'jiaMu',
	name = "Jia Mu",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { baseChance = 1, maxChance = 2, moneyLoss = 3} },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 3,
	cost = 10,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 2 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'jiaMu')
        return {vars = { new_numerator, new_denominator, card.ability.extra.moneyLoss } } 
	end,
	calculate = function(self, card, context)

		

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					SMODS.debuff_card(G.jokers.cards[i], "reset", "jiaMu")
				end
			end
		end

		if context.setting_blind then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					if SMODS.pseudorandom_probability(card, 'jiaMu', card.ability.extra.baseChance, card.ability.extra.maxChance, 'jiaMu') then
						SMODS.debuff_card(G.jokers.cards[i], true, "jiaMu")
					end
				end
			end
		end
		for i = 1, #G.jokers.cards do
			if context.retrigger_joker_check and context.other_card == G.jokers.cards[i] and G.GAME.dollars >= 3 then
				return {
					repetitions = math.random(0, 2),
					dollars = -card.ability.extra.moneyLoss
				} 
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("H Corp", HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_diet_cola" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

--Jia Qiu
SMODS.Joker {
	key = 'jiaQiu',
	name = "Jia Qiu",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { xmult = 2, baseChance = 1, maxChance = 4 } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 6, y = 2 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'jiaQiu')
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmult * 4, new_numerator, new_denominator } } 
	end,
	calculate = function(self, card, context)


		local leiHengDetected = false
		local leiHengPos = nil

		for i=1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.key == "j_pmcmod_leiHeng" then
				leiHengDetected = true
				leiHengPos = i
				break
			end
		end

		if context.joker_main then
			local chosenMult = nil
			if SMODS.pseudorandom_probability(card, 'jiaQiu', card.ability.extra.baseChance, card.ability.extra.maxChance, 'jiaQiu') or leiHengDetected then
				chosenMult = card.ability.extra.xmult * 4

				if leiHengDetected then
					G.jokers.cards[leiHengPos].children.center:set_sprite_pos({x = 4 , y = 10})

					G.jokers.cards[leiHengPos].getting_sliced = true
                    G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 3.0,
						func = function()
						card:juice_up(0.8, 0.8)
                        G.jokers.cards[leiHengPos]:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				end

			else
				chosenMult = card.ability.extra.xmult
			end
			return {
				xmult = chosenMult
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Jia Family", HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'chip_score' and to_big(args.chips) >= to_big(800000)
    end,
}

--Lin Daiyu
SMODS.Joker {
	key = 'linDaiyu',
	name = "Lin Daiyu",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { ruptureStack = 0, trigger = false } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 2,
	cost = 7,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 7, y = 2 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.ruptureStack } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.scoring_hand[1]:get_id() == 5 then
				if SMODS.has_enhancement(context.other_card, 'm_pmcmod_rupture') then
					card.ability.extra.ruptureStack = card.ability.extra.ruptureStack + context.other_card.ability.counter
					context.other_card.ability.counter = 0
				end
			end
		end
		if context.joker_main then
			return{
				xmult = 1 + 0.1*(card.ability.extra.ruptureStack / 5)
			}
		end
		if context.after then
			card.ability.extra.ruptureStack = 0
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Xue Family", HEX("f0a3a3"), HEX('c22929'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        if args.type == 'modify_deck' then
            local count = 0
            for _, playing_card in ipairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(playing_card, 'm_pmcmod_rupture') then count = count + 1 end
                if count >= 5 then
                    return true
                end
            end
        end
        return false
    end
}

--Xue Baochai
SMODS.Joker {
	key = 'xueBaochai',
	name = "Xue Baochai",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { percentageToReduce = 0.9 } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x =8, y = 2 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.percentageToReduce } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips*card.ability.extra.percentageToReduce)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
				G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
				G.HUD_blind:recalculate() 
				G.hand_text_area.blind_chips:juice_up()
			return true end }))
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Xue Family", HEX("f0a3a3"), HEX('c22929'), 1.2 )
 	end,
}

--Xianren A
SMODS.Joker {
	key = 'xianrenA',
	name = "Xianren A",
	unlocked = false,
	config = { extra = { dollars = 10 } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 9, y = 2 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.dollars } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	
			local xianrenList = {"j_pmcmod_xianrenB", "j_pmcmod_xianrenC", "j_pmcmod_xianrenD", "j_pmcmod_xianrenE", "j_pmcmod_xianrenF"}
			local selectedXianren = pseudorandom_element(xianrenList, pseudoseed('xianren'))
			local percent = 1.15
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.15,
				func = function()
					card:flip()
					play_sound('card1', percent)
					card:juice_up(0.3, 0.3)
					return true
				end,
			}))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
				func = function()
					card:set_ability(G.P_CENTERS[selectedXianren])
					return true
				end
			}))
		end

    end,
	calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("H Corp", HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Xianren B
SMODS.Joker {
	key = 'xianrenB',
	name = "Xianren B",
	unlocked = false,
	config = { extra = { mult = 30, chips = 50  } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 0, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	
			local xianrenList = {"j_pmcmod_xianrenA", "j_pmcmod_xianrenC", "j_pmcmod_xianrenD", "j_pmcmod_xianrenE", "j_pmcmod_xianrenF"}
			local selectedXianren = pseudorandom_element(xianrenList, pseudoseed('xianren'))
			local percent = 1.15
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.15,
				func = function()
					card:flip()
					play_sound('card1', percent)
					card:juice_up(0.3, 0.3)
					return true
				end,
			}))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
				func = function()
					card:set_ability(G.P_CENTERS[selectedXianren])
					return true
				end
			}))
		end
		if context.individual and context.cardarea == G.play and (context.other_card == context.scoring_hand[1] or context.other_card == context.scoring_hand[#context.scoring_hand]) and #context.scoring_hand >= 4 then
				return{
					mult = card.ability.extra.mult,
					chips = card.ability.extra.chips
				}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("H Corp", HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Xianren C
SMODS.Joker {
	key = 'xianrenC',
	name = "Xianren C",
	unlocked = false,
	config = { extra = { xmult = 1.15 } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 1, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	
			local xianrenList = {"j_pmcmod_xianrenA", "j_pmcmod_xianrenB", "j_pmcmod_xianrenD", "j_pmcmod_xianrenE", "j_pmcmod_xianrenF"}
			local selectedXianren = pseudorandom_element(xianrenList, pseudoseed('xianren'))
			local percent = 1.15
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.15,
				func = function()
					card:flip()
					play_sound('card1', percent)
					card:juice_up(0.3, 0.3)
					return true
				end,
			}))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
				func = function()
					card:set_ability(G.P_CENTERS[selectedXianren])
					return true
				end
			}))
		end
        if context.individual and context.cardarea == G.play then
			return {
				xmult = card.ability.extra.xmult,
			}
        end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("H Corp", HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Xianren D
SMODS.Joker {
	key = 'xianrenD',
	name = "Xianren D",
	unlocked = false,
	config = { extra = { repetitions = 1 } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.repetitions } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	
			local xianrenList = {"j_pmcmod_xianrenA", "j_pmcmod_xianrenB", "j_pmcmod_xianrenC", "j_pmcmod_xianrenE", "j_pmcmod_xianrenF"}
			local selectedXianren = pseudorandom_element(xianrenList, pseudoseed('xianren'))
			local percent = 1.15
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.15,
				func = function()
					card:flip()
					play_sound('card1', percent)
					card:juice_up(0.3, 0.3)
					return true
				end,
			}))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
				func = function()
					card:set_ability(G.P_CENTERS[selectedXianren])
					return true
				end
			}))
		end
		if context.retrigger_joker_check and context.other_card ~= card and context.other_card == G.jokers.cards[1] then
			print("Testing trigger")
		return {
				repetitions = card.ability.extra.repetitions
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("H Corp", HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Xianren E
SMODS.Joker {
	key = 'xianrenE',
	name = "Xianren E",
	unlocked = false,
	config = { extra = {  } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 7 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	
			local xianrenList = {"j_pmcmod_xianrenA", "j_pmcmod_xianrenB", "j_pmcmod_xianrenC", "j_pmcmod_xianrenD", "j_pmcmod_xianrenF"}
			local selectedXianren = pseudorandom_element(xianrenList, pseudoseed('xianren'))
			local percent = 1.15
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.15,
				func = function()
					card:flip()
					play_sound('card1', percent)
					card:juice_up(0.3, 0.3)
					return true
				end,
			}))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
				func = function()
					card:set_ability(G.P_CENTERS[selectedXianren])
					return true
				end
			}))
		end

		if context.before and context.main_eval and G.GAME.current_round.hands_played == 0 then
			if G.GAME.hands[context.scoring_name] then
				return {
					level_up = 1
				}
			end
    	end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("H Corp", HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Xianren F
SMODS.Joker {
	key = 'xianrenF',
	name = "Xianren F",
	unlocked = false,
	config = { extra = { sell_value = 3 } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.sell_value } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	
			local xianrenList = {"j_pmcmod_xianrenA", "j_pmcmod_xianrenB", "j_pmcmod_xianrenC", "j_pmcmod_xianrenD", "j_pmcmod_xianrenE"}
			local selectedXianren = pseudorandom_element(xianrenList, pseudoseed('xianren'))
			local percent = 1.15
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.15,
				func = function()
					card:flip()
					play_sound('card1', percent)
					card:juice_up(0.3, 0.3)
					return true
				end,
			}))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
				func = function()
					card:set_ability(G.P_CENTERS[selectedXianren])
					return true
				end
			}))
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            for _, area in ipairs({ G.jokers }) do
                for _, other_card in ipairs(area.cards) do
                    if other_card.set_cost then
                        other_card.ability.extra_value = (other_card.ability.extra_value or 0) +
                            card.ability.extra.sell_value
                        other_card:set_cost()
                    end
                end
            end
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("H Corp", HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Lady Wang
SMODS.Joker {
	key = 'ladyWang',
	name = "ladyWang",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { mult = 6 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { 6 + 3 * (G.GAME.round_resets.ante or 1) } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:get_id() == 6 then
            return {
                mult = card.ability.extra.mult + (3 * (G.GAME.round_resets.ante or 0))
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Wang Family", HEX("525252"), HEX('c2c2c2'), 1.2 )
 	end,
}

--Jia Zheng
SMODS.Joker {
	key = 'jiaZheng',
	name = "Jia Zheng",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { chips = 16 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 3 },
    pools =
	{
        
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { 10 + 5 * (G.GAME.round_resets.ante or 1) } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:get_id() == 6 then
            return {
                chips = card.ability.extra.chips + (5 * (G.GAME.round_resets.ante or 0))
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Jia Family", HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}

--Jia Yuanchun
SMODS.Joker {
	key = 'jiaYuanchun',
	name = "Jia Yuanchun",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { dollars = 6 } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 6, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.dollars } }
	end,
	calculate = function(self, card, context)
		
    end,
	calc_dollar_bonus = function(self, card)
        if #G.GAME.tags >= 2 and G.GAME.last_blind and G.GAME.last_blind.boss then
            return ((#G.GAME.tags - 1) *  card.ability.extra.dollars)
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Jia Family", HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}

--Jia Huan (Child)
SMODS.Joker {
	key = 'jiaHuanChild',
	name = "Jia Huan (Child)",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 1,
	cost = 2,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 7, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.selling_self and not context.blueprint then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                        SMODS.add_card {
                            set = 'Joker',
                            key_append = 'jiaHuan',
                            rarity = 'Uncommon',
                        }
                        G.GAME.joker_buffer = 0
                    return true
                end
            }))
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Jia Family", HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}

--Xue Pan
SMODS.Joker {
	key = 'xuePan',
	name = "Xue Pan",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 8, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		local coinFlip = math.random(1,2)
		if context.setting_blind and not context.blueprint then
			if coinFlip == 1 then
				local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

				local eligible_card = pseudorandom_element(editionless_jokers, 'xuePan')
				local edition = SMODS.poll_edition { key = "xuePan", guaranteed = true, no_negative = false, options = { 'e_polychrome', 'e_holo', 'e_foil', 'e_negative', 'e_pmcmod_charge' } }
				eligible_card:set_edition(edition, true)
				check_for_unlock({ type = 'have_edition' })
			else
				local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and not G.jokers.cards[i].edition then
						 destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i]
					end
                end
                local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('xuePan')) or nil

                if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
                end
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Xue Family", HEX("f0a3a3"), HEX('c22929'), 1.2 )
 	end,
}

--Wang Zhao
SMODS.Joker {
	key = 'wangZhao',
	name = "Wang Zhao",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { } },
	eternal_compat = false,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 9, y = 3 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then
			card.ability.extra_value = card.ability.extra_value + 1
			card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end

		if context.final_scoring_step and hand_chips * mult >= G.GAME.blind.chips and not context.blueprint then
			card.ability.extra_value = card.ability.extra_value + 2
			card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not G.GAME.last_blind.boss and not context.blueprint then

			local my_pos = nil

			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					my_pos = i
					break
				end
			end

			if G.jokers.cards[my_pos - 1] then
				if G.jokers.cards[my_pos - 1].set_cost then
					G.jokers.cards[my_pos - 1].ability.extra_value  = G.jokers.cards[my_pos - 1].ability.extra_value  + 4
					card.ability.extra_value = card.ability.extra_value - 2
					card:set_cost()
					G.jokers.cards[my_pos - 1]:set_cost()
				end
			end

			if G.jokers.cards[my_pos + 1] then
				if G.jokers.cards[my_pos - 1].set_cost then
					G.jokers.cards[my_pos + 1].ability.extra_value  = G.jokers.cards[my_pos + 1].ability.extra_value  + 4
					card.ability.extra_value = card.ability.extra_value - 2
					card:set_cost()
					G.jokers.cards[my_pos + 1]:set_cost()
				end
			end
			if card.sell_cost <= 0 then
				print("Testing destruction")
            G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('slice1', 0.96+math.random()*0.08)
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true

						card.getting_sliced = true

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
            G.GAME.pool_flags.wangZhao_extinct = true
            return {
                message = 'Died'
            }
			end
            return {
                message = "Value loss",
                colour = G.C.MONEY
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Wang Family", HEX("525252"), HEX('c2c2c2'), 1.2 )
 	end,
}

--Wang Dawei
SMODS.Joker {
	key = 'wangDawei',
	name = "Wang Dawei",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { counter = 0, permaMult_mod = 7, permaChips_mod = 15 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 0, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return {vars = { 8 - card.ability.extra.counter, card.ability.extra.permaMult_mod, card.ability.extra.permaChips_mod } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
            card.ability.extra.counter = card.ability.extra.counter + 1
			if card.ability.extra.counter >= 8 then
				context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.permaMult_mod
				context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +  card.ability.extra.permaChips_mod
				card.ability.extra.counter = 0
				local cardToJuiceUp = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						cardToJuiceUp:juice_up()
						return true
					end
				}))
			end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Wang Family", HEX("525252"), HEX('c2c2c2'), 1.2 )
 	end,
}

--Wang Qingshan
SMODS.Joker {
	key = 'wangQingshan',
	name = "Wang Qingshan",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { counter = 0, permaDollars_mod = 3 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 1, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return {vars = { card.ability.extra.counter, card.ability.extra.permaDollars_mod } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
            card.ability.extra.counter = card.ability.extra.counter + 1
			if card.ability.extra.counter >= 8 then
				context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) + card.ability.extra.permaDollars_mod
				card.ability.extra.counter = 0
				local cardToJuiceUp = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						cardToJuiceUp:juice_up()
						return true
					end
				}))
			end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}

--Wang Ren
SMODS.Joker {
	key = 'wangRen',
	name = "Wang Ren",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { dollars = 7 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.dollars } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.dollars <= 100 then
            G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('slice1', 0.96+math.random()*0.08)
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true

						card.getting_sliced = true

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
            G.GAME.pool_flags.wangRen_extinct = true
            return {
                message = 'Died'
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        if G.GAME.dollars > 100 then
            return card.ability.extra.dollars
        end
    end,
	in_pool = function(self, args)
		if G.GAME.dollars >= 104 then
            return true
		else
			return false
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Wang Family", HEX("525252"), HEX('c2c2c2'), 1.2 )
 	end,
}

--Shi Yihua
SMODS.Joker {
	key = 'shiYihua',
	name = "Shi Yihua",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { baseChips = 2} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local diamond_tally = 0
        if G.playing_cards then
            for i = 1, #G.playing_cards do
                if G.playing_cards[i]:is_suit('Diamonds', true) then diamond_tally = diamond_tally + 1 end
            end
        end
        return {vars = { card.ability.extra.baseChips, card.ability.extra.baseChips * diamond_tally } }
	end,
	calculate = function(self, card, context)
		local diamond_tally = 0
        if G.playing_cards then
            for i = 1, #G.playing_cards do
                if G.playing_cards[i]:is_suit('Diamonds', true) then diamond_tally = diamond_tally + 1 end
            end
        end

		if context.joker_main then
			return{
				chips = card.ability.extra.baseChips * diamond_tally
			}
		end
		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Shi Family", HEX("8a753f"), HEX('2e4a37'), 1.2 )
 	end,
}

--Shi Huazhen
SMODS.Joker {
	key = 'shiHuazhen',
	name = "Shi Huazhen",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = {mult_mod = 1 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult_mod } }
	end,
	calculate = function(self, card, context)
		local my_pos = nil
		if context.joker_main then
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
				print(my_pos)
            end
			if my_pos >= 2 then
				return {
					print(string.len(localize{type="name_text", set="Joker", key = G.jokers.cards[my_pos-1].config.center.key} or "")),
					mult = card.ability.extra.mult_mod * (string.len((localize{type="name_text", set="Joker", key = G.jokers.cards[my_pos-1].config.center.key} or "") or 0))
				}
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Shi Family", HEX("8a753f"), HEX('2e4a37'), 1.2 )
 	end,
}

--Shi Sijing
SMODS.Joker {
	key = 'shiSijing',
	name = "Shi Sijing",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { chips_mod = 10, chips = 0 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips_mod, card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.joker_type_destroyed and not context.blueprint  then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.CHIPS,
				message_card = card
			}
		end

		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Shi Family", HEX("8a753f"), HEX('2e4a37'), 1.2 )
 	end,
}

--Kong Sihui
SMODS.Joker {
	key = 'kongSihui',
	name = "Kong Sihui",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { dollars = 2, baseChanceTrigger = 1, maxChanceTrigger = 5, baseChanceDeath = 1, maxChanceDeath = 20 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 6, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numeratorTrigger, new_denominatorTrigger = SMODS.get_probability_vars(card, card.ability.extra.baseChanceTrigger, card.ability.extra.maxChanceTrigger, 'kong')
		local new_numeratorDeath, new_denominatorDeath = SMODS.get_probability_vars(card, card.ability.extra.baseChanceDeath, card.ability.extra.maxChanceDeath, 'kong')
        return {vars = { card.ability.extra.dollars, new_numeratorTrigger, new_denominatorTrigger, new_numeratorDeath, new_denominatorDeath } } 
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.pseudorandom_probability(card, 'kong', card.ability.extra.baseChanceTrigger, card.ability.extra.maxChanceTrigger, 'kong') then
				return {
					dollars = card.ability.extra.dollars
				}
			end

			if SMODS.pseudorandom_probability(card, 'kong', card.ability.extra.baseChanceDeath, card.ability.extra.maxChanceDeath, 'kong') then
			
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
				G.GAME.pool_flags.sihui_extinct = true
			end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Kong Family", HEX("8a001e"), HEX('242424'), 1.2 )
 	end,
}

--Kong Youjin
SMODS.Joker {
	key = 'kongYoujin',
	name = "Kong Youjin",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { repetitions = 1, baseChanceTrigger = 1, maxChanceTrigger = 5, baseChanceDeath = 1, maxChanceDeath = 20 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 7, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numeratorTrigger, new_denominatorTrigger = SMODS.get_probability_vars(card, card.ability.extra.baseChanceTrigger, card.ability.extra.maxChanceTrigger, 'kong')
		local new_numeratorDeath, new_denominatorDeath = SMODS.get_probability_vars(card, card.ability.extra.baseChanceDeath, card.ability.extra.maxChanceDeath, 'kong')
        return {vars = { card.ability.extra.repetitions, new_numeratorTrigger, new_denominatorTrigger, new_numeratorDeath, new_denominatorDeath } } 
	end,
	calculate = function(self, card, context)
		if context.repetition and context.cardarea == G.play then
			if SMODS.pseudorandom_probability(card, 'kong', card.ability.extra.baseChanceTrigger, card.ability.extra.maxChanceTrigger, 'kong') then
				return {
					repetitions = card.ability.extra.repetitions
				}
			end

			if SMODS.pseudorandom_probability(card, 'kong', card.ability.extra.baseChanceDeath, card.ability.extra.maxChanceDeath, 'kong') then
			
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
				G.GAME.pool_flags.youjin_extinct = true
			end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Kong Family", HEX("8a001e"), HEX('242424'), 1.2 )
 	end,
}

--Xiren
SMODS.Joker {
	key = 'xiren',
	name = "Xiren",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { lastPlayedHand = "", mult_mod = 3 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)

		if context.before and not context.blueprint then
			local _hand, _tally = nil, 0
			for _, handname in ipairs(G.handlist) do
				if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
					_hand = handname
					_tally = G.GAME.hands[handname].played
				end
			end
			card.ability.extra.mostPlayedHand = _hand
		end
		
		if context.joker_main then
			return {
				mult = (G.GAME.hands[card.ability.extra.mostPlayedHand].played - G.GAME.hands[context.scoring_name].played) * card.ability.extra.mult_mod
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Jia Family", HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}

--Wei
SMODS.Joker {
	key = 'wei',
	name = "Wei",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { mostPlayedHand = "", cardsInHand = 0, dollars = 2 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.dollars, card.ability.extra.mostPlayedHand } }
	end,
	calculate = function(self, card, context)

		if context.after then
			card.ability.extra.cardsInHand = #G.hand.cards
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			local _hand, _tally = nil, 0
			for _, handname in ipairs(G.handlist) do
				if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
					_hand = handname
					_tally = G.GAME.hands[handname].played
				end
			end
			card.ability.extra.mostPlayedHand = _hand
		end
    end,
	calc_dollar_bonus = function(self, card)
        if card.ability.extra.mostPlayedHand ~= "High Card" then
            return (card.ability.extra.cardsInHand * card.ability.extra.dollars)
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Jia Family", HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}

--Zigong
SMODS.Joker {
	key = 'zigong',
	name = "Zigong",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { chips = 3} },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end

			if G.jokers.cards[my_pos + 1] then
				local affectedCard = G.jokers.cards[my_pos + 1]
				card.ability.extra.chips = card.ability.extra.chips + (affectedCard.sell_cost * 3)
				if affectedCard.sell_cost then
                        affectedCard.sell_cost = 0
                end
			end
        end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Jia Family", HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}

--Zilu
SMODS.Joker {
	key = 'zilu',
	name = "Zilu",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Heishou Pack", HEX("362e29"), HEX('948e1c'), 1.2 )
 	end,
}

--Night Drifter
SMODS.Joker {
	key = 'nightDrifter',
	name = "Night Drifter",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { minXMult = 0.8, maxXMult = 2, minXMult_mod = 0.1, maxXMult_mod = 0.5, currentConsumableCount = 0 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { (card.ability.extra.minXMult - (card.ability.extra.minXMult_mod * card.ability.extra.currentConsumableCount)), (card.ability.extra.maxXMult + (card.ability.extra.maxXMult_mod * card.ability.extra.currentConsumableCount)), card.ability.extra.currentConsumableCount, card.ability.extra.minXMult_mod, card.ability.extra.maxXMult_mod  } }
	end,
	calculate = function(self, card, context)
		if context.using_consumeable and not context.blueprint and card.ability.extra.currentConsumableCount <= 3 then
			card.ability.extra.currentConsumableCount = card.ability.extra.currentConsumableCount + 1
		end

        if context.joker_main then
            local selectedXMult = 1
            local coinToss = math.random(1,2)

            if coinToss == 1 then
                selectedXMult = card.ability.extra.maxXMult + (card.ability.extra.maxXMult_mod * card.ability.extra.currentConsumableCount)
            else
                selectedXMult = card.ability.extra.minXMult - (card.ability.extra.minXMult_mod * card.ability.extra.currentConsumableCount)
            end

			return {
				xmult = selectedXMult
			}
		end

        if context.end_of_round and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	
            card.ability.extra.currentConsumableCount = 0
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Assassin", G.C.BLACK, G.C.WHITE, 1.2 )
 	end,
}

--Lei Heng
SMODS.Joker {
	key = 'leiHeng',
	name = "Lei Heng",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { my_pos = 1 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 5 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.before then
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    card.ability.extra.my_pos = i
                    break
                end
            end
		end
		
		if context.retrigger_joker_check and context.other_card == G.jokers.cards[card.ability.extra.my_pos -1] then
			local coinToss = math.random(0,4)

			if coinToss == 0 then
                local joker_to_destroy = G.jokers.cards[card.ability.extra.my_pos -1]

                if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
                end
			else
				return {
					repetitions = coinToss
				}
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_flower_pot" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

--Valencina
SMODS.Joker {
	key = 'valencina',
	name = "Valencina",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { currentPosition = 1, lucioDeathCounter = 0, lucioPresent = false, lucioPos = nil } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 5 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.lucioDeathCounter } }
	end,
	calculate = function(self, card, context)

		if context.before then
			card.ability.extra.lucioPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_lucio" then
						card.ability.extra.lucioPresent = true
						card.ability.extra.lucioPos = i
						break
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and (context.other_card == context.scoring_hand[1]) and #context.scoring_hand >= 2 then
			context.other_card:set_ability("m_pmcmod_tremor", nil, true)
		end

		if context.individual and context.cardarea == G.play and (context.other_card == context.scoring_hand[#context.scoring_hand]) and #context.scoring_hand > 2 and card.ability.extra.lucioPresent then
			context.other_card:set_ability("m_pmcmod_tremor", nil, true)

			card.ability.extra.lucioDeathCounter = card.ability.extra.lucioDeathCounter + 1

			if card.ability.extra.lucioDeathCounter >= 5 then
				local lucio = G.jokers.cards[card.ability.extra.lucioPos]
				
                    lucio.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        lucio:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
			end

		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_flower_pot" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

--Rien
SMODS.Joker {
	key = 'rien',
	name = "Rien",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { mult = 0, mult_mod = 15,  prescriptListShuffled = {}, prescriptActive = false, currentPrescript = 0, soraPresent = false, soraPos = nil } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 5 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	add_to_deck = function(self, card, from_debuff)
		
		-- Shuffles prescripts
        local prescriptListUnshuffled = {"j_pmcmod_prescript1", "j_pmcmod_prescript2", "j_pmcmod_prescript3", "j_pmcmod_prescript4", "j_pmcmod_prescript5", "j_pmcmod_prescript6", "j_pmcmod_prescript7", "j_pmcmod_prescript8", "j_pmcmod_prescript9", "j_pmcmod_prescript10", "j_pmcmod_prescript11"}
		card.ability.extra.prescriptListShuffled = Shuffle(prescriptListUnshuffled)
    end,
	calculate = function(self, card, context)

		-- Increase the prescript counter at the end of the boss
		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	

			card.ability.extra.soraPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_sora" then
						card.ability.extra.soraPresent = true
						card.ability.extra.soraPos = i
					end
				end
			end

			card.ability.extra.currentPrescript = card.ability.extra.currentPrescript + 1
			card.ability.extra.prescriptActive = false
			if card.ability.extra.soraPresent then
				card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod * 2)
				card.ability.extra.soraDeathCounter = card.ability.extra.soraDeathCounter + 1
			else
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
			end

			if card.ability.extra.soraDeathCounter >= 3 then
				local sora = G.jokers.cards[card.ability.extra.soraPos]
				
				sora.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.8, 0.8)
					sora:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end
			
		end

		-- Spawn the next prescript
		if context.ending_shop and card.ability.extra.prescriptActive == false and G.GAME.round_resets.ante > 1 and card.ability.extra.currentPrescript <= 10 then
			SMODS.add_card({ key = card.ability.extra.prescriptListShuffled[card.ability.extra.currentPrescript], stickers = {"eternal"}, force_stickers = true })
			card.ability.extra.prescriptActive = true
		end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_flower_pot" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

--Matthias
SMODS.Joker {
	key = 'matthias',
	name = "Matthias",
	unlocked = true,
	pronouns = "he_him",
	config = { extra = { hands = 1, dollarsBase = 2, kiraDeathCounter = 0, kiraPresent = false, kiraPos = nil } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x =9, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local burn_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_burn') then burn_tally = burn_tally + 1 end
				end
			end
        return {vars = { card.ability.extra.hands, card.ability.extra.dollarsBase, card.ability.extra.dollarsBase * burn_tally, card.ability.extra.kiraDeathCounter } }
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.kiraPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_kira" then
						card.ability.extra.kiraPresent = true
						card.ability.extra.kiraPos = i
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and #context.scoring_hand <= 3 and G.GAME.current_round.hands_played == 0 then
			
			
			local burn_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_burn') then burn_tally = burn_tally + 1 end
				end
			end

			

			if card.ability.extra.dollarsBase * burn_tally <= G.GAME.dollars then
				context.other_card:set_ability("m_pmcmod_burn", nil, true)
				if card.ability.extra.kiraPresent then
					card.ability.extra.kiraDeathCounter = card.ability.extra.kiraDeathCounter + 1
				else
					ease_dollars (-card.ability.extra.dollarsBase * burn_tally)
				end

				if card.ability.extra.kiraDeathCounter >= 5 then
					local kira = G.jokers.cards[card.ability.extra.kiraPos]
				
                    kira.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        kira:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				end
			end
		end

    end,
	add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_flower_pot" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

--Callisto
SMODS.Joker {
	key = 'callisto',
	name = "Callisto",
	unlocked = true,
	pronouns = "she_her",
	config = { extra = { currentPosition = 1, albinaPresent = false, albinaPos = nil, chips = 0, mult = 0, chips_gain = 20, mult_gain = 5  } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x =9, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
        if context.before and not context.blueprint then

			card.ability.extra.albinaPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_kira" then
						card.ability.extra.albinaPresent = true
						card.ability.extra.albinaPos = i
					end
				end
			end

            local enhancedChips = {}
			local enhancedMult = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.has_enhancement(playing_card, 'm_bonus')) and not scored_card.debuff and not scored_card.vampired then
                    enhancedChips[#enhancedChips + 1] = scored_card
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

				if next(SMODS.has_enhancement(playing_card, 'm_mult')) and not scored_card.debuff and not scored_card.vampired then
                    enhancedMult[#enhancedMult + 1] = scored_card
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

            if #enhancedChips > 0 then

				if card.ability.extra.albinaPresent then
					card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chips_gain * #enhancedChips * 2)
					card.ability.extra.albinaDeathCounter = card.ability.extra.albinaDeathCounter + 1
				else
					card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chips_gain * #enhancedChips)
				end
				
                return {
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                    colour = G.C.CHIPS
                }
            end

			if #enhancedMult > 0 then
				if card.ability.extra.albinaPresent then
					card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_gain * #enhancedMult * 2)
					card.ability.extra.albinaDeathCounter = card.ability.extra.albinaDeathCounter + 1
				else
					card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_gain * #enhancedMult)
				end

				
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                    colour = G.C.MULT
                }
            end

			if card.ability.extra.albinaDeathCounter >= 5 then
					local albina = G.jokers.cards[card.ability.extra.albinaPos]
				
                    albina.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        albina:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
			end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
				chips = card.ability.extra.chips
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_flower_pot" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

--Shiomi Yoru
SMODS.Joker {
	key = 'shiomiYoru',
	name = "Shiomi Yoru",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = {renDeathCounter = 0, renPos = nil } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)

		if context.before then
			card.ability.extra.matthiasPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_ren" then
						card.ability.extra.renPresent = true
						card.ability.extra.renPos = i
						break
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and context.other_card.poise_trigger and card.ability.extra.renPresent then
					
			card.ability.extra.renDeathCounter = card.ability.extra.renDeathCounter + 1
		
				if card.ability.extra.renDeathCounter >= 5 then
					local ren = G.jokers.cards[card.ability.extra.renPos]
                    ren.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        ren:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_flower_pot" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}

--Lucio
SMODS.Joker {
	key = 'lucio',
	name = "Lucio",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { currentPosition = 1, lucioDeathCounter = 0, dollars = 3, valencinaPresent = false, valencinaPos = nil } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x =9, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.lucioDeathCounter, card.ability.extra.dollars, card.ability.extra.dollars * 3} }
	end,
	calculate = function(self, card, context)

		if context.before then
			card.ability.extra.valencinaPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_valencina" then
						card.ability.extra.valencinaPresent = true
						card.ability.extra.valencinaPos = i
						break
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_pmcmod_tremor') then
			local multiplier = 1
			if card.ability.extra.valencinaPresent then
				multiplier = 3
				card.ability.extra.lucioDeathCounter = card.ability.extra.lucioDeathCounter + 1
			end
			return {
				dollars = card.ability.extra.dollars * multiplier,
			}
        end

		if context.after then
			if card.ability.extra.lucioDeathCounter >= 3 then
                    card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_valencina" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

--Sora
SMODS.Joker {
	key = 'sora',
	name = "Sora",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { chips = 0, chips_mod = 20, soraDeathCounter = 0, rienPresent = false, rienPos = nil, locked = false } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x =9, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips, card.ability.extra.chips_mod, card.ability.extra.soraDeathCounter } }
	end,
	calculate = function(self, card, context)

		if context.before then
			card.ability.extra.rienPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_rien" then
						card.ability.extra.rienPresent = true
						card.ability.extra.rienPos = i
						break
					end
				end
			end
			
		end

		if context.setting_blind and not card.ability.extra.locked and not context.blueprint then

			local editionJokers = {}
			local edition

			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
					if not card.edition then
						print("First edition for Sora")
						editionJokers[#editionJokers + 1] = G.jokers.cards[i]
					else
						if card.edition.key ~= G.jokers.cards[i].edition.key then
							print("Second+ Edition for Sora")
							editionJokers[#editionJokers + 1] = G.jokers.cards[i]
						end
					end
				end
			end

			if (#editionJokers > 0) then
				print("Choosing a random Joker")
				local eligible_card = pseudorandom_element(editionJokers, 'sora')
				local edition = eligible_card.edition.key
				print("Chosen edition" .. edition)
				card:set_edition(edition, true)
				eligible_card:set_edition()
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
				card.ability.extra.counter = 0

			else
				
				card.ability.extra.counter = card.ability.extra.counter + 1

				if card.ability.extra.counter >= 3 then
					card:set_edition()
					card.ability.extra.chips = card.ability.extra.chips * 2
					card.ability.extra.locked = true
				end
				
			end

		end

		if context.joker_main then

			local multiplier = 1

			if card.ability.extra.rienPresent then
				multiplier = 2
				card.ability.extra.soraDeathCounter = card.ability.extra.soraDeathCounter + 1
			else
				multiplier = 1
			end

			if card.ability.extra.soraDeathCounter >= 5 then
				
				card.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end

			return {
				chips = card.ability.extra.chips * multiplier
			}
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_rien" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

--Kira
SMODS.Joker {
	key = 'kira',
	name = "Kira",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { currentPosition = 1, kiraDeathCounter = 0, dollars = 2, matthiasPresent = false, matthiasPos = nil } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x =9, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.kiraDeathCounter, card.ability.extra.dollars, card.ability.extra.dollars * 3} }
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.matthiasPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_matthias" then
						card.ability.extra.matthiasPresent = true
						card.ability.extra.matthiasPos = i
						break
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_pmcmod_burn') then
			local multiplier = 1
			if card.ability.extra.matthiasPresent then
				multiplier = 3
				card.ability.extra.kiraDeathCounter = card.ability.extra.kiraDeathCounter + 1
			end
			return {
				dollars = card.ability.extra.dollars * multiplier,
			}
        end

		if context.after then
			if card.ability.extra.kiraDeathCounter >= 3 then
                    card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_matthias" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

--Albina
SMODS.Joker {
	key = 'albina',
	name = "Albina",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = {callistoPresent = false, callistoPos = nil, albinaDeathCounter = 0, baseChance = 1, maxChance = 2, type = "Pair" } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x =9, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'ren')
        return {vars = { card.ability.extra.albinaDeathCounter, localize(card.ability.extra.type, 'poker_hands'), new_numerator, new_denominator } }
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.callistoPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_callisto" then
						card.ability.extra.callistoPresent = true
						card.ability.extra.callistoPos = i
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and #context.scoring_hand == 2 then
			if context.scoring_hand[1] then
				if card.ability.extra.callistoPresent then
					context.other_card:set_ability("m_mult", nil, true)
					card.ability.extra.albinaDeathCounter = card.ability.extra.albinaDeathCounter + 1
				else
					if SMODS.pseudorandom_probability(card, 'albina', card.ability.extra.baseChance, card.ability.extra.maxChance, 'albina') then
						context.other_card:set_ability("m_mult", nil, true)
					end
				end
			end

			if context.scoring_hand[2] then
				if card.ability.extra.callistoPresent then
					context.other_card:set_ability("m_bonus", nil, true)
					card.ability.extra.albinaDeathCounter = card.ability.extra.albinaDeathCounter + 1
				else
					if SMODS.pseudorandom_probability(card, 'albina', card.ability.extra.baseChance, card.ability.extra.maxChance, 'albina') then
						context.other_card:set_ability("m_bonus", nil, true)
					end
				end
			end

			if card.ability.extra.albinaDeathCounter >= 6 then
				
				card.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.8, 0.8)
					card:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_callisto" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

--Ren
SMODS.Joker {
	key = 'ren',
	name = "Ren",
	pronouns = "she_her",
	unlocked = true,
	config = { extra = { shiomiPresent = false, shiomiPos = nil, renDeathCounter = 0, baseChance = 1, maxChance = 2} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x =9, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'ren')
        return {vars = { card.ability.extra.renDeathCounter, new_numerator, new_denominator } } 
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.shiomiPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_shiomiYoru" then
						card.ability.extra.shiomiPresent = true
						card.ability.extra.shiomiPos = i
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play then
			if card.ability.extra.shiomiPresent then
				context.other_card:set_ability("m_pmcmod_poise", nil, true)
				card.ability.extra.renDeathCounter = card.ability.extra.renDeathCounter + 1
			else
				if SMODS.pseudorandom_probability(card, 'ren', card.ability.extra.baseChance, card.ability.extra.maxChance, 'ren') then
					context.other_card:set_ability("m_pmcmod_poise", nil, true)
				end
			end

			if card.ability.extra.renDeathCounter >= 5 then
				
				card.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.8, 0.8)
					card:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end
		end

		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_shiomiYoru" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

--Ravi
SMODS.Joker {
	key = 'ravi',
	name = "Ravi",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = {chips = 0, chips_mod = 10, baseChance = 1, maxChance = 9 } },
	eternal_compat = false,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 1,
	cost = 3,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'ravi')
        return {vars = { card.ability.extra.chips, card.ability.extra.chips_mod, new_numerator, new_denominator } } 
	end,
	calculate = function(self, card, context)


		if context.joker_type_destroyed and context.card == card and not context.blueprint  then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod

			if SMODS.pseudorandom_probability(card, 'ravi', card.ability.extra.baseChance, card.ability.extra.maxChance, 'ravi') then
				
			card.getting_sliced = true
			G.E_MANAGER:add_event(Event({func = function()
				card:juice_up(0.8, 0.8)
				card:start_dissolve({G.C.RED}, nil, 1.6)
			return true end }))

			else

				SMODS.debuff_card(card, true, "ravi")
				return{
					no_destroy = true
				}

			end

			
			
		end
		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			SMODS.debuff_card(card, "reset", "ravi")
		end

		
		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Limbus Company", G.C.BLACK, G.C.RED, 1.2 )
 	end,
}

--Werner
SMODS.Joker {
	key = 'werner',
	name = "Werner",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = {chips = 0, chips_mod = 15 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips, card.ability.extra.chips_mod } }
	end,
	calculate = function(self, card, context)
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_ricardo" and not context.blueprint  then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.CHIPS,
				message_card = card
			}
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
 		badges[#badges+1] = create_badge("The Middle", HEX('5b0b75'), HEX('e3a81e'), 1.2 )
 	end,
}


--Jamila
SMODS.Joker {
	key = 'jamila',
	name = "Jamila",
	pronouns = "she_her",
	unlocked = true,
	config = { multBase = 10 },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
		local voucherAmount = 0
		
		if G.GAME.blind then
			voucherAmount = #G.vouchers.cards
		end
        return {vars = { card.ability.multBase, card.ability.multBase * voucherAmount } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.multBase * #G.vouchers.cards
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("LCA Udjat", HEX('212121'), HEX('ba8832'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        if #G.vouchers.cards >= 5 then
			return true
		end
    end
	
}

--A Certain Sinclair
SMODS.Joker {
	key = 'aCertainSinclair',
	name = "A Certain Sinclair",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { counter = 0, currentPosition = 1 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 10,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		local cardTriggeredIsToTheLeft = false
		if context.before then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					print("my_pos is ".. card.ability.extra.currentPosition)
					break
				end
			end
		end

		if context.post_trigger and G.jokers.cards[card.ability.extra.currentPosition-1].config.center.key == context.other_card.config.center.key then

			if card.ability.extra.currentPosition > 1 then
					cardTriggeredIsToTheLeft = true
					print("card to the left detected")
			end

			if cardTriggeredIsToTheLeft == true then
				card.ability.extra.counter = card.ability.extra.counter + 1
				print(card.ability.extra.counter)
			end
		end


		if context.retrigger_joker_check and context.other_card == G.jokers.cards[card.ability.extra.currentPosition + 1] and #G.jokers.cards > card.ability.extra.currentPosition then
			print("Testing trigger")
		return {
				repetitions = card.ability.extra.counter
			}
		end

		if context.after then
			card.ability.extra.counter = 0
			print("test reset")
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Abraxas Chariot", G.C.BLACK, G.C.WHITE, 1.2 )
 	end,
}

--Araya (Child)
SMODS.Joker {
	key = 'arayaKid',
	name = "Araya (Child)",
	pronouns = "she_her",
	unlocked = false,
	config = { chips = 20, counters = {playedCards = 0, discardedCards = 0, moneyUsed = 0} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.chips, card.ability.counters.playedCards, card.ability.counters.discardedCards, card.ability.counters.moneyUsed } }
	end,
	calculate = function(self, card, context)

		if context.joker_main then
			return {
				chips = card.ability.chips
			}
		end

		if context.individual and context.cardarea == G.play and not context.blueprint then
			card.ability.counters.playedCards = card.ability.counters.playedCards + 1
        end

		if context.discard and not context.blueprint then
            card.ability.counters.discardedCards = card.ability.counters.discardedCards + 1
            
        end

		if context.money_altered and context.amount < 0 and not context.blueprint then
			card.ability.counters.moneyUsed = card.ability.counters.moneyUsed - context.amount
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

				local highestValue = nil
				local maxValue = -math.huge

				for key, value in pairs(card.ability.counters) do
					if value > maxValue then
						maxValue = value
						highestValue = key
					end
				end

			if highestValue == "playedCards" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaTeen"])
                    return true
                end
            }))
			elseif highestValue == "discardedCards" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaYA"])
                    return true
                end
            }))

			elseif highestValue == "moneyUsed" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaAdult"])
                    return true
                end
            }))

			end


				card.ability.counters.playedCards = 0
				card.ability.counters.discardedCards = 0
				card.ability.counters.moneyUsed = 0
				
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_ryoshu" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}

--Araya (Teen)
SMODS.Joker {
	key = 'arayaTeen',
	name = "Araya (Teen)",
	pronouns = "she_her",
	unlocked = false,
	config = { permaChips_mod = 6, counters = {playedCards = 0, discardedCards = 0, moneyUsed = 0} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return {vars = { card.ability.permaChips_mod, card.ability.counters.playedCards, card.ability.counters.discardedCards, card.ability.counters.moneyUsed  } }
	end,
	calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play then
			context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +  card.ability.permaChips_mod
        end

		if context.individual and context.cardarea == G.play and not context.blueprint then
			card.ability.counters.playedCards = card.ability.counters.playedCards + 1
        end

		if context.discard and not context.blueprint then
            card.ability.counters.discardedCards = card.ability.counters.discardedCards + 1
            
        end

		if context.money_altered and context.amount < 0 and not context.blueprint then
			card.ability.counters.moneyUsed = card.ability.counters.moneyUsed - context.amount
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

				local highestValue = nil
				local maxValue = -math.huge

				for key, value in pairs(card.ability.counters) do
					if value > maxValue then
						maxValue = value
						highestValue = key
					end
				end

			if highestValue == "playedCards" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaChild"])
                    return true
                end
            }))
			elseif highestValue == "discardedCards" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaYA"])
                    return true
                end
            }))

			elseif highestValue == "moneyUsed" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaAdult"])
                    return true
                end
            }))

			end


				card.ability.counters.playedCards = 0
				card.ability.counters.discardedCards = 0
				card.ability.counters.moneyUsed = 0
				
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
}

--Araya (Young Adult)
SMODS.Joker {
	key = 'arayaYA',
	name = "Araya (Young Adult)",
	pronouns = "she_her",
	unlocked = false,
	config = { permaMult_mod = 3, counters = {playedCards = 0, discardedCards = 0, moneyUsed = 0} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return {vars = { card.ability.permaMult_mod, card.ability.counters.playedCards, card.ability.counters.discardedCards, card.ability.counters.moneyUsed  } }
	end,
	calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play then
			context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) +  card.ability.permaMult_mod
        end

		if context.individual and context.cardarea == G.play and not context.blueprint then
			card.ability.counters.playedCards = card.ability.counters.playedCards + 1
        end

		if context.discard and not context.blueprint then
            card.ability.counters.discardedCards = card.ability.counters.discardedCards + 1
            
        end

		if context.money_altered and context.amount < 0 and not context.blueprint then
			card.ability.counters.moneyUsed = card.ability.counters.moneyUsed - context.amount
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

				local highestValue = nil
				local maxValue = -math.huge

				for key, value in pairs(card.ability.counters) do
					if value > maxValue then
						maxValue = value
						highestValue = key
					end
				end

			if highestValue == "playedCards" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaTeen"])
                    return true
                end
            }))
			elseif highestValue == "discardedCards" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaChild"])
                    return true
                end
            }))

			elseif highestValue == "moneyUsed" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaAdult"])
                    return true
                end
            }))

			end


				card.ability.counters.playedCards = 0
				card.ability.counters.discardedCards = 0
				card.ability.counters.moneyUsed = 0
				
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
}

--Araya (Adult)
SMODS.Joker {
	key = 'arayaAdult',
	name = "Araya (Adult)",
	pronouns = "she_her",
	unlocked = false,
	config = { permaDollars_mod = 1, counters = {playedCards = 0, discardedCards = 0, moneyUsed = 0} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return {vars = { card.ability.permaDollars_mod, card.ability.counters.playedCards, card.ability.counters.discardedCards, card.ability.counters.moneyUsed  } }
	end,
	calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play then
			context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) +  card.ability.permaDollars_mod
        end

		if context.individual and context.cardarea == G.play and not context.blueprint then
			card.ability.counters.playedCards = card.ability.counters.playedCards + 1
        end

		if context.discard and not context.blueprint then
            card.ability.counters.discardedCards = card.ability.counters.discardedCards + 1
            
        end

		if context.money_altered and context.amount < 0 and not context.blueprint then
			card.ability.counters.moneyUsed = card.ability.counters.moneyUsed - context.amount
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

				local highestValue = nil
				local maxValue = -math.huge

				for key, value in pairs(card.ability.counters) do
					if value > maxValue then
						maxValue = value
						highestValue = key
					end
				end

			if highestValue == "playedCards" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaTeen"])
                    return true
                end
            }))
			elseif highestValue == "discardedCards" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaYA"])
                    return true
                end
            }))

			elseif highestValue == "moneyUsed" then
				local percent = 1.15
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    play_sound('card1', percent)
                    card:juice_up(0.3, 0.3)
                    return true
                end,
            }))

			G.E_MANAGER:add_event(Event({
				delay = 0.5,
                func = function()
                    card:set_ability(G.P_CENTERS["j_pmcmod_arayaChild"])
                    return true
                end
            }))

			end


				card.ability.counters.playedCards = 0
				card.ability.counters.discardedCards = 0
				card.ability.counters.moneyUsed = 0
				
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('House of Spiders', HEX('121212'), HEX('d90000'), 1.2 )
 	end,
}

-- COLOR FIXERS --
------------------

-- Vermillion Cross
SMODS.Joker {
	key = 'vermillionCross',
	name = "Vermillion Cross",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { percentageToReduce = 0.5 } },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 4,
	cost = 10,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 8 },
	soul_pos = { x = 5, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.percentageToReduce } }
	end,
	calculate = function(self, card, context)

		if context.setting_blind then
			G.E_MANAGER:add_event(Event({func = function()
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips*card.ability.extra.percentageToReduce)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
				G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
				G.HUD_blind:recalculate() 
				G.hand_text_area.blind_chips:juice_up()
			return true end }))
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('Color Fixer', HEX('2b1313'), HEX('f50000'), 1.2 )
 	end,
}

-- Indigo Elder
SMODS.Joker {
	key = 'indigoElder',
	name = "Indigo Elder",
	pronouns = "he_him",
	config = { extra = { mult = 0, chips = 0, dollars = 0, xmult = 0, lockedPosition = 0, debuffMult = 2, debuffChips = 5, debuffDollars = 1, debuffXmult = 0.9} },
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 4,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 8 },
	soul_pos = { x = 3, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.dollars, card.ability.extra.xmult, card.ability.extra.lockedPosition, card.ability.extra.debuffMult,
		card.ability.extra.debuffChips, card.ability.extra.debuffDollars, card.ability.extra.debuffXmult } }
	end,
	calculate = function(self, card, context)

		if context.setting_blind and card.ability.extra.lockedPosition == 0 then
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
			card.ability.extra.lockedPosition = my_pos
		end

		if context.individual and context.cardarea == G.play then

			if card.ability.extra.lockedPosition == 2 then
				return
				{
					mult = - card.ability.extra.debuffMult,
					chips = card.ability.extra.chips,
					xmult = card.ability.extra.xmult
					
				}
			elseif card.ability.extra.lockedPosition == 3 then
				return
				{
					mult = card.ability.extra.mult,
					chips = - card.ability.extra.debuffChips,
					xmult = card.ability.extra.xmult					
				}

			elseif card.ability.extra.lockedPosition == 4 then
				G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
				return
				{
					mult = card.ability.extra.mult,
					chips = card.ability.extra.chips,
					xmult = card.ability.extra.xmult,
					dollars = -card.ability.extra.debuffDollars,
                	func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
								G.GAME.dollar_buffer = 0
								return true
							end
						}))
					end
					
				}
			elseif card.ability.extra.lockedPosition == 5 then
				return
				{
					mult = card.ability.extra.mult,
					chips = card.ability.extra.chips,
					xmult = card.ability.extra.xmultDebuff
					
				}
			else
				return
				{
					mult = card.ability.extra.mult,
					chips = card.ability.extra.chips,
					xmult = card.ability.extra.xmult
					
				}
			end

		end


		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.debuffMult = card.ability.extra.debuffMult + 2
			card.ability.extra.debuffChips = card.ability.extra.debuffChips + 5
			card.ability.extra.debuffXmult = card.ability.extra.debuffXmult - 0.1
			card.ability.extra.debuffDollars = card.ability.extra.debuffDollars + 1

			if card.ability.extra.lockedPosition == 1 then
				card.ability.extra.mult = card.ability.extra.mult + 15
				card.ability.extra.chips = card.ability.extra.chips + 30
				card.ability.extra.dollars = card.ability.extra.dollars + 2
				card.ability.extra.xmult = card.ability.extra.xmult + 1

			elseif card.ability.extra.lockedPosition == 2 then
				card.ability.extra.mult = card.ability.extra.mult + 15

			elseif card.ability.extra.lockedPosition == 3 then
				card.ability.extra.chips = card.ability.extra.chips + 30

			elseif card.ability.extra.lockedPosition == 4 then
				card.ability.extra.dollars = card.ability.extra.dollars + 2

			else
				card.ability.extra.xmult = card.ability.extra.xmult + 1
			end	

			card.ability.extra.lockedPosition = 0
			return {message = localize('k_reset')}
		end
    end,
	calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Color Fixer", HEX('243542'), HEX('35c5e6'), 1.2 )
 	end
}


--Yellow Harpoon
SMODS.Joker {
	key = 'yellowHarpoon',
	name = "Yellow Harpoon",
	pronouns = "he_him",
	unlocked = true,
	config = { extra = { base_xmult = 1.0 } },
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 4,
	cost = 10,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 14 },
	soul_pos = { x = 3, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.base_xmult + 0.2, card.ability.extra.base_xmult + 1.0 } }
	end,
	calculate = function(self, card, context)
		local selectedXMult = 1.0

		if context.other_joker then
			if context.other_joker.config.center.rarity == 1 or context.other_joker.config.center.rarity == "Common" then
				selectedXMult = card.ability.extra.base_xmult + 0.2
			elseif context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == "Uncommon" then
				selectedXMult = card.ability.extra.base_xmult + 0.4
			elseif context.other_joker.config.center.rarity == 3 or context.other_joker.config.center.rarity == "Rare" then
				selectedXMult = card.ability.extra.base_xmult + 0.6
			else
				selectedXMult = card.ability.extra.base_xmult + 1.0
			end
            return {
                xmult = selectedXMult
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Color Fixer", HEX('212121'), HEX('f0a524'), 1.2 )
 	end,
}

------------------
-- DUMMY JOKERS --
------------------

-- Sephirah Hod
SMODS.Joker {
    key = "sephirahHod",
	name = "Sephirah Hod",
	pronouns = "she_her",
	config = {extra = 1, xmult = 1},
    blueprint_compat = true,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pos = { x = 1, y = 11 },
    pools = 
	{
 		["Heretics"] = true,
 	},
	no_pool_flag = 'robot_extinct',
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
				xmult = card.ability.xmult
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
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}

-- Sephirah Malkuth
SMODS.Joker {
    key = "sephirahMalkuth",
	name = "Sephirah Malkuth",
	pronouns = "she_her",
	config = {extra = {mult = 0}},
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = false,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pos = { x = 2, y = 11 },
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
		G.GAME.hands["Flush Five"].level)*3 - 36

		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}

-- Sephirah Netzach
SMODS.Joker {
    key = "sephirahNetzach",
	name = "Sephirah Netzach",
	pronouns = "he_him",
	config = {extra = {mult = 0, chips = 0, current_consumable_count = 0}},
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
    pos = { x = 3, y = 11 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.current_consumable_count } }
    end,

    calculate = function(self, card, context)

		--Increments counter when a consumable is used
		if context.using_consumeable and not context.blueprint then
			card.ability.extra.current_consumable_count = card.ability.extra.current_consumable_count + 1
		end

		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

				card.ability.extra.mult = card.ability.extra.mult + (3 * card.ability.extra.current_consumable_count)
				card.ability.extra.chips = card.ability.extra.chips + (5 * card.ability.extra.current_consumable_count)

				card.ability.extra.current_consumable_count = 0
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
 	end,
}

-- Sephirah Yesod
SMODS.Joker {
    key = "sephirahYesod",
	name = "Sephirah Yesod",
	pronouns = "he_him",
	config = {extra = {totalSpades = 0, totalClubs = 0, totalHearts = 0, totalDiamonds = 0, mult = 0, chips = 0}},
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
    pos = { x = 4, y = 11 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.totalSpades, card.ability.extra.totalClubs, card.ability.extra.totalHearts, card.ability.extra.totalDiamonds, card.ability.extra.mult, card.ability.extra.chips } }
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

		card.ability.extra.chips = (card.ability.extra.totalSpades + card.ability.extra.totalClubs)*3
        card.ability.extra.mult = (card.ability.extra.totalHearts + card.ability.extra.totalDiamonds)

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
 	end,
}

-- Sephirah Chesed
SMODS.Joker {
    key = "sephirahChesed",
	name = "Sephirah Chesed",
	pronouns = "he_him",
	config = {extra = {xmult = 2, xmult_mod = 0.1, baseChance = 1, maxChance = 2}},
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
    pos = { x = 5, y = 11 },
    loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'chesed')
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod, new_numerator, new_denominator } } 
    end,

    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.pseudorandom_probability(card, 'chesed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'chesed') then
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
				xmult = card.ability.xmult
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Sephirah Gebura
SMODS.Joker {
    key = "sephirahGebura",
	name = "Sephirah Gebura",
	pronouns = "she_her",
	config = {extra = {mult = 0, roundCount = 0}},
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
    pos = { x = 6, y = 11 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, card.ability.extra.roundCount } }
    end,
    calculate = function(self, card, context)

		card.ability.extra.mult = (G.GAME.current_round.hands_played) * (15 + (card.ability.extra.roundCount * 5))

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			card.ability.extra.roundCount = card.ability.extra.roundCount + 1
		end

		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}

-- Sephirah Hokma
SMODS.Joker {
    key = "sephirahHokma",
	name = "Sephirah Hokma",
	pronouns = "he_him",
	config = {extra = {xmult = 1, xmult_mod = 0.3, consumablesUsed = 0}},
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
    pos = { x = 7, y = 11 },
    loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.xmult + (card.ability.extra.xmult_mod * card.ability.extra.consumablesUsed ), card.ability.extra.xmult_mod }}
	end,
    calculate = function(self, card, context)

		if context.using_consumeable and (context.consumeable.ability.set == "Tarot" or context.consumeable.ability.set == "Spectral") and not context.blueprint then

			card.ability.extra.consumablesUsed = 0
			for k, v in pairs(G.GAME.consumeable_usage) do
				if v.set == 'Tarot' then 
					card.ability.extra.consumablesUsed = card.ability.extra.consumablesUsed + 1 
				end
				if v.set == 'Spectral' then
					card.ability.extra.consumablesUsed = card.ability.extra.consumablesUsed + 1
				end
			end
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod * card.ability.extra.consumablesUsed)
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}

-- Sephirah Binah
SMODS.Joker {
    key = "sephirahBinah",
	name = "Sephirah Binah",
	pronouns = "she_her",
	config = {extra = {xmult = 1, xmult_mod = 0.3, bondedHand = "None", bonded = 0}},
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
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod, card.ability.extra.bondedHand, card.ability.extra.bonded } }
    end,

    calculate = function(self, card, context)

		if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end

		if context.before and #context.full_hand >= 1 and G.GAME.current_round.hands_played == 0 then
			if card.ability.extra.bonded == 0 then
				card.ability.extra.bondedHand = context.scoring_name
				card.ability.extra.bonded = 1
			end
		end

		if context.destroying_card and context.cardarea == G.play and #context.full_hand >= 1 and not context.blueprint and G.GAME.current_round.hands_played == 0 and context.scoring_name == card.ability.extra.bondedHand and card.ability.extra.bonded == 1 then  
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
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}

-- Sephirah Tiphereth
SMODS.Joker {
    key = "sephirahTiphereth",
	name = "Sephirah Tiphereth",
	pronouns = "she_her",
	config = {extra = {aceMult = 10, aceMult_mod = 10}},
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
    pos = { x = 8, y = 11 },
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.aceMult, card.ability.extra.aceMult_mod } }
    end,

    calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
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

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Lobotomy Corporation", G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}

-- Robot Hod
SMODS.Joker {
    key = "robotHod",
	name = "Hod (Robot)",
	pronouns = "she_her",
	config = {xmult = 2},
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
        return { main_end = main_end, vars = { card.ability.xmult } }
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
				xmult = card.ability.xmult
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
	pronouns = "she_her",
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
	pronouns = "he_him",
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
	pronouns = "he_him",
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
	pronouns = "he_him",
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
	pronouns = "she_her",
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

-- Robot Hokma
SMODS.Joker {
    key = "robotHokma",
	name = "Hokma (Robot)",
	pronouns = "he_him",
	config = {extra = {xmult = 1,xmult_mod_spectrals = 0.3, xmult_mod_tarot = 0.1, spectralsUsed = 0, tarotUsed = 0}},
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
    pos = { x = 0, y = 12 },
    loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.xmult + (card.ability.extra.xmult_mod_spectrals * card.ability.extra.spectralsUsed ) - (card.ability.extra.xmult_mod_tarot * card.ability.extra.tarotUsed ), card.ability.extra.xmult_mod_spectrals, card.ability.extra.xmult_mod_tarot }}
	end,
    calculate = function(self, card, context)

		if context.using_consumeable and (context.consumeable.ability.set == "Tarot" or context.consumeable.ability.set == "Spectral") and not context.blueprint then

			card.ability.extra.tarotUsed = 0
			card.ability.extra.spectralsUsed = 0
			for k, v in pairs(G.GAME.consumeable_usage) do
				if v.set == 'Tarot' then 
					card.ability.extra.tarotUsed = card.ability.extra.tarotUsed + 1 
				end
				if v.set == 'Spectral' then
					card.ability.extra.spectralsUsed = card.ability.extra.spectralsUsed + 1
				end
			end
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod_spectrals * card.ability.extra.spectralsUsed ) - (card.ability.extra.xmult_mod_tarot * card.ability.extra.tarotUsed )
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
	pronouns = "she_her",
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
	pronouns = "she_her",
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
--			print("Testing destruction")
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
	pronouns = "he_him",
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
	pronouns = "it_its",
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
--                    print("[DEBUG] game over triggered")
                    return true
                end
            }))
				
			end
	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_silent_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Abnormality", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}


-- Shy Look Dummy Joker
SMODS.Joker {
	key = 'shylook',
	name = "Today's Shy Look",
	pronouns = "it_its",
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
 		badges[#badges+1] = create_badge("Abnormality", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Queen of Hatred
SMODS.Joker {
	key = 'queenOfHatred',
	name = "Queen of Hatred",
	pronouns = "she_her",
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
			local possibleDebuffs = {}
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					possibleDebuffs[i] = G.jokers.cards[i]
				end
			end
			local selectedJoker = pseudorandom_element(possibleDebuffs, pseudoseed('queen'))
			SMODS.debuff_card(selectedJoker, true, "queen")
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if card.ability.extra.transformationCount > 2 then
				card.ability.extra.transformationCount = 0
				--print("transform reset")
				enableTransform = false
				card.ability.extra.currentCount = 0
				card.ability.extra.playedCount = 5
				card.ability.extra.discardedCount = 5
				card.children.center:set_sprite_pos({x = 1, y = 0})
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] ~= card then
						SMODS.debuff_card(G.jokers.cards[i], "reset", "queen")
					end
				end
			end
		end
	end,
	in_pool = function(self, args) -- equivalent to `yes_pool_flag = 'vremade_gros_michel_extinct'`
        return G.GAME.pool_flags.fake_queen_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Abnormality", G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Bongy A
SMODS.Joker {
	key = 'chickenA',
	name = "Chicken A",
	pronouns = "it_its",
	config = { extra = { roundsCompleted = 0 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 14 },
	no_collection = true,
	unlocked = true,
	blueprint_compat = false,
    eternal_compat = false,
	perishable_compat = false,
	cost = 0,
	pools =
	{
        ["HellsKitchen"] = true,
 	},
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
	pronouns = "it_its",
	config = { extra = { handsUsed = 0 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 14 },
	no_collection = true,
	unlocked = true,
	blueprint_compat = false,
    eternal_compat = false,
	perishable_compat = false,
	cost = 0,
	pools =
	{
        ["HellsKitchen"] = true,
 	},
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
	pronouns = "it_its",
	config = { extra = { discardsUsed = 0 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 14 },
	no_collection = true,
	unlocked = true,
	blueprint_compat = false,
    eternal_compat = false,
	perishable_compat = false,
	cost = 0,
	pools =
	{
        ["HellsKitchen"] = true,
 	},
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
	pronouns = "it_its",
	config = { extra = { boostersOpened = 0 } },
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 14 },
	no_collection = true,
	unlocked = true,
	blueprint_compat = false,
    eternal_compat = false,
	perishable_compat = false,
	cost = 0,
	pools =
	{
        ["HellsKitchen"] = true,
 	},
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

-- Small Puppet
SMODS.Joker {
	key = 'puppetA',
	name = "Puppet",
	pronouns = "it_its",
	config = { extra = { mult = 15, counter = 0 } },
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = true,
    --	no_collection = true,
	rarity = 1,
    cost = 0,
	atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 13 },
	pools =
	{
        ["Puppet"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.mult, card.ability.extra.counter }}
	end,
	calculate = function(self, card, context)
		
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end

		if context.after and not context.blueprint then
			card.ability.extra.counter = card.ability.extra.counter + 1
                return {
                    message = card.ability.extra.counter .. '',
                    colour = G.C.FILTER
                }
		end

		if context.end_of_round and not context.blueprint then
            if card.ability.extra.counter >= 5 then
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
		end
	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Puppets", HEX('bd0d19'), HEX('4f3d2d'), 1.2 )
 	end
}

-- Medium Puppet
SMODS.Joker {
	key = 'puppetB',
	name = "Nimble Puppet",
	pronouns = "it_its",
	config = { extra = { mult = 30, counter = 0 } },
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = true,
    --	no_collection = true,
	rarity = 2,
    cost = 0,
	atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 13 },
	pools =
	{
        ["Puppet"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.mult, card.ability.extra.counter }}
	end,
	calculate = function(self, card, context)
		
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end

		if context.after and not context.blueprint then
			card.ability.extra.counter = card.ability.extra.counter + 1
                return {
                    message = card.ability.extra.counter .. '',
                    colour = G.C.FILTER
                }
		end

		if context.end_of_round and not context.blueprint then
            if card.ability.extra.counter >= 5 then
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
		end
	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Puppets", HEX('bd0d19'), HEX('4f3d2d'), 1.2 )
 	end
}

-- Big Puppet
SMODS.Joker {
	key = 'puppetC',
	name = "Weighty Puppet",
	pronouns = "it_its",
	config = { extra = { mult = 50, counter = 0 } },
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = true,
--	no_collection = true,
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 13 },
--	no_collection = true,
	cost = 0,
	pools =
	{
        ["Puppet"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.mult, card.ability.extra.counter }}
	end,
	calculate = function(self, card, context)
		
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end

		if context.after and not context.blueprint then
			card.ability.extra.counter = card.ability.extra.counter + 1
                return {
                    message = card.ability.extra.counter .. '',
                    colour = G.C.FILTER
                }
		end

		if context.end_of_round and not context.blueprint then
            if card.ability.extra.counter >= 5 then
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
		end
	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Puppets", HEX('bd0d19'), HEX('4f3d2d'), 1.2 )
 	end
}

-- Puppet Angelica
SMODS.Joker {
	key = 'puppetAngelica',
	name = "Puppet Angelica",
	pronouns = "it_its",
	config = { extra = { mult = 60, counter = 0 } },
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = true,
--	no_collection = true,
	rarity = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 13 },
	cost = 0,
	pools =
	{
        ["Puppet"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { self.config.extra.mult }}
	end,
	calculate = function(self, card, context)
		
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge("Puppets", HEX('bd0d19'), HEX('4f3d2d'), 1.2 )
 	end
}

-- Dummy Ricardo
SMODS.Joker {
	key = 'dummyRicardo',
	name = "Dummy Ricardo",
	pronouns = "it_its",
	config = { extra = { ricardoDefeatCounter = 0, canSpawnRicardo = false, baseChance = 1, maxChance = 3} },
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'wernerChance')
		return { vars = { card.ability.extra.ricardoDefeatCounter, card.ability.extra.canSpawnRicardo, new_numerator, new_denominator } }
	end,
	calculate = function(self, card, context)

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_ricardo" then
--			print("Testing Ricardo increment")
			card.ability.extra.ricardoDefeatCounter = card.ability.extra.ricardoDefeatCounter + 1
			card.ability.extra.canSpawnRicardo = true
		end

		if context.ending_shop and not context.blueprint and G.jokers and card.ability.extra.canSpawnRicardo == true then
			SMODS.add_card({ key = "j_pmcmod_ricardo" })
			if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'wernerChance') then
				SMODS.add_card({ key = "j_pmcmod_werner" })
			end
			card.ability.extra.canSpawnRicardo = false
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}





-- Voice of the City
SMODS.Joker {
	key = 'voiceOfTheCity',
	name = "Voice of the City",
	pronouns = "it_its",
	config = { extra = { prescriptListShuffled = {}, prescriptActive = false, currentPrescript = 0} },
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptActive } }
	end,
	add_to_deck = function(self, card, from_debuff)
        local prescriptListUnshuffled = {"j_pmcmod_prescript1", "j_pmcmod_prescript2", "j_pmcmod_prescript3", "j_pmcmod_prescript4", "j_pmcmod_prescript5", "j_pmcmod_prescript6", "j_pmcmod_prescript7", "j_pmcmod_prescript8", "j_pmcmod_prescript9", "j_pmcmod_prescript10", "j_pmcmod_prescript11"}
		
		card.ability.extra.prescriptListShuffled = Shuffle(prescriptListUnshuffled)
    end,
	calculate = function(self, card, context)

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	
			card.ability.extra.currentPrescript = card.ability.extra.currentPrescript + 1
			card.ability.extra.prescriptActive = false
		end

		if context.ending_shop and card.ability.extra.prescriptActive == false and G.GAME.round_resets.ante > 1 and card.ability.extra.currentPrescript <= 10 then
			SMODS.add_card({ key = card.ability.extra.prescriptListShuffled[card.ability.extra.currentPrescript], stickers = {"eternal"}, force_stickers = true })
			card.ability.extra.prescriptActive = true
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge('The Index', HEX('e0e0e0'), HEX('59a5e3'), 1.2 )
 	end
}

-- Prescript 1
SMODS.Joker {
	key = 'prescript1',
	name = "Prescript",
	pronouns = "it_its",
	config = { extra = {prescriptFullfilled = false, faces = 5} },
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptFullfilled } }
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
				G.GAME.pool_flags.prescript1Extinct = true
				
				if card.ability.extra.prescriptFullfilled then
					return{
						dollars = 15
					}
				else
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
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptFullfilled, card.ability.extra.selectedJokerName } }
	end,
	calculate = function(self, card, context)

		local selectableJokers = {}

		if context.setting_blind and card.ability.extra.jokerSelected == false then
				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal
					then selectableJokers[#selectableJokers+1] = G.jokers.cards[i] end
                end
                card.ability.extra.selectedJoker = #selectableJokers > 0 and pseudorandom_element(selectableJokers, pseudoseed('prescript')) or nil
				if #selectableJokers > 0 then
					card.ability.extra.jokerSelected = true
				end
				card.ability.extra.selectedJokerName = #selectableJokers > 0 and localize{type="name_text", set="Joker", key = card.ability.extra.selectedJoker.config.center.key} or nil
		end

		if context.selling_card and context.card.ability.set == "Joker" and context.card.config.center.key == card.ability.extra.selectedJoker.config.center.key and not context.blueprint then
				card.ability.extra.prescriptFullfilled = true
		end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
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
				G.GAME.pool_flags.prescript2Extinct = true

				if card.ability.extra.prescriptFullfilled == true then
					return{
						dollars = 15
					}
				else
					ease_dollars(-G.GAME.dollars, true)
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
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local cardRank = G.GAME.current_round.reset_prescript_3 or { rank = 'Ace'}
		return { vars = { card.ability.extra.prescriptFullfilled, localize(cardRank.rank, 'ranks'), card.ability.extra.prescriptFailed } }
	end,
	calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and  context.other_card:get_id() == G.GAME.current_round.reset_prescript_3.id then
            card.ability.extra.prescriptFailed = true
        end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
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
				G.GAME.pool_flags.prescript3Extinct = true

				if card.ability.extra.prescriptFailed == true then
					ease_dollars(-G.GAME.dollars, true)
				else
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
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptFullfilled } }
	end,
	calculate = function(self, card, context)


		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint and G.SETTINGS.GAMESPEED == 1 then
			card.ability.extra.prescriptFullfilled = true
		end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
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
				G.GAME.pool_flags.prescript4Extinct = true

				if card.ability.extra.prescriptFullfilled == true then
					return{
						dollars = 15
					}
				else
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
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptFullfilled } }
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
				G.GAME.pool_flags.prescript4Extinct = true

				if card.ability.extra.prescriptFailed == true then
					ease_dollars(-G.GAME.dollars, true)
				else
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
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptFullfilled, card.ability.extra.boosterSkipCount } }
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
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					return{
						dollars = 15
					}
				else
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
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptFullfilled} }
	end,
	calculate = function(self, card, context)


		if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
			if context.card.config.center.rarity == 2 then
				card.ability.extra.prescriptFullfilled = true
            end
        end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
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
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					return{
						dollars = 15
					}
				else
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
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptFullfilled } }
	end,
	calculate = function(self, card, context)


		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and (G.GAME.round_resets.hands - G.GAME.current_round.hands_played) < 1 then
				card.ability.extra.prescriptFullfilled = true
        end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
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
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					return{
						dollars = 15
					}
				else
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
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptFullfilled } }
	end,
	calculate = function(self, card, context)

		if context.debuffed_hand or context.joker_main then
            if G.GAME.blind.triggered then
                card.ability.extra.prescriptFullfilled = true
            end
        end

		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then			
				-- This part plays the animation.
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
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					return{
						dollars = 15
					}
				else
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
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptFullfilled, card.ability.extra.current_consumable_count } }
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
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					return{
						dollars = 15
					}
				else
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
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 9 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.prescriptFullfilled } }
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
				G.GAME.pool_flags.prescript4Extinct = true

				

				if card.ability.extra.prescriptFullfilled == true then
					return{
						dollars = 15
					}
				else
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







-- Children of the Galaxy
SMODS.Joker {
	key = 'childrenOfTheGalaxy',
	name = "Children of The Galaxy",
	pronouns = "they_them",
	config = { extra = {baseChance = 1, maxChance = 4, priceIncrease = 20} },
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.extra.baseChance, card.ability.extra.maxChance} }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
			
			for i = 1, #G.playing_cards do
				G.playing_cards[i]:set_seal()
			end

			for i = 1, #G.playing_cards do
				if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'galaxyChance') then
					G.playing_cards[i]:set_seal('pmcmod_pebble', true)
				end
			end
		end

    end,
	add_to_deck = function(self, card, from_debuff)
        G.GAME.discount_percent = G.GAME.discount_percent - card.ability.extra.priceIncrease
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.discount_percent = G.GAME.discount_percent + card.ability.extra.priceIncrease
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}

-- Laetitia
SMODS.Joker {
	key = 'laetitia',
	name = "Laetitia",
	pronouns = "they_them",
	config = { extra = {baseChance = 1, maxChance = 10} },
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local gift_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if playing_card.seal == "pmcmod_gift" then gift_tally = gift_tally + 1 end
				end
			end
		return { vars = { gift_tally, card.ability.extra.baseChance, card.ability.extra.maxChance } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

			local gift_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if playing_card.seal == "pmcmod_gift" then gift_tally = gift_tally + 1 end
				end
			end

			if G.GAME.round_resets.ante > 1 then

				if gift_tally > 0 then
					ease_dollars(-gift_tally*10)
				else  
					G.E_MANAGER:add_event(Event({
					func = (function()
						add_tag(Tag('tag_standard'))
						play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
						play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
						return true
					end)
					}))
					G.E_MANAGER:add_event(Event({
					func = (function()
						add_tag(Tag('tag_charm'))
						play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
						play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
						return true
					end)
					}))
					G.E_MANAGER:add_event(Event({
					func = (function()
						add_tag(Tag('tag_meteor'))
						play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
						play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
						return true
					end)
					}))
					G.E_MANAGER:add_event(Event({
					func = (function()
						add_tag(Tag('tag_buffoon'))
						play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
						play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
						return true
					end)
					}))
				end
			end

			for i = 1, #G.playing_cards do
				G.playing_cards[i]:set_seal()
			end

			for i = 1, #G.playing_cards do
				if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'laetitiaChance') then
					G.playing_cards[i]:set_seal('pmcmod_gift', true)
				end
			end
		end

    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}


-- Censored
SMODS.Joker {
	key = 'censored',
	name = "[CENSORED]",
	pronouns = "it_its",
	config = { extra = {} },
	no_collection = true,    --In testing
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,
	calculate = function(self, card, context)


    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}


-- Ryoshu
SMODS.Joker {
	key = 'ryoshu',
	name = "Ryoshu",
	pronouns = "she_her",
	config = { extra = {xmult = 1, xmult_mod = 0.1} },
	no_collection = false,
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 8, y = 14 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod } }
	end,
	calculate = function(self, card, context)

		if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
			local keypageKey = context.card.config.center.key
			G.GAME.banned_keys[keypageKey] = true
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
        end

		if context.joker_main then
			return{
				xmult = card.ability.extra.xmult
			}
		end

    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}