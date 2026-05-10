SMODS.Joker {
	key = 'emile',
	name = "Emile",
	pronouns = "she_her",
	config = { },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 7 },
	attributes = {'enhanced', 'painted'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_painted
        return {vars = {   } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then

			local painted_pos = nil
			local paintedDetected = false
			local multDetected = false
			local bonusDetected = false
			local steelDetected = false
			local goldDetected = false
			local stoneDetected = false
			local bleedDetected = false
			local ruptureDetected = false


			if #context.full_hand == 1 and SMODS.has_enhancement(context.full_hand[1], 'm_wild') and G.GAME.current_round.hands_played == 0 then
				local paintedCard = context.full_hand[1]
				paintedCard:set_ability('m_pmcmod_painted', nil, true)
				G.E_MANAGER:add_event(Event({
					func = function()
						paintedCard:juice_up()
						return true
					end
				}))
			end

			for i=1, #context.full_hand do
				if SMODS.has_enhancement(context.full_hand[i], 'm_pmcmod_painted') then
					paintedDetected = true
					painted_pos = i
				end
			
			end

			if paintedDetected then
				for i=1, #context.full_hand do
					
					if SMODS.has_enhancement(context.full_hand[i], 'm_mult') then
						
						if context.full_hand[painted_pos].ability.multCollected == false and paintedDetected == true then
							context.full_hand[painted_pos].ability.mult = context.full_hand[painted_pos].ability.mult + 10
							context.full_hand[painted_pos].ability.multCollected = true
							context.full_hand[i]:set_ability('c_base', nil, true)
						end

					end

					if SMODS.has_enhancement(context.full_hand[i], 'm_bonus') then

						if context.full_hand[painted_pos].ability.bonusCollected == false and paintedDetected == true then
							context.full_hand[painted_pos].ability.bonus = context.full_hand[painted_pos].ability.bonus + 30
							context.full_hand[painted_pos].ability.bonusCollected = true
							context.full_hand[i]:set_ability('c_base', nil, true)
						end

					end

					if SMODS.has_enhancement(context.full_hand[i], 'm_steel') then

						if context.full_hand[painted_pos].ability.steelCollected == false and paintedDetected == true then
							context.full_hand[painted_pos].ability.h_x_mult = 1.5
							context.full_hand[painted_pos].ability.steelCollected = true
							context.full_hand[i]:set_ability('c_base', nil, true)
						end

					end

					if SMODS.has_enhancement(context.full_hand[i], 'm_gold') then

						if context.full_hand[painted_pos].ability.goldCollected == false and paintedDetected == true then
							context.full_hand[painted_pos].ability.h_dollars = 3
							context.full_hand[painted_pos].ability.goldCollected = true
							context.full_hand[i]:set_ability('c_base', nil, true)
						end

					end

					if SMODS.has_enhancement(context.full_hand[i], 'm_stone') then

						if context.full_hand[painted_pos].ability.stoneCollected == false and paintedDetected == true then
							context.full_hand[painted_pos].ability.bonus = context.full_hand[painted_pos].ability.bonus + 50
							context.full_hand[painted_pos].ability.stoneCollected = true
							context.full_hand[i]:set_ability('c_base', nil, true)
						end

					end

					if SMODS.has_enhancement(context.full_hand[i], 'm_pmcmod_bleed') then

						if context.full_hand[painted_pos].ability.bleedCollected == false and paintedDetected == true and context.full_hand[i].ability.perma_mult then
							context.full_hand[painted_pos].ability.mult = context.full_hand[painted_pos].ability.mult + context.full_hand[i].ability.perma_mult
							context.full_hand[painted_pos].ability.bleedCollected = true
							context.full_hand[i]:set_ability('c_base', nil, true)
						end

					end

					if SMODS.has_enhancement(context.full_hand[i], 'm_pmcmod_rupture') then

						if context.full_hand[painted_pos].ability.stoneCollected == false and paintedDetected == true and context.full_hand[i].ability.counter then
							context.full_hand[painted_pos].ability.bonus = context.full_hand[painted_pos].ability.bonus + context.full_hand[i].ability.counter * 2
							context.full_hand[painted_pos].ability.ruptureCollected = true
							context.full_hand[i]:set_ability('c_base', nil, true)
						end

					end
				end
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