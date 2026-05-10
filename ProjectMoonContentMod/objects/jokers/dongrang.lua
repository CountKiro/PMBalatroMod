SMODS.Joker {
	key = 'dongrang',
	name = "Dongrang",
	pronouns = "he_him",
	config = { extra = { xchips = 1, xchips_gain = 1 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 9,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 3 },
	attributes = {'xchips', 'scaling', 'polychrome', 'modify_card', 'editions'},
    pools =
	{
        ["KCorp"] = true,
 	},
	loc_vars = function(self, info_queue, card)

		if card.edition then
			if card.edition.key == 'e_polychrome' then
				tempKey = self.key..'_alt'
				card.children.center:set_sprite_pos({x = 0 , y = 10})
			else 
				tempKey = self.key
				card.children.center:set_sprite_pos({x = 0 , y = 3})
			end
		else
			tempKey = self.key
			card.children.center:set_sprite_pos({x = 0 , y = 3})
		end

		return { vars = { card.ability.extra.xchips, card.ability.extra.xchips_gain },key = tempKey, }
		
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
		card.ability.extra.xchips = 1 + joker_count

		if context.joker_main then
			return {
				xchips = card.ability.extra.xchips,
				message = localize { type = 'variable', key = 'a_xchips', vars = { card.ability.extra.xchips } }
			}
		end

		if context.end_of_round and context.game_over == false and G.GAME.last_blind and G.GAME.last_blind.boss and context.main_eval and not context.blueprint then
            local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

			if (#editionless_jokers > 0) then
				local eligible_card = pseudorandom_element(editionless_jokers, 'dongrang')
				local edition = 'e_polychrome'
				eligible_card:set_edition(edition, true)
				check_for_unlock({ type = 'have_edition' })
			end

		end

    end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_plasma') > 4
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_KCorp'), G.C.GREEN, G.C.BLACK, 1.2 )
 	end
}