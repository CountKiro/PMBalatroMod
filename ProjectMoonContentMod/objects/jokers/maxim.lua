SMODS.Joker {
	key = 'maxim',
	name = "Maxim",
	pronouns = "he_him",
	config = { extra = { chargeCount = 0, dollars = 10, repetitions = 1, charge_mod = 5, maxCharge = 100 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = false,
	rarity = 2,
	cost = 6,
	atlas = 'ModdedProjectMoonTrue',
	pos = { x = 7, y = 14 },
	attributes = {'economy', 'retrigger'},
	pools =
	{
        ["R Corp"] = true,
 	},
	loc_vars = function (self, info_queue, card)
    	return {vars = { card.ability.extra.chargeCount, card.ability.extra.dollars, card.ability.extra.charge_mod, card.ability.extra.maxCharge }}
	end,
	calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play and not context.blueprint then

			if context.other_card:is_face() then
				card.ability.extra.chargeCount = card.ability.extra.chargeCount + 5

				if card.ability.extra.chargeCount >= 100 then
					card.ability.extra.chargeCount = 100
				end

			end
        end

		if context.repetition and context.cardarea == G.play and not context.blueprint then
			if card.ability.extra.chargeCount >= (context.other_card.base.nominal * 2) and not context.other_card:is_face() then
					card.ability.extra.chargeCount = card.ability.extra.chargeCount - (context.other_card.base.nominal * 2)
					return {
						repetitions = card.ability.extra.repetitions
					}
			end
		end
	end,
	calc_dollar_bonus = function(self, card)
        return card.ability.extra.chargeCount >= 90 and card.ability.extra.dollars
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_RCorp'), HEX('2e2b2b'), HEX('c4560c'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_bull" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}