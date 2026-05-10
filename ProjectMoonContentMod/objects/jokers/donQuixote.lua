SMODS.Joker {
	key = 'donQuixote',
	name = "Don Quixote",
	pronouns = "she_her",
	config = { extra = { chips = 0 } },
	unlocked = false,
	blueprint_compat = true,
	perishable_compat = true,
	eternal_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 2, y = 0 },
    pools =
	{
		["Bloodfiends"] = true,
 	},
	attributes = {'chips', 'perma_bonus'},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = "Other", key = "effect_perma"}
        return {vars = { card.ability.extra.chips } }
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card.ability.perma_mult > 0 and not context.blueprint then
			card.ability.extra.chips = card.ability.extra.chips + context.other_card.ability.perma_mult * 3
			context.other_card.ability.perma_mult = 0
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT,
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
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_seeing_double" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}