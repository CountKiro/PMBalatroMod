SMODS.Joker {
	key = 'herbert',
	name = "Herbert",
	pronouns = "he_him",
	config = { extra = {baseChance = 1, maxChance = 3 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 7 },
	attributes = {'chance', 'economy'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'herbertChance')
    	return {vars = { new_numerator, new_denominator}}
	end,
	calculate = function(self, card, context)
		if context.buying_card and (context.card.ability.set == "Joker" or context.card.ability.set == "Planet" or context.card.ability.set == "Tarot" or context.card.ability.set == "Spectral" or context.card.ability.set == "Voucher") then

			if SMODS.pseudorandom_probability(card, 'herbert', card.ability.extra.baseChance, card.ability.extra.maxChance, 'herbert') then
				ease_dollars(context.card.cost)
			end
		end
		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_TCorp'), HEX('382d21'), HEX('a3802e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'money' and to_big(G.GAME.dollars) >= to_big(200)
    end
}