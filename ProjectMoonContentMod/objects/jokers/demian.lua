SMODS.Joker {
    key = "demian",
	name = "Demian",
	pronouns = "he_him",
    config = { extra = { xchips = 1, xchips_mod = 0.3 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    atlas = 'ModdedProjectMoon',
    pos = { x = 4, y = 1 },
	attributes = {'xchips', 'scaling', 'spectral'},
    pools =
	{
        ["DemiansGroup"] = true,
 	},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips_mod, card.ability.extra.xchips } }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Spectral' then
            card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_mod
            return {
                message = localize { type = 'variable', key = 'a_xchips', vars = { card.ability.extra.xchips } }
            }
        end
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_sovereigns'), HEX('d61f11'), HEX('470d09'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        return args.type == 'win_deck' and get_deck_win_stake('b_erratic') > 4
    end
	
}