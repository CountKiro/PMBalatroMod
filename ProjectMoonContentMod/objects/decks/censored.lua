SMODS.Back {
    key = "censoredDeck",
	name = "Censored Deck",
    config = { hands = 4, joker_slot = 1},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 2, y = 1 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_censored", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_red') > 4
    end
}