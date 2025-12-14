-----------
-- BACKS --
-----------

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


-- The Middle Deck 
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


-- The Ring Deck
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

-- Index Deck
SMODS.Back {
    key = "indexDeck",
	name = "The Index Deck",
    config = { joker_slot = 2},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 6, y = 1 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands, self.config.discards, self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_voiceOfTheCity", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_yellow') > 4
    end
}


-- Silent Deck
SMODS.Back {
    key = "silenceDeck",
	name = "Silent Deck",
    config = { hands = 2, discards = 2, joker_slot = 2},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 1, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands, self.config.discards, self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_silence", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_ghost') > 4
    end
}

-- Shy Deck
SMODS.Back {
    key = "todaysShyLookDeck",
	name = "Shy Deck",
    config = { joker_slot = 1},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands, self.config.discards, self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_shylook", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_zodiac') > 4
    end
}

-- Hatred Deck
SMODS.Back {
    key = "hatredDeck",
	name = "Love Deck",
    config = { hands = 1, discards = 1, joker_slot = 1},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 3, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands, self.config.discards, self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_queenOfHatred", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_yellow') > 4
    end
}

-- Serpent Deck
SMODS.Back {
    key = "serpentDeck",
	name = "Serpent Deck",
    config = { hands = 1},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 2, y = 0 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands } } --Chesed - 1 more hands
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
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_black') > 4
    end
}

-- Galaxy Deck
SMODS.Back {
    key = "galaxyDeck",
	name = "Galaxy Deck",
    config = { joker_slot = 1, extra_hand_bonus = 0, extra_discard_bonus = 0, no_interest = true},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 1, y = 1 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.joker_slot } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_childrenOfTheGalaxy", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_green') > 4
    end
}

-- Gift Deck
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

-- Censored Deck
SMODS.Back {
    key = "censoredDeck",
	name = "Censored Deck",
    config = { hands = 4, joker_slot = 1},
    unlocked = false,
    atlas = 'ModdedProjectMoonEditions',
    pos = { x = 2, y = 1 },
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.hands } }
    end,
	apply = function(self, back)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({ key = "j_pmcmod_censored", stickers = { "eternal" }, force_stickers = true })
					return true
				end
			end,
		}))
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_red') > 4
    end
}