SMODS.Joker {
	key = 'timeRipper',
	name = "Time Ripper",
	pronouns = "they_them",
	config = { extra = {charges = 0 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 9, y = 7 },
	attributes = {'ante_reset', 'selling_card'},
    pools =
	{
		["Heretics"] = true,
 	},
	loc_vars = function(self, info_queue, card)
		
        return {vars = { card.ability.extra.charges } }
	end,
	calculate = function(self, card, context)
		if context.selling_card and context.card.ability.set == "Joker" and card.ability.extra.charges <= 3 and not context.blueprint then
			if G.GAME.round_resets.ante >= card.ability.extra.charges + 1 then
				card.ability.extra.charges = card.ability.extra.charges + 1
			end
        end

		if context.selling_self and card.ability.extra.charges >=1 and not context.blueprint then

        		ease_ante(-card.ability.extra.charges)
        		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        		G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.charges
		end
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_TCorp'), HEX('382d21'), HEX('a3802e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_herbert" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}