-- Small Puppet
SMODS.Joker {
	key = 'puppetA',
	name = "Puppet",
	pronouns = "it_its",
	config = { extra = { mult = 10, counter = 0 } },
	eternal_compat = false,
	perishable_compat = true,
    blueprint_compat = true,
    --	no_collection = true,
	rarity = 1,
    cost = 0,
	atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 13 },
	attributes = {'mult', 'destroy_itself'},
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_puppets'), HEX('bd0d19'), HEX('4f3d2d'), 1.2 )
 	end
}

-- Medium Puppet
SMODS.Joker {
	key = 'puppetB',
	name = "Nimble Puppet",
	pronouns = "it_its",
	config = { extra = { mult = 20, counter = 0 } },
	eternal_compat = false,
	perishable_compat = true,
    blueprint_compat = true,
    --	no_collection = true,
	rarity = 2,
    cost = 0,
	atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 13 },
	attributes = {'mult', 'destroy_itself'},
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_puppets'), HEX('bd0d19'), HEX('4f3d2d'), 1.2 )
 	end
}

-- Big Puppet
SMODS.Joker {
	key = 'puppetC',
	name = "Weighty Puppet",
	pronouns = "it_its",
	config = { extra = { mult = 30, counter = 0 } },
	eternal_compat = false,
	perishable_compat = true,
    blueprint_compat = true,
--	no_collection = true,
	rarity = 3,
	cost = 0,
	atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 13 },
	attributes = {'mult', 'destroy_itself'},
--	no_collection = true,
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_puppets'), HEX('bd0d19'), HEX('4f3d2d'), 1.2 )
 	end
}

-- Puppet Angelica
SMODS.Joker {
	key = 'puppetAngelica',
	name = "Puppet Angelica",
	pronouns = "it_its",
	config = { extra = { mult = 40, counter = 0 } },
	eternal_compat = false,
	perishable_compat = true,
    blueprint_compat = true,
--	no_collection = true,
	rarity = 3,
	cost = 0,
	atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 13 },
	attributes = {'mult', 'destroy_itself'},
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_puppets'), HEX('bd0d19'), HEX('4f3d2d'), 1.2 )
 	end
}