SMODS.Joker {
	key = 'hanul',
	name = "Han-ul",
	pronouns = "she_her",
	config = { extra = { type = 'Flush' } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,	
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon',
	pos = { x = 2, y = 8 },
	attributes = {'hand_type', 'economy'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { localize(card.ability.extra.type, 'poker_hands') } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
			local accumulatedValue = 0
			local averageValue
			for i = 1, #G.play.cards do
				accumulatedValue = accumulatedValue + G.play.cards[i].base.nominal
			end

			averageValue = math.floor(math.floor(accumulatedValue / #G.play.cards))/2

			return
			{
				dollars = averageValue;
			}
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_hana'), HEX('e3e3e3'), HEX('8a6d15'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_no_hand' and G.GAME.hands['Flush'].played == 0
    end
}