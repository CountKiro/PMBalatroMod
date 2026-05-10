SMODS.Joker {
	key = 'niko',
	name = "Niko",
	pronouns = "he_him",
	config = { extra = { mult = 0, handSize = 1} },
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 3 },
	attributes = {'mult', 'hand_size'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.handSize } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
		card.ability.extra.mult = #G.hand.cards * 3
			return {
					mult_mod = card.ability.extra.mult,
					message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_rosespanner'), HEX('380e21'), HEX('ed2680'), 1.2 )
 	end,
	add_to_deck = function(self, card, from_debuff)
        G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size + card.ability.extra.handSize
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.starting_params.hand_size = G.GAME.starting_params.hand_size - card.ability.extra.handSize
    end,
	
}