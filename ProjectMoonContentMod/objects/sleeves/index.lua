CardSleeves.Sleeve {
        key = "indexDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 0, y = 2 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_voiceOfTheCity", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
        end,
	unlock_condition = { deck = "b_pmcmod_indexDeck", stake = "stake_white" },
}