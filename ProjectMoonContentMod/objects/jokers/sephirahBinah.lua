SMODS.Joker {
    key = "sephirahBinah",
	name = "Sephirah Binah",
	pronouns = "she_her",
	config = {extra = {xmult = 1, xmult_mod = 0.3, bondedHand = "None", bonded = 0}},
	eternal_compat = false,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 0 },
	attributes = {'xmult', 'hand_type', 'scaling', 'discard'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod, card.ability.extra.bondedHand, card.ability.extra.bonded } }
    end,

    calculate = function(self, card, context)

		if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end

		if context.before and #context.full_hand >= 1 and G.GAME.current_round.hands_played == 0 then
			if card.ability.extra.bonded == 0 then
				card.ability.extra.bondedHand = context.scoring_name
				card.ability.extra.bonded = 1
			end
		end

		if context.destroying_card and context.cardarea == G.play and #context.full_hand >= 1 and not context.blueprint and G.GAME.current_round.hands_played == 0 and context.scoring_name == card.ability.extra.bondedHand and card.ability.extra.bonded == 1 then  
				card.ability.extra.xmult = card.ability.extra.xmult + (card.ability.extra.xmult_mod)
                return {
                    remove = true
                }
		end

		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
				Xmult_mod = card.ability.extra.xmult
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}