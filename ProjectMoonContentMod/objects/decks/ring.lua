SMODS.Back {
    key = "ringDeck",
	name = "The Ring Deck",
    config = { },
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 6, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = {  } }
    end,
	apply = function(self, back)
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
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_green') > 4
    end
}