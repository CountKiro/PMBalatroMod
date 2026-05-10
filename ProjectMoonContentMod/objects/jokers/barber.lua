SMODS.Joker {
	key = 'barber',
	name = "Barber",
	pronouns = "she_her",
	config = { extra = {chips = 0, chips_mod = 4 } },
	unlocked = false,	
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 6 },
	attributes = {'chips', 'scaling', 'bleed', 'hearts'},
    pools =
	{
		["Bloodfiends"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_bleed
        return {vars = { card.ability.extra.chips, card.ability.extra.chips_mod } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if (SMODS.has_enhancement(context.other_card, 'm_pmcmod_bleed') or context.other_card:is_suit("Hearts")) then		

				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod

			else
				if card.ability.extra.chips >= 0 then
					card.ability.extra.chips = card.ability.extra.chips - card.ability.extra.chips_mod
				end

				if  card.ability.extra.chips < 0 then
					card.ability.extra.chips = 0
				end
			end
        end

		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_lamanchaland'), HEX('400a18'), HEX('c7285f'), 1.2 )
 	end,
	get_weight = function(self, weight)
		local bleed_card_tally = 0
		if G.GAME.blind then
			if G.playing_cards then
				for _, playing_card in ipairs(G.playing_cards) do
					if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then bleed_card_tally = bleed_card_tally + 1 end
				end
			end
		end
    	return weight*(2^(bleed_card_tally + 1))
	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_dulcinea" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end,
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then
                return true
            end
        end
        return false
    end,
}