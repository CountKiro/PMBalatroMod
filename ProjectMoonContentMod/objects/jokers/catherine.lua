SMODS.Joker {
	key = 'catherine',
	name = "Catherine",
	pronouns = "she_her",
	config = {},
	perishable_compat = true,
	eternal_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 6, y = 4 },
	attributes = {'summoning'},
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
	get_weight = function(self, weight)
    	return weight*(2^((#SMODS.find_card('j_pmcmod_heathcliff') + #SMODS.find_card('j_hit_the_road'))*G.GAME.round_resets.ante * 2))
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_wuthering'), HEX('3d2920'), HEX('998277'), 1.2 )
 	end
}