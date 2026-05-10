SMODS.Joker {
	key = 'shiomiYoru',
	name = "Shiomi Yoru",
	pronouns = "she_her",
	config = { extra = {renDeathCounter = 0, renPos = nil } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 8, y = 5 },
	attributes = {'passive', 'poise', 'chance', 'destroy_card', 'position'},
    pools =
	{
		["Pinky"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.renDeathCounter } }
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
					if G.jokers.cards[i].config.center.key == "j_pmcmod_ren" then
						card.ability.extra.renPresent = true
						card.ability.extra.renPos = i
						break
					end
				end
			end
			
		end

		if context.individual and context.cardarea == G.play and context.other_card.poise_trigger and card.ability.extra.renPresent then
					
			card.ability.extra.renDeathCounter = card.ability.extra.renDeathCounter + 1
		
				if card.ability.extra.renDeathCounter >= 5 then
					G.GAME.banned_keys["j_pmcmod_ren"] = true
					local ren = G.jokers.cards[card.ability.extra.renPos]
                    ren.getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        card:juice_up(0.8, 0.8)
                        ren:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	get_weight = function(self, weight)
		local poise_card_tally = 0
		if G.GAME.blind then
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_poise') then poise_card_tally = poise_card_tally + 1 end
				end
			end
		end
    	return weight*(2^(poise_card_tally + 1))
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