SMODS.Joker {
    key = "aseah",
	name = "Aseah",
	pronouns = "he_him",
	config = {extra = {baseChance = 1, maxChance = 2}},
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 9,
	atlas = 'ModdedProjectMoon',
    pos = { x = 3, y = 1 },
	attributes = {'chance', 'modify_card', 'position'},
    pools = 
	{
 		["NewLeagueOfNine"] = true,
 	},
    loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'everyCatherineChance')
        return {vars = { new_numerator, new_denominator } }
    end,	
	calculate = function(self, card, context)
			if context.setting_blind and not context.blueprint then
			local my_pos = nil
			local jokerToTheRightIsFromTheLeague = false
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
			for j = 1, #G.P_CENTER_POOLS.NewLeagueOfNine do
				if my_pos and G.jokers.cards[my_pos + 1] and G.jokers.cards[my_pos + 1] ~= card and (G.P_CENTER_POOLS.NewLeagueOfNine[j].key ~= G.jokers.cards[my_pos + 1].config.center.key) then 
					jokerToTheRightIsFromTheLeague = true
				end
			end
			if context.setting_blind and my_pos and G.jokers.cards[my_pos + 1] and not G.jokers.cards[my_pos + 1].ability.eternal and G.jokers.cards[my_pos + 1].config.center.rarity <= 2 and not context.blueprint then
				local sliced_card = G.jokers.cards[my_pos + 1]
				local rarity = G.jokers.cards[my_pos + 1].config.center.rarity
                sliced_card.getting_sliced = true
				G.GAME.joker_buffer = G.GAME.joker_buffer - 1
				G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								 G.GAME.joker_buffer = 0
								sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
								play_sound('slice1', 0.96 + math.random() * 0.08)
                        		return true
							end
						}))
				if rarity == 1 then
					if SMODS.pseudorandom_probability(card, 'aseah', card.ability.extra.baseChance, card.ability.extra.maxChance, 'aseahChance') then
						G.E_MANAGER:add_event(Event({
						func = function()
								SMODS.add_card {
									set = 'Joker',
									rarity = 'Uncommon',
									key_append = 'pmcmod_aseah' -- Optional, useful for manipulating the random seed and checking the source of the creation in in_pool.
								}
								--G.GAME.joker_buffer = 0
							return true
						end
						}))
					else
						G.E_MANAGER:add_event(Event({
						func = function()
								SMODS.add_card {
									set = 'Joker',
									rarity = 'Common',
									key_append = 'pmcmod_aseah' -- Optional, useful for manipulating the random seed and checking the source of the creation in in_pool.
								}
								--G.GAME.joker_buffer = 0
							return true
						end
						}))
					end
				end
				if rarity == 2 then
					if SMODS.pseudorandom_probability(card, 'aseah', card.ability.extra.baseChance, card.ability.extra.maxChance, 'aseahChance') then
						G.E_MANAGER:add_event(Event({
						func = function()
								SMODS.add_card {
									set = 'Joker',
									rarity = 'Rare',
									key_append = 'pmcmod_aseah' -- Optional, useful for manipulating the random seed and checking the source of the creation in in_pool.
								}
								--G.GAME.joker_buffer = 0
							return true
						end
						}))
					else
						G.E_MANAGER:add_event(Event({
						func = function()
								SMODS.add_card {
									set = 'Joker',
									rarity = 'Uncommon',
									key_append = 'pmcmod_aseah' -- Optional, useful for manipulating the random seed and checking the source of the creation in in_pool.
								}
								--G.GAME.joker_buffer = 0
							return true
						end
						}))
					end
				end
			end
		end
    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 5
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_newLeagueOfNine'), HEX('242b45'), HEX('d5001e'), 1.2 )
 	end
}