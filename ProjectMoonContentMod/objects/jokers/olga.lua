SMODS.Joker {
	key = 'olga',
	name = "Olga",
	pronouns = "she_her",
	config = { extra = { xmult = 1, xmult_mod = 0.1} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 7 },
	attributes = {'xmult', 'scaling', 'discard', 'reset'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)	
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod } }
	end,
	calculate = function(self, card, context)
		if context.discard and not context.blueprint and not context.other_card.debuff and card.ability.extra.xmult < 3 then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
				card.ability.extra.xmult = 1
				return {message = localize('k_reset')}
				
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end	
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_molar'), HEX('595447'), HEX('c9c9c9'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_drunkard" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}