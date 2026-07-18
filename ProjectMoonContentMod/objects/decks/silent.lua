SMODS.Back {
    key = "silenceDeck",
	name = "Silent Deck",
    config = { hands = 2, discards = 2, joker_slot = 2},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands, self.config.discards, self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_silence", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_ghost') > 4
    end
}