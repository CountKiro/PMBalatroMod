-- Bongy A
SMODS.Joker {
	key = 'chickenA',
	name = "Chicken A",
	pronouns = "it_its",
	config = { extra = { roundsCompleted = 0 } },
	no_collection = true,
	unlocked = true,
	eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 0,
	atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 14 },
	attributes = {'summon', 'destroy_itself'},
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_foodMaybe'), G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Bongy B
SMODS.Joker {
	key = 'chickenB',
	name = "Chicken B",
	pronouns = "it_its",
	config = { extra = { handsUsed = 0 } },
	no_collection = true,
	unlocked = true,
	eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 0,
	atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 14 },
	attributes = {'summon', 'destroy_itself'},
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_foodMaybe'), G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Bongy C
SMODS.Joker {
	key = 'chickenC',
	name = "Chicken C",
	pronouns = "it_its",
	config = { extra = { discardsUsed = 0 } },
	no_collection = true,
	unlocked = true,
	eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 0,
	atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 14 },
	attributes = {'summon', 'destroy_itself'},
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_foodMaybe'), G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}

-- Bongy D
SMODS.Joker {
	key = 'chickenD',
	name = "Chicken D",
	pronouns = "it_its",
	config = { extra = { boostersOpened = 0 } },
	no_collection = true,
	unlocked = true,
	eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 0,
	atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 14 },
	attributes = {'summon', 'destroy_itself'},
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_foodMaybe'), G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end
}