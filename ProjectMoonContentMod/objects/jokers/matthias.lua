SMODS.Joker {
	key = 'matthias',
	name = "Matthias",
	pronouns = "he_him",
	config = { extra = { hands = 1, dollarsBase = 2, kiraDeathCounter = 0, kiraPresent = false, kiraPos = nil } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 6, y = 5 },
	attributes = {'economy', 'burn', 'destroy_card', 'scaling', 'position'},
    pools =
	{
		["Middle"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		local burn_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_burn') then burn_tally = burn_tally + 1 end
				end
			end
        return {vars = { card.ability.extra.hands, card.ability.extra.dollarsBase, card.ability.extra.dollarsBase * burn_tally, card.ability.extra.kiraDeathCounter } }
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.kiraPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_kira" then
						card.ability.extra.kiraPresent = true
						card.ability.extra.kiraPos = i
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and #context.scoring_hand <= 3 and G.GAME.current_round.hands_played == 0 then
			
			
			local burn_tally = 0
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_burn') then burn_tally = burn_tally + 1 end
				end
			end

			

			if card.ability.extra.dollarsBase * burn_tally <= G.GAME.dollars then
				context.other_card:set_ability("m_pmcmod_burn", nil, true)
				if card.ability.extra.kiraPresent then
					card.ability.extra.kiraDeathCounter = card.ability.extra.kiraDeathCounter + 1
				else
					ease_dollars (-card.ability.extra.dollarsBase * burn_tally)
				end

				if card.ability.extra.kiraDeathCounter >= 5 then
					G.GAME.banned_keys["j_pmcmod_kira"] = true
					local kira = G.jokers.cards[card.ability.extra.kiraPos]
                    kira.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        kira:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				end
			end
		end

    end,
	add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	get_weight = function(self, weight)
    	return weight*(2^(#SMODS.find_card('j_pmcmod_kira')*G.GAME.round_resets.ante))
	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_flower_pot" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}