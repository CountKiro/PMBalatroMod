SMODS.Joker {
    key = "sephirahHod",
	name = "Sephirah Hod",
	pronouns = "she_her",
	config = {extra = 1, xchips = 1},
	eternal_compat = true,
	perishable_compat = false,
    blueprint_compat = true,	
    rarity = 3,
    cost = 8,
	atlas = 'ModdedProjectMoon',
    pos = { x = 1, y = 11 },
	attributes = {'xchips', 'blind'},
    pools = 
	{
 		["Heretics"] = true,
 	},
	no_pool_flag = 'robot_extinct',
    loc_vars = function(self, info_queue, card)
        local main_end = nil
        if card.area and (card.area == G.jokers) then
            local disableable = G.GAME.blind and ((not G.GAME.blind.disabled) and (G.GAME.blind.boss))
            main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = disableable and G.C.GREEN or G.C.RED, r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize(disableable and 'k_active' or 'ph_no_boss_active') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.9 } },
                            }
                        }
                    }
                }
            }
        end
        return { main_end = main_end, vars = { card.ability.extra, card.ability.xchips } }
    end,
    calculate = function(self, card, context)
		if context.joker_main then
			return {
				message = localize { type = 'variable', key = 'a_xchips', vars = { card.ability.xchips } },
				xchips = card.ability.xchips
			}
		end
        if context.selling_card and context.card.ability.set == "Joker" and not context.blueprint then
            if G.GAME.blind and not G.GAME.blind.disabled and G.GAME.blind.boss then
			card.ability.xchips = card.ability.xchips + card.ability.extra	
                return {
                    message = localize('ph_boss_disabled'),
                    func = function()
                        G.GAME.blind:disable()
                    end
                }
            end
        end
    end,
	in_pool = function(self, args)
        return G.GAME.pool_flags.fake_robot_flag
    end,
	set_badges = function(self, card, badges)
 		badges[#badges+1] = create_badge(localize('pmcmod_badge_LCorp'), G.C.RED, HEX('f2e396'), 1.2 )
 	end,
}