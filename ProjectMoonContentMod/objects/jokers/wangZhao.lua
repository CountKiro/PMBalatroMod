SMODS.Joker {
	key = 'wangZhao',
	name = "Wang Zhao",
	pronouns = "he_him",
	config = { extra = { } },
	unlocked = true,
	eternal_compat = false,
	perishable_compat = true,
	blueprint_compat = false,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 9, y = 3 },
	attributes = {'sell_value'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = {  } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.last_blind and G.GAME.last_blind.boss and not context.blueprint then
			card.ability.extra_value = card.ability.extra_value + 1
			card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end

		if context.final_scoring_step and hand_chips * mult >= G.GAME.blind.chips and not context.blueprint then
			card.ability.extra_value = card.ability.extra_value + 2
			card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
		end

		if context.end_of_round and context.game_over == false and context.main_eval and not G.GAME.last_blind.boss and not context.blueprint then

			local my_pos = nil

			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i] == card then
					my_pos = i
					break
				end
			end

			if G.jokers.cards[my_pos - 1] then
				if G.jokers.cards[my_pos - 1].set_cost then
					G.jokers.cards[my_pos - 1].ability.extra_value  = G.jokers.cards[my_pos - 1].ability.extra_value  + 4
					card.ability.extra_value = card.ability.extra_value - 2
					card:set_cost()
					G.jokers.cards[my_pos - 1]:set_cost()
				end
			end

			if G.jokers.cards[my_pos + 1] then
				if G.jokers.cards[my_pos - 1].set_cost then
					G.jokers.cards[my_pos + 1].ability.extra_value  = G.jokers.cards[my_pos + 1].ability.extra_value  + 4
					card.ability.extra_value = card.ability.extra_value - 2
					card:set_cost()
					G.jokers.cards[my_pos + 1]:set_cost()
				end
			end
			if card.sell_cost <= 0 then
				print("Testing destruction")
            G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('slice1', 0.96+math.random()*0.08)
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true

						card.getting_sliced = true

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
            G.GAME.pool_flags.wangZhao_extinct = true
            return {
                message = 'Died'
            }
			end
            return {
                message = "Value loss",
                colour = G.C.MONEY
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_wangFamily'), HEX("525252"), HEX('c2c2c2'), 1.2 )
 	end,
}