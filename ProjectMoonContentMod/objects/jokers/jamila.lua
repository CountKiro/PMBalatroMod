SMODS.Joker {
	key = 'jamila',
	name = "Jamila",
	pronouns = "she_her",
	config = { multBase = 15 },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 6, y = 6 },
	attributes = {'mult', 'scaling', 'voucher'},
    pools =
	{
		["LCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		
		local voucherAmount = 0
		
		if G.GAME.blind then
			voucherAmount = #G.vouchers.cards
		end
        return {vars = { card.ability.multBase, card.ability.multBase * voucherAmount } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.multBase * #G.vouchers.cards
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCAUdjat'), HEX('212121'), HEX('ba8832'), 1.2 )
 	end,
	get_weight = function(self, weight)
    	return weight*(2^(#G.vouchers.cards + 1))
	end,
	check_for_unlock = function(self, args)
        if #G.vouchers.cards >= 5 then
			return true
		end
    end
	
}