SMODS.Joker {
	key = 'samjo',
	name = "Samjo",
	pronouns = "he_him",
	config = { chips = 20 },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 3 },
	attributes = {'chips', 'polychrome'},
    pools =
	{
        ["KCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.chips } }
	end,
	calculate = function(self, card, context)
		local joker_count = 0
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
                	if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_polychrome" then
					 	joker_count = joker_count + 1
					end
				end
			end
		card.ability.chips = 20 + (20*joker_count)

		if context.joker_main then
			return {
				chips = card.ability.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.chips } }
			}
		end
    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 1
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_KCorp'), G.C.GREEN, G.C.BLACK, 1.2 )
 	end
}