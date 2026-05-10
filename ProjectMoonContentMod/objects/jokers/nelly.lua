SMODS.Joker {
	key = 'nelly',
	name = "Nelly",
	pronouns = "she_her",
	config = {},
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 5 },
	attributes = {'summoning', 'negative', 'stickers'},
    pools =
	{
		["NewLeagueOfNine"] = true,
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_wuthering'), HEX('3d2920'), HEX('998277'), 1.2 )
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