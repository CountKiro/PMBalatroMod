SMODS.Joker {
	key = 'sora',
	name = "Sora",
	pronouns = "she_her",
	config = { extra = { chips = 0, chips_mod = 20, soraDeathCounter = 0, rienPresent = false, rienPos = nil, locked = false, counter = 0 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x =0, y = 6 },
	attributes = {'chips', 'editions', 'scaling', 'destroy_itself', 'position'},
    pools =
	{
		["Index"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		
		if card.edition then
			card.children.center:set_sprite_pos({x = 0 , y = 11})
		end
		
		if card.ability.extra.locked then
			card.children.center:set_sprite_pos({x = 1 , y = 11})
		end



        return {vars = { card.ability.extra.chips, card.ability.extra.chips_mod, card.ability.extra.soraDeathCounter } }
	end,
	calculate = function(self, card, context)

		if context.before then
			card.ability.extra.rienPresent = false
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					card.ability.extra.currentPosition = i
					break
				end
			end

			if card.ability.extra.currentPosition <= #G.jokers.cards then
				for i = card.ability.extra.currentPosition, #G.jokers.cards do
					if G.jokers.cards[i].config.center.key == "j_pmcmod_rien" then
						card.ability.extra.rienPresent = true
						card.ability.extra.rienPos = i
						break
					end
				end
			end
			
		end

		if context.setting_blind and not card.ability.extra.locked and not context.blueprint then

			local editionJokers = {}
			local edition

			for i=1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
					if not card.edition then
						print("First edition for Sora")
						editionJokers[#editionJokers + 1] = G.jokers.cards[i]
					else
						if card.edition.key ~= G.jokers.cards[i].edition.key then
							print("Second+ Edition for Sora")
							editionJokers[#editionJokers + 1] = G.jokers.cards[i]
						end
					end
				end
			end

			if (#editionJokers > 0) then
				print("Choosing a random Joker")
				local eligible_card = pseudorandom_element(editionJokers, 'sora')
				local edition = eligible_card.edition.key
				print("Chosen edition" .. edition)
				card:set_edition(edition, true)
				eligible_card:set_edition()
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
				card.ability.extra.counter = 0

			else
				
				card.ability.extra.counter = card.ability.extra.counter + 1

				if card.ability.extra.counter >= 3 then
					card:set_edition()
					card.ability.extra.chips = card.ability.extra.chips * 2
					card.ability.extra.locked = true
				end
				
			end

		end

		if context.joker_main then

			local multiplier = 1

			if card.ability.extra.rienPresent then
				multiplier = 2
				card.ability.extra.soraDeathCounter = card.ability.extra.soraDeathCounter + 1
			else
				multiplier = 1
			end

			if card.ability.extra.soraDeathCounter >= 5 then
				
				card.getting_sliced = true
				G.E_MANAGER:add_event(Event({func = function()
					card:start_dissolve({G.C.RED}, nil, 1.6)
				return true end }))
			end

			return {
				chips = card.ability.extra.chips * multiplier
			}
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_spiders'), HEX('121212'), HEX('d90000'), 1.2 )
 	end,
	get_weight = function(self, weight)
    	return weight*(2^(#SMODS.find_card('j_pmcmod_rien')*G.GAME.round_resets.ante))
	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_rien" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}