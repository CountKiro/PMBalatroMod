SMODS.Joker {
	key = 'dulcinea',
	name = "Dulcinea",
	pronouns = "she_her",
	config = { extra = { mult = 0, mult_mod = 2 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 6 },
	attributes = {'mult', 'scaling', 'bleed', 'hearts'},
    pools =
	{
		["Bloodfiends"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_bleed
        return {vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if (SMODS.has_enhancement(context.other_card, 'm_pmcmod_bleed') or context.other_card:is_suit("Hearts")) then		

				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod

				return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_mod } },
                    colour = G.C.MULT
                }

			else
				if card.ability.extra.mult >= 0 then
					card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_mod
					
					return {
						message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.mult_mod } },
						colour = G.C.MULT
                	}
				end

				if  card.ability.extra.mult < 0 then
					card.ability.extra.mult = 0
				end
			end
        end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_lamanchaland'), HEX('400a18'), HEX('c7285f'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_sancho" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
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
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_bleed') then
                return true
            end
        end
        return false
    end,
}