SMODS.Joker {
	key = 'rien',
	name = "Rien",
	pronouns = "he_him",
	config = { extra = { mult = 0, mult_mod = 15,  prescriptListShuffled = {}, prescriptActive = false, currentPrescript = 0, soraPresent = false, soraPos = nil, soraDeathCounter = 0, allowPrescriptCheck = false } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 5 },
	attributes = {'mult', 'economy', 'destroy_card', 'destroy_itself', 'scaling', 'position'},
    pools =
	{
		["Index"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, card.ability.extra.soraDeathCounter, card.ability.extra.mult_mod, } }
	end,
	add_to_deck = function(self, card, from_debuff)
		
		-- Shuffles prescripts
        local prescriptListUnshuffled = {"j_pmcmod_prescript1", "j_pmcmod_prescript2", "j_pmcmod_prescript3", "j_pmcmod_prescript4", "j_pmcmod_prescript5", "j_pmcmod_prescript6", "j_pmcmod_prescript7", "j_pmcmod_prescript8", "j_pmcmod_prescript9", "j_pmcmod_prescript10", "j_pmcmod_prescript11"}
		card.ability.extra.prescriptListShuffled = Shuffle(prescriptListUnshuffled)
    end,
	calculate = function(self, card, context)


		if context.joker_type_destroyed then


			card.ability.extra.soraPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_sora" then
						card.ability.extra.soraPresent = true
						card.ability.extra.soraPos = i
					end
				end
			end		


			for i=1, #card.ability.extra.prescriptListShuffled do
				--print("cardDestroyed")
				if context.card.config.center.key == card.ability.extra.prescriptListShuffled[i] then
					--print("prescript destroyed")
					if context.card.prescriptFullfilled then
						--print("prescript fullfilled")
						if card.ability.extra.soraPresent then
							card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_mod * 2)
							card.ability.extra.soraDeathCounter = card.ability.extra.soraDeathCounter + 1
						else
							card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
						end
					else
						card.getting_sliced = true
						G.E_MANAGER:add_event(Event({func = function()
							card:juice_up(0.8, 0.8)
							card:start_dissolve({G.C.RED}, nil, 1.6)
						return true end }))
					end
				end
			end


			

			if card.ability.extra.soraDeathCounter >= 3 and card.ability.extra.soraPresent then

				for i = 1, #G.jokers.cards do
					if G.jokers.cards[i] == card then
						card.ability.extra.currentPosition = i
						break
					end
				end

				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_sora" then
						card.ability.extra.soraPos = i
					end
				end
				G.GAME.banned_keys["j_pmcmod_sora"] = true
				local sora = G.jokers.cards[card.ability.extra.soraPos]
				card.ability.extra.soraDeathCounter = 0
				sora.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.8, 0.8)
					sora:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end


		end

		-- Increase the prescript counter at the end of the boss
		if context.end_of_round and not context.repetition and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then	

			

			card.ability.extra.currentPrescript = card.ability.extra.currentPrescript + 1
			card.ability.extra.prescriptActive = false
			card.ability.extra.allowPrescriptCheck = true
			
			if card.ability.extra.currentPrescript >= 12 then
				card.ability.extra.currentPrescript = 1
			end
			
		end
		
		

		-- Spawn the next prescript
		if context.ending_shop and card.ability.extra.prescriptActive == false and card.ability.extra.allowPrescriptCheck and card.ability.extra.currentPrescript <= 11 then
			SMODS.add_card({ key = card.ability.extra.prescriptListShuffled[card.ability.extra.currentPrescript], stickers = {"eternal"}, force_stickers = true })
			card.ability.extra.prescriptActive = true
		end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	get_weight = function(self, weight)
    	return weight*(2^(#SMODS.find_card('j_pmcmod_sora')*G.GAME.round_resets.ante))
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