SMODS.Back {
    key = "hatredDeck",
	name = "Love Deck",
    config = { hands = 1, discards = 1, joker_slot = 1},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 3, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands, self.config.discards, self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_queenOfHatred", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_yellow') > 4
    end
}