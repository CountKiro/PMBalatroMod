SMODS.Joker {
	key = 'hongLu',
	name = "Hong Lu",
	pronouns = "he_him",
	config = { extra = {
		yiSangBonusApplied = false, 
		faustBonusApplied = false, 
		donQuixoteBonusApplied = false, 
		ryoshuBonusApplied = false,
		meursaultBonusApplied = false,
		heathcliffBonusApplied = false,
		ishmaelBonusApplied = false,
		rodionBonusApplied = false,
		sinclairBonusApplied = false,
		outisBonusApplied = false,
		gregorBonusApplied = false,
		baseChanceYiSang = 1,
		maxChanceYiSang = 2,
		baseChanceFaust = 1,
		maxChanceFaust = 4,
		donQuixotePermaMult = 1,
		ryoshuXMult = 2,
		meursaultPermaChips = 2,
		heathcliffMult = 20,
		ishmaelChips = 40,
		rodionDollars = 5,
		sinclairHand = 1,
		outisDiscard = 1,
		gregorHandSize = 1} },
	no_collection = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 0 },
	attributes = {'mult', 'chips', 'xmult', 'economy', 'hands', 'hand_size', 'discard', 'perma_bonus', 'retrigger', 'chance'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)



		if G.jokers then
            local yiSangPresent = false  --ok
            local faustPresent = false  --ok
            local donQuixotePresent = false  --ok
            local ryoshuPresent = false -- ok
            local meursaultPresent = false --ok
            local heathcliffPresent = false --ok
            local ishmaelPresent = false  --ok
			local rodionPresent = false  --ok
            local sinclairPresent = false  --ok
            local outisPresent = false  --ok
            local gregorPresent = false  --ok

            for i=1, #G.jokers.cards do

                    if G.jokers.cards[i].config.center.key == "j_pmcmod_yiSang" or G.jokers.cards[i].config.center.key == "j_constellation" then
                        yiSangPresent = true
                    end

                    if G.jokers.cards[i].config.center.key == "j_oops" then
                        faustPresent = true
                    end

                    if G.jokers.cards[i].config.center.key == "j_pmcmod_donQuixote" or G.jokers.cards[i].config.center.key == "j_seeing_double" then
                        donQuixotePresent = true
                    end

                    if G.jokers.cards[i].config.center.key == "j_pmcmod_ryoshu" or G.jokers.cards[i].config.center.key == "j_flower_pot" then
                        ryoshuPresent = true
                    end

                    if G.jokers.cards[i].config.center.key == "j_baron" then
                        meursaultPresent = true
                    end

                    if G.jokers.cards[i].config.center.key == "j_pmcmod_heathcliff" or G.jokers.cards[i].config.center.key == "j_hit_the_road" then
                        heathcliffPresent = true
                    end

                    if G.jokers.cards[i].config.center.key == "j_pmcmod_ishmael" or G.jokers.cards[i].config.center.key == "j_midas_mask" then
                        ishmaelPresent = true
                    end

                    if G.jokers.cards[i].config.center.key == "j_bootstraps" then
                        rodionPresent = true
                    end

                    if G.jokers.cards[i].config.center.key == "j_idol" then
                        sinclairPresent = true
                    end

                    if G.jokers.cards[i].config.center.key == "j_hanging_chad" then
                        outisPresent = true
                    end

                    if G.jokers.cards[i].config.center.key == "j_ring_master" then
                        gregorPresent = true
                    end

            end

			if yiSangPresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_yiSangEffect"}
			end

			if faustPresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_faustEffect"}
			end

			if donQuixotePresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_donQuixoteEffect"}
			end

			if ryoshuPresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_ryoshuEffect"}
			end

			if meursaultPresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_meursaultEffect"}
			end

			if heathcliffPresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_heathcliffEffect"}
			end

			if ishmaelPresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_ishmaelEffect"}
			end

			if rodionPresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_rodionEffect"}
			end

			if sinclairPresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_sinclairEffect"}
			end

			if outisPresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_outisEffect"}
			end

			if gregorPresent then
				info_queue[#info_queue + 1] = {set = "Other", key = "hongLu_gregorEffect"}
			end

        end



		local new_numeratorYiSang, new_denominatorYiSang = SMODS.get_probability_vars(card, card.ability.extra.baseChanceYiSang, card.ability.extra.maxChanceYiSang, 'HLYiSangChance')
		local new_numeratorFaust, new_denominatorFaust = SMODS.get_probability_vars(card, card.ability.extra.baseChanceFaust, card.ability.extra.maxChanceFaust, 'HLFaustChance')
    	--return {main_end = main_end, vars = { card.ability.extra.baseChanceYiSang, card.ability.extra.maxChanceYiSang, card.ability.extra.baseChanceFaust, card.ability.extra.maxChanceFaust,new_numeratorYiSang, new_denominatorYiSang, new_numeratorFaust, new_denominatorFaust}}
		return { vars = { card.ability.extra.baseChanceYiSang, card.ability.extra.maxChanceYiSang, card.ability.extra.baseChanceFaust, card.ability.extra.maxChanceFaust,new_numeratorYiSang, new_denominatorYiSang, new_numeratorFaust, new_denominatorFaust}}
	end,
	calculate = function(self, card, context)

		local yiSangPresent = false  --ok
		local faustPresent = false  --ok
		local donQuixotePresent = false  --ok
		local ryoshuPresent = false -- ok
		local meursaultPresent = false --ok
		local heathcliffPresent = false --ok
		local rodionPresent = false  --ok
		local ishmaelPresent = false  --ok
		local sinclairPresent = false  --ok
		local outisPresent = false  --ok
		local gregorPresent = false  --ok

		for i=1, #G.jokers.cards do

				if G.jokers.cards[i].config.center.key == "j_pmcmod_yiSang" or G.jokers.cards[i].config.center.key == "j_constellation" then
					yiSangPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_oops" then
					faustPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_pmcmod_donQuixote" or G.jokers.cards[i].config.center.key == "j_seeing_double" then
					donQuixotePresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_pmcmod_ryoshu" or G.jokers.cards[i].config.center.key == "j_flower_pot" then
					ryoshuPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_baron" then
					meursaultPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_pmcmod_heathcliff" or G.jokers.cards[i].config.center.key == "j_hit_the_road" then
					heathcliffPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_pmcmod_ishmael" or G.jokers.cards[i].config.center.key == "j_midas_mask" then
					ishmaelPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_bootstraps" then
					rodionPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_idol" then
					sinclairPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_hanging_chad" then
					outisPresent = true
				end

				if G.jokers.cards[i].config.center.key == "j_ring_master" then
					gregorPresent = true
				end

		end


		if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] and yiSangPresent and
			SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChanceYiSang, card.ability.extra.maxChanceYiSang, 'HLYiSangChance') then
			return {
				repetitions = 1
			}
		end

		if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[#context.scoring_hand] and faustPresent and
			SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChanceFaust, card.ability.extra.maxChanceFaust, 'HLYiSangChance') then
			return {
				repetitions = 1
			}
		end

		if context.individual and context.cardarea == G.play and not context.blueprint then
			if donQuixotePresent then
				context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.donQuixotePermaMult
				local cardToJuiceUp = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						cardToJuiceUp:juice_up()
						return true
					end
				}))
			end

			if meursaultPresent then
				context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) +  card.ability.extra.meursaultPermaChips
				local cardToJuiceUp = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						cardToJuiceUp:juice_up()
						return true
					end
				}))
			end


		end

		if context.setting_blind and not context.blueprint then

			if sinclairPresent and not card.ability.extra.sinclairBonusApplied then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.sinclairHand
				card.ability.extra.sinclairBonusApplied = true
			end

			if card.ability.extra.sinclairBonusApplied and not sinclairPresent then
				G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.sinclairHand
				card.ability.extra.sinclairBonusApplied = false
			end

			if outisPresent and not card.ability.extra.outisBonusApplied then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.outisDiscard
				card.ability.extra.sinclairBonusApplied = true
			end

			if card.ability.extra.outisBonusApplied and not outisPresent then
				G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.outisDiscard
				card.ability.extra.sinclairBonusApplied = false
			end

			if gregorPresent and not card.ability.extra.gregorBonusApplied then
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + card.ability.extra.gregorHandSize
				card.ability.extra.gregorBonusApplied = true
			end

			if card.ability.extra.gregorBonusApplied and not gregorPresent then
				G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size - card.ability.extra.gregorHandSize
				card.ability.extra.gregorBonusApplied = false
			end


		end

		if context.joker_main then

			local ret = {}

			if heathcliffPresent then
				ret.mult = card.ability.extra.heathcliffMult
			end

			if heathcliffPresent then
				ret.chips = card.ability.extra.ishmaelChips
			end


			if ryoshuPresent then
				ret.xmult = card.ability.extra.ryoshuXMult
			end

			return ret

		end




    end,
	calc_dollar_bonus = function(self, card)

		for i=1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.key == "j_bootstraps" then
				return card.ability.extra.rodionDollars
			end
		end
            
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
 	end,
	in_pool = function(self, args)
        
    end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_diet_cola" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}