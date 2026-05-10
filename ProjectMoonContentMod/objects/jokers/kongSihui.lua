SMODS.Joker {
	key = 'kongSihui',
	name = "Kong Sihui",
	pronouns = "she_her",
	config = { extra = { dollars = 2, baseChanceTrigger = 1, maxChanceTrigger = 5, baseChanceDeath = 1, maxChanceDeath = 20 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 6, y = 4 },
	attributes = {'chance', 'destroy_itself', 'economy'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        local new_numeratorTrigger, new_denominatorTrigger = SMODS.get_probability_vars(card, card.ability.extra.baseChanceTrigger, card.ability.extra.maxChanceTrigger, 'kong')
		local new_numeratorDeath, new_denominatorDeath = SMODS.get_probability_vars(card, card.ability.extra.baseChanceDeath, card.ability.extra.maxChanceDeath, 'kong')
        return {vars = { card.ability.extra.dollars, new_numeratorTrigger, new_denominatorTrigger, new_numeratorDeath, new_denominatorDeath } } 
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if SMODS.pseudorandom_probability(card, 'kong', card.ability.extra.baseChanceTrigger, card.ability.extra.maxChanceTrigger, 'kong') then
				return {
					dollars = card.ability.extra.dollars
				}
			end

			if SMODS.pseudorandom_probability(card, 'kong', card.ability.extra.baseChanceDeath, card.ability.extra.maxChanceDeath, 'kong') then
			
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
				G.GAME.pool_flags.sihui_extinct = true
			end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_kongFamily'), HEX("8a001e"), HEX('242424'), 1.2 )
 	end,
}