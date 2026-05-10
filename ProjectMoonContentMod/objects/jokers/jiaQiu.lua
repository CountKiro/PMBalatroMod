SMODS.Joker {
	key = 'jiaQiu',
	name = "Jia Qiu",
	pronouns = "he_him",
	config = { extra = { xmult = 2, baseChance = 1, maxChance = 4 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 6, y = 2 },
	attributes = {'xmult', 'chance'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'jiaQiu')
        return {vars = { card.ability.extra.xmult, card.ability.extra.xmult * 4, new_numerator, new_denominator } } 
	end,
	calculate = function(self, card, context)


		local leiHengDetected = false
		local leiHengPos = nil

		for i=1, #G.jokers.cards do
			if G.jokers.cards[i].config.center.key == "j_pmcmod_leiHeng" then
				leiHengDetected = true
				leiHengPos = i
				break
			end
		end

		if context.joker_main then
			local chosenMult = nil
			if SMODS.pseudorandom_probability(card, 'jiaQiu', card.ability.extra.baseChance, card.ability.extra.maxChance, 'jiaQiu') or leiHengDetected then
				chosenMult = card.ability.extra.xmult * 4

				if leiHengDetected then
					G.GAME.banned_keys["j_pmcmod_leiHeng"] = true
					G.jokers.cards[leiHengPos].children.center:set_sprite_pos({x = 4 , y = 10})
					G.jokers.cards[leiHengPos].getting_sliced = true
                    G.E_MANAGER:add_event(Event({
						trigger = 'after',
						delay = 3.0,
						func = function()
						card:juice_up(0.8, 0.8)
                        G.jokers.cards[leiHengPos]:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
				end

			else
				chosenMult = card.ability.extra.xmult
			end
			return {
				xmult = chosenMult
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_jiaFamily'), HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'chip_score' and to_big(args.chips) >= to_big(800000)
    end,
}