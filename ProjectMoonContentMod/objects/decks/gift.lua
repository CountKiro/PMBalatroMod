SMODS.Back {
    key = "giftDeck",
	name = "Gift Deck",
    config = { hands = 2, joker_slot = 1},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 0, y = 1 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_laetitia", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_zodiac') > 4
    end
}