SMODS.Joker {
	key = 'mika',
	name = "Mika",
	pronouns = "she_her",
	config = { extra = { mult = 0, mult_mod = 1} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,	
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 7 },
	attributes = {'mult', 'scaling', 'discard', 'reset'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
	end,
	calculate = function(self, card, context)
		if context.discard and not context.blueprint and not context.other_card.debuff and card.ability.extra.mult < 30 then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.mult
            }
        end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
				card.ability.extra.mult = 0
				return {message = localize('k_reset')}
				
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
			}
		end	
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_molar'), HEX('595447'), HEX('c9c9c9'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_faceless" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}