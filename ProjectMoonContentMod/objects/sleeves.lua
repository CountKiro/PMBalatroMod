SMODS.Atlas {
    key = 'projectMoonSleeves',
    path = "modCompat/projectMoonSleeves.png",
    px = 73,
    py = 95,
}

CardSleeves.Sleeve {
        key = "thumbDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 0, y = 0 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            G.GAME.edition_rate = G.GAME.edition_rate + 2
        end,
		unlock_condition = { deck = "b_pmcmod_thumbDeck", stake = "stake_white" },
}

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

CardSleeves.Sleeve {
        key = "todaysShyLookDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 4, y = 0 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_shylook", stickers = { "eternal" }, force_stickers = true  })
					return true
				end
			end,
		}))
        end,
		unlock_condition = { deck = "b_pmcmod_todaysShyLookDeck", stake = "stake_white" },
}

CardSleeves.Sleeve {
        key = "hatredDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 0, y = 1 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_queenOfHatred", stickers = { "eternal" }, force_stickers = true  })
					return true
				end
			end,
		}))
        end,
		unlock_condition = { deck = "b_pmcmod_hatredDeck", stake = "stake_white" },
}

CardSleeves.Sleeve {
        key = "galaxyDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 3, y = 1 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_childrenOfTheGalaxy", stickers = { "eternal" }, force_stickers = true  })
					return true
				end
			end,
		}))
        end,
		unlock_condition = { deck = "b_pmcmod_galaxyDeck", stake = "stake_white" },
}

CardSleeves.Sleeve {
        key = "giftDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 2, y = 1 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_laetitia", stickers = { "eternal" }, force_stickers = true  })
					return true
				end
			end,
		}))
        end,
		unlock_condition = { deck = "b_pmcmod_giftDeck", stake = "stake_white" },
}

CardSleeves.Sleeve {
        key = "censoredDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 4, y = 1 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_censored", stickers = { "eternal" }, force_stickers = true  })
					return true
				end
			end,
		}))
        end,
		unlock_condition = { deck = "b_pmcmod_censoredDeck", stake = "stake_white" },
}

CardSleeves.Sleeve {
        key = "serpentDeck",
        atlas = "projectMoonSleeves",
        pos = { x = 1, y = 1 },
		unlocked = false,
        config = {
        },
        apply = function(self, sleeve)
            
        end,
        calculate = function(self, back, context)

        if context.context == 'eval' and G.GAME.last_blind and G.GAME.last_blind.boss then

			--Gebura - 1 more discard
            if G.GAME.round_resets.ante == 2 then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
				G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 2
			end

			--Hokma - increased spectral chance
			if G.GAME.round_resets.ante == 3 then
				G.GAME.spectral_rate = 2
			end

			--Netzach - money per remaining discards
			if G.GAME.round_resets.ante == 4 then
				G.GAME.modifiers.money_per_hand = 2
        		G.GAME.modifiers.money_per_discard = 1
			end

			--Binah - reroll cost
			if G.GAME.round_resets.ante == 5 then
				G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - 2
			end

			--Tiphereth - interest cap
			if G.GAME.round_resets.ante == 6 then
				if G.GAME.interest_cap < 50 then
				   G.GAME.interest_cap = 50
				end
				if G.GAME.interest_cap == 50 then
				   G.GAME.interest_cap = 100
				end
				if G.GAME.interest_cap == 100 then
				   G.GAME.interest_cap = 150
				end
			end

			--Hod - hand size
			if G.GAME.round_resets.ante == 7 then
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + 1
			end

			--Malkuth - shop limit
			if G.GAME.round_resets.ante == 8 then
				G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
			end

			--Yesod - chance of new edition
			if G.GAME.round_resets.ante == 9 then
				G.GAME.edition_rate = 2
			end

			--Roland - joker slot
			if G.GAME.round_resets.ante == 10 then
				G.jokers.config.card_limit = G.jokers.config.card_limit + 1
			end
        end
    end,
	unlock_condition = { deck = "b_pmcmod_serpentDeck", stake = "stake_white" },
}