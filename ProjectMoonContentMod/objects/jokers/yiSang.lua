SMODS.Joker {
	key = 'yisang',
	name = "Yi Sang",
	pronouns = "he_him",
	config = { extra = { xchips = 1, xchips_mod = 0.3, xchips_bonus = 0.1 } },
	unlocked = false,
	eternal_compat = true,
	perishable_compat = true,
    blueprint_compat = true,
	rarity = 3,
	cost = 8,
	atlas = 'ModdedProjectMoon2',
	pos = { x = 0, y = 0 },
	attributes = {'xchips', 'scaling', 'planet'},
	loc_vars = function (self, info_queue, card)

		local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do 
			if v.set == 'Planet' then 
				planets_used = planets_used + 1 
			end 
		end

    	return {vars = { card.ability.extra.xchips + card.ability.extra.xchips_mod*planets_used, card.ability.extra.xchips_mod, card.ability.extra.xchips_bonus }}
	end,
	calculate = function(self, card, context)
		local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do 
			if v.set == 'Planet' then 
				planets_used = planets_used + 1 
			end 
		end

		if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' and not context.blueprint then
            -- See note about SMODS Scaling Manipulation on the wiki
            card.ability.extra.xchips = card.ability.extra.xchips + card.ability.extra.xchips_bonus
            return {
                message = localize { type = 'variable', key = 'a_xchips', vars = { card.ability.extra.xchips_bonus } }
            }
        end

		if context.joker_main then
			return {
				xchips = card.ability.extra.xchips + (planets_used * card.ability.extra.xchips_mod)
			}
		end
	end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_limbus'), HEX('63160e'), HEX('eba313'), 1.2 )
 	end,
	check_for_unlock = function(self, args)
        for _, v in pairs(G.P_CENTER_POOLS["Joker"]) do
            if v.key == "j_constellation" then
                if get_joker_win_sticker(v, true) >= 8 then
                    return true
                end
                break
            end
        end
    end
}