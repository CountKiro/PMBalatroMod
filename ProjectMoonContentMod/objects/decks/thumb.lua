-- The Thumb Deck
SMODS.Back {
    key = "thumbDeck",
	name = "The Thumb Deck",
    config = { dollars = 100, extra_hand_bonus = 0, extra_discard_bonus = 0, no_interest = true},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 4, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.dollars } }
    end,
	apply = function(self, back)
		G.GAME.edition_rate = G.GAME.edition_rate + 2
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_blue') > 4
    end
}
