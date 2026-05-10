SMODS.Joker {
	key = 'rufo',
	name = "Rufo",
	pronouns = "she_her",
	config = { },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 4, y = 7 },
	attributes = {'enhanced', 'modify_card'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {   } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then

			local possible_enhancements = {'m_bonus', 'm_mult', 'm_wild', 'm_glass', 'm_steel', 'm_stone', 'm_gold', 'm_lucky', 'm_pmcmod_burn', 'm_pmcmod_bleed', 'm_pmcmod_rupture', 'm_pmcmod_poise', 'm_pmcmod_tremor'}
			local unenhancedCards = {}

			for i=1, #G.playing_cards do
				if not SMODS.has_enhancement(G.playing_cards[i]) then
					unenhancedCards[#unenhancedCards+1] = i
				end
			end

			local cardToEnhance = #unenhancedCards > 0 and pseudorandom_element(unenhancedCards, pseudoseed('rufo')) or nil
			
			if #unenhancedCards > 0 then
				G.playing_cards[cardToEnhance]:set_ability(pseudorandom_element(possible_enhancements, pseudoseed('rufo')), nil, true)
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