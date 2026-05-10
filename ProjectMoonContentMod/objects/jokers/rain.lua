SMODS.Joker {
	key = 'rain',
	name = "Rain",
	pronouns = "he_him",
	config = { extra = { chips = 0, chips_mod = 2} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 7 },
	attributes = {'chips', 'scaling', 'discard', 'reset'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_mod } }
	end,
	calculate = function(self, card, context)
		if context.discard and not context.blueprint and not context.other_card.debuff and card.ability.extra.chips < 60 then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS
            }
        end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then
				card.ability.extra.chips = 0
				return {message = localize('k_reset')}
				
		end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
			}
		end	
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_molar'), HEX('595447'), HEX('c9c9c9'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_merry_andy" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}