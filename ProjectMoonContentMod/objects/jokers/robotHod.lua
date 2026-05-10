SMODS.Joker {
    key = "robotHod",
	name = "Hod (Robot)",
	pronouns = "she_her",
	config = {xchips = 2},
	eternal_compat = true,
	perishable_compat = false,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pos = { x = 1, y = 12 },
	attributes = {'xchips', 'debuff'},
    pools = 
	{
 		["Heretics"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.xchips } }
    end,
    calculate = function(self, card, context)
		local selectedJoker
		local possibleDebuffs = {}
		if context.setting_blind then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					possibleDebuffs[i] = G.jokers.cards[i]
				end
			end
			selectedJoker  = pseudorandom_element(possibleDebuffs, pseudoseed('hod'))
			SMODS.debuff_card(selectedJoker, true, "hod")
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					SMODS.debuff_card(G.jokers.cards[i], "reset", "hod")
				end
			end
		end

		if context.joker_main then
			return {
				xchips = card.ability.xchips
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