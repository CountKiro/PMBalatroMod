SMODS.Joker {
	key = 'werner',
	name = "Werner",
	pronouns = "he_him",
	config = { extra = {chips = 0, chips_mod = 15 } },
	unlocked = true,
	perishable_compat = true,
	eternal_compat = true,
	blueprint_compat = true,
	rarity = 2,
	cost = 6,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 6 },
	attributes = {'chips', 'on_destroy', 'scaling'},
    pools =
	{
		["Middle"] = true,
 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips, card.ability.extra.chips_mod } }
	end,
	calculate = function(self, card, context)
		if context.joker_type_destroyed and context.card.config.center.key == "j_pmcmod_ricardo" and not context.blueprint  then
			card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.CHIPS,
				message_card = card
			}
		end

		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_middle'), HEX('5b0b75'), HEX('e3a81e'), 1.2 )
 	end,
}