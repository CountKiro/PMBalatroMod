CardSleeves.Sleeve {
        key = "silenceDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 3, y = 0 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_silence", stickers = { "eternal" }, force_stickers = true  })
					return true
				end
			end,
		}))
        end,
		unlock_condition = { deck = "b_pmcmod_silenceDeck", stake = "stake_white" },
}