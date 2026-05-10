SMODS.Joker {
    key = "robotChesed",
	name = "Chesed (Robot)",
	pronouns = "he_him",
	config = {extra = {odds_upgrade = 8, xchips = 1, xchips_mod = 0.1}},
	eternal_compat = true,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 12 },
	attributes = {'xchips', 'scaling', 'chance'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return {vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds_upgrade, card.ability.extra.xchips, card.ability.extra.xchips_mod } } 
    end,
    calculate = function(self, card, context)

		if context.before and context.main_eval and not context.blueprint then
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.vampired then
                    enhanced[#enhanced + 1] = scored_card
                    scored_card.vampired = true
                    scored_card:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card.vampired = nil
                            return true
                        end
                    }))
                end
            end
        end

		if context.individual and context.cardarea == G.play then
            if (pseudorandom('daniel_upgrade') < G.GAME.probabilities.normal / card.ability.extra.odds_upgrade) then
				card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_mod
				return {
						message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.xchips_mod } },
						colour = G.C.RED
				}
			end
        end
		if context.joker_main then
			return {
				xchips = card.ability.extra.xchips
			}
		end
		
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end
}