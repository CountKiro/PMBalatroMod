SMODS.Joker {
	key = 'mai',
	name = "Mai",
	pronouns = "she_her",
	config = { extra = { xmult = 0 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 8 },
	attributes = {'xmult', 'position'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		local selectedJoker
		local possibleDebuffs = {}
		if context.setting_blind and #G.jokers.cards > 1 then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					possibleDebuffs[i] = G.jokers.cards[i]
				end
			end
			selectedJoker  = pseudorandom_element(possibleDebuffs, pseudoseed('mai'))
			SMODS.debuff_card(selectedJoker, true, "mai")
			card.ability.extra.xmult = 1.5 + selectedJoker.config.center.rarity * 0.5
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					SMODS.debuff_card(G.jokers.cards[i], "reset", "mai")
				end
			end
		end

		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_TCorp'), HEX('382d21'), HEX('a3802e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'money' and to_big(G.GAME.dollars) >= to_big(200)
    end
}