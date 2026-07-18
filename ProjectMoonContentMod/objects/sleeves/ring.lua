CardSleeves.Sleeve {
        key = "ringDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 2, y = 0 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card {set = 'Joker'}
					SMODS.add_card {set = 'Joker'}
					SMODS.add_card {set = 'Joker'}
					SMODS.add_card {set = 'Joker'}
					SMODS.add_card {set = 'Joker'}
					return true
				end
			end,
		}))
        end,
        calculate = function (self, back, context)
		if context.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then
			for i=1, #G.jokers.cards do
				G.jokers.cards[i].getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        G.jokers.cards[i]:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
			end
			G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card {set = 'Joker'}
					SMODS.add_card {set = 'Joker'}
					SMODS.add_card {set = 'Joker'}
					SMODS.add_card {set = 'Joker'}
					SMODS.add_card {set = 'Joker'}
					return true
				end
			end,
			}))
		end
	end,
	unlock_condition = { deck = "b_pmcmod_ringDeck", stake = "stake_white" },
}