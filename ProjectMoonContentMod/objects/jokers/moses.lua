SMODS.Joker {
	key = 'moses',
	name = 'Moses',
	pronouns = "she_her",
	config = { extra = { xchips = 1.25 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 1, y = 6 },
	attributes = {'xchips', 'seven'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xchips } }
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 7 then
                return {
                    xchips = card.ability.extra.xchips,
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