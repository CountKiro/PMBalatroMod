SMODS.Joker {
	key = 'hindley',
	name = "Hindley",
	pronouns = "he_him",
	config = { extra = { chips = 20} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 5 },
	attributes = {'chips', 'scaling', 'negative'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local joker_count = 0
		if G.GAME.blind then
             for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].edition then
                	if G.jokers.cards[i].ability.set == 'Joker' and G.jokers.cards[i].edition.key == "e_negative" then
					 	joker_count = joker_count + 1
					end
				end
			end
		end
		return { vars = { card.ability.extra.chips + (20*joker_count) } }
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
		if context.joker_main then
			return {
				chips = card.ability.extra.chips + (20*joker_count)
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_wuthering'), HEX('3d2920'), HEX('998277'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_nelly" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}