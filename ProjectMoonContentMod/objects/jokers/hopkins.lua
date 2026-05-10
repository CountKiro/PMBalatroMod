SMODS.Joker {
	key = 'hopkins',
	name = "Hopkins",
	pronouns = "he_him",
	config = { extra = { mult = 20, odds = 20 } },
    eternal_compat = false,
	perishable_compat = false,
	blueprint_compat = true,	
	rarity = 1,
    cost = 3,
	atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 2 },
	attributes = {'mult', 'chance', 'destroy_itself'},
    pools = 
	{

 	},
    no_pool_flag = 'hopkins_extinct',
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
	end,
	calculate = function(self, card, context)

		if context.joker_main then
			return {
				mult_mod = card.ability.extra.mult,
				message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
			}
		end

		if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then

			if pseudorandom('hopkins') < G.GAME.probabilities.normal / card.ability.extra.odds then
				local destructable_jokers = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= self and not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced then destructable_jokers[#destructable_jokers+1] = G.jokers.cards[i] end
                end
                local joker_to_destroy = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('hopkins')) or nil

                if joker_to_destroy and not (context.blueprint_card or self).getting_sliced then 
                    joker_to_destroy.getting_sliced = true
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('slice1', 0.96+math.random()*0.08)
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						G.E_MANAGER:add_event(Event({
							joker_to_destroy:start_dissolve({G.C.RED}, nil, 1.6),
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
				end
				G.GAME.pool_flags.hopkins_extinct = true
				return {
					message = 'Escaped!'
				}
			else
				return {
					message = '...'
				}
			end
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_fixer'), G.C.BLACK, G.C.WHITE, 1.2 )
 	end
}