SMODS.Joker {
	key = 'panther',
	name = "Panther",
	pronouns = "he_him",
	config = { extra = { mult = 0, mult_gain = 5 } },
	unlocked = false,
    eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,	
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 1 },
	attributes = {'mult', 'scaling', 'planet'},
    pools = 
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
		
		if context.selling_card and context.card.ability.set == "Planet" and not context.blueprint then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
					--local quip = "pnr_pmcmod_panther_test"
					--card:keypage_add_speech_bubble(quip, nil, { quip = true })
					--card:keypage_say_stuff(5, false, quip)
					--Card:add_partner_speech_bubble(pnr_pmcmod_panther_test)
                	--Card:partner_say_stuff(5)
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
        return args.type == 'win_deck' and get_deck_win_stake('b_pmcmod_serpentDeck') > 1
    end
}