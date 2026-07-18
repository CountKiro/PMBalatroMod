SMODS.Back {
    key = "middleDeck",
	name = "The Middle Deck",
    config = { extra_hand_bonus = 3},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 5, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands } }
    end,
	apply = function(self, back)
		G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 2
		
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_red') > 4
    end
}