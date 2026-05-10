SMODS.Joker {
	key = 'alan',
	name = "Alan",
	pronouns = "he_him",
	config = { spotSelected = 0, jokerSelected = "None", jokerName = "None", jokerSelectedFlag = false, jokerFailed = false, counter = 0 },
	unlocked = true,
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = false,	
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 7 },
	attributes = {'edition', 'painted'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.spotSelected, card.ability.jokerName, card.ability.counter  } }
	end,
	calculate = function(self, card, context)

		local availableJokers = {}
		local possible_editions = {'e_foil', 'e_holo', 'e_polychrome', 'e_pmcmod_charge'}

		

		if context.setting_blind and #G.jokers.cards > 1 and card.ability.jokerSelectedFlag == false and not context.blueprint then

			for i=1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal then
					if not G.jokers.cards[i].edition then
						print(G.jokers.cards[i].config.center.key)
						availableJokers[#availableJokers+1] = G.jokers.cards[i]
					end
				end
			end

			local joker_count = 0
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					if not G.jokers.cards[i].edition then
						if G.jokers.cards[i].ability.set == 'Joker' then
							joker_count = joker_count + 1
						end
					end
				end
			end

			if joker_count < 1 then

				G.E_MANAGER:add_event(Event({
					func = function()
					
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true

						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				G.GAME.pool_flags.alan_extinct = true
				return {
					message = 'The job is done'
				}
			else
				local cardToSelect = #availableJokers > 0 and pseudorandom_element(availableJokers, pseudoseed('alan')) or nil

				card.ability.spotSelected = math.random(1,#G.jokers.cards)
				card.ability.jokerSelected = cardToSelect
				card.ability.jokerSelectedFlag = true
				card.ability.jokerName = localize { type = 'name_text', set = "Joker", key = card.ability.jokerSelected.config.center.key }
			end

			
		end


		if context.joker_main and card.ability.jokerSelectedFlag and not context.blueprint then
			local selectedJokerPos = nil

			for i=1, #G.jokers.cards do

				if G.jokers.cards[i]== card.ability.jokerSelected then
					selectedJokerPos = i
					break
				end
			end


			if card.ability.spotSelected == selectedJokerPos then
				card.ability.counter = card.ability.counter + 1
			else
				card.ability.jokerFailed = true
			end

			if card.ability.counter >= 5 then
				G.jokers.cards[selectedJokerPos]:set_edition(pseudorandom_element(possible_editions, pseudoseed('alan')), nil, true)

				card.ability.jokerSelectedFlag = false
				card.ability.jokerSelected = nil
				card.ability.spotSelected = nil
				card.ability.counter = 0
			end

		end
	
		if context.end_of_round and context.game_over == false and context.main_eval and card.ability.jokerSelectedFlag and card.ability.jokerFailed and not context.blueprint then
			local selectedJokerPos = nil

			for i=1, #G.jokers.cards do
				if #G.jokers.cards[i] == card.ability.jokerSelected then
					selectedJokerPos = i
					break
				end
			end

			local joker_to_destroy = card.ability.jokerSelected

			if card.ability.jokerSelected and not (context.blueprint_card or self).getting_sliced then
				card.ability.jokerSelectedFlag = false
				card.ability.jokerSelected = nil
				card.ability.spotSelected = nil
				card.ability.counter = 0
				joker_to_destroy.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.8, 0.8)
					joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end

		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
		
		local valencinaUnlocked = false
		local rienUnlocked = false
		local matthiasUnlocked = false
		local callistoUnlocked = false
		local shiomiYoruUnlocked = false

        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_valencina" then
                if get_joker_win_sticker(v, true) >= 1 then
                    valencinaUnlocked = true
                end
            end

			if v.key == "j_pmcmod_rien" then
                if get_joker_win_sticker(v, true) >= 1 then
                    rienUnlocked = true
                end
            end

			if v.key == "j_pmcmod_matthias" then
                if get_joker_win_sticker(v, true) >= 1 then
                    matthiasUnlocked = true
                end
            end

			if v.key == "j_pmcmod_callisto" then
                if get_joker_win_sticker(v, true) >= 1 then
                    callistoUnlocked = true
                end
            end

			if v.key == "j_pmcmod_shiomiYoru" then
                if get_joker_win_sticker(v, true) >= 1 then
                    shiomiYoruUnlocked = true
                end
            end
        end

		if valencinaUnlocked and rienUnlocked and matthiasUnlocked and callistoUnlocked and shiomiYoruUnlocked then
			return true
		end

    end
}