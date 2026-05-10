SMODS.Joker {
	key = 'jiaMu',
	name = "Jia Mu",
	pronouns = "she_her",
	config = { extra = { baseChance = 1, maxChance = 2, moneyLoss = 3} },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 3,
	cost = 10,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 2 },
	attributes = {'chance', 'retrigger'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'jiaMu')
        return {vars = { new_numerator, new_denominator, card.ability.extra.moneyLoss } } 
	end,
	calculate = function(self, card, context)

		

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					SMODS.debuff_card(G.jokers.cards[i], "reset", "jiaMu")
				end
			end
		end

		if context.setting_blind then
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] ~= card then
					if SMODS.pseudorandom_probability(card, 'jiaMu', card.ability.extra.baseChance, card.ability.extra.maxChance, 'jiaMu') then
						SMODS.debuff_card(G.jokers.cards[i], true, "jiaMu")
					end
				end
			end
		end
		for i = 1, #G.jokers.cards do
			if context.retrigger_joker_check and context.other_card == G.jokers.cards[i] and G.GAME.dollars >= 3 then
				return {
					repetitions = math.random(0, 2),
					dollars = -card.ability.extra.moneyLoss
				} 
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_HCorp'), HEX('b87869'), HEX('f0f0f0'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_diet_cola" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}