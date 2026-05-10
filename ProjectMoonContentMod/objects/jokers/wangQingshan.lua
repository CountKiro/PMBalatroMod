SMODS.Joker {
	key = 'wangQingshan',
	name = "Wang Qingshan",
	pronouns = "she_her",
	config = { extra = { counter = 0, permaDollars_mod = 3 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 1, y = 4 },
	attributes = {'perma_bonus', 'economy'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return {vars = { card.ability.extra.counter, card.ability.extra.permaDollars_mod } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
            card.ability.extra.counter = card.ability.extra.counter + 1
			if card.ability.extra.counter >= 8 then
				context.other_card.ability.perma_p_dollars = (context.other_card.ability.perma_p_dollars or 0) + card.ability.extra.permaDollars_mod
				card.ability.extra.counter = 0
				local cardToJuiceUp = context.other_card
				G.E_MANAGER:add_event(Event({
					func = function()
						cardToJuiceUp:juice_up()
						return true
					end
				}))
			end
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_wangFamily'), HEX("525252"), HEX('c2c2c2'), 1.2 )
 	end,
}