SMODS.Joker {
	key = 'arayaKid',
	name = "Araya (Child)",
	pronouns = "she_her",
	config = { chips = 20, counters = {playedCards = 0, discardedCards = 0, moneyUsed = 0} },
	unlocked = false,
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 8, y = 6 },
	attributes = {'chips', 'transform', 'discard', 'economy'},
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
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
	config = { permaChips_mod = 6, counters = {playedCards = 0, discardedCards = 0, moneyUsed = 0} },
	unlocked = true,
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 9, y = 6 },
	attributes = {'chips', 'perma_bonus', 'scaling', 'discard'},
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
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
}

--Araya (Young Adult)
SMODS.Joker {
	key = 'arayaYA',
	name = "Araya (Young Adult)",
	pronouns = "she_her",
	config = { permaMult_mod = 3, counters = {playedCards = 0, discardedCards = 0, moneyUsed = 0} },
	unlocked = true,
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 0, y = 7 },
	attributes = {'mult', 'perma_bonus', 'scaling', 'discard'},
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
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
}

--Araya (Adult)
SMODS.Joker {
	key = 'arayaAdult',
	name = "Araya (Adult)",
	pronouns = "she_her",
	config = { permaDollars_mod = 1, counters = {playedCards = 0, discardedCards = 0, moneyUsed = 0} },
	unlocked = true,
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 1, y = 7 },
	attributes = {'economy', 'perma_bonus', 'scaling', 'discard'},
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
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
}