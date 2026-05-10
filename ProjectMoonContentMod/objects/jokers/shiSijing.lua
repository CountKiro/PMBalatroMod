SMODS.Joker {
	key = 'shiSijing',
	name = "Shi Sijing",
	pronouns = "he_him",
	config = { extra = { chips_mod = 10, chips = 0 } },
	unlocked = true,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 1,
	cost = 4,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 5, y = 4 },
	attributes = {'chips', 'scaling', 'on_destroy'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.chips_mod, card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.joker_type_destroyed and not context.blueprint  then
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
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_shiFamily'), HEX("8a753f"), HEX('2e4a37'), 1.2 )
 	end,
}