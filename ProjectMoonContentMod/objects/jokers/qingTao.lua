SMODS.Joker {
	key = 'qingTao',
	name = "Qing Tao",
	pronouns = "he_him",
	config = { extra = { type = "Three of a Kind", baseChance = 1, maxChance = 3, counter = 0 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 0, y = 2 },
	attributes = {'mult', 'enhancements', 'scaling'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, card.ability.extra.baseChance, card.ability.extra.maxChance, 'qingTao')
        return {vars = { localize(card.ability.extra.type, 'poker_hands'), new_numerator, new_denominator } } 
	end,
	calculate = function(self, card, context)
		 if context.destroy_card and context.cardarea == G.play and not context.blueprint and next(context.poker_hands[card.ability.extra.type]) and G.GAME.current_round.hands_played == 0 and #context.full_hand == 3 then
			if SMODS.pseudorandom_probability(card, 'qingTao', card.ability.extra.baseChance, card.ability.extra.maxChance, 'shanSan') then
				card.ability.extra.counter = card.ability.extra.counter + 1
				return {
                    remove = true
                }
			end
        end

		if context.after then
			if card.ability.extra.counter == 0 then
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

				G.GAME.pool_flags.qingTao_extinct = true
				return {
					message = 'Died'
				}
			else
				card.ability.extra.counter = 0
			end
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_citizen'), HEX('828282'), HEX('ebebeb'), 1.2 )
 	end,
}