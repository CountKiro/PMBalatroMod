SMODS.Back {
    key = "galaxyDeck",
	name = "Galaxy Deck",
    config = { joker_slot = 1, extra_hand_bonus = 0, extra_discard_bonus = 0, no_interest = true},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 1, y = 1 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_childrenOfTheGalaxy", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_green') > 4
    end
}