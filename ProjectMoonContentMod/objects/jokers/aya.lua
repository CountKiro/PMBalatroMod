SMODS.Joker {
	key = 'aya',
	name = "Aya",
	pronouns = "she_her",
	config = { extra = { chips = 70, odds = 20, voucher = 'v_tarot_merchant' } },
    eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = true,	
	rarity = 1,
    cost = 4,
	atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 2 },
	attributes = {'chips', 'chance', 'destroy_itself', 'voucher'},
    pools = 
	{

 	},
    no_pool_flag = 'aya_extinct',
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.v_tarot_merchant
		return { vars = { card.ability.extra.chips, (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.voucher } }
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
	
		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then

			if pseudorandom('aya') < G.GAME.probabilities.normal / card.ability.extra.odds then

			
				-- This part plays the animation.
				G.E_MANAGER:add_event(Event({
					func = function()
					G.GAME.used_vouchers[card.ability.extra.voucher] = true
					G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 1
					Card.apply_to_run(nil, G.P_CENTERS['v_tarot_merchant'])
					
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
				G.GAME.pool_flags.aya_extinct = true
				return {
					message = 'Left!'
				}
			else
				return {
					message = 'Safe!'
				}
			end
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_fixer'), G.C.BLACK, G.C.WHITE, 1.2 )
 	end
}