SMODS.Joker {
	key = 'xianrenA',
	name = "Xianren A",
	pronouns = 'they_them',
	config = { extra = { dollars = 10 } },
	unlocked = false,
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 9, y = 2 },
	attributes = {'transform', 'economy'},
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
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_jiaMu" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_HCorp'), HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Xianren B
SMODS.Joker {
	key = 'xianrenB',
	name = "Xianren B",
	pronouns = 'they_them',
	config = { extra = { mult = 30, chips = 50  } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 0, y = 3 },
	attributes = {'transform', 'mult', 'chips'},
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
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_jiaMu" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_HCorp'), HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Xianren C
SMODS.Joker {
	key = 'xianrenC',
	name = "Xianren C",
	pronouns = 'they_them',
	config = { extra = { xmult = 1.15 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 1, y = 3 },
	attributes = {'transform', 'xmult'},
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
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_jiaMu" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_HCorp'), HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Xianren D
SMODS.Joker {
	key = 'xianrenD',
	name = "Xianren D",
	pronouns = 'they_them',
	config = { extra = { repetitions = 1 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 3 },
	attributes = {'transform', 'retrigger'},
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
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_jiaMu" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_HCorp'), HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Xianren E
SMODS.Joker {
	key = 'xianrenE',
	name = "Xianren E",
	pronouns = 'they_them',
	config = { extra = {  } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 7 },
	attributes = {'transform'},
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
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_jiaMu" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_HCorp'), HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}

--Xianren F
SMODS.Joker {
	key = 'xianrenF',
	name = "Xianren F",
	pronouns = 'they_them',
	config = { extra = { sell_value = 3 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 3 },
	attributes = {'transform', 'economy'},
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
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_jiaMu" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_HCorp'), HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
}