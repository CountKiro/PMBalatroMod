SMODS.Joker {
	key = 'yuri',
	name = "Yuri",
	pronouns = "she_her",
	config = { extra = { odds = 13, rounds = 4, current_rounds = 0, consumables = { 'c_soul' }  } },
    eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 10,
    atlas = 'ModdedProjectMoon',
	pos = { x = 0, y = 2 },
	attributes = {'chips', 'chance', 'destroy_itself', 'on_sell'},
    pools =
	{

 	},
    no_pool_flag = 'yuri_extinct',
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.c_soul
		return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.rounds, card.ability.extra.current_rounds, card.ability.extra.consumables[1] } }
	end,
	calculate = function(self, card, context)

		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
			if pseudorandom('yuri') < G.GAME.probabilities.normal / card.ability.extra.odds then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('slice1', 0.96+math.random()*0.08)
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

				G.GAME.pool_flags.yuri_extinct = true
				return {
					message = 'Died'
				}
			else			
			card.ability.extra.current_rounds = card.ability.extra.current_rounds + 1	
				if (card.ability.extra.current_rounds == card.ability.extra.rounds) then
					local eval = function(card) return not card.REMOVED end
					juice_card_until(card, eval, true)
				end	
			return {
                message = (card.ability.extra.current_rounds < card.ability.extra.rounds) and
                    (card.ability.extra.current_rounds .. '/' .. card.ability.extra.rounds) or
                    localize('k_active_ex'),
                colour = G.C.FILTER
            }
			end
		end
		if context.selling_self and (card.ability.extra.current_rounds >= card.ability.extra.rounds) and not context.blueprint then
                    SMODS.add_card({set = 'Spectral', key = 'c_soul' })
                    return { message = localize('k_duplicated_ex') }
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_fixer'), G.C.BLACK, G.C.WHITE, 1.2 )
 	end

}