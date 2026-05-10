SMODS.Joker {
	key = 'kim',
	name = "Kim",
	pronouns = "he_him",
	config = { extra = {xmult = 3, xmult_mod = 0.1} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoonTrue',
	pos = { x = 2, y = 1 },
	attributes = {'xmult', 'hands'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_pmcmod_poise
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod } }
	end,
	calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and context.other_card.poise_trigger and not context.blueprint then

            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
                message_card = card
            }
        end

		if context.joker_main and G.GAME.current_round.hands_left == 0 then
            return {
                xmult = card.ability.extra.xmult
            }
        end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_blade'), HEX('3d3d3d'), HEX('b5b5b5'), 1.2 )
 	end,
	in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_pmcmod_poise') then
                return true
            end
        end
        return false
    end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_acrobat" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}