CardSleeves.Sleeve {
        key = "thumbDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 0, y = 0 },
		unlocked = false,
        config = { dollars = 100, extra_hand_bonus = 0, extra_discard_bonus = 0, no_interest = true},
		loc_vars = function(self)
        local key, vars
			if self.get_current_deck_key() == "b_pmcmod_thumbDeck" then
				self.config = { dollars = 200}
				vars = { self.config.dollars }
			else
				self.config = { dollars = 100}
				vars = { self.config.dollars }
			end
			return { key = key, vars = vars }
    	end,
        apply = function(self, sleeve)
            G.GAME.edition_rate = G.GAME.edition_rate + 2
			G.GAME.starting_params.dollars = G.GAME.starting_params.dollars + 100
        end,
		unlock_condition = { deck = "b_pmcmod_thumbDeck", stake = "stake_white" },
}