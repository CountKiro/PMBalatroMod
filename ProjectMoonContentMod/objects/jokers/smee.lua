SMODS.Joker {
	key = 'smee',
	name = "Smee",
	pronouns = "she_her",
	config = { extra = { type = 'Flush'} },
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 5,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 4 },
	attributes = {'hand_type', 'mult'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { localize(card.ability.extra.type, 'poker_hands') } }
	end,
	calculate = function(self, card, context)
		if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                mult = context.full_hand[3].base.nominal * 3
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_twinhook'), HEX('c20a0a'), HEX('e3a81e'), 1.2 )
 	end
}