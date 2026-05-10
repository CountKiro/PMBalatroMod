SMODS.Joker {
    key = "rim",
	name = "Rim",
	pronouns = "he_him",
	config = {},
    unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = false,
    rarity = 2,
	atlas = 'ModdedProjectMoon',
    cost = 6,
    pos = { x = 5, y = 1 },
	attributes = {'passive', 'mod_chance'},
    pools = 
	{
 		["Heretics"] = true,
        ["DemiansGroup"] = true,
 	},
    add_to_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v / 2
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v* 2
        end
    end,
    locked_loc_vars = function(self, info_queue, card)
        return { vars = { number_format(100000) } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'chip_score' and to_big(args.chips) >= to_big(100000)
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_sovereigns'), HEX('d61f11'), HEX('470d09'), 1.2 )
 	end
}