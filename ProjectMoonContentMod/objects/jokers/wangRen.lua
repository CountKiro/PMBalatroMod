SMODS.Joker {
	key = 'wangRen',
	name = "Wang Ren",
	pronouns = "he_him",
	config = { extra = { dollars = 7 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 4 },
	attributes = {'transform', 'economy'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.dollars } }
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.dollars <= 100 then
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
            G.GAME.pool_flags.wangRen_extinct = true
            return {
                message = 'Died'
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        if G.GAME.dollars > 100 then
            return card.ability.extra.dollars
        end
    end,
	in_pool = function(self, args)
		if G.GAME.dollars >= 104 then
            return true
		else
			return false
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_wangFamily'), HEX("525252"), HEX('c2c2c2'), 1.2 )
 	end,
}