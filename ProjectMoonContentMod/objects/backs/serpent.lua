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