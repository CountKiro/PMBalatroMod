SMODS.Joker {
	key = 'ricardo',
	name = "Ricardo",
	pronouns = "he_him",
	config = { extra = { mult = 10, multBase = 10, mult_mod = 15, canSpawnDummy = true, xmult = 1} },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
	blueprint_compat = true,
	rarity = 3,
	cost = 8,
    atlas = 'ModdedProjectMoon',
	pos = { x = 5, y = 4 },
	attributes = {'mult', 'scaling'},
    pools =
	{

 	},
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.multBase, card.ability.extra.mult_mod, card.ability.extra.xmult } }
	end,
	calculate = function(self, card, context)
		if context.setting_blind then
			for i=1, #ProjectMoonMod.dummyJoker.cards do
				if ProjectMoonMod.dummyJoker.cards[1].config.center.key == "j_pmcmod_dummyRicardo" then
					card.ability.extra.canSpawnDummy = false
					card.ability.extra.mult = card.ability.extra.multBase + ProjectMoonMod.dummyJoker.cards[i].ability.extra.ricardoDefeatCounter * card.ability.extra.mult_mod
					break
				end
			end
			if ProjectMoonMod.dummyJoker and card.ability.extra.canSpawnDummy  == true then
				SMODS.add_card({ key = "j_pmcmod_dummyRicardo", area = ProjectMoonMod.dummyJoker })
			end
		end

		if G.GAME.used_vouchers.v_grabber then
			card.ability.extra.xmult = 2
		end

		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
				xmult = card.ability.extra.xmult
			}
		end	
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_middle'), HEX('5b0b75'), HEX('e3a81e'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_pmcmod_smee" then
                if get_joker_win_sticker(v, true) >= 1 then
                    return true
                end
                break
            end
        end
    end
}