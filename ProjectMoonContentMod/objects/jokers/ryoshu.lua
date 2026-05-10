SMODS.Joker {
	key = 'ryoshu',
	name = "Ryoshu",
	pronouns = "she_her",
	config = { extra = {xmult = 1, xmult_mod = 0.1} },
	no_collection = false,
	eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = false,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon2',
	pos = { x = 3, y = 0 },
	attributes = {'xmult', 'scaling', 'erasing'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult_mod, card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)

		if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
			local keypageKey = context.card.config.center.key
			G.GAME.banned_keys[keypageKey] = true
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
        end

		if context.joker_main then
			return{
				xmult = card.ability.extra.xmult
			}
		end

    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
 	end,
	in_pool = function(self, args)

    end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_flower_pot" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}