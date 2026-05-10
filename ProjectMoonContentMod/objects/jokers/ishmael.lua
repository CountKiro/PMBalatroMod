SMODS.Joker {
	key = 'ishmael',
	name = "Ishmael",
	pronouns = "she_her",
	config = { extra = { mult = 0, mult_mod = 10, xmult = 1, xmult_mod = 5, baseChance = 1, maxChance = 3} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = true,
	rarity = 3,
	cost = 8,
	atlas = 'ModdedProjectMoon2',
	pos = { x = 7, y = 0 },
	attributes = {'mult', 'xmult', 'chance', 'scaling'},
	loc_vars = function (self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_pallid
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'ishamelChance')
    	return {vars = { card.ability.extra.xmult, card.ability.extra.mult, card.ability.extra.mult_mod, new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		
		if context.before and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.vampired then
					if SMODS.has_enhancement(scored_card, "m_pmcmod_pallid") then
						if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'ishmaelChance') then
							enhanced[#enhanced + 1] = scored_card
							scored_card.vampired = true
							scored_card:set_ability('c_base', nil, true)
							G.E_MANAGER:add_event(Event({
								func = function()
									scored_card:juice_up()
									scored_card.vampired = nil
									return true
								end
							}))
						end
					end
                end
            end

            if #enhanced > 0 then
                -- See note about SMODS Scaling Manipulation on the wiki
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod * #enhanced
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                    colour = G.C.MULT
                }
            end
        end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			local pallidTally = 0
			local ahabDetected = false
			local joker_to_destroy
			for _, playing_card in ipairs(G.playing_cards or {}) do
				if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then
					pallidTally = pallidTally + 1
				end
			end

			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card and G.jokers.cards[i].config.center.key == "j_pmcmod_ahab" then 
					ahabDetected = true
					joker_to_destroy = G.jokers.cards[i]
				end
            end

			if pallidTally <= 0  and ahabDetected then
				if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then
					card.ability.extra.xmult = card.ability.extra.xmult + 2
                    joker_to_destroy.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
					card_eval_status_text((context.blueprint_card or card), 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.xmult}}})
                end
			end
		end

		if context.joker_main then
			return
			{
				mult = card.ability.extra.mult,
				xmult = card.ability.extra.xmult
			}
		end
	end,
	in_pool = function(self, args)
		local pallidTally = 0
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_pallid') then
                pallidTally = pallidTally + 1
            end
        end

		if pallidTally >= 10 then
			return true
		else
        	return false
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_midas_mask" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}