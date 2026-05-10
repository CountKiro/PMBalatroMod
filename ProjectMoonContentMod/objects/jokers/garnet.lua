SMODS.Joker {
	key = 'garnet',
	name = "Garnet",
	pronouns = "he_him",
	config = { availableJokers = {}, selectedJoker = "None", extra = {} },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 2 },
	attributes = {'random', 'copying'},
    pools =
	{
		["Thumb"] = true,
        ["Index"] = true,
        ["Middle"] = true,
        ["Ring"] = true,
        ["Pinky"] = true,
        ["Bloodfiends"] = true,
        ["LCorp"] = true,
        ["Limbus"] = true,
        ["Sinner"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		local keyToLocalize = "j_pmcmod_garnet"
		if ProjectMoonMod.garnetJoker then
			if #ProjectMoonMod.garnetJoker.cards >= 1 then
				keyToLocalize = ProjectMoonMod.garnetJoker.cards[1].config.center.key
			else
				keyToLocalize = "j_pmcmod_garnet"
			end
		end

		if card.ability.selectedJoker ~= "None" then
			card.children.center:set_sprite_pos({x = 0 , y = 10})
		end

        return {vars = { localize{type="name_text", set="Joker", key = (keyToLocalize)} } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			card.ability.availableJokers = {}
			card.ability.selectedJoker = "None"
			for i = 1, #G.P_CENTER_POOLS["Joker"] do
				if G.P_CENTER_POOLS["Joker"][i] ~= card and G.P_CENTER_POOLS["Joker"][i].blueprint_compat and G.P_CENTER_POOLS["Joker"][i].unlocked then
					card.ability.availableJokers[#card.ability.availableJokers+1] = G.P_CENTER_POOLS["Joker"][i]
				end
			end
			card.ability.selectedJoker = #card.ability.availableJokers > 0 and pseudorandom_element(card.ability.availableJokers, pseudoseed('garnet')) or nil
			if #ProjectMoonMod.garnetJoker.cards >=1 then
				G.E_MANAGER:add_event(Event({func = function()
							card:juice_up(0.8, 0.8)
							ProjectMoonMod.garnetJoker.cards[1]:start_dissolve({G.C.RED}, nil, 1.6)
						return true end }))
			end
			local jokerKey = card.ability.selectedJoker.key
			SMODS.add_card({ key = jokerKey, area = ProjectMoonMod.garnetJoker })
			
			
		end

		local ret = SMODS.blueprint_effect(card, ProjectMoonMod.garnetJoker.cards[1], context)
		if ret then
			ret.colour = G.C.BLUE
		end
		return ret
        
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_fixer'), G.C.BLACK, G.C.WHITE, 1.2 )
 	end,
	check_for_unlock = function(self, args)
        if args.type == 'discard_custom' then
            local eval = evaluate_poker_hand(args.cards)
            if next(eval['Flush House']) then
                local min = 10
                for j = 1, #args.cards do
                    if args.cards[j]:get_id() < min then min = args.cards[j]:get_id() end
                end
                if min == 10 then
                    return true
                end
            end
        end
        return false
    end
}