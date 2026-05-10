SMODS.Joker {
	key = 'kira',
	name = "Kira",
	pronouns = "she_her",
	config = { extra = { currentPosition = 1, kiraDeathCounter = 0, dollars = 4, matthiasPresent = false, matthiasPos = nil } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x =1, y = 6 },
	attributes = {'economy', 'burn', 'position'},
    pools =
	{
		["Middle"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.kiraDeathCounter, card.ability.extra.dollars, card.ability.extra.dollars * 2} }
	end,
	calculate = function(self, card, context)
		if context.before then
			card.ability.extra.matthiasPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_matthias" then
						card.ability.extra.matthiasPresent = true
						card.ability.extra.matthiasPos = i
						break
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_pmcmod_burn') then
			local multiplier = 1
			if card.ability.extra.matthiasPresent then
				multiplier = 2
				card.ability.extra.kiraDeathCounter = card.ability.extra.kiraDeathCounter + 1
			end
			return {
				dollars = card.ability.extra.dollars * multiplier,
			}
        end

		if context.after then
			if card.ability.extra.kiraDeathCounter >= 3 then
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
    	return weight*(2^(#SMODS.find_card('j_pmcmod_matthias')*G.GAME.round_resets.ante))
	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_matthias" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}