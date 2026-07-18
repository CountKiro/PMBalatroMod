CardSleeves.Sleeve {
        key = "middleDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 1, y = 0 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 2
        end,
		unlock_condition = { deck = "b_pmcmod_middleDeck", stake = "stake_white" },
}