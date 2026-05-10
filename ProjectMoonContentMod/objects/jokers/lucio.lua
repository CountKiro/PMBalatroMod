SMODS.Joker {
	key = 'lucio',
	name = "Lucio",
	pronouns = "he_him",
	config = { extra = { currentPosition = 1, lucioDeathCounter = 0, dollars = 6, valencinaPresent = false, valencinaPos = nil } },
	unlocked = true,	
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x =9, y = 5 },
	attributes = {},
    pools =
	{
		["Thumb"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.lucioDeathCounter, card.ability.extra.dollars, card.ability.extra.dollars * 2} }
	end,
	calculate = function(self, card, context)

		if context.before then
			card.ability.extra.valencinaPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_valencina" then
						card.ability.extra.valencinaPresent = true
						card.ability.extra.valencinaPos = i
						break
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_pmcmod_tremor') then
			local multiplier = 1
			if card.ability.extra.valencinaPresent then
				multiplier = 2
				card.ability.extra.lucioDeathCounter = card.ability.extra.lucioDeathCounter + 1
			end
			return {
				dollars = card.ability.extra.dollars * multiplier,
			}
        end

		if context.after then
			if card.ability.extra.lucioDeathCounter >= 3 then
                    card.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	get_weight = function(self, weight)
    	return weight*(2^(#SMODS.find_card('j_pmcmod_valencina')*G.GAME.round_resets.ante))
	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_valencina" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}