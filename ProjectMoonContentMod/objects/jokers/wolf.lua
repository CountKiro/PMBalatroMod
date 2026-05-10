SMODS.Joker {
	key = 'wolf',
	name = "Wolf",
	pronouns = "she_her",
	config = {extra = 0.1, xmult = 1},
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,	
	rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 1 },
	attributes = {'xmult', 'scaling', 'planet'},
    pools = 
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra, card.ability.xmult } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				Xmult_mod = card.ability.xmult,
				message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.xmult } }
			}
		end
		
		if context.selling_card and context.card.ability.set == "Planet" and not context.blueprint then
                    card.ability.xmult = card.ability.xmult + card.ability.extra	
			return {
				message = 'Upgraded!',
				colour = G.C.MULT,
				card = card
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_unknown'), G.C.BLACK, HEX('9e13bd'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_pmcmod_serpentDeck') > 3
    end
}