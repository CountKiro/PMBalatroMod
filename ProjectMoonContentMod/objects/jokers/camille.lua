SMODS.Joker {
	key = 'camille',
	name = "Camille",
	pronouns = "he_him",
	config = { extra = { mult = 0, percentage = 10} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	attributes = {'mult', 'scaling'},
	pos = { x = 9, y = 4 },
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.mult, card.ability.extra.percentage } }
	end,
	calculate = function(self, card, context)
		
		if context.setting_blind and not context.blueprint then

			local moneyToSubtract = math.floor(G.GAME.dollars * card.ability.extra.percentage / 100)

			ease_dollars(-moneyToSubtract)

			card.ability.extra.mult = card.ability.extra.mult + moneyToSubtract
			return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
		end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult
			}
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_cinq'), HEX('1a2040'), HEX('bdc1db'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'money' and to_big(G.GAME.dollars) >= to_big(600)
    end
}