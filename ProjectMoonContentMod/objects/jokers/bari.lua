SMODS.Joker {
	key = 'bari',
	name = "Bari",
	pronouns = "she_her",
	config = { extra = { xchips = 1.3 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 5 },
	attributes = {'xchips', 'enhancements'},
    pools =
	{
		
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.xchips } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_steel') then
                return {
                    xchips = card.ability.extra.xchips,
                }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_fixer'), G.C.BLACK, G.C.WHITE, 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_angelaLoR" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end,
	get_weight = function(self, weight)
		local steel_card_tally = 0
		if G.GAME.blind then
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_steel') then steel_card_tally = steel_card_tally + 1 end
				end
			end
		end
    	return weight*(2^(steel_card_tally + 1))
	end,
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_steel') then
                return true
            end
        end
        return false
    end,
}