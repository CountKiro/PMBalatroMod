SMODS.Joker {
	key = 'erlking',
	name = "Erlking",
	pronouns = "he_him",
	config = { extra = { xmult = 1, catherineDestroyed = 0} },
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 4 },
	attributes = {'xmult', 'scaling', 'negative'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		local joker_count = 0
		for i = 1, #G.jokers.cards do
			if G.jokers.cards[i].edition then
				if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_negative" then
					joker_count = joker_count + 1
				end
			end
		end

		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_everyCatherine" then
			card.ability.extra.catherineDestroyed = 1
		end
		card.ability.extra.xmult = 1 + joker_count + card.ability.extra.catherineDestroyed

		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_wildHunt'), HEX('40342d'), HEX('7a369c'), 1.2 )
 	end,
	add_to_deck = function(self, card, from_debuff)
        G.GAME.banned_keys["j_pmcmod_erlking"] = true
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}