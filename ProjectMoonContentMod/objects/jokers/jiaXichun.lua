SMODS.Joker {
	key = 'jiaXichun',
	name = "Jia Xichun",
	pronouns = "she_her",
	config = { extra = { zhiCount = 0, yongCount = 0, renCount = 0, totalCount = 0, dollars = 0 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 8, y = 5 },
	attributes = {'chips', 'mult', 'economy', 'scaling', 'suit'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.zhiCount, card.ability.extra.yongCount, card.ability.extra.renCount, card.ability.extra.totalCount, card.ability.extra.dollars } }
	end,
	calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") and card.ability.extra.totalCount < 50 then
			card.ability.extra.zhiCount = card.ability.extra.zhiCount + 1
			card.ability.extra.totalCount = card.ability.extra.totalCount + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") and card.ability.extra.totalCount < 50 then
			card.ability.extra.yongCount = card.ability.extra.yongCount + 1
			card.ability.extra.totalCount = card.ability.extra.totalCount + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and card.ability.extra.totalCount < 50 then
			card.ability.extra.renCount = card.ability.extra.renCount + 1
			card.ability.extra.totalCount = card.ability.extra.totalCount + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") and card.ability.extra.totalCount < 50 then
			if card.ability.extra.zhiCount >= 1 then
				card.ability.extra.zhiCount = card.ability.extra.zhiCount - 1
				card.ability.extra.totalCount = card.ability.extra.totalCount - 1
			end

			if card.ability.extra.yongCount >= 1 then
				card.ability.extra.yongCount = card.ability.extra.yongCount - 1
				card.ability.extra.totalCount = card.ability.extra.totalCount - 1
			end

			if card.ability.extra.renCount >= 1 then
				card.ability.extra.renCount = card.ability.extra.renCount - 1
				card.ability.extra.totalCount = card.ability.extra.totalCount - 1
			end
		end

		if context.joker_main then
			return{
				chips = card.ability.extra.zhiCount,
				mult = card.ability.extra.renCount
			}
		end
    end,
	calc_dollar_bonus = function(self, card)

		card.ability.extra.dollars = math.floor(card.ability.extra.yongCount / 5)

        return (card.ability.extra.dollars)
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_hongyuan'), HEX('ad886f'), HEX('e3deda'), 1.2 )
 	end,
}