SMODS.Joker {
	key = 'yellowHarpoon',
	name = "Yellow Harpoon",
	pronouns = "he_him",
	config = { extra = { base_xchips = 1.0 } },
	unlocked = true,	
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,	
	rarity = 4,
	cost = 10,
    atlas = 'ModdedProjectMoon',
	pos = { x = 4, y = 8 },
	soul_pos = { x = 4, y = 9 },
	attributes = {'xchips', 'rarity'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.base_xchips + 0.2, card.ability.extra.base_xchips + 1.0 } }
	end,
	calculate = function(self, card, context)
		local selectedXMult = 1.0

		if context.other_joker and not context.blueprint then
			if context.other_joker.config.center.rarity == 1 or context.other_joker.config.center.rarity == "Common" then
				selectedXMult = card.ability.extra.base_xchips + 0.2
			elseif context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == "Uncommon" then
				selectedXMult = card.ability.extra.base_xchips + 0.4
			elseif context.other_joker.config.center.rarity == 3 or context.other_joker.config.center.rarity == "Rare" then
				selectedXMult = card.ability.extra.base_xchips + 0.6
			else
				selectedXMult = card.ability.extra.base_xchips + 1.0
			end
            return {
                xchips = selectedXMult
            }
        end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_colorFixer'), HEX('212121'), HEX('f0a524'), 1.2 )
 	end,
}