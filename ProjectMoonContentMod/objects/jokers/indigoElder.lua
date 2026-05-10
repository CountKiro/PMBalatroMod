SMODS.Joker {
	key = 'indigoElder',
	name = "Indigo Elder",
	pronouns = "he_him",
	config = { extra = { dollars = 2, chips = 10, mult = 5, xchips = 1, 
						 dollars_mod = 1, chips_mod = 10, mult_mod = 3, xchips_mod = 0.2,
						 lockedPosition = 0} },
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 4,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 3, y = 8 },
	soul_pos = { x = 3, y = 9 },
	attributes = {'chips', 'mult', 'xchips', 'scaling', 'position', 'economy'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollars, card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.xchips, card.ability.extra.lockedPosition } }
	end,
	calculate = function(self, card, context)

		if G.shop then
			card.ability.extra.lockedPosition = 0
		end

		if context.setting_blind and card.ability.extra.lockedPosition == 0 then
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
			card.ability.extra.lockedPosition = my_pos
		end

		if context.individual and context.cardarea == G.play then

			if card.ability.extra.lockedPosition == 1 or card.ability.extra.lockedPosition == 4 then
				return
				{
					mult = card.ability.extra.mult,
				}
			end

		end


		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and G.GAME.last_blind and G.GAME.last_blind.boss then

			if card.ability.extra.lockedPosition == 1 then
				card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_mod
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
				card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_mod
			elseif card.ability.extra.lockedPosition == 2 then
				card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollars_mod
			elseif card.ability.extra.lockedPosition == 3 then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
			elseif card.ability.extra.lockedPosition == 4 then
				card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
			else 
				card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_mod
			end

		end
    end,
	calc_dollar_bonus = function(self, card)
		if card.ability.extra.lockedPosition == 1 or card.ability.extra.lockedPosition == 2 then
        	return card.ability.extra.dollars
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_colorFixer'), HEX('243542'), HEX('35c5e6'), 1.2 )
 	end
}