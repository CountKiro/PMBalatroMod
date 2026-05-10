SMODS.Joker {
	key = 'robotYesod',
	name = "Yesod (Robot)",
	pronouns = "he_him",
	config = {extra = {totalSpades = 0, totalClubs = 0, totalHearts = 0, totalDiamonds = 0, mult = 0, chips = 0, odds = 10}},
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 12 },
	attributes = {'spades', 'clubs', 'hearts', 'diamonds', 'mult', 'chips'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.totalSpades, card.ability.extra.totalClubs, card.ability.extra.totalHearts, card.ability.extra.totalDiamonds, card.ability.extra.mult, card.ability.extra.chips, (G.GAME.probabilities.normal or 1), card.ability.extra.odds  } }
    end,

    calculate = function(self, card, context)

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
			card.ability.extra.totalSpades = card.ability.extra.totalSpades + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
			card.ability.extra.totalClubs = card.ability.extra.totalClubs + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
			card.ability.extra.totalHearts = card.ability.extra.totalHearts + 1
		end

		if context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then
			card.ability.extra.totalDiamonds = card.ability.extra.totalDiamonds + 1
		end

		card.ability.extra.chips = (card.ability.extra.totalSpades + card.ability.extra.totalClubs)
        card.ability.extra.mult = (card.ability.extra.totalHearts + card.ability.extra.totalDiamonds)/2

		if context.before and context.main_eval and pseudorandom('alfonso') < G.GAME.probabilities.normal / card.ability.extra.odds then

			local currentJokers = {}
					for i = 1, #G.jokers.cards do
							if G.jokers.cards[i] ~= card and not G.jokers.cards[i].ability.eternal then 
								currentJokers[#currentJokers+1] = G.jokers.cards[i] 
							end
					end
					local selectedJoker = #currentJokers > 0 and pseudorandom_element(currentJokers, pseudoseed('yesod')) or nil

					if selectedJoker then
						selectedJoker:juice_up()
						SMODS.Stickers["perishable"]:apply(selectedJoker, true)
					end

		

		end

		if context.joker_main then
			return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult
            }
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end
}