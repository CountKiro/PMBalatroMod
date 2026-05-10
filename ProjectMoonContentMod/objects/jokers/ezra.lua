SMODS.Joker {
    key = "ezra",
    name = "Ezra",
	pronouns = "she_her",
	config = { extra = { repetitions = 1 } },
	unlocked = false,
    blueprint_compat = true,
	perishable_compat = true,
    eternal_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'ModdedProjectMoon',
    pos = { x = 2, y = 6 },
	attributes = {'retrigger', 'seven'},
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 7 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end,
	check_for_unlock = function(self, args)
        return args.type == 'chip_score' and to_big(args.chips) >= to_big(100000) and to_big(args.chips)%to_big(7) == to_big(0)
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), HEX('1c1c1c'), HEX('e6ed1a'), 1.2 )
 	end
}