SMODS.Joker {
	key = 'zigong',
	name = "Zigong",
	pronouns = "she_her",
	config = { extra = { chips = 3} },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = false,	
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 0, y = 5 },
	attributes = {'chips', 'sell_value'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
			local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end

			if G.jokers.cards[my_pos + 1] then
				local affectedCard = G.jokers.cards[my_pos + 1]
				card.ability.extra.chips = card.ability.extra.chips + (affectedCard.sell_cost * 3)
				if affectedCard.sell_cost then
                        affectedCard.sell_cost = 0
                end
			end
        end
		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_jiaFamily'), HEX("b02121"), HEX('140e0e'), 1.2 )
 	end,
}