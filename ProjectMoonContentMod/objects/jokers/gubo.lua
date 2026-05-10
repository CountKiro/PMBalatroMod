SMODS.Joker {
    key = "gubo",
	name = "Gubo",
	pronouns = "he_him",
	config = {extra = {mult = 0, commonMult = 4, uncommonMult = 8, odds = 2, selected_keypage = "", aimingAtJoker = false, joker_to_destroy = {}}},
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 9,
	atlas = 'ModdedProjectMoon',
    pos = { x = 1, y = 1 },
	attributes = {'mult', 'scaling', 'destroy_card', 'destroy_itself', 'chance'},
    pools = 
	{
 		["NewLeagueOfNine"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, card.ability.extra.commonMult, card.ability.extra.uncommonMult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.selected_keypage } }
    end,
	calculate = function(self, card, context)
		local destructable_jokers = {}
		local aimingAtJoker = false
		if context.setting_blind and not card.getting_sliced and (pseudorandom('gubo') < G.GAME.probabilities.normal / card.ability.extra.odds) and not context.blueprint then
--			print("enteredAimingPhase")
				for i = 1, #G.jokers.cards do
					for j = 1, #G.P_CENTER_POOLS.Sinners do
						if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and 
						(G.P_CENTER_POOLS.Sinners[j].key == G.jokers.cards[i].config.center.key)
						then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
					end
                end
                for i = 1, #G.jokers.cards do
					for j = 1, #G.P_CENTER_POOLS.NewLeagueOfNine do
						if (G.jokers.cards[i] ~= card and (G.jokers.cards[i].config.center.rarity <= 2) and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced and
						(G.P_CENTER_POOLS.NewLeagueOfNine[j].key ~= G.jokers.cards[i].config.center.key)) or (G.jokers.cards[i].config.center.key == "j_family") then 
							destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] 
						end
					end
                end
                card.ability.extra.joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('gubo')) or nil
				card.ability.extra.aimingAtJoker = true
				card.ability.extra.selected_keypage = #destructable_jokers > 0 and localize{type="name_text", set="Joker", key = card.ability.extra.joker_to_destroy.config.center.key} or nil
				play_sound('pmcmod_gubo_aim', 0.9, 0.9)
				
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and card.ability.extra.joker_to_destroy then
			
			local sinnerDetected = false
			local keypageStillDetected = false
			local vergiliusDetected = false
			if card.ability.extra.aimingAtJoker then
				for i = 1, #G.jokers.cards do
						if G.jokers.cards[i].config.center.key == card.ability.extra.joker_to_destroy.config.center.key then 
							keypageStillDetected = true 
						end
				end
				if card.ability.extra.joker_to_destroy.config.center.key == "j_family" then
					vergiliusDetected = true
				end
			end

			

			if vergiliusDetected == true then
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
				G.GAME.pool_flags.gubo_extinct = true
				return {
					message = 'Shit!'
				}
			end
			

			if keypageStillDetected and not vergiliusDetected and card.ability.extra.aimingAtJoker == true and not (context.blueprint_card or self).getting_sliced then
--				print("enteredShootingPhase")
				if card.ability.extra.joker_to_destroy.config.center.rarity == 1 then
					for j = 1, #G.P_CENTER_POOLS.Sinners do
						if G.P_CENTER_POOLS.Sinners[j].key == card.ability.extra.joker_to_destroy.config.center.key then
							sinnerDetected = true
						end
					end
					if sinnerDetected == true then
						card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.commonMult * 2)
						sinnerDetected = false
					else
						card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.commonMult)
					end
				end
				if card.ability.extra.joker_to_destroy.config.center.rarity == 2 then
					for j = 1, #G.P_CENTER_POOLS.Sinners do
						if G.P_CENTER_POOLS.Sinners[j].key == card.ability.extra.joker_to_destroy.config.center.key then
							sinnerDetected = true
						end
					end
					if sinnerDetected == true then
						card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.uncommonMult * 2)
						sinnerDetected = false
					else
						card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.uncommonMult)
					end
				end
				card.ability.extra.joker_to_destroy.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.8, 0.8)
					play_sound('pmcmod_gubo_shoot', 0.9, 0.9)
					card.ability.extra.joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end

		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 5
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_newLeagueOfNine'), HEX('242b45'), HEX('d5001e'), 1.2 )
 	end
}