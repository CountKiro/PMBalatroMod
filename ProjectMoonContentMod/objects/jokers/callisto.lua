SMODS.Joker {
	key = 'callisto',
	name = "Callisto",	
	pronouns = "he_him",
	config = { extra = { currentPosition = 1, albinaPresent = false, albinaPos = nil, chips = 0, mult = 0, chips_gain = 25, mult_gain = 5, albinaDeathCounter = 0  } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x =7, y = 5 },
	attributes = {'chips', 'mult', 'enhancement', 'destroy_card', 'scaling', 'modify_card', 'position'},
    pools =
	{
		["Ring"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips, card.ability.extra.mult } }
	end,
	calculate = function(self, card, context)
        if context.individual and not context.blueprint then

			card.ability.extra.albinaPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_kira" then
						card.ability.extra.albinaPresent = true
						card.ability.extra.albinaPos = i
					end
				end
			end

			if SMODS.has_enhancement(context.other_card, 'm_bonus') and not context.other_card.debuff and not context.other_card.vampired then
				context.other_card.vampired = true
				context.other_card:set_ability('c_base', nil, true)
				if card.ability.extra.albinaPresent then
					card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chips_gain * 2)
					card.ability.extra.albinaDeathCounter = card.ability.extra.albinaDeathCounter + 1
				else
					card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chips_gain)
				end
				local cardToRemoveEnhancement = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						cardToRemoveEnhancement:juice_up()
						cardToRemoveEnhancement.vampired = nil
						return true
					end
				}))
				return {
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                    colour = G.C.CHIPS
                }
			end

			if SMODS.has_enhancement(context.other_card, 'm_mult') and not context.other_card.debuff and not context.other_card.vampired then
				context.other_card.vampired = true
				context.other_card:set_ability('c_base', nil, true)
				if card.ability.extra.albinaPresent then
					card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_gain * 2)
					card.ability.extra.albinaDeathCounter = card.ability.extra.albinaDeathCounter + 1
				else
					card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.mult_gain)
				end
				local cardToRemoveEnhancement = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						cardToRemoveEnhancement:juice_up()
						cardToRemoveEnhancement.vampired = nil
						return true
					end
				}))
				return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                    colour = G.C.CHIPS
                }
			end




			if card.ability.extra.albinaDeathCounter >= 5 then
				G.GAME.banned_keys["j_pmcmod_albina"] = true
				local albina = G.jokers.cards[card.ability.extra.albinaPos]
				albina.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:juice_up(0.8, 0.8)
					albina:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
				chips = card.ability.extra.chips
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	get_weight = function(self, weight)
		local strength_card_tally = 0
		local endurance_card_tally = 0
		if G.GAME.blind then
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_mult') then strength_card_tally = strength_card_tally + 1 end
					if SMODS.has_enhancement(playing_card, 'm_bonus') then endurance_card_tally = endurance_card_tally + 1 end
				end
			end
		end
    	return weight*(2^(strength_card_tally + endurance_card_tally + 1))
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