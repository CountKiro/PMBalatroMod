SMODS.Joker {
	key = 'lion',
	name = "Lion",
	pronouns = "she_her",
	config = { extra = { chips = 0, chips_gain = 10 } },
	unlocked = false,
    eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,	
	rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 1 },
	attributes = {'chips', 'scaling', 'planet'},
    pools = 
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
		
		if context.selling_card and context.card.ability.set == "Planet" and not context.blueprint then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_gain
			return {
				message = 'Upgraded!',
				colour = G.C.CHIPS,
				card = card
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_unknown'), G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_pmcmod_serpentDeck') > 2
    end
}