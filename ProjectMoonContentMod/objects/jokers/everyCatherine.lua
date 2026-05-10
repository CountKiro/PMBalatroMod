SMODS.Joker {
	key = 'everyCatherine',
	name = "Every Catherine",
	pronouns = "she_her",
	config = { extra = { baseChance = 0, maxChance = 4} },
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 7, y = 4 },
	attributes = {'chance', 'negative', 'modify_card'},
	soul_pos = {
        x = 7, y = 9,
--        draw = function(card, scale_mod, rotate_mod)
--            card.hover_tilt = card.hover_tilt * 1.5
--            card.children.floating_sprite:draw_shader('hologram', nil, card.ARGS.send_to_shader, nil,
--            card.children.center, 2 * scale_mod, 2 * rotate_mod)
--            card.hover_tilt = card.hover_tilt / 1.5
--        end
    },
	set_ability = function(self, card, initial, delay_sprites) card:set_edition("e_negative", true) end,
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'everyCatherineChance')
		return { vars = { new_numerator, new_denominator } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

			local editionless_jokers = {}

			for i=1, #G.jokers.cards do
				print("loop")
				print(i)
				if G.jokers.cards[i] ~= card and G.jokers.cards[i].config.center.key ~= "j_pmcmod_erlking" and G.jokers.cards[i].config.center.key ~= "j_pmcmod_catherine" then
					print("found card")
					if G.jokers.cards[i].edition == nil then
						print("found editionless card")
						editionless_jokers[#editionless_jokers + 1] = G.jokers.cards[i]
						print(editionless_jokers[i])
					end
				end
			end
			--local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

			if (#editionless_jokers > 0) then
				local eligible_card = pseudorandom_element(editionless_jokers, 'everyCatherine')
				local edition = 'e_negative'
				eligible_card:set_edition(edition, true)
				check_for_unlock({ type = 'have_edition' })
			end
			if SMODS.pseudorandom_probability(card, 'seed', card.ability.extra.baseChance, card.ability.extra.maxChance, 'everyCatherineChance') then
				G.GAME.pool_flags.clearAllCathy = true
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true

						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				G.GAME.pool_flags.everyCatherineExtinct = true
			else
				card.ability.extra.baseChance = card.ability.extra.baseChance + 1
			end
			
		end
		
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_empty'), HEX('3d2920'), HEX('998277'), 1.2 )
 	end,
	add_to_deck = function(self, card, from_debuff)
        G.GAME.banned_keys["j_pmcmod_everyCatherine"] = true
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
}